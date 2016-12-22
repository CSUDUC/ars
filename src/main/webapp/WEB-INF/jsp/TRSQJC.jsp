<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html lang="en"> 
<!--土壤墒情监测--> 
  <!-- BEGIN HEAD -->
  
		<head>
		<style>
		#viewDiv {
		    padding: 0;
		    margin: 0;
		    height: 100%;
		    width: 100%;
		  }
		</style>
        <meta charset="utf-8" />
        <title>农业遥感</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <!-- BEGIN LAYOUT FIRST STYLES -->
        <link href="//fonts.googleapis.com/css?family=Oswald:400,300,700" rel="stylesheet" type="text/css" />
        <!-- END LAYOUT FIRST STYLES -->
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
        <link href="plugins/assets/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="plugins/assets/css/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="plugins/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="plugins/assets/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="plugins/assets/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="plugins/assets/css/plugins.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <link href="plugins/assets/css/layout.min.css" rel="stylesheet" type="text/css" />
        <link href="plugins/assets/css/custom.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="favicon.ico" /> 
        
        <link rel="stylesheet" href="https://js.arcgis.com/4.1/esri/css/main.css">
        
        <link rel="icon" type="image/png" href="imgs/logoPic.png" sizes="32x32">
    </head>
    <!-- END HEAD -->
    
  
    
  <body class="page-header-fixed page-sidebar-closed-hide-logo"> 
  <!-- BEGIN CONTAINER -->
        <div class="wrapper">
        		<!-- 引入导航栏 -->
        		<jsp:include page="navi1.jsp" flush="true"/> 
            <div class="container-fluid">
	            <div class="page-content">
	            		<div class="page-content-container">
	            			<div class="page-content-row">
	            				<div id="viewDiv"></div>
	            			</div>
	            		</div>
	            </div>
	             <!-- BEGIN FOOTER -->
                <p class="copyright">2016 © 中国科学院空间应用工程与技术中心
                    <a href="http://www.csu.cas.cn/" title="Purchase Metronic just for 27$ and get lifetime updates for free" target="_blank">Here!</a>
                </p>
                <a href="#index" class="go2top">
                    <i class="icon-arrow-up"></i>
                </a>
                <!-- END FOOTER -->
            </div>
        </div>
  <!-- BEGIN CORE PLUGINS -->
        <script src="plugins/assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="plugins/assets/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="plugins/assets/js/js.cookie.min.js" type="text/javascript"></script>
        <script src="plugins/assets/js/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
        <script src="plugins/assets/js/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="plugins/assets/js/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="plugins/assets/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="plugins/assets/js/app.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <script src="plugins/assets/js/layout.min.js" type="text/javascript"></script>
        <script src="plugins/assets/js/quick-sidebar.min.js" type="text/javascript"></script>
        <!-- END THEME LAYOUT SCRIPTS -->  
        <script src="http://10.2.3.222:8080/arcgis_js_api/library/4.1/4.1/init.js"></script>
  </body>  
	<script type="text/javascript"> 
	$(document).ready(function(){
		$("#TRSQJC").addClass( "active open selected" );
	})
	
	/* require([
	  "esri/Map",
	  "esri/views/MapView",
	  "dojo/domReady!"
	], function(Map, MapView){
		  var map = new Map({
		    basemap: "streets"
		  });
		  var view = new MapView({
		    container: "viewDiv",  // Reference to the scene div created in step 5
		    map: map,  // Reference to the map object created before the scene
		    zoom: 4,  // Sets the zoom level based on level of detail (LOD)
		    center: [15, 65]  // Sets the center point of view in lon/lat
		  });
	}); */
	require([
	         "esri/Map",
	         "esri/views/MapView",
	         "esri/views/SceneView",
	         "esri/layers/ImageryLayer",
	         "esri/layers/support/RasterFunction",
	         "esri/layers/support/DimensionalDefinition",
	         "esri/layers/support/MosaicRule",
	         "esri/core/watchUtils",
	         "dojo/domReady!"
	       ], function(
	         Map, MapView, SceneView,ImageryLayer,
	         RasterFunction, DimensionalDefinition, MosaicRule, watchUtils
	       ) {
/*
	         var pixelBlock, factor, minValue, maxValue;


	         var rasterAttributes;

	         var layer = new ImageryLayer({
	           url: "http://10.2.3.222:6080/arcgis/rest/services/sde_DBO_shangxi/ImageServer",
	           //definitionExpression: "OBJECTID = 14",
	           pixelFilter: colorize // Applies color to the layer
	          
	         });

	         var map = new Map({
	           basemap: "dark-gray",
	           layers: [layer]
	         });

	         view = new MapView({
	           container: "viewDiv",
	           map: map,
	           center: [108, 34],
	           zoom: 6
	         });

	         var fields;

	         layer.then(function() {
	        	 	//console.log(layer.rasterFields);
	          
	         });
	         

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
				console.log(minValue+","+maxValue);
	           // The pixels visible in the view
	           var pixels = pixelBlock.pixels;
	           // The number of pixels in the pixelBlock
	           var numPixels = pixelBlock.width * pixelBlock.height;

	           // Calculate the factor by which to determine the red and blue
	           // values in the colorized version of the layer
	           factor = 255.0 / (maxValue - minValue);

	           // Get the pixels containing temperature values in the only band of the data
	           var tempBand = pixels[0];
			
	           // Create empty arrays for each of the RGB bands to set on the pixelBlock
	           var rBand = [];
	           var gBand = [];
	           var bBand = [];

	           // Loop through all the pixels in the view
	           for (i = 0; i < numPixels; i++) {
	             // Get the pixel value (the temperature) recorded at the pixel location
	             var tempValue = tempBand[i];
	             
	             // Calculate the red value based on the factor
	             var red = (tempValue - minValue) * factor;

	             // Sets a color between blue (coldest) and red (warmest) in each band
	             rBand[i] = red;
	             gBand[i] = 0;
	             bBand[i] = 255 - red;
	           }

	           // Set the new pixel values on the pixelBlock
	           pixelData.pixelBlock.pixels = [rBand, gBand, bBand];
	           pixelData.pixelBlock.pixelType = "U8"; // U8 is used for color
	         }

	         */
	    	   var mosaicRule = new MosaicRule({
	    	        ascending: true,
	    	        method: "center",
	    	        operation: "last"
	    	      });
	    	   var remapRF = new RasterFunction({
	    	        functionName: "Remap",
	    	        functionArguments: {
	    	          // pixel values of forest categories are 41, 42, and 43
	    	          // according to the  raster attribute table.
	    	          // The InputRanges property defines the ranges of intial pixel values to remap
	    	          // Three ranges: [0, 41], [41, 44], and [44, 255] are defined to extract forest pixels.
	    	          inputRanges: [5,8,8,10,10,15],
	    	          // non-forest pixels (0-41 and 44-255) are remapped to a value of 1,
	    	          // forest pixels (41-44) are remapped to a value of 2.
	    	          outputValues: [1, 2, 3],
	    	          // $$(default) refers to the entire image service,
	    	          // $2 refers to the second image of the image service
	    	          raster: "$$"
	    	        }
	    	      });
	    	   var colorRF = new RasterFunction({
	    	        functionName: "Colormap",
	    	        functionArguments: {
	    	        	//ColormapName : "Random"
	    	        	Colormap : [
				      [0,240,240,240],
				      [5,161,250,45],
				      [6,58,25,247],
				      [7,242,39,17],
				      [8,176,231,247],
				      [9,252,109,185],
				      [10,17,9,79],
				      [11,176,130,67],
				      [12,46,219,141],
				      [13,8,77,13],
				      [14,74,132,240]
				    ]
	    	        },
	    	        outputPixelType: "U8",
	    	        variableName : "Raster"
	    	      });
	    	   var streth = new RasterFunction({
	    	        functionName: "Stretch",
	    	        functionArguments: {
	    	        		StretchType : 6,
	    	            MinPercent : 0.25,
	    	            MaxPercent : 0.25,
	    	            Gamma: [1.25, 1.25, 1.25],
	    	            DRA:true,
	    	            Min:0,
	    	            Max:10
	    	        },
	    	        outputPixelType: "U8"
	    	      });
	    	   var layer = new ImageryLayer({
	    	        url: "http://10.2.3.222:6080/arcgis/rest/services/sde_DBO_shangxi1/ImageServer"
	    	        //definitionExpression: "OBJECTID = 14"
	    	        // apply the most recent raster function to the chain
	    	       /*  renderingRule: colorRF,
	    	        mosaicRule: mosaicRule, */
	    	      });
	    	   	var map = new Map({
	    	        basemap: "satellite",
	    	        layers: [layer]
	    	      });
			/* var view = new MapView({
	    	        container: "viewDiv",
	    	        map: map,
	    	        center: [108, 34],
	    	        zoom: 4
	    	      }); */
			var view = new SceneView({
		        container: "viewDiv",
		        map: map,
		        scale: 50000000,
		        center: [108, 34]
		      });
	       });
	</script>   
</html>  