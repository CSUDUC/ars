<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link rel="shortcut icon" type="image/x-icon" href="newview/images/logo.ico" media="screen" /> 
<link rel="stylesheet" type="text/css" href="newview/css/base.css">
<link rel="stylesheet" type="text/css" href="newview/css/style.css">
<link rel="stylesheet" href="https://js.arcgis.com/4.3/esri/css/main.css">
<style type="text/css">
#city{
	width:430px;
	height:35px;
	line-height:35px;
	border:1px solid #cdcdcd;
	padding:0 5px;
	background:#fff;
	margin:20px auto;
	display:block;
}

._citys { width: 430px; display: inline-block; border: 2px solid #eee; padding: 5px; position: relative; background:#fff;}
._citys span { color: #56b4f8; height: 15px; width: 15px; line-height: 15px; text-align: center; border-radius: 3px; position: absolute; right: 10px; top: 10px; border: 1px solid #56b4f8; cursor: pointer; }
._citys0 { width: 100%; height: 34px; display: inline-block; border-bottom: 2px solid #56b4f8; padding: 0; margin: 0; }
._citys0 li { display: inline-block; line-height: 34px; font-size: 15px; color: #888; width: 80px; text-align: center; cursor: pointer; }
.citySel { background-color: #56b4f8; color: #fff !important; }
._citys1 { width: 100%; display: inline-block; padding: 10px 0; }
._citys1 a { width: 83px; height: 35px; display: inline-block; background-color: #f5f5f5; color: #666; margin-left: 3px; margin-top: 3px; line-height: 35px; text-align: center; cursor: pointer; font-size: 13px; overflow: hidden; }
._citys1 a:hover { color: #fff; background-color: #56b4f8; }
.AreaS { background-color: #56b4f8 !important; color: #fff !important; }
</style>
<script type="text/javascript" src="newview/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="newview/js/web.js"></script>
<script src="newview/js/Popt.js"></script>
<script src="newview/js/cityJson.js"></script>
<script src="newview/js/citySet.js"></script>
<script type="text/javascript" src="newview/js/jquery.SuperSlide.js"></script>

<script type="text/javascript" src="newview/js/index.js"></script>	
<script type="text/javascript" src="newview/js/params.js"></script>
<script src="https://js.arcgis.com/4.3/"></script>

</head>
<body style="background:url(newview/images/map.jpg) no-repeat;">
<div class="BbWebIndexWrap" style="min-width:1440px;">
	<div class="BbWebHeader">
    	<div class="logo">
        	<h1><img src="newview/images/logo.png" width="580" height="85" alt=""/></h1>
    	</div>
        <div class="header_right">
        	<div class="BbWebMenu">
            	<ul>
                		<li class="current">
                    	<a class="one" href="index">首页</a>
                    </li>
                    <li>
                    	<a class="two" href="myblock">我的地块</a>
                    </li>
                    <li>
                    	<a class="three" href="download">报表下载</a>
                    </li>
                    <li>
                    	<a class="four" href="account">个人账户</a>
                    </li>
                </ul>
            </div>
            <div class="webinfo">
	            	<div class="webinfo_text">
	                	<p id="webinfo_text_username">欢迎您 <%=session.getAttribute("UserName")%></p>
	                	<%   
					java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");   
					java.util.Date currentTime = new java.util.Date();//得到当前系统时间   
					String str_date1 = formatter.format(currentTime); //将日期时间格式化   
					%>  
	                <p id="webinfo_text_date"><%=str_date1%></p>
	            </div>
	            <div class="webinfo_img">
	            		<span class="user_img"><img src=<%=session.getAttribute("urlphoto")%> width="80" height="75" alt=""/></span>
	                <span class="btn"></span>
	            </div>
	            <div class="user_mark">
	            		<a style="margin-top:30px;" href="login">注销用户</a>
	                <a href="login">退出登录</a>
	            </div>
            </div>
        </div>
  </div>
  <div class="BbWebContent">
  	<div id="mapcontainer">
  	</div>
  </div>
	<div class="BbWebBtns">
    		<ul>
        	<li>
            	<span onclick="StartDraw()" class="block"></span>
            </li>
            <li>
            	<span class="region"></span>
            </li>
       </ul>
    </div>
    <div class="block_search_index">
        	<input type="text" placeholder="search" id ="PositionName"><button id="gotoPositionName"></button>
    </div>
    <!--选择地区-->
    <div class="BbRegionSelect">
    	<span class="region_text">选择区域</span><!--<span title="关闭" id="cColse" >×</span>-->
        <div>
            <input type="text" id="city" placeholder="请选择区域" value="请选择区域" />
        </div>
        <div class="region_btn">
        	<span class="sure">确定</span><span class="cancel">取消</span>
        </div>
        <script type="text/javascript">
			$("#city").click(function (e) {
				SelCity(this,e);
				console.log("inout",$(this).val(),new Date())
			});
        </script>
    </div>
    <!--地块缩影-->
    <span class="block_mini"><img src="newview/images/block_default_bg_mini.png" width="110" height="110" alt=""/></span>
    <!--绘制地块-->
    <div class="block_btns" id="block_btns_draw">
        	<ul>
            		<li>
                	<a id="block_btns_cancel" class="cancel" href="#" title="撤销"></a>
                </li>
                <!--li>
                	<a class="backup" href="#" title="返回"></a>
                </li-->
                <li>
                	<a id="block_btns_delete" class="delete" href="#" title="删除"></a>
                </li>
                <li>
                	<a id="block_btns_save" class="save" href="#" title="保存"></a>
                </li>
            </ul>
    </div>
    <!--选择地块（行政区域选择）-->
    <div class="block_btns" id="block_btns_choosearea">
        	<ul>
            		<li>
                	<a id="block_btns_delete_choosearea" class="delete" href="#" title="删除"></a>
                </li>
                <li>
                	<a id="block_btns_save_choosearea" class="save" href="#" title="保存"></a>
                </li>
            </ul>
    </div>
  	<!--保存地块-->
    <div class="BbBlockSavingWrap">
    	<div class="BbBlockSaving">
        	<p class="Bbtitle">保存地块</p>
        	<span class="close"></span>
            <input id="DrawAreaName" class="blocksaving_input" type="text" placeholder="请输入地块名称">
            <span class="seperation_line block">选择作物</span>
            <div class="crop_lists">
            	<span>玉米</span>
            	<span>小麦</span>
            	<span>水稻</span>
            	<!--span>黄豆</span><span>花生</span><span>绿豆</span><span class="on">芝麻</span><span>油菜</span-->
            </div>
            <span class="line"></span>
            <div class="block_saving_btns">
            	<span id="block_saving_btns_sure" class="sure">确定</span><span id="block_saving_btns_cancel" class="cancel">取消</span>
            </div>
        </div>
    </div>
    <!--地块保存成功弹出层-->
    <div class="BbAlertshadow">
    	<div class="BbSavingok">
        	<p class="alert_title">系统提示</p>
            <p class="alert_text">地块保存完毕，3s 后自动跳转至 <a href="myblock.html">我的地块</a> <br>
点击 <span class="cancel">取消</span> 可关闭</p>
        </div>
    </div>
    <!--查看地块-->
    <div class="BbWebBlockCheck">
    	<!--div class="BbWebBlockWrap">
        	<div class="BbWebBlock">
                <div class="block_mark">
                    <span class="color01">文字</span>
                    <span class="color02">文字</span>
                    <span class="color03">文字</span>
                </div>
                <span class="block_img"></span>
                <span class="block_date">2017-05-09</span>
                <div class="block_states_hover">
                    <dl>
                    	<dt>地块001</dt>
                        <dd>面积：2800亩</dd>
						<dd>主要作物：小麦，水稻，玉米</dd>
                    </dl>
                </div>
            </div>
      </div-->
        <div class="BbBlockRightWrap">
        	<div class="BbBlockRight">
            	<ul class="Block_function" id="Block_function_ul_id">
            			<!-- 
                		<li>
                    	<span class="function01" id="NZWJXFL">农作物分类与面积统计</span>
                    </li>
                    <li>
                    	<span class="function02" id="NYBCHJC">农业病虫害监测</span>
                    </li>
                    <li>
                    	<span class="function03" id="NZWZSJC">农作物长势监测</span>
                    </li>
                    <li>
                    	<span class="function04" id="TRSQ">土壤墒情监测</span>
                    </li>
                    <li>
                    	<span class="function05" id="TRFL">土壤肥力监测</span>
                    </li>
                    <li>
                    	<span class="function06" id="NZWGC">农作物估产</span>
                    </li>
                    -->
                </ul>
            </div>
        </div>
        <!--图层控制  -->
       
      	<!--时间轴-->
        <div class="BbWebBlockTime">
	        	<div class="BbBlockTab">
	            		<span>2015</span>
	                <span>2016</span>
	                <span class="choosed">2017</span>
	        </div>
            <div class="BbBlockTimeWrap" id="leftMarquee">
        			<a class="prev" id="prev"></a>
            		<a class="next" id="next"></a>
            		<div class="block_lists">
	                <ul class="block_list_ul">
	                    <li>
	                        <span class="img"><img src="newview/images/example01.png" width="100" height="100" alt=""></span>
	                        <span class="time">2017-05-05</span>
	                    </li>
	                    <li>
	                        <span class="img"><img src="newview/images/example02.png" width="100" height="100" alt=""></span>
	                        <span class="time">2017-05-06</span>
	                    </li>
	                    <li>
	                        <span class="img"><img src="newview/images/example03.png" width="100" height="100" alt=""></span>
	                        <span class="time">2017-05-07</span>
	                    </li>
	                    <li>
	                        <span class="img"><img src="newview/images/example04.png" width="100" height="100" alt=""></span>
	                        <span class="time">2017-05-08</span>
	                    </li>
	                    <li>
	                        <span class="img"><img src="newview/images/example05.png" width="100" height="100" alt=""></span>
	                        <span class="time">2017-05-09</span>
	                    </li>
	                    <li>
	                        <span class="img"><img src="newview/images/example01.png" width="100" height="100" alt=""></span>
	                        <span class="time">2017-05-05</span>
	                    </li>
	                    <li>
	                        <span class="img"><img src="newview/images/example02.png" width="100" height="100" alt=""></span>
	                        <span class="time">2017-05-06</span>
	                    </li>
	                    <li>
	                        <span class="img"><img src="newview/images/example03.png" width="100" height="100" alt=""></span>
	                        <span class="time">2017-05-07</span>
	                    </li>
	                    <li>
	                        <span class="img"><img src="newview/images/example04.png" width="100" height="100" alt=""></span>
	                        <span class="time">2017-05-08</span>
	                    </li>
	                    <li>
	                        <span class="img"><img src="newview/images/example05.png" width="100" height="100" alt=""></span>
	                        <span class="time">2017-05-09</span>
	                    </li>
	                </ul>
	            </div>
        		</div>
        </div>
        
        <script type="text/javascript">
        jQuery("#leftMarquee").slide({ 
	        	mainCell:".block_lists ul",
	        	effect:"leftMarquee",
	        	vis:6,
	        	interTime:40,
	        	autoPlay:true 
        	});
        </script>
    </div>
</div>
</body>
<script type="text/javascript">
/*
 全局变量声明
*/
codeid ="<%=request.getParameter("codeid")%>";

</script>
		
</html>