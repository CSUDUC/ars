<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的地块</title>
<link rel="shortcut icon" type="image/x-icon" href="newview/images/logo.ico" media="screen" /> 
<link rel="stylesheet" type="text/css" href="newview/css/base.css">
<link rel="stylesheet" type="text/css" href="newview/css/style.css">
<script type="text/javascript" src="newview/js/jquery-1.7.2.min.js"></script>

<script type="text/javascript">
	/*
	$(function(){
		$('.BbWebMenu ul li').click(function(e) {
            $(this).addClass('current').siblings().removeClass('current');
        });
		$('.webinfo_img').click(function(e) {
            $('.user_mark').show();
        });
		$('.user_mark a').click(function(e) {
            $('.user_mark').hide();
        });
		$('.crop_lists span').click(function(e) {
            $(this).addClass('on');
        });
		$('.block_search button').mouseover(function(e) {
            $(this).css('background','url(newview/images/block_search_btn_pressed.png)');
        });
		$('.block_search button').mouseout(function(e) {
            $(this).css('background','url(newview/images/block_search_btn.png)');
        });
		$('.block_operation .operation_btn').click(function(e) {
            $(this).addClass('on').siblings('.operation_btn').removeClass('on');
        });
		$('.block_operation .operation_btn').hover(function(e) {
            $(this).toggleClass('on');
        });
		$('.block_info').hover(function(e) {
            $(this).children('.block_details').toggle();
        });
		$('.block_operation .location').click(function(e) {
            window.location.href="index.html?flag=open";
        });
		$('.block_operation .delete').click(function(e) {
            $('.BbAlertshadow').show();
			$(this).parent().parent().siblings('.BbSavingok').show();
			$('.BbSavingok.success').hide();
			$('.BbSavingok.block_edit').hide();
        });
		$('.block_saving_btns .cancel').click(function(e) {
            $('.BbAlertshadow').hide();
			$('.BbSavingok').hide();
			$('.BbBlockSavingWrap').hide();
        });
		$('.block_saving_btns .cancel').mouseover(function(e) {
            $(this).css('background','#24add2');
			$(this).css('color','#fff');
        });
		$('.block_saving_btns .cancel').mouseout(function(e) {
            $(this).css('background','#fff');
			$(this).css('color','#24add2');
        });
		$('.BbSavingok .block_saving_btns .sure').click(function(e) {
			$(this).parent().parent('.BbSavingok').hide();
			$(this).parent().parent().siblings('.BbSavingok.success').show();
			$('.BbAlertshadow').delay(3000).hide(0);
			$(this).parent().parent().siblings('.BbSavingok.success').delay(3000).hide(0);
			$(this).parent().parent().parent('.block_series_li').delay(3000).hide(0);
        });
		$('.BbSavingok .block_saving_btns .sure').mouseover(function(e) {
            $(this).css('background','#1189aa');
        });
		$('.BbSavingok .block_saving_btns .sure').mouseout(function(e) {
            $(this).css('background','#24add2');
        });
		$('.block_operation .edit').click(function(e) {
            $('.BbAlertshadow').show();
			$(this).parent().parent().siblings('.BbBlockSavingWrap').show();
        });
		$('.BbBlockSaving .block_saving_btns .sure').click(function(e) {
            $(this).parent().parent().parent().siblings('.BbSavingok.block_edit').show();
			$(this).parent().parent().parent().hide();
			$('.BbAlertshadow').delay(3000).hide(0);
			$(this).parent().parent().parent().siblings('.BbSavingok.block_edit').delay(3000).hide(0);
        });
		$('.BbBlockSaving .block_saving_btns .sure').mouseover(function(e) {
            $(this).css('background','#1189aa');
        });
		$('.BbBlockSaving .block_saving_btns .sure').mouseout(function(e) {
            $(this).css('background','#24add2');
        });
		$('.BbBlockSavingWrap .BbBlockSaving .close').click(function(e) {
            $('.BbAlertshadow').hide();
			$('.BbBlockSavingWrap').hide();
        });
	})
	*/
</script>
</head>
<body style="background:url(newview/images/block_big_bg.png) no-repeat;">
<div class="BbWebIndexWrap" style="min-width:1440px;">
	<div class="BbWebHeader">
    	<div class="logo">
        	<h1><img src="newview/images/logo.png" width="580" height="85" alt=""/></h1>
    	</div>
        <div class="header_right">
        	<div class="BbWebMenu">
            	<ul>
                	<li>
                    	<a class="one" href="index">首页</a>
                    </li>
                    <li class="current">
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
	<div class="BbBlockSeriesWrap">
    	<!--弹出提示框-->
        <div class="BbAlertshadow"></div>
        <div class="BbSavingok" style="display:none;">
            <p class="alert_title">系统提示</p>
            <p class="delete_answer">确定删除选中内容？</p>
            <div class="block_saving_btns" style="width:355px;">
                <span class="sure">确定</span><span class="cancel">取消</span>
            </div>
        </div>
        <div class="BbSavingok success">
            <p class="alert_title">系统提示</p>
            <p class="delete_answer success">已成功删除该地块</p>
        </div>
        <div class="BbSavingok block_edit">
            <p class="alert_title">系统提示</p>
            <p class="delete_answer success">地块修改已保存成功</p>
        </div>
        <div class="BbBlockSavingWrap">
             <div class="BbBlockSaving">
                 <p class="Bbtitle">编辑地块</p>
                 <span class="close"></span>
                 <input id="DrawAreaName" class="blocksaving_input" type="text" placeholder="请输入地块名称">
                 <span class="seperation_line block">选择作物</span>
                 <div class="crop_lists">
                     <span>玉米</span><span>小麦</span><span>水稻</span>
                 </div>
                 <span class="line"></span>
                 <div class="block_saving_btns">
                     <span class="sure">确定</span><span class="cancel">取消</span>
                 </div>
             </div>
         </div>
                    
        <div class="block_search">
        	<input type="text" placeholder="地块名称" id="block_search_name"><button></button>
        </div>
        <div class="block_series">
	        	<ul class="block_series_ul" id="block_series_ul_id">
	        
	            	
	        </ul>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">

//fieldsArray = [];
var activeid;//当前选中的地块id

$(document).ready(function() {
	$('.block_series_ul li').remove();
	
	$.ajax({  
	    type:"POST",  
	    url:"doinitmyblock",  
	    dataType:"json",  
	    async: false,  
	    success:function(data){
	    		//fieldsArray = data;
	    		for(var i = 0;i<data.length;i++)
	    			{
	    			var order = data[i];
	    			var block_series_li="<li class='block_series_li'>"+
	    			"<div class='block_info' id='"+order["codeid"]+"'"+
	    			"style='background:url("+order["sdpath"]+") no-repeat;'>"+
	    					"<div class='block_operation'>"+
		    			    		"<span class='text blockName'>"+order["ordername"]+"</span>"+
		    			        "<span class='delete operation_btn' onclick='operation_btn_delete("+order["codeid"]+");'></span>"+
		    			        "<span class='edit operation_btn' onclick='operation_btn_edit("+order["codeid"]+");'></span>"+
		    			        "<form id='tolocationform' method=post>"+
		    			        "<span class='location operation_btn' onclick='operation_btn_location("+order["codeid"]+");'></span>"+
		    			        "</form>"+
	    			    		"</div>"+
	    			    "<div class='block_details'>"+
	    			    		"<div class='details_text'>"+
	    			        		"<p>面积：2800亩</p>"+
	    			            "<p>主要作物："+order["cropkinds"]+"</p>"+
	    			            "<p>土壤墒情：良好</p>"+
	    			            "<p>病虫害威胁：良</p>"+
	    			            "<p>预计产值：56546KG</p>"+
	    			        "</div>"+
	    			    	"</div>"+
	    			"</div>"+
	    			"</li>";
	    				$(".block_series_ul").append(block_series_li);
	    			}
	    		
	    },  
	    error:function(){  
	         alert("方法执行不成功!");  
	    }    
	});
	
	$('.block_info').hover(function(e) {
        $(this).children('.block_details').toggle();
    });
	$('.block_operation .operation_btn').hover(function(e) {
        $(this).toggleClass('on');
    });
	
});

</script>
<script type="text/javascript" src="newview/js/myblock.js"></script>
</html>