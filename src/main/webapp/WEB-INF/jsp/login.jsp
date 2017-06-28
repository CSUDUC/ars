<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆</title>
<link rel="shortcut icon" type="image/x-icon" href="newview/images/logo.ico" media="screen" /> 
<link rel="stylesheet" type="text/css" href="newview/css/base.css">
<link rel="stylesheet" type="text/css" href="newview/css/jcDate.css">
<link rel="stylesheet" type="text/css" href="newview/css/style.css">

<script type="text/javascript" src="newview/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="newview/js/jQuery-jcDate.js" charset="utf-8"></script>
<script type="text/javascript" src="newview/js/login.js" charset="utf-8"></script>

</head>
<body style="background:url(newview/images/login_bg.jpg) no-repeat;">
<div class="BbWebLoginWrap">
	<div class="BbWebLogin">
    	<div class="logo">
        	<h1><img src="newview/images/logo.png" width="580" height="85" alt=""/></h1>
        </div>
        <div class="logincons">
        	<p class="login_title">用户登陆</p>
        	<form class="login-form" action=Dologin method="post">
            <div class="login">
            		<div class="login_user">
                	<input type="text" placeholder="请输入用户名" name="username">
                </div>
                <div class="login_password">
                	<input type="password" placeholder="请输入密码" name="password">
                </div>
            </div>
            <!--a class="login_btn" href="index.html">登陆</a-->
            <div class="form-actions">
				<button type="submit" class="login_btn">登陆</button>
			</div>
         </form>
            <span class="decoration_line"></span>
            <div class="login_marks">
            	<span class="forget_password">忘记密码？</span><span class="register_mark">注册账号</span>
            </div>
            <div class="download">
            	<span>现已推出安卓版APP，移动平台更方便！</span>
                <a href="#">点此下载</a>
            </div>
        </div>
        <div class="registercons">
        	<p class="login_title">用户注册</p>
            <div class="register">
            		<!--span >请输入用户名</span-->
            		<div class="alert-danger">
					<span>输入信息有误</span>
				</div>
				
            		<input type="text" id="register_username" placeholder="请输入用户名">
                <input type="password" id="register_pwd" placeholder="请输入密码">
                <input style="margin-bottom:0;" type="password" id="register_pwd_confirm" placeholder="请确认密码">
            		
            </div>
            <span class="register_btn">选择服务</span>
            <div class="download">
            	<span>现已推出安卓版APP，移动平台更方便！</span>
                <a href="#">点此下载</a>
            </div>
        </div>
        <div class="forgetpasswordcons">
        	<p class="login_title">修改密码</p>
            <div class="register">
            	<input type="text" placeholder="请输入用户名">
                <input type="text" placeholder="请输入原密码">
                <input style="margin-bottom:0;" type="text" placeholder="请输入新密码">
            </div>
            <a class="login_btn" style="margin:20px auto 21px;">确认并登陆</a>
            <div class="download">
            	<span>现已推出安卓版APP，移动平台更方便！</span>
                <a href="#">点此下载</a>
            </div>
        </div>
        <div class="servicecons">
        	<p class="login_title">用户注册</p>
            <span class="seperation_line">农业遥感应用</span>
            <ul class="application_one">
            		<li style="width:230px;">
                	<input type="checkbox" name="productTypes" value="农作物分类与面积统计"><span>农作物分类与面积统计</span>
                </li>
                <li style="width:168px;">
                	<input type="checkbox" name="productTypes" value="土壤墒情监测"><span>土壤墒情监测</span>
                </li>
                <li>
                	<input type="checkbox" name="productTypes" value="农业病虫害监测"><span>农业病虫害监测</span>
                </li>
                <li style="width:230px;">
                	<input type="checkbox" name="productTypes" value="农作物长势监测"><span>农作物长势监测</span>
                </li>
                <!--li style="width:168px;">
                	<input type="checkbox" name="productTypes" value="土壤肥力监测"><span>土壤肥力监测</span>
                </li-->
                <li>
                	<input type="checkbox" name="productTypes" value="农作物估产"><span>农作物估产</span>
                </li>
            </ul>
            <span class="seperation_line" style="margin-top:5px;">其他应用</span>
            <ul class="application_one">
            	<li style="width:230px;">
                	<input type="checkbox"><span>功能应用1</span>
                </li>
                <li style="width:168px;">
                	<input type="checkbox"><span>功能应用2</span>
                </li>
                <li>
                	<input type="checkbox"><span>功能应用3</span>
                </li>
            </ul>
            <div class="service_time">
            	<div class="begining_time">
                	<span class="text">起始时间：</span><input class="jcDate begining" id="service_begin_time" style="width:110px; padding:5px; border:1px solid #1094cb; border-radius:4px;" />
                </div>
                <div class="ending_time">
                	<span class="text">终止时间：</span><input class="jcDate begining" id="service_end_time" style="width:110px; padding:5px; border:1px solid #1094cb; border-radius:4px;" />
                </div>
            </div>
            <form id='registerAndlogin' method=post>
            		<a style="margin-top:60px;" class="login_btn" id="registerAndin">立即登陆</a>
            </form>
        </div>
    </div>
</div>
</body>
</html>