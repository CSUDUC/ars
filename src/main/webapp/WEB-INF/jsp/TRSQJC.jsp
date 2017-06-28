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
#viewDiv1 {
	padding: 0;
	margin: 0;
	height: 100%;
	width: 100%;
}
#viewDiv1 p{
    
    color: #f36a5a;
    
}
.black_overlay{  display: none;  position: absolute;  top: 0%;  left: 0%;  width: 100%;  height: 100%;  background-color: #4e7779;  z-index:1001;  -moz-opacity: 0.8;  opacity:.80;  filter: alpha(opacity=80);  }  
.white_content {  display: none;  position: absolute;  top: 25%;  left: 25%;  width: 50%;  height: 50%;  padding: 16px;  border: 16px solid orange;  background-color: #150303;  z-index:1002;  overflow: auto;  } 
</style>
<meta charset="utf-8" />
<title>农业地理可视化大数据平台</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<!-- BEGIN LAYOUT FIRST STYLES -->
<link href="//fonts.googleapis.com/css?family=Oswald:400,300,700"
	rel="stylesheet" type="text/css" />
<!-- END LAYOUT FIRST STYLES -->
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all"
	rel="stylesheet" type="text/css" />
<link href="plugins/assets/css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<link href="plugins/assets/css/simple-line-icons.min.css"
	rel="stylesheet" type="text/css" />
<link href="plugins/assets/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="plugins/assets/css/bootstrap-switch.min.css"
	rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN THEME GLOBAL STYLES -->
<link href="plugins/assets/css/components.min.css" rel="stylesheet"
	id="style_components" type="text/css" />
<link href="plugins/assets/css/plugins.min.css" rel="stylesheet"
	type="text/css" />
<!-- END THEME GLOBAL STYLES -->
<!-- BEGIN THEME LAYOUT STYLES -->
<link href="plugins/assets/css/layout.min.css" rel="stylesheet"
	type="text/css" />
<link href="plugins/assets/css/custom.min.css" rel="stylesheet"
	type="text/css" />
<link href="plugins/assets/css/style1.css" rel="stylesheet"
	type="text/css" />

<!-- END THEME LAYOUT STYLES -->
<link rel="shortcut icon" href="favicon.ico" />

<!--link rel="stylesheet"
	href="https://js.arcgis.com/4.1/esri/css/main.css"-->
<link rel="stylesheet" href="https://js.arcgis.com/4.3/esri/css/main.css">
<!-- BEGIN LOGIN  -->
<link href="plugins/assets/css/login.css" rel="stylesheet"
	type="text/css" />
<link href="plugins/assets/css/login-2.min.css" rel="stylesheet"
	type="text/css" />

<link rel="icon" type="image/png" href="imgs/logoPic.png" sizes="32x32">
</head>
<!-- END HEAD -->
<body>
	<!-- BEGIN FRAMEWORK -->
	<div class="header" id="home">
		<nav class="navbar navbar-default"> <!-- BEGIN LOGO -->
		<div class="logo">
			<a href="login" style="float: left;"> <img src="imgs/logoPic.png"
				style="height: 90px;" alt="" />
			</a>
			<h1 style="color: #fdfdfd;">农业地理可视化大数据平台</h1>
			<br />
			<h2 style="color: #fdfdfd;">Agricultural Remote Sensing Visualization Platform</h2>
		</div>
		<!-- END LOGO -->
		<div class="container">
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right margin-top cl-effect-2">
					<li><a href="#TRSQJC"><span data-hover="首页">首页</span></a></li>
					<li><a href="#fields"><span data-hover="我的地块">我的地块</span></a></li>
					<li><a href="#downloadpage"><span data-hover="下载">下载</span></a></li>
					<li><a href="#settingpage"><span
							data-hover="个人账户">个人账户</span></a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /container-fluid --> </nav>
		<div id="tab_container">
			<div id="TRSQJC" class="tab_content" style="display: block; ">
				<div class="header-banner">
			<!-- Top Navigation -->
			<div class="container page-seperator" style="position: relative">

				<section class="color bgi">
				<div class="container-fluid">
					<div class="page-content">
						<div class="page-content-container">
							<div class="page-content-row">
								<div id="viewDiv"></div>
							</div>
						</div>
					</div>
				</div>
				<div style="position: absolute; left: 10px; top: 100px;width:250px;height:150px;">
					
					
					
					<input type="text" name="PositionName" value="输入地名" id = "PositionName" style="background-color: black;"><button id="gotoPositionName" style="background: black;">goto</button>
					
					<button onclick="StartDraw()" style="background: black;">Draw</button>
					<button id = "UndoOfDraw" style="display:none;background: black;">Undo</button>
					
					<button id="ImageryLayer" style="background: black;">ImageryLayer</button>
				</div>
				<div id="ProductGallery" style="position: absolute; left: 5%; bottom: 150px;width:90%;height:150px;display:none;">
					<ul id="ProductGalleryPic">
						
					</ul>
				</div>
				<!--div id="SaveDrawPic" style="position: absolute; left: 10px;top: 200px;width:300px;height:300px;">
					
				</div-->
				<div id="chooseproduct" style="position: absolute; right: 10px; top: 10px;width: 285px;display: none;">
					<div class="banner-forms">
						<form>
							<div class="input-group">
								<span class="input-group-addon"> <input type="checkbox"
									aria-label="...">
								</span>
								<div id="selectList1" class="form-control">
									<span>农作物精细分类与面积统计</span>
								</div>
							</div>
							<div class="input-group">
								<span class="input-group-addon"> <input type="checkbox"
									aria-label="...">
								</span>
								<div id="selectList2" class="form-control">
									<span>农作物长势监测</span>
								</div>
							</div>
							<div class="input-group">
								<span class="input-group-addon"> <input type="checkbox"
									aria-label="...">
								</span>
								<div id="selectList3" class="form-control">
									<span>农作物病虫害监测</span>
								</div>
							</div>
							<div class="input-group">
								<span class="input-group-addon"> <input type="checkbox"
									aria-label="...">
								</span>
								<div id="selectList4" class="form-control">
									<span>土壤墒情监测</span>
								</div>
							</div>
							<div class="input-group">
								<span class="input-group-addon"> <input type="checkbox"
									aria-label="...">
								</span>
								<div id="selectList5" class="form-control">
									<span>农作物估产</span>
								</div>
							</div>
							<!--button type="submit" class="btn btn-info mrgn-can">查询</button-->
						</form>
					</div>
				</div>
				</section>
			</div>
		</div>
			</div>
			<div id="fields" class="tab_content" style="display: none; ">
				<div class="header-banner">
			<!-- Top Navigation -->
			<div class="container page-seperator" style="position: relative">

				<section class="color bgi">
					<div class="container-fluid">
						<div class="page-content">
							<div class="page-content-container">
								<div class="page-content-row">
									<div id="viewDiv1">
										<ul id="orders">
									        <!-- These are our grid blocks -->
									        
									        
									
									        <!-- End of grid blocks -->
									      </ul>
									</div>
										
									
								</div>
							</div>
						</div>
					</div>
				
				
				
					
					</section>
			</div>
		</div>
			</div>
			<div id="downloadpage" class="tab_content" style="display: none; "></div>
			<div id="settingpage" class="tab_content" style="display: none; "></div>
		</div>
		
	</div>
	<div class="copyrights">
		Collect from <a href="http://www.cssmoban.com/">企业网站模板</a>
	</div>
	<div class="clearfix"></div>
	<!-- END FRAMEWORK -->
	<!-- BEGIN CONTAINER -->
	<div class="wrapper">
		<!-- BEGIN FOOTER -->
		<p class="copyright">
			2016 © 中国科学院空间应用工程与技术中心 <a href="http://www.csu.cas.cn/"
				title="Purchase Metronic just for 27$ and get lifetime updates for free"
				target="_blank">Here!</a>
		</p>
		<a href="#index" class="go2top"> <i class="icon-arrow-up"></i>
		</a>
		<!-- END FOOTER -->
	</div>
	</div>
		<div id="light" class="white_content"> 
		    输入地块名称：<input type="text" name="DrawAreaName" value="" id = "DrawAreaName" style="background-color: black;">
		    <br>
		    农作物种类：
		    <br>
		    小麦:
		    <input type="checkbox" name="cropKinds" value="小麦"/>
			<br/>
			玉米: 
			<input type="checkbox" name="cropKinds" value="玉米" />
			<br/>
			水稻: 
			<input type="checkbox" name="cropKinds" value="水稻" />
			<br/>
		    <button id="SaveDraw" style="background: black;">Save</button>
		    <button id="CancelSaveDraw" style="background: black;">Cancel</button>
	    </div> 
		<div id="fade" class="black_overlay"> 
		</div> 
	<!-- BEGIN CORE PLUGINS -->
	<script src="plugins/assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="plugins/assets/js/jquery.wookmark.js" type="text/javascript"></script>
	<script src="plugins/assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="plugins/assets/js/js.cookie.min.js" type="text/javascript"></script>
	<script src="plugins/assets/js/bootstrap-hover-dropdown.min.js"
		type="text/javascript"></script>
	<script src="plugins/assets/js/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<script src="plugins/assets/js/jquery.blockui.min.js"
		type="text/javascript"></script>
	<script src="plugins/assets/js/bootstrap-switch.min.js"
		type="text/javascript"></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN THEME GLOBAL SCRIPTS -->
	<script src="plugins/assets/js/app.min.js" type="text/javascript"></script>
	<!-- END THEME GLOBAL SCRIPTS -->
	<!-- BEGIN THEME LAYOUT SCRIPTS -->
	<script src="plugins/assets/js/layout.min.js" type="text/javascript"></script>
	<script src="plugins/assets/js/quick-sidebar.min.js"
		type="text/javascript"></script>
	<!-- END THEME LAYOUT SCRIPTS -->
	<!--script
		src="http://10.2.3.222:8080/arcgis_js_api/library/4.1/4.1/init.js"></script-->
		<script src="https://js.arcgis.com/4.3/"></script>
</body>
<script type="text/javascript">
var wookmarkParas = {
	      // Prepare layout options.
	      autoResize: true, // This will auto-update the layout when the browser window is resized.
	      container: $('#viewDiv1'), // Optional, used for some extra CSS styling
	      offset: 5, // Optional, the distance between grid items
	      outerOffset: 10, // Optional, the distance to the containers border
	      itemWidth: 210, // Optional, the width of a grid item
	      itemHeight: 210
	  };
var wookmarkParas1 = {
	      // Prepare layout options.
	      autoResize: true, // This will auto-update the layout when the browser window is resized.
	      container: $('#ProductGallery'), // Optional, used for some extra CSS styling
	      offset: 5, // Optional, the distance between grid items
	      outerOffset: 10, // Optional, the distance to the containers border
	      itemWidth: 120, // Optional, the width of a grid item
	      itemHeight: 120
	  };	  

var exportImage="/exportImage?bbox=105.48500796400003%2C31.691026704000073%2C111.27500738500004%2C39.621025911000075&bboxSR=&size=&imageSR=&time=&format=jpgpng&pixelType=F32&noData=&noDataInterpretation=esriNoDataMatchAny&interpolation=+RSP_BilinearInterpolation&compressionQuality=&bandIds=&mosaicRule=&renderingRule=&f=image";
var ImageServers=["http://10.2.3.222:6080/arcgis/rest/services/TRSQ_20170101/ImageServer",
"http://10.2.3.222:6080/arcgis/rest/services/TRSQ_20170108/ImageServer",
"http://10.2.3.222:6080/arcgis/rest/services/TRSQ_20170115/ImageServer",
"http://10.2.3.222:6080/arcgis/rest/services/TRSQ_20170122/ImageServer",
"http://10.2.3.222:6080/arcgis/rest/services/TRSQ_20170129/ImageServer"];
var dates = ["2017-01-01","2017-01-08","2017-01-15","2017-01-22","2017-01-29"];
var fieldsArray = [];	


/* (function ($){
  	var handler = $('#ProductGalleryPic li');
  	for(var i = 0;i<ImageServers.length;i++)
	     {
	        				
	        var ImageServerUrl = ImageServers[i]+exportImage;
	        	$("#ProductGalleryPic").append("<li style='display: list-item; position: absolute;' id='"+dates[i]+"'><img src='plugins/assets/img/image_1.jpg' width='120' height='120'><p>"+dates[i]+"</p></li>");
	      }
  	handler.wookmark(wookmarkParas1);
 
})(jQuery); */

	/*$(document).ready(function() {
		//$("#TRSQJC").addClass("active open selected");
		//Default Action  
	    $(".tab_content").hide(); //Hide all content  
	    $("ul.nav li:first").addClass("active").show(); //Activate first tab  
	    $(".tab_content:first").show(); //Show first tab content  
	      
	    //On Click Event  
	    $("ul.nav li").click(function() {  
	        $("ul.nav li").removeClass("active"); //Remove any "active" class  
	        $(this).addClass("active"); //Add "active" class to selected tab  
	        $(".tab_content").hide(); //Hide all tab content  
	        var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content  
	        //alert(activeTab);
	        $(activeTab).fadeIn(); //Fade in the active content
	        if(activeTab=="#fields")
	        	{
	        		$('#orders li').remove();
	        		fieldsArray = [];
	        		//alert(activeTab);
	        		$.ajax({  
	                    type:"POST",  
	                    url:"initfieldsPage",  
	                    dataType:"json",  
	                    async: false,  
	                    success:function(data){
	                    		fieldsArray = data;
	                    		for(var i = 0;i<data.length;i++)
	                    			{
	                    				var order = data[i];
	                    				$("#orders").append("<li style='display: list-item; position: absolute;' id='"+order["codeid"]+"'><img src="+order["sdpath"]+"><p>1</p></li>");
	                    			}
	                    		var handler = $('#orders li');
	                    		handler.wookmark(wookmarkParas);
	                    		
	                    		
	                    		
	                    },  
	                    error:function(){  
	                         alert("方法执行不成功!");  
	                    }    
             		});
	        	
	        	}
	        return false;  
	    });  
	});*/
	
require(["dijit/Dialog", "dijit/form/TextBox", "dijit/form/Button"]);
	var m_StartDraw =false;
	function StartDraw()
	{
		m_StartDraw = true;
		document.getElementById("ProductGallery").style.display= "none";
		document.getElementById("chooseproduct").style.display= "none";
		
	}
	/* function SaveDraw(geometry)
	{
		
		console.log(geometry);
	} */
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
	require(
			[ "dojo/dom","dojo/on","dojo/query","dojo/_base/array",
			  "esri/Map", "esri/views/MapView", "esri/views/SceneView",
					"esri/layers/ImageryLayer",
					"esri/layers/GraphicsLayer",
					"esri/geometry/Point",
					"esri/geometry/Polyline",
					"esri/geometry/Polygon",
					"esri/geometry/Extent",
					"esri/geometry/Circle",
					"esri/Graphic",
					"esri/symbols/SimpleMarkerSymbol",
					"esri/symbols/SimpleLineSymbol",
					"esri/symbols/SimpleFillSymbol",
					"esri/symbols/TextSymbol",
					"esri/layers/support/RasterFunction",
					"esri/layers/support/DimensionalDefinition",
					"esri/layers/support/MosaicRule", "esri/core/watchUtils",
					"esri/tasks/PrintTask",
		            "esri/tasks/support/PrintTemplate",
		            "esri/tasks/support/PrintParameters",
		            "esri/widgets/Print",
		            "esri/tasks/QueryTask",
		            "esri/tasks/support/Query",
		            "esri/config",
					"dojo/domReady!" ],
			function(dom,on,query,arrayUtils,Map, MapView, SceneView, ImageryLayer, 
					GraphicsLayer, Point,
					Polyline, Polygon, Extent, Circle, Graphic, SimpleMarkerSymbol, SimpleLineSymbol,
					SimpleFillSymbol, TextSymbol,
					RasterFunction,
					DimensionalDefinition, MosaicRule, watchUtils,
					PrintTask,PrintTemplate,PrintParameters,Print,
					QueryTask,Query,esriConfig) {
				
				$(".tab_content").hide(); //Hide all content  
			    $("ul.nav li:first").addClass("active").show(); //Activate first tab  
			    $(".tab_content:first").show(); //Show first tab content  
			      
			    //On Click Event  
			    $("ul.nav li").click(function() {  
			        $("ul.nav li").removeClass("active"); //Remove any "active" class  
			        $(this).addClass("active"); //Add "active" class to selected tab  
			        $(".tab_content").hide(); //Hide all tab content  
			        var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content  
			        //alert(activeTab);
			        $(activeTab).fadeIn(); //Fade in the active content
			        if(activeTab=="#fields")
			        	{
			        		$('#orders li').remove();
			        		fieldsArray = [];
			        		//alert(activeTab);
			        		$.ajax({  
			                    type:"POST",  
			                    url:"initfieldsPage",  
			                    dataType:"json",  
			                    async: false,  
			                    success:function(data){
			                    		fieldsArray = data;
			                    		for(var i = 0;i<data.length;i++)
			                    			{
			                    				var order = data[i];
			                    				$("#orders").append("<li style='display: list-item; position: absolute;' id='"+order["codeid"]+"'><img src="+order["sdpath"]+"><p>"+order["ordername"]+order["cropkinds"]+"</p></li>");
			                    			}
			                    		var handler = $('#orders li');
			                    		handler.wookmark(wookmarkParas);
			                    		
			                    		 //On Click Event  
			            			    handler.click(function() {
				            			    	  var activeid = $(this).attr("id");
				            			    	  
				            			    	  AddGra(activeid);
				            			    	  initProductGallery(activeid);
				            			});
			                    		
			                    },  
			                    error:function(){  
			                         alert("方法执行不成功!");  
			                    }    
		             		});
			        	
			        	}
			        return false;  
			    });  
			    
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
				esriConfig.request.corsDetection = false;
				esriConfig.request.corsEnabledServers.push("http://10.2.3.222:6080");
				//esriConfig.request.corsEnabledServers.push("http://10.2.3.222:6080");
				var mosaicRule = new MosaicRule({
					ascending : true,
					method : "center",
					operation : "last"
				});
				var remapRF = new RasterFunction({
					functionName : "Remap",
					functionArguments : {
						// pixel values of forest categories are 41, 42, and 43
						// according to the  raster attribute table.
						// The InputRanges property defines the ranges of intial pixel values to remap
						// Three ranges: [0, 41], [41, 44], and [44, 255] are defined to extract forest pixels.
						inputRanges : [ 5, 8, 8, 10, 10, 15 ],
						// non-forest pixels (0-41 and 44-255) are remapped to a value of 1,
						// forest pixels (41-44) are remapped to a value of 2.
						outputValues : [ 1, 2, 3 ],
						// $$(default) refers to the entire image service,
						// $2 refers to the second image of the image service
						raster : "$$"
					}
				});
				var colorRF = new RasterFunction({
					functionName : "Colormap",
					functionArguments : {
						//ColormapName : "Random"
						Colormap : [ [ 0, 240, 240, 240 ], [ 5, 161, 250, 45 ],
								[ 6, 58, 25, 247 ], [ 7, 242, 39, 17 ],
								[ 8, 176, 231, 247 ], [ 9, 252, 109, 185 ],
								[ 10, 17, 9, 79 ], [ 11, 176, 130, 67 ],
								[ 12, 46, 219, 141 ], [ 13, 8, 77, 13 ],
								[ 14, 74, 132, 240 ] ]
					},
					outputPixelType : "U8",
					variableName : "Raster"
				});
				var streth = new RasterFunction({
					functionName : "Stretch",
					functionArguments : {
						StretchType : 6,
						MinPercent : 0.25,
						MaxPercent : 0.25,
						Gamma : [ 1.25, 1.25, 1.25 ],
						DRA : true,
						Min : 0,
						Max : 10
					},
					outputPixelType : "U8"
				});
				var m_Imagerylayer = new ImageryLayer(
						{
							url : "http://10.2.3.222:6080/arcgis/rest/services/TRSQ/ImageServer"
						//definitionExpression: "OBJECTID = 14"
						// apply the most recent raster function to the chain
						/*  renderingRule: colorRF,
						 mosaicRule: mosaicRule, */
						});
				/* var map = new Map({
					basemap : "satellite",
					layers : [ layer ]
				}); */
				var map = new Map({
					basemap : "satellite"
				});
				var view = new MapView({
				        container: "viewDiv",
				        map: map,
				        center: [108, 34],
				        zoom: 4
				      });
				/*var view = new SceneView({
					container : "viewDiv",
					map : map,
					scale : 50000000,
					center : [ 108, 34 ]
				}); */
				_clickPoints = []; // 点击绘制时的点集合
	            //_tempGraphicLayer = new GraphicsLayer(); // 绘制过程中的要素图层
	            _drawGraphicLayer = new GraphicsLayer(); // 绘制完成的要素图层
	            map.add(_drawGraphicLayer);
	            /*
	            *地名搜索相关变量
	            */
	            var PositionQueryUrl ="http://10.2.3.222:6080/arcgis/rest/services/ChinaCountry/MapServer/0";
	            // Create graphics layer and symbol to use for displaying the results of query    
	            var PositionQueryResultsLyr = new GraphicsLayer();
	            var PositionQueryTask = new QueryTask({
	              url: PositionQueryUrl
	            });
				var PositionQueryparams = new Query({
	              returnGeometry: true,
	              outFields: ["*"]
	            });
	            map.add(PositionQueryResultsLyr);//添加地名查询结果图层
	            /*
	            *Draw 生成的Graphic
	            */
	            var m_GraphicOfDraw;
	            //map.add(_tempGraphicLayer);
	            var polygonSymbol = new SimpleFillSymbol({ // 默认绘制polygon的样式
                    color: [255, 128, 0, 0.5],
                    style: "solid",
                    outline: {
                        color: [0, 124, 247, 1],
                        width: 2
                    }
                });
	            var tempPolygonSymbol = new SimpleFillSymbol({ // 绘制过程中的polygon样式
                    color: [0, 0, 0, 0],
                    style: "solid",
                    outline: {
                        color: [0, 124, 247, 1],
                        width: 2
                    }
                });
	            var tempPolyline=new SimpleLineSymbol({
                    color: [0, 124, 247, 1],
                    width: 2,
                    style: "solid"
                });
	            var PointSymbol = SimpleMarkerSymbol({
	            	  color: "red",
	            	  outline: {
	            	    color: [128, 128, 128, 0.5],
	            	    width: "0.5px"
	            	  }
	            	});
	          	//添加地名
                var textSymbol = new TextSymbol({
                	  color: "white",
                	  haloColor: "black",
                	  haloSize: "1px",
                	  text: "You are here",
                	  xoffset: 3,
                	  yoffset: 3,
                	  font: {  // autocast as esri/symbols/Font
                	    size: 12,
                	    family: "sans-serif",
                	    weight: "bolder"
                	  }
                	});
	            //设置提示
	            dojo.query(view.container).addContent('<div id="fn-tooltip-div" style="position:absolute;border: 1px solid #999;padding: 4px;background:#836FFF;"></div>');
	            _tooltipMsg = {
	                click: '点击开始绘制',
	                doubleClick: '双击结束绘制'
	            };
	            _tooltipNode = dom.byId('fn-tooltip-div');
	            
	            function _setTooltipMsg(msg) {
	            	
	                if (msg) {
	                    this._tooltipNode.style.display = "block";
	                } else {
	                    this._tooltipNode.style.display = "none";
	                }
	                _tooltipNode.innerHTML = msg;
	                //alert(_tooltipNode.innerHTML);
	            }
	            view.on("pointer-move",function(e){
	            		
		            	if(m_StartDraw)
	            		{
		            		
		            		_tooltipNode.style['top']= (e.y + 10) + "px";
		            		_tooltipNode.style['left']= (e.x + 15) + "px";
		            		//alert(e.pageY);
		            		_setTooltipMsg(_tooltipMsg.click+","+_tooltipMsg.doubleClick);
	            		}
	            });
	            view.on("click", function(event){
	            	
	            		if(m_StartDraw)
	            		{
	            			// event is the event handle returned after the event fires.
	  	            	  //me._drawPoint(event.mapPoint);
	            		 //_setTooltipMsg(_tooltipMsg.doubleClick);
	            		 
	                  _clickPoints.push(event.mapPoint);
	                 // _tempGraphicLayer.removeAll();
	                  _drawGraphicLayer.removeAll();
	                  event.stopPropagation();
	                  var graphic;
	                  _drawPolygon(_clickPoints,_drawGraphicLayer);
	                  
	                  _drawPoint(event.mapPoint,_drawGraphicLayer);
	                  showUndoOrNot();
	            		}
	            	  
	            	});
	            view.on('double-click', function (event) {
	                if (m_StartDraw) {
	                	
	                	var t1 = dom.byId("light");
                	 	var t2 = dom.byId("fade");
                	 	t1.style.display="block";
                	 	t2.style.display="block";
                	 	
	                    event.stopPropagation();
	                    //_clickPoints.push(event.mapPoint);
	                    _drawGraphicLayer.removeAll();
	                    m_GraphicOfDraw = _generateGraphic();
	                    //console.log(graphic);
	                    //graphic.mapPoint = event.mapPoint;
	                    var extent_Gra = m_GraphicOfDraw.geometry.extent;
			 	        view.extent = extent_Gra;
	                    
	                    
	                    _endDraw(m_GraphicOfDraw);
	                    //数据库保存
	                   /* _drawGraphicLayer.removeAll();
	                   var testGStr = dojo.toJson(graphic.toJSON());
	                   var testGra = Graphic.fromJSON(dojo.fromJson(testGStr));
	                    _drawGraphicLayer.add(testGra);  */ 
	                }
	            });
	            
	            on(dom.byId("gotoPositionName"),"click",function(){
	            		var m_positonName = dom.byId('PositionName').value;
	            		PositionQueryResultsLyr.removeAll();
	            		
	            		PositionQueryparams.where = "SNAME='"+m_positonName+"'";
	            		PositionQueryTask.execute(PositionQueryparams).then(getResults).otherwise(promiseRejected);
	            		
	            });
	         // Called each time the promise is resolved    
	            function getResults(response) {
					console.log(response);
	              // Loop through each of the results and assign a symbol and PopupTemplate
	              // to each so they may be visualized on the map
	              var peakResults = arrayUtils.map(response.features, function(
	                feature) {

	                // Sets the symbol of each resulting feature to a cone with a 
	                // fixed color and width. The height is based on the mountain's elevation
	                feature.symbol = tempPolygonSymbol;
					return feature;
	              });

	              PositionQueryResultsLyr.addMany(peakResults);

	              // animate to the results after they are added to the map  
	              view.goTo(peakResults);
	              
	            }
	         // Called each time the promise is rejected    
	            function promiseRejected(err) {
	              console.error("Promise rejected: ", err.message);
	            }
	            on(dom.byId("UndoOfDraw"),"click",function(){
	            		
	            		_clickPoints.pop();
	            		_drawGraphicLayer.removeAll();
	            		if(_clickPoints.length>0)
	            		{
	            			_drawPolygon(_clickPoints,_drawGraphicLayer);
	            			var endPoint = _clickPoints[_clickPoints.length-1];
	  	                _drawPoint(endPoint,_drawGraphicLayer);
	            		}
	            		showUndoOrNot();
	            		
	            });
	            
	            function showUndoOrNot() {
	                //int minPoints = 1;
					var UndoDiv = dom.byId("UndoOfDraw");
	                if(_clickPoints.length == 0)
	                {
	                		UndoDiv.style.display = "none";
	                    return false;
	                }
	                else{
						UndoDiv.style.display = "block";
	                    return true;
	                }

	            }
	          //给地图打印按钮绑定事件
                on(dom.byId("CancelSaveDraw"),"click",function(){
                		//alert(m_cropKindsVal);
                   	var t1 = dom.byId("light");
                	 	var t2 = dom.byId("fade");
                	 	t1.style.display="none";
                	 	t2.style.display="none";
                });
	          //给地图打印按钮绑定事件
                 on(dom.byId("SaveDraw"),"click",function(){
                			// 添加地块名称
                			var m_drawareaName = dom.byId('DrawAreaName').value;
	                    var geometry_Gra = m_GraphicOfDraw.geometry;
	                    var textPos = new Point();
	                    if(geometry_Gra.type=="point")
	                    	{
	                    		textPos = m_GraphicOfDraw.geometry;
	                    	}
	                    else{
		                    var extent_Gra = geometry_Gra.extent;
		 	                //view.extent = extent_Gra;
		 	                textPos = extent_Gra.center;
	                    }
	                    textSymbol.text = m_drawareaName;
	                   	var graphic_text = new Graphic({
	                        geometry: textPos,
	                        symbol: textSymbol
	                    });
	                    _drawGraphicLayer.add(graphic_text);  
                     
	                  	
		        	  		//alert(result.url);
             	 	var printTask = new PrintTask({
             			//https://sampleserver6.arcgisonline.com/arcgis/rest/services/Utilities/PrintingTools/GPServer/Export%20Web%20Map%20Task
             			url: "http://10.2.3.222:6080/arcgis/rest/services/Utilities/PrintingTools/GPServer/Export%20Web%20Map%20Task"
             		});

             		var template = new PrintTemplate({
             		 
             		 exportOptions: {
             			width: 200,  
                     	height: 200,
             		  	dpi: 96
             		 }
             		});

             		var params = new PrintParameters({
             		 view: view,
             		 template: template
             		});

             		printTask.execute(params).then(printResult, printError);
             		/////////
             		
                	/* var printTask = new PrintTask("https://sampleserver6.arcgisonline.com/arcgis/rest/services/Utilities/PrintingTools/GPServer/Export%20Web%20Map%20Task");  
                    
                	var template = new PrintTemplate();  
                    
                    template.exportOptions = {  
                        width: 800,  
                        height: 600,  
                        dpi: 96  
                    };  
                    template.format = "PDF";  
                    template.layout = "MAP_ONLY";  
                    template.preserveScale = false;  
                    var params = new PrintParameters();  
                    params.view = view;  
                    params.outSpatialReference = view.spatialReference;
                    params.template = template;  
                    printTask.execute(params, function(evt){
                    		console.log(evt.url);
                    		alert(evt.url);
                        
                    });   */
                }); 
	          //ImageryLayer
	          on(dom.byId("ImageryLayer"),"click",function(){
	        	  	/* var layer = new ImageryLayer({
	                  url: "https://sampleserver6.arcgisonline.com/arcgis/rest/services/NLCDLandCover2001/ImageServer",
	                  format: "jpgpng" // server exports in either jpg or png format
	                }); */
	        	  	map.add(m_Imagerylayer);
	          });
	          function printResult(result)
	          {
	        		//SaveDrawPic
      	  		/* var SaveDrawPic = dom.byId("SaveDrawPic");
      	  		SaveDrawPic.style['background-image']= "url("+result.url+")"; */
      	  		
	        	  	var m_drawareaName = dom.byId('DrawAreaName').value;
               	var m_cropKinds = document.getElementsByName("cropKinds");
               	var m_cropKindsVal = [];
               	    for(k in m_cropKinds){
               	        if(m_cropKinds[k].checked)
               	        	m_cropKindsVal.push(m_cropKinds[k].value);
               	    }
               	//alert(m_cropKindsVal);
               	var t1 = dom.byId("light");
            	 	var t2 = dom.byId("fade");
            	 	t1.style.display="none";
            	 	t2.style.display="none";
            	 	
            	 	
            	 	var m_GraphicOfDrawStr = dojo.toJson(m_GraphicOfDraw.toJSON());
	            /* var testGra = Graphic.fromJSON(dojo.fromJson(testGStr));
	            _drawGraphicLayer.add(testGra); */
	            //alert(m_GraphicOfDrawStr);       
               	$.ajax({  
	                    type:"POST",  
	                    url:"doDrawSave",  
	                    dataType:"json",  
	                    async: false,  
	                    data:{resultPicUrl:result.url,drawareaName:m_drawareaName,cropKinds:JSON.stringify(m_cropKindsVal),GraphicOfDrawStr:m_GraphicOfDrawStr},  
	                    success:function(data){  
	                    		alert(data);
	                    },  
	                    error:function(){  
	                            alert("方法执行不成功!");  
	                    }    
	             });  
	          }
	          function printError(eror)
	          {
	        	  	console.log(error);
	          }
                /* view.then(function() {
                    var print = new Print({
                      view: view,
                      // specify your own print service
                      //https://utility.arcgisonline.com/arcgis/rest/services/Utilities/PrintingTools/GPServer/Export%20Web%20Map%20Task
                      printServiceUrl: "https://sampleserver6.arcgisonline.com/arcgis/rest/services/Utilities/PrintingTools/GPServer/Export%20Web%20Map%20Task"
                    });

                    // Add widget to the top right corner of the view
                    view.ui.add(print, "top-left");
                  }); */
                
	            function _drawPolygon(mapPoints, layer) {
	                var _layer = layer;
	                if (mapPoints.length === 2) {
	                		
	                    _drawPolyline(mapPoints, layer);
	                } else if (mapPoints.length > 2) {
	                    var polygon = new Polygon({
	                        spatialReference: view.spatialReference,
	                        rings: [dojo.map(mapPoints, function (mapPoint) {
	                            return [mapPoint.x, mapPoint.y];
	                        })]
	                    });
	                    var graphic = new Graphic({
	                        geometry: polygon,
	                        symbol: polygonSymbol
	                    });
	                    _layer.add(graphic);
	                    //_drawPoint(polygon.centroid);
	                    //console.log(polygon.centroid)
	                    return graphic;
	                }
	            }
	            function _drawPolyline(mapPoints, layer) {
	                var _layer = layer;
	                var polyline = new Polyline({
	                    spatialReference: view.spatialReference,
	                    paths: [dojo.map(mapPoints, function (mapPoint) {
	                        return [mapPoint.x, mapPoint.y];
	                    })]
	                });
	                var graphic = new Graphic({
	                    geometry: polyline,
	                    symbol: tempPolyline
	                });
	                _layer.add(graphic);
	                return graphic;
	            }
	            function _drawPoint(mapPoint, layer) {
	            	var _layer = layer ||_drawGraphicLayer;
	                var mp = new Point({
	                    spatialReference: view.spatialReference,
	                    x: mapPoint.x,
	                    y: mapPoint.y
	                }); 
	                var graphic = new Graphic({
	                    geometry: mp,
	                    symbol: PointSymbol
	                });
	                _layer.add(graphic);
	                return graphic;
	            }
	            function _generateGraphic() {
	            		alert(_clickPoints.length);
	                if(_clickPoints.length>=2)
	                	{
	                		if(_clickPoints==2)
	                		{
	                			return _drawPolyline(_clickPoints,_drawGraphicLayer);
	                		}
	                		else{
	                			return _drawPolygon(_clickPoints,_drawGraphicLayer);
	                		}
	                		
	                	}
	                else{
	                		return _drawPoint(_clickPoints[0],_drawGraphicLayer);
	                } 
	                
	            		//return _drawPolygon(_clickPoints,_drawGraphicLayer);
	            }
	            function _endDraw(graphic) {
	                m_StartDraw = false;
	                //_drawGraphicLayer.removeAll();
	                _clickPoints = [];
	                _setTooltipMsg('');
	                return graphic;
	            }
	            
	            function AddGra(selectorderid){
		            	
	            		for(var i = 0;i<fieldsArray.length;i++)
	            			{
	            				var selectorder = fieldsArray[i];
	            				if(selectorder["codeid"]==selectorderid)
	            					{
	            						var selectgeometry = selectorder["geometry"];
	            						//alert(selectgeometry);
	            						var selectGra = Graphic.fromJSON(dojo.fromJson(selectgeometry));
	            						_drawGraphicLayer.removeAll();
						            _drawGraphicLayer.add(selectGra);
						            
						            var extent_selectGra = selectGra.geometry.extent;
						 	        view.extent = extent_selectGra;
						 	        
						 	       var geometry_selectGra = selectGra.geometry;
				                    var textPos = new Point();
				                    if(geometry_selectGra.type=="point")
				                    	{
				                    		textPos = selectGra.geometry;
				                    	}
				                    else{
					                    var extent_selectGra = geometry_selectGra.extent;
					 	                //view.extent = extent_Gra;
					 	                textPos = extent_selectGra.center;
				                    }
				                    textSymbol.text = selectorder["ordername"];
				                   	var graphic_text = new Graphic({
				                        geometry: textPos,
				                        symbol: textSymbol
				                    });
				                    _drawGraphicLayer.add(graphic_text);  
				                    
				                    //initProductGallery(selectorderid);
	            						return true;
	            					}
	            			}
				}
	            function initProductGallery(selectorderid)
	            {
	            		dom.byId("ProductGallery").style.display = "block";
	            		dom.byId("chooseproduct").style.display = "block";
	            		
	            	    $('#ProductGalleryPic li').remove();
		            	//alert(selectorderid);
		            	
		            	$(".tab_content").hide(); //Hide all content
		            	$("ul.nav li").removeClass("active");
					$("ul.nav li:first").addClass("active").show(); //Activate first tab  
					$(".tab_content:first").show(); //Show first tab content  
		            	
		            	for(var i = 0;i<ImageServers.length;i++)
		       	     {
		       	        				
		       	        var ImageServerUrl = ImageServers[i]+exportImage;
		       	        	$("#ProductGalleryPic").append("<li style='display: list-item; position: absolute;' id='"+dates[i]+"'><img src="+ImageServerUrl+" width='120' height='120'><p>"+dates[i]+"</p></li>");
		       	      }
		       		var handler = $('#ProductGalleryPic li');
		       		handler.wookmark(wookmarkParas1);
		       		 //On Click Event  
	    			    handler.click(function() {
	        			    	  var activeid = $(this).attr("id");
	        			    	  alert(activeid);
	        			    	  
	        			});
	            }
		       
		         
			});
</script>
</html>
