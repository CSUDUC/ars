<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>下载</title>
<link rel="shortcut icon" type="image/x-icon" href="newview/images/logo.ico" media="screen" /> 
<link rel="stylesheet" type="text/css" href="newview/css/base.css">
<link rel="stylesheet" type="text/css" href="newview/css/style.css">
<link rel="stylesheet" type="text/css" href="newview/css/page.css">
<link rel="stylesheet" type="text/css" href="newview/css/jcDate.css">
<link rel="stylesheet" type="text/css" href="newview/plugins/datatables/datatables.min.css">
<!--link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.15/datatables.min.css"/-->
 
<script type="text/javascript" src="newview/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="newview/js/jQuery-jcDate.js" charset="utf-8"></script>
<script type="text/javascript" src="newview/js/download.js"></script>
<script type="text/javascript" src="newview/plugins/datatables/datatables.min.js"></script>
<!--script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.15/datatables.min.js"></script-->


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
                    <li>
                    	<a class="two" href="myblock">我的地块</a>
                    </li>
                    <li class="current">
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
    	<div class="BbBlockQuery">
        	<div class="query_left">
            		<div class="query_name">
                		<span>地块名称：</span><input id="query_block_name" type="text" placeholder="地块名称">
                </div>
                <div class="query_name">
                		<span>时间：</span><input id="query_block_date" class="jcDate begining" placeholder="查询时间">
                </div>
                <button id="doquery">查询</button>
            </div>
            <div class="query_right">
	            	<span class="download">下载</span>
	            	<span class="delete">删除</span>
            </div>
        </div>
        	
        <div class="BbQueryTableWrap">
        		<table id="myTable" class="display BbQueryTable" cellspacing="0" width="100%"></table>

        </div>
        
    </div>
	<div class="BbAlertshadow">
    	<div class="BbSavingok" style="display:block;">
            <p class="alert_title">系统提示</p>
            <p class="delete_answer">确定删除选中内容？</p>
            <div class="block_saving_btns" style="width:355px;">
                <span class="sure">确定</span><span class="cancel">取消</span>
            </div>
        </div>
        <div class="BbSavingok block_edit">
            <p class="alert_title">系统提示</p>
            <p class="delete_answer success">已成功删除选中文件！</p>
        </div>
    </div>
</div>
<script type="text/javascript">

/* Custom filtering function which will search data in column four between two values */

</script>
</body>
</html>