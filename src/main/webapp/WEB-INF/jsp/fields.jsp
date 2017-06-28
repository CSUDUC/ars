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
					<li><a href="TRSQJC"><span data-hover="Home">首页</span></a></li>
					<li><a href="fields"><span data-hover="Home">我的地块</span></a></li>
					<li><a href="about.html"><span data-hover="About">下载</span></a></li>
					<li><a href="typography.html"><span
							data-hover="Shortcodes">个人账户</span></a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /container-fluid --> </nav>
		<div class="header-banner">
			<!-- Top Navigation -->
			<div class="container page-seperator" style="position: relative">

				<section class="color bgi">
					<div class="container-fluid">
						<div class="page-content">
							<div class="page-content-container">
								<div class="page-content-row">
									<div id="viewDiv">
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
		      container: $('#viewDiv'), // Optional, used for some extra CSS styling
		      offset: 5, // Optional, the distance between grid items
		      outerOffset: 10, // Optional, the distance to the containers border
		      itemWidth: 210, // Optional, the width of a grid item
		      itemHeight: 210
		  };
	
/* (function ($){
  var handler = $('#orders li');
  
  handler.wookmark({
      // Prepare layout options.
      autoResize: true, // This will auto-update the layout when the browser window is resized.
      container: $('#viewDiv'), // Optional, used for some extra CSS styling
      offset: 5, // Optional, the distance between grid items
      outerOffset: 10, // Optional, the distance to the containers border
      itemWidth: 210, // Optional, the width of a grid item
      itemHeight: 210
  });
  
  // Capture clicks on grid items.
  handler.click(function(){
    // Randomize the height of the clicked item.
    var newHeight = $('img', this).height() + Math.round(Math.random() * 300 + 30);
    $(this).css('height', newHeight+'px');

    // Update the layout.
    handler.wookmark();
  });
})(jQuery); */

				
					$.ajax({  
	                    type:"POST",  
	                    url:"initfieldsPage",  
	                    dataType:"json",  
	                    async: false,  
	                    //data:{resultPicUrl:result.url,drawareaName:m_drawareaName,cropKinds:JSON.stringify(m_cropKindsVal),GraphicOfDrawStr:m_GraphicOfDrawStr},  
	                    success:function(data){  
	                    		for(var i = 0;i<data.length;i++)
	                    			{
	                    				var order = data[i];
	                    				$("#orders").append("<li style='display: list-item; position: absolute;' onclick='AddGra("+order["geometry"]+")'><img src="+order["sdpath"]+"><p>1</p></li>");
	                    			}
	                    		var handler = $('#orders li');
	                    		handler.wookmark(wookmarkParas);
	                    },  
	                    error:function(){  
	                         alert("方法执行不成功!");  
	                    }    
             		}); 
		
					function AddGra(geometry){
						alert(geometry);
					}
</script>
</html>
