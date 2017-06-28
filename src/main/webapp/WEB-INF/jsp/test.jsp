<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://js.arcgis.com/4.3/esri/css/main.css">
<script src="https://js.arcgis.com/4.3/"></script>

  <style>
    html,
    body,
    #viewDiv {
      padding: 0;
      margin: 0;
      height: 100%;
      width: 100%;
    }
  </style>
  
  <script>
    require([
      "esri/Map",
      "esri/views/MapView",
      "esri/layers/ImageryLayer",
      
      "esri/layers/support/RasterFunction",
      "esri/layers/support/DimensionalDefinition",
      "esri/layers/support/MosaicRule",
      "esri/core/watchUtils",
      "dojo/domReady!"
    ], function(
      Map, MapView, ImageryLayer,
      RasterFunction, DimensionalDefinition, MosaicRule, watchUtils
    ) {

      var pixelBlock, factor, minValue, maxValue;

      // The URL to an image layer representing sea temperature
      var url =
        //"https://sampleserver6.arcgisonline.com/arcgis/rest/services/ScientificData/SeaTemperature/ImageServer";
		"http://10.2.3.222:6080/arcgis/rest/services/sde_DBO_rendertest1/ImageServer";
      var map = new Map({
        basemap: "dark-gray"
      });

      var view = new MapView({
        container: "viewDiv",
        map: map,
        zoom: 3,
        center: [108, 34],
        //center: [-32, 28],
        
        popup: {
          actions: []
        },
      });

      /**********************************************************************************************
       * Variable water_temp describes the water temperature, it has both depth and time dimensions.
       * This snippet sets water_temp to a specific depth and a specific time by defining the
       * multidimensionalDefinition property of a MosaicRule object.
       **********************************************************************************************/

      var dimInfo = []; // Define dimensional definition as array

      // Multidimensional information of image service can be viewed at thisService/multiDimensionalInfo
      // DEPTH: show only temperatures at sea surface
      dimInfo.push(new DimensionalDefinition({
        variableName: "water_temp",
        dimensionName: "StdZ", // Water depth
        values: [0], // Sea surface or 0ft
        isSlice: true
      }));
      // TIME: only show temperatures for the week of April 7, 2014
      dimInfo.push(new DimensionalDefinition({
        variableName: "water_temp",
        dimensionName: "StdTime", // time temp was recorded
        values: [1396828800000], // Week of April 7, 2014
        isSlice: true
      }));

      var mr = new MosaicRule({
        multidimensionalDefinition: dimInfo
      });

      /******************************************
       * Set the rendering rule to the
       * "None" raster function. This will allow
       * us to gain access to the temperature
       * value assigned to each pixel
       *****************************************/

      var rf = new RasterFunction({
        functionName: "None"
      });
      
      var ClipRF = new RasterFunction({
			functionName : "Clip",
			functionArguments : {
					ClippingGeometry: 
						{
  						rings:[[[108.411,34.935], [108.35,33.687], [109.537,33.581], [109.522,34.6], [108.411,34.935]]], 
  						spatialReference: {wkid: 4326} 
						},
					ClippingType: 1
			},
		variableName : "Raster"
		});
      /**********************************************************
       * The PixelFilter. This function is used to color the
       * pixels. By default, each pixel has one band containing
       * a temperature value. Without the pixelFilter
       * the layer would render in a grayscale. We will
       * replace the single band with three bands - red,
       * green, and blue to give color to the layer. This
       * will overwrite the original temperature value. See
       * the getTemp() function for converting the RGB values
       * back to the original temperature value.
       *********************************************************/

      function colorize(pixelData) {
        if (pixelData === null || pixelData.pixelBlock === null ||
          pixelData.pixelBlock.pixels === null) {
          return;
        }
       	
        // The pixelBlock stores the values of all pixels visible in the view
        pixelBlock = pixelData.pixelBlock;
		
        // Get the min and max values of the data in the current view
        minValue = pixelBlock.statistics[0].minValue;
        maxValue = pixelBlock.statistics[0].maxValue;
		
       // The pixels visible in the view
        var pixels = pixelBlock.pixels;
		
        // The number of pixels in the pixelBlock
        var numPixels = pixelBlock.width * pixelBlock.height;
		
        // Calculate the factor by which to determine the red and blue
        // values in the colorized version of the layer
        factor = 255.0 / (maxValue - minValue);
		//console.log(factor);
        // Get the pixels containing temperature values in the only band of the data
        var tempBand = pixels[0];
		//console.log(tempBand);
        // Create empty arrays for each of the RGB bands to set on the pixelBlock
        var rBand = [];
        var gBand = [];
        var bBand = [];

        var min=0;
        var max=0;
        
        // Loop through all the pixels in the view
        for (i = 0; i < numPixels; i++) {
          // Get the pixel value (the temperature) recorded at the pixel location
          var tempValue = tempBand[i];
          if(tempValue<min)
          {
            min=tempValue;
          }
          if(tempValue>max)
          {
            max=tempValue;
          }
          // Calculate the red value based on the factor
          var red = (tempValue - minValue) * factor;

          // Sets a color between blue (coldest) and red (warmest) in each band
          rBand[i] = red;
          gBand[i] = 0;
          bBand[i] = 255 - red;
        }
        console.log(min);
        console.log(max);
        // Set the new pixel values on the pixelBlock
       pixelData.pixelBlock.pixels = [rBand, gBand, bBand];
        pixelData.pixelBlock.pixelType = "U8"; // U8 is used for color
        
      }

      var layer = new ImageryLayer({
        url: url,
        //definitionExpression: "OBJECTID = 2",
        renderingRule: ClipRF,
       	pixelFilter: colorize,
        //mosaicRule: mr,
        // The popup will display the temperature at the clicked location
        popupTemplate: {
          title: "土壤湿度",
          content: "{Raster.ServicePixelValue}° Celsius"
        }
      });
      //layer.pixelFilter=colorize;
      // Add sea temperature layer to the map
      
      map.add(layer);
      
      // Display popup when the layer view loadsv
      /* view.whenLayerView(layer).then(function(layerView) {
        watchUtils.whenFalseOnce(layerView, "updating", function(newVal) {
          view.popup.open({
            title: "Sea Surface Temperature",
            content: "Click anywhere in the oceans to view the sea temperature at that location.",
            location: view.center
          });
        });
      }); */
    });
    //http://10.2.3.222:6080/arcgis/rest/services/sde_DBO_SM0803/ImageServer/exportImage?bbox=108.411,33.581,109.537,34.935&bboxSR=&size=&imageSR=&time=&format=jpgpng&pixelType=F32&noData=&noDataInterpretation=esriNoDataMatchAny&interpolation=+RSP_BilinearInterpolation&compressionQuality=&bandIds=&mosaicRule=&renderingRule={"rasterFunction" : "Clip","rasterFunctionArguments" : {"ClippingGeometry" : {"rings" : [[[108.411,34.935], [108.35,33.687], [109.537,33.581], [109.522,34.6], [108.411,34.935]]], "spatialReference" : {"wkid" : 4326} },"ClippingType": 1},"variableName" : "Raster"}&f=image
    		
    		/*{"rasterFunction" : "Clip",
    		"rasterFunctionArguments" : 
    			{"ClippingGeometry" : 
    				{
	    				"rings" : [[[108.411,34.935], [108.35,33.687], [109.537,33.581], [109.522,34.6], [108.411,34.935]]], 
	    				"spatialReference" : {"wkid" : 4326} 
    				},
    			"ClippingType": 1
    			},
    		"variableName" : "Raster"
    		} */
  </script>
</head>
<body>
	<div id="viewDiv"></div>
</body>
</html>