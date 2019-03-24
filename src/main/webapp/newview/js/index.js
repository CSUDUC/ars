/**
 * 
 */
var codeid;
var map;
var view;
var PositionQueryResultsLyr;
var PositionQueryUrl;
var _drawGraphicLayer;

/*
 *Draw 或者是选择行政区域 生成的Graphic
 */
var m_GraphicOfDraw;
var m_GraphicOfChooseArea;
var polygonSymbol; 
var tempPolygonSymbol;
var tempPolyline;
var PointSymbol;
var textSymbol;
var productType_en2ch={
		"TRSQ":["土壤墒情监测","function04"],//土壤墒情
		"NZWJXFL":["农作物分类与面积统计","function01"],//农作物精细分类与面积统计
		"YMJZSJC":"叶面积指数监测",//叶面积指数监测
		"NYBCHJC":["农业病虫害监测","function02"],//农业病虫害监测
		"NZWZSJC":["农作物长势监测","function03"],//农作物长势监测
		"NZWGC":["农作物估产","function06"],//农作物估产
		"TRFL":["土壤肥力监测","function05"]//土壤肥力
};
var m_StartDraw =false;
var DrawOrChoose = false;//true Draw， false Choose
$(function(){
		$('.BbWebMenu ul li').click(function(e) {
            $(this).addClass('current').siblings().removeClass('current');
        });
		$('.webinfo_img').click(function(e) {
			$('.user_mark').toggle();
        });
		$('.user_mark a').click(function(e) {
            $('.user_mark').hide();
        });
		$('.BbWebBtns ul li .region').click(function(e) {
			m_StartDraw = false;
			DrawOrChoose=false;
            $('.BbRegionSelect').show();
			//$('.BbDrawBlock').hide();
			$('.BbWebBlockCheck').hide();
			$('.BbBlockSavingWrap').hide(); 
			
			$('#block_btns_draw').hide();
        });
		$('.region_btn .sure').click(function(e) {
            //$('.BbDrawBlock').show();
			$('.BbRegionSelect').hide();
			processRegion();
			
        });
		$('.region_btn .sure').mouseover(function(e) {
            $(this).css('background','#1189aa');
        });
		$('.region_btn .sure').mouseout(function(e) {
            $(this).css('background','#24add2');
        });
		
		$('.region_btn .cancel').click(function(e) {
            $('.BbRegionSelect').hide();
        });
		$('.region_btn .cancel').mouseover(function(e) {
            $(this).css('background','#24add2');
			$(this).css('color','#fff');
        });
		$('.region_btn .cancel').mouseout(function(e) {
            $(this).css('background','#fff');
			$(this).css('color','#24add2');
        });

		require(
				[ "dojo/dom","dojo/on","dojo/query","dojo/_base/array",
				  "esri/Map", "esri/views/MapView", "esri/views/SceneView",
						"esri/layers/ImageryLayer",
						"esri/layers/GraphicsLayer",
						"esri/layers/MapImageLayer",
						"esri/geometry/Geometry",
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
						GraphicsLayer, MapImageLayer,Geometry,Point,
						Polyline, Polygon, Extent, Circle, Graphic, SimpleMarkerSymbol, SimpleLineSymbol,
						SimpleFillSymbol, TextSymbol,
						RasterFunction,
						DimensionalDefinition, MosaicRule, watchUtils,
						PrintTask,PrintTemplate,PrintParameters,Print,
						QueryTask,Query,esriConfig) {
						
						//var userid ="<%=request.getParameter("userid")%>";
						//var codeid ="<%=request.getParameter("codeid")%>";
						//alert(a+","+b);
						
						esriConfig.request.corsDetection = false;
						esriConfig.request.corsEnabledServers.push(serviceUrl);
						esriConfig.request.corsEnabledServers.push(serviceUrl);
						//设置地图容器高度
						document.getElementById("mapcontainer").style.height
						=(document.documentElement.clientHeight-100)+"px";
						
						map = new Map({
							basemap : "satellite"
						});
						view = new MapView({
						        container: "mapcontainer",
						        map: map,
						        center: [108, 34],
						        zoom: 4
						      });
						_clickPoints = []; // 点击绘制时的点集合
			            //_tempGraphicLayer = new GraphicsLayer(); // 绘制过程中的要素图层
			            _drawGraphicLayer = new GraphicsLayer(); // 绘制完成的要素图层
			            map.add(_drawGraphicLayer);
			            
			            var layer = new MapImageLayer({
			                url: "http://localhost:6080/arcgis/rest/services/test/MapServer"
			              });
			              map.add(layer);  // adds the layer to the map
			            /*
			            *地名搜索相关变量
			            */
			            PositionQueryUrl =serviceUrl+"/arcgis/rest/services/ChinaCountry/MapServer/0";
			            // Create graphics layer and symbol to use for displaying the results of query    
			            PositionQueryResultsLyr = new GraphicsLayer();
			            var PositionQueryTask = new QueryTask({
			              url: PositionQueryUrl
			            });
						var PositionQueryparams = new Query({
			              returnGeometry: true,
			              outFields: ["*"]
			            });
			            map.add(PositionQueryResultsLyr);//添加地名查询结果图层
			            
			            //map.add(_tempGraphicLayer);
			            polygonSymbol = new SimpleFillSymbol({ // 默认绘制polygon的样式
		                    color: [255, 128, 0, 0.5],
		                    style: "solid",
		                    outline: {
		                        color: [0, 124, 247, 1],
		                        width: 2
		                    }
		                });
			            tempPolygonSymbol = new SimpleFillSymbol({ // 绘制过程中的polygon样式
		                    color: [0, 0, 0, 0],
		                    style: "solid",
		                    outline: {
		                        color: [0, 124, 247, 1],
		                        width: 2
		                    }
		                });
			            tempPolyline=new SimpleLineSymbol({
		                    color: [0, 124, 247, 1],
		                    width: 2,
		                    style: "solid"
		                });
			            PointSymbol = SimpleMarkerSymbol({
			            	  color: "red",
			            	  outline: {
			            	    color: [128, 128, 128, 0.5],
			            	    width: "0.5px"
			            	  }
			            	});
			          	//添加地名
		                textSymbol = new TextSymbol({
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
		                view.then(function(){
		                	 // All the resources in the MapView and the map have loaded. Now execute additional processes
		                		initindex(codeid);
		                	}, function(error){
			                	 // Use the errback function to handle when the view doesn't load properly
			                	 console.log("The view's resources failed to load: ", error);
		                	});
		                
			          	/*
			          	初始化首页，判断是首次点击进入还是页面跳转进入
			          	*/
			          	function initindex(codeid)
			          	{
			          		
			          		if(codeid!="null")
		          			{
			          			//alert("okkkk");
			          			//alert(userid+","+codeid);
			          			$.ajax({  
				                    type:"POST",  
				                    url:"doinitindex",  
				                    dataType:"json",  
				                    async: false,  
				                    data:{codeid:codeid},  
				                    success:function(data){  
				                    		//alert(data);
				                    		//AddGra(data["order"]);
				                    		//renderGraphic(data["order"]);
				                    		initProductGallery(data["user"]);
				                    },  
				                    error:function(){  
				                            alert("方法执行不成功!");  
				                    }    
				             });  
		          			}
			          	}
						function AddGra(selectorder){
							_drawGraphicLayer.removeAll();
							
			            		var selectgeometry = selectorder["geometry"];
	   						
	   						var selectGra_geo = Polygon.fromJSON(dojo.fromJson(selectgeometry));
	   						
	   						if(selectGra_geo.extent==null)//行政区域
	   						{
	   							
	   							generateGraphicByAreaCode(selectgeometry);
//	   							selectGra = m_GraphicOfChooseArea;
//	   							console.log(m_GraphicOfChooseArea);
	   						}
	   						else{//画的地块
	   							
	   							var selectGra = new Graphic({
			                        geometry: selectGra_geo,
			                        symbol: polygonSymbol
			                    });
	   							
	   							_drawGraphicLayer.add(selectGra);
	   							var extent_selectGra = selectGra.geometry.extent;
					 	        view.extent = extent_selectGra;
					 	        //添加地块名称
					 	       var textPos = new Point();
			                    if(selectGra.geometry.type=="point")
			                    	{
			                    		textPos = selectGra.geometry;
			                    	}
			                    else{
				                    var extent_selectGra = selectGra.geometry.extent;
				 	                //view.extent = extent_Gra;
				 	                textPos = extent_selectGra.center;
			                    }
			                    textSymbol.text = selectorder["ordername"];
			                   	var graphic_text = new Graphic({
			                        geometry: textPos,
			                        symbol: textSymbol
			                    });
			                    _drawGraphicLayer.add(graphic_text);  
	   						}
	   						
				 	       //var geometry_selectGra = selectGra.geometry;
		                    
		                    return true;
		            			
						}
				 
					       
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
			            			
			                  _clickPoints.push(event.mapPoint);
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
		                		event.stopPropagation();
		                    //_clickPoints.push(event.mapPoint);
		                    _drawGraphicLayer.removeAll();
		                    m_GraphicOfDraw = _generateGraphic();
		                    //console.log(graphic);
		                    //graphic.mapPoint = event.mapPoint;
		                    if(m_GraphicOfDraw)
		                    	{
		                    		var extent_Gra = m_GraphicOfDraw.geometry.extent;
					 	        view.extent = extent_Gra;
		                    	}
		                    
		                    _endDraw(m_GraphicOfDraw);
		                    
		                		}
		            		});
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
		            		//alert(_clickPoints.length);
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
		                else if(_clickPoints.length==1)
		                {
		                		return _drawPoint(_clickPoints[0],_drawGraphicLayer);
		                } 
		                else
		                	{
		                		return null;
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
		            on(dom.byId("gotoPositionName"),"click",function(){
		            		
		            		var m_positonName = dom.byId('PositionName').value;
		            		//alert(m_positonName);
		            		PositionQueryResultsLyr.removeAll();
		            		
		            		PositionQueryparams.where = "SNAME='"+m_positonName+"'";
		            		PositionQueryTask.execute(PositionQueryparams).then(getResults).otherwise(promiseRejected);
	            		
	            		});
		         	 
		            function getResults(response) {
						console.log(response);
			            var peakResults = arrayUtils.map(response.features, function(
		                feature) {
							feature.symbol = tempPolygonSymbol;
							return feature;
		              	});

		              	PositionQueryResultsLyr.addMany(peakResults);
						view.goTo(peakResults);
		              
		            }
		         // Called each time the promise is rejected    
		            function promiseRejected(err) {
		              console.error("Promise rejected: ", err.message);
		            }
		         //撤销按钮
		            on(dom.byId("block_btns_cancel"),"click",function(){
	            		
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
		         //删除按钮
		            on(dom.byId("block_btns_delete"),"click",function(){
	            		
		            		_clickPoints = [];
		            		_drawGraphicLayer.removeAll();
		            		showUndoOrNot();
	            		
	            		});
		         //保存按钮
		            on(dom.byId("block_btns_save"),"click",function(){
	            			
		            		$('.BbBlockSavingWrap').show(); 
	            		
	            		});
		            on(dom.byId("block_saving_btns_sure"),"click",function(){
			            	// 添加地块名称
//		        			var m_drawareaName = dom.byId('DrawAreaName').value;
//		                var geometry_Gra = m_GraphicOfDraw.geometry;
//		                var textPos = new Point();
//		                if(geometry_Gra.type=="point")
//		                	{
//		                		textPos = m_GraphicOfDraw.geometry;
//		                	}
//		                else{
//		                    var extent_Gra = geometry_Gra.extent;
//		 	                //view.extent = extent_Gra;
//		 	                textPos = extent_Gra.center;
//		                }
//		                textSymbol.text = m_drawareaName;
//		               	var graphic_text = new Graphic({
//		                    geometry: textPos,
//		                    symbol: textSymbol
//		                });
		                //_drawGraphicLayer.add(graphic_text);  
	             
	              	
	        	  			//alert(result.url);
			     	 	var printTask = new PrintTask({
			     			//url:"https://sampleserver6.arcgisonline.com/arcgis/rest/services/Utilities/PrintingTools/GPServer/Export%20Web%20Map%20Task"
			     			url: serviceUrl+"/arcgis/rest/services/Utilities/PrintingTools/GPServer/Export%20Web%20Map%20Task"
			     		});
			
			     		var template = new PrintTemplate({
			     		 
			     		 exportOptions: {
			     			width: 284,  
			             	height: 284,
			     		  	dpi: 96
			     		 }
			     		});
			
			     		var params = new PrintParameters({
			     		 view: view,
			     		 template: template
			     		});
			
			     		printTask.execute(params).then(printResult, printError);
	            		
	        			});
		            function printResult(result)
			          {
			        		//alert(result.url);
		      	  		
			        	  	var m_drawareaName = dom.byId('DrawAreaName').value;
		      	  		
		               	var m_cropKinds = $('.crop_lists span');
		               	var m_cropKindsVal="";
		               	for(var i=0;i<3;i++)
		               		{
				               	if(m_cropKinds[i].className=="on")
				       	        	{
				               		m_cropKindsVal+=m_cropKinds[i].innerText+"/";
				       	        	}
		               		}
		               	//console.log(m_cropKindsVal);
		               	var m_GraphicOfDrawStr="";
		               	if(DrawOrChoose)//地块是通过画图产生
		               	{
		               		var m_GraphicOfDraw_geo=m_GraphicOfDraw.geometry;
		               		m_GraphicOfDrawStr=dojo.toJson(m_GraphicOfDraw_geo.toJSON());
		               		//m_GraphicOfDrawStr = dojo.toJson(m_GraphicOfDraw.toJSON());
		               		//alert(m_GraphicOfDrawStr);
		               	}
		               	else{//地块是通过行政区域选择产生
		               		m_GraphicOfDrawStr = m_GraphicOfDraw;
		               	}
		            	 	
		               	$.ajax({  
			                    type:"POST",  
			                    url:"doDrawSave",  
			                    dataType:"json",  
			                    async: false,  
			                    data:{resultPicUrl:result.url,drawareaName:m_drawareaName,cropKinds:m_cropKindsVal,GraphicOfDrawStr:m_GraphicOfDrawStr},  
			                    success:function(data){
			                    		if(data==0)
		                    			{
			                    			alert("选择的行政区域已经存在");
				                    		$('.BbAlertshadow').hide();
		                    			}
			                    		else{
			                    			$('.BbAlertshadow').hide();
			                    		}
			                    		
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
		            	function showUndoOrNot() {
		                //int minPoints = 1;
						//var UndoDiv = dom.byId("UndoOfDraw");
		                if(_clickPoints.length == 0)
		                {
		                		$('#block_btns_draw').hide();
		                		//UndoDiv.style.display = "none";
		                    return false;
		                }
		                else{
		                		$('#block_btns_draw').show();
							//UndoDiv.style.display = "block";
		                    return true;
		                }

		            }
		});
})

function StartDraw()
{
	//alert("ok");
	$('#block_btns_choosearea').hide();
	m_StartDraw = true;
	DrawOrChoose = true;
	/* document.getElementById("ProductGallery").style.display= "none";
	document.getElementById("chooseproduct").style.display= "none"; */
	
}
	
function initProductGallery(userinfo)
{
	test1();
 	$('.BbBlockRightWrap').show();
	$('.BbWebBlockTime').show();
	
	var producttypes=userinfo["producttype"].split("/");
	
	for(var i=0;i<producttypes.length-1;i++)
	{
		var producttypes_en=producttypes[i];
		if(i==0)
		{
			var Block_function_ul_li=
				"<li class='checked'>"+
        			"<span class="+productType_en2ch[producttypes_en][1]+" id="+producttypes_en+">"+productType_en2ch[producttypes_en][0]+"</span>"+
        			"</li>";
			$("#Block_function_ul_id").append(Block_function_ul_li);
		}
		else{
			var Block_function_ul_li=
				"<li>"+
        			"<span class="+productType_en2ch[producttypes_en][1]+" id="+producttypes_en+">"+productType_en2ch[producttypes_en][0]+"</span>"+
        			"</li>";
			$("#Block_function_ul_id").append(Block_function_ul_li);
		}
	}
	$('.Block_function li').click(function(e) {
        $(this).addClass('checked').siblings().removeClass('checked');
        //console.log($(this).find("span").attr("id"));
        var selectText = $(this).find("span").attr("id");
        if(selectText=="NYBCHJC")
        	{
        		test1();
        	}
        else{
        		test2();
        }
        
    });
	$('.block_list_ul li').click(function(e) {
        console.log($(this).find("span")[1].innerText);
    });
	
}
function test1()
{
	 require([
	          "esri/Map",
	          "esri/views/MapView",
	          "esri/layers/MapImageLayer",
	          "esri/widgets/LayerList",
	          "dojo/on",
	          "dojo/domReady!"
	        ],
	        function(
	          Map, MapView, MapImageLayer,LayerList, on
	        ) {
		 var diseaselayer = new MapImageLayer({
	          url: "http://10.2.3.222:6080/arcgis/rest/services/disease1/MapServer",
	          sublayers: [
	          {
	            id: 0,
	            visible: true
	          }, {
	            id: 1,
	            visible: false,
	            
	          }, {
	            id: 2,
	            visible: false
	          }, {
	            id: 3,
	            visible: false
	          }, 
	          {
		            id: 4,
		            visible: false
		      },
		      {
		            id: 5,
		            visible: false
		      }]
	        });
		 map.removeAll();
		 map.add(diseaselayer);
		 view.goTo(diseaselayer);
		 view.ui.empty("top-left");
		 view.then(function() {
		        var layerList = new LayerList({
		          view: view
		        });

		        // Add widget to the top right corner of the view
		        view.ui.add(layerList, "top-left");
		        view.ui.padding = { top: 0, left: 150, right: 0, bottom: 0 };
		 });
	 });
}
function test2()
{
	require([
	          "esri/Map",
	          "esri/views/MapView",
	          "esri/layers/MapImageLayer",
	          "esri/widgets/LayerList",
	          "dojo/on",
	          "dojo/domReady!"
	        ],
	        function(
	          Map, MapView, MapImageLayer, LayerList,on
	        ) {
		 var growinglayer = new MapImageLayer({
	          url: "http://10.2.3.222:6080/arcgis/rest/services/growing/MapServer",
	          sublayers: [
	          {
	            id: 0,
	            visible: false
	          }, {
	            id: 1,
	            visible: false,
	            
	          }, {
	            id: 2,
	            visible: true
	          }]
	        });
		 map.removeAll();
		 map.add(growinglayer);
		 view.goTo(growinglayer);
		 view.ui.empty("top-left");
		 view.then(function() {
		        var layerList = new LayerList({
		          view: view
		        });

		        // Add widget to the top right corner of the view
		        view.ui.add(layerList, "top-left");
		        view.ui.padding = { top: 0, left: 150, right: 0, bottom: 0 };
		 });
	 });
}
function processRegion()
{
	var select_region=$("#city").val();
	//alert(select_region);
	//提交删除，后台更新数据库
   	$.ajax({  
            type:"POST",  
            url:"doProcessRegion",  
            dataType:"json",  
            async: false,  
            data:{region:select_region},  
            success:function(data){  
            		//alert(data);
            	generateGraphicByAreaCode(data);
            	
            require(
            				[ "dojo/dom","dojo/on","dojo/query","dojo/_base/array",
            						
            						"dojo/domReady!" ],
            				function(dom,on,query,arrayUtils) {
            					
            						$('#block_btns_choosearea').show();
		        					
		        					//删除按钮
		        		            on(dom.byId("block_btns_delete_choosearea"),"click",function(){
		        	            		
		        		            		
		        		            		_drawGraphicLayer.removeAll();
		        		            		$('#block_btns_choosearea').hide();
		        	            		
		        	            		});
		        		         //保存按钮
		        		            on(dom.byId("block_btns_save_choosearea"),"click",function(){
		        	            			
		        		            		$('.BbBlockSavingWrap').show(); 
		        	            		
		        	            		});
            						
            				});
            	 
            },  
            error:function(){  
                 alert("方法执行不成功!");  
            }    
     });
}
function generateGraphicByAreaCode(code)
{
	require(
			[ "dojo/dom","dojo/on","dojo/query","dojo/_base/array",
					"esri/symbols/SimpleFillSymbol",
					"esri/symbols/TextSymbol",
					"esri/Graphic",
					"esri/geometry/Point",
					"esri/tasks/PrintTask",
		            "esri/tasks/support/PrintTemplate",
		            "esri/tasks/support/PrintParameters",
		            "esri/widgets/Print",
		            "esri/tasks/QueryTask",
		            "esri/tasks/support/Query",
		            "esri/config",
					"dojo/domReady!" ],
			function(dom,on,query,arrayUtils,
					SimpleFillSymbol, TextSymbol,
					Graphic,Point,
					PrintTask,PrintTemplate,PrintParameters,Print,
					QueryTask,Query,esriConfig) {
				
					var PositionQueryTask = new QueryTask({
		              url: PositionQueryUrl
		            });
					var PositionQueryparams = new Query({
		              returnGeometry: true,
		              outFields: ["*"]
		            });
					var tempPolygonSymbol = new SimpleFillSymbol({ // 绘制过程中的polygon样式
	                    color: [255, 106, 106, 0.5],
	                    style: "solid",
	                    outline: {
	                        color: [0, 124, 247, 1],
	                        width: 2
	                    }
	                });
					_drawGraphicLayer.removeAll();
            		
					m_GraphicOfDraw = code;//将选择的行政区域的行政代码 赋值给全局变量
					
            			PositionQueryparams.where = "CODE="+code;
            			
            			PositionQueryTask.execute(PositionQueryparams).then(getResults).otherwise(promiseRejected);
            			
            			
            			
            			function getResults(response) {
        					//console.log(response);
        		            var peakResults = arrayUtils.map(response.features, function(
        	                feature) {
        						feature.symbol = tempPolygonSymbol;
        						//console.log(dojo.toJson(feature.toJSON()));
        						return feature;
        	              	});

        		            _drawGraphicLayer.addMany(peakResults);
        					view.goTo(peakResults);
        					
//        					var selectGra=peakResults[0];
//        					var textPos = new Point();
//        					var extent_selectGra = selectGra.geometry.extent;
//	 	                textPos = extent_selectGra.center;
//	                   
//	                    textSymbol.text = "ordername";
//	                   	var graphic_text = new Graphic({
//	                        geometry: textPos,
//	                        symbol: textSymbol
//	                    });
//	                    _drawGraphicLayer.add(graphic_text);  
        	            }
        	         // Called each time the promise is rejected    
        	            function promiseRejected(err) {
        	              console.error("Promise rejected: ", err.message);
        	            }
        	            
			});
}
function renderGraphic(data){
	 require([
	          "esri/Map",
	          "esri/views/MapView",
	          "esri/layers/ImageryLayer",
	          "esri/geometry/Geometry",
	          "esri/geometry/Point",
				"esri/geometry/Polyline",
				"esri/geometry/Polygon",
				"esri/geometry/Extent",
				"esri/geometry/Circle",
				"esri/Graphic",
	          "esri/layers/support/RasterFunction",
	          "esri/layers/support/DimensionalDefinition",
	          "esri/layers/support/MosaicRule",
	          "esri/core/watchUtils",
	          "dojo/domReady!"
	        ], function(
	          Map, MapView, ImageryLayer,Geometry,Point,
				Polyline, Polygon, Extent, Circle, Graphic, 
	          RasterFunction, DimensionalDefinition, MosaicRule, watchUtils
	        ) {
		 
		 var selectgeometry = data["geometry"];
			//alert(selectgeometry);
		//var selectGra = Graphic.fromJSON(dojo.fromJson(selectgeometry));
		var 	selectGra_geometry=Geometry.fromJSON(dojo.fromJson(selectgeometry));
		
		var geoRings=selectGra_geometry.rings;
		//console.log(geoRings);
		
		var geoSpatialReference=selectGra_geometry.spatialReference;
		//console.log(geoSpatialReference.wkid);
		
		var url=serviceUrl+"/arcgis/rest/services/sde_DBO_rendertest/ImageServer";
		
		var ClipRF = new RasterFunction({
			functionName : "Clip",
			functionArguments : {
					ClippingGeometry: 
						{
//							rings:[[[108.411,34.935], [108.35,33.687], [109.537,33.581], [109.522,34.6], [108.411,34.935]]], 
//							spatialReference: {wkid: 4326}
							rings:geoRings,
							spatialReference:{wkid: geoSpatialReference.wkid}
						},
					ClippingType: 1
			},
		variableName : "Raster"
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
			console.log(minValue);
			console.log(maxValue);
		    // The pixels visible in the view
		    var pixels = pixelBlock.pixels;
			//console.log(pixels);
		    // The number of pixels in the pixelBlock
		    var numPixels = pixelBlock.width * pixelBlock.height;
			//console.log(numPixels);
		    // Calculate the factor by which to determine the red and blue
		    // values in the colorized version of the layer
		    factor = 255.0 / (maxValue - minValue);
		    //	console.log(factor);
		    // Get the pixels containing temperature values in the only band of the data
		    var tempBand = pixels[0];
			//console.log(tempBand);
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
		
		var layer = new ImageryLayer({
	        url: url,
	        //definitionExpression: "OBJECTID = 2",
	        renderingRule: ClipRF,
	       	pixelFilter: colorize,
	        //mosaicRule: mr,
	        // The popup will display the temperature at the clicked location
	        popupTemplate: {
	          title: "Sea Surface Temperature",
	          content: "{Raster.ServicePixelValue}° Celsius"
	        }
	      });

	      // Add sea temperature layer to the map
	      map.add(layer);
	 });
	
}
