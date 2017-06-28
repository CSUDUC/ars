<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人账户</title>
<link rel="shortcut icon" type="image/x-icon" href="newview/images/logo.ico" media="screen" /> 
<link rel="stylesheet" type="text/css" href="newview/css/base.css">
<link rel="stylesheet" type="text/css" href="newview/css/style.css">
<link rel="stylesheet" type="text/css" href="newview/css/jcDate.css">
<script type="text/javascript" src="newview/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="newview/js/jQuery-jcDate.js" charset="utf-8"></script>
<script type="text/javascript" src="newview/js/account.js"></script>
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
                    <li>
                    	<a class="three" href="download">报表下载</a>
                    </li>
                    <li class="current">
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
                	<span class="user_img"><img id="user_img" src=<%=session.getAttribute("urlphoto")%> width="80" height="75" alt=""/></span>
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
        <div class="BbAlertshadow">
        	<!--修改账号信息-->
            <div class="BbAccountModify">
        		<div class="BbBlockSavingWrap" style="display:block;">
                        <div class="BbBlockSaving">
                            <p class="Bbtitle">修改信息</p>
                            <span class="close"></span>
                            <div class="accountinfo" style="margin-top:30px;">
                            	<span>用户名：</span>
                                <input type="text" placeholder="请输入用户名">
                            </div>
                            <div class="accountinfo">
                            	<span>手机号：</span>
                                <input type="text" placeholder="请输入手机号">
                            </div>
                            <div class="accountinfo">
                            	<span>地址：</span>
                                <input type="text" placeholder="请输入地址">
                            </div>
                            <span class="line" style="margin:25px auto;"></span>
                            <div class="block_saving_btns">
                                <span class="sure">确定</span><span class="cancel">取消</span>
                            </div>
                        </div>
                    </div>
        	</div>
            <!--修改密码-->
            <div class="BbPasswordModify">
        		<div class="BbBlockSavingWrap" style="display:block;">
                        <div class="BbBlockSaving">
                            <p class="Bbtitle">修改密码</p>
                            <span class="close"></span>
                            <div class="alert-danger">
								<span>输入信息有误</span>
							</div>
                            <div class="accountinfo" style="margin-top:30px;">
                            	<span>原密码：</span>
                                <input id="PasswordModify_oldpwd" type="password" placeholder="请输入原密码">
                            </div>
                            <div class="accountinfo">
                            	<span>新密码：</span>
                                <input id="PasswordModify_newpwd" type="password" placeholder="请输入新密码">
                            </div>
                            <div class="accountinfo">
                            	<span>确认密码：</span>
                                <input id="PasswordModify_newpwd_confirm" type="password" placeholder="请确认新密码">
                            </div>
                            <span class="line" style="margin:25px auto;"></span>
                            <div class="block_saving_btns">
                                <span class="sure">确定</span><span class="cancel">取消</span>
                            </div>
                        </div>
                    </div>
        	</div>
            <!--修改服务-->
            <div class="BbServiceModify">
        		<div class="BbBlockSavingWrap" style="display:block; width:780px; height:460px;">
                        <div class="BbBlockSaving">
                            <p class="Bbtitle">修改服务</p>
                            <span class="close"></span>
                            <span class="seperation_line service">农业遥感应用</span>
                            <ul class="application_one">
                                <li>
                                    <input type="checkbox" name="productTypes" value="农作物分类与面积统计"><span>农作物分类与面积统计</span>
                                </li>
                                <li>
                                    <input type="checkbox" name="productTypes" value="土壤墒情监测"><span>土壤墒情监测</span>
                                </li>
                                <li>
                                    <input type="checkbox" name="productTypes" value="农业病虫害监测"><span>农业病虫害监测</span>
                                </li>
                                <li>
                                    <input type="checkbox" name="productTypes" value="农作物长势监测"><span>农作物长势监测</span>
                                </li>
                                <!-- li>
                                    <input type="checkbox" name="productTypes" value="土壤肥力监测"><span>土壤肥力监测</span>
                                </li-->
                                <li>
                                    <input type="checkbox" name="productTypes" value="农作物估产"><span>农作物估产</span>
                                </li>
                            </ul>
                            <span class="seperation_line service" style="margin-top:5px;">其他应用</span>
                            <ul class="application_one">
                                <li>
                                    <input type="checkbox"><span>服务A</span>
                                </li>
                                <li>
                                    <input type="checkbox"><span>服务B</span>
                                </li>
                                <li>
                                    <input type="checkbox"><span>服务C</span>
                                </li>
                            </ul>
                            <div class="service_time" style="width:650px; color:#666;">
                                <div class="begining_time">
                                    <span class="text">起始时间：</span><input class="jcDate begining" id="service_begin_time" style="width:110px; padding:5px; border:1px solid #1094cb; border-radius:4px;" />
                                </div>
                                <div class="ending_time">
                                    <span class="text">终止时间：</span><input class="jcDate begining" id="service_end_time" style="width:110px; padding:5px; border:1px solid #1094cb; border-radius:4px;" />
                                </div>
                            </div>
                            <span class="line" style="margin:35px auto 25px; width:650px;"></span>
                            <div class="block_saving_btns">
                                <span class="sure">确定</span><span class="cancel">取消</span>
                            </div>
                        </div>
                    </div>
        	</div>
            <!--修改头像-->
            <div class="BbPicModify">
            	<div class="BbBlockSavingWrap" style="display:block;">
                        <div class="BbBlockSaving">
                            <p class="Bbtitle">修改头像</p>
                            <span class="close"></span>
                            <!--div class="piclists">
                            	<ul>
                                	<li><img src="newview/images/pic_example01.jpg" width="60" height="60" alt=""/></li>
                                    <li><img src="newview/images/pic_example02.jpg" width="60" height="60" alt=""/></li>
                                    <li><img src="newview/images/pic_example03.jpg" width="60" height="60" alt=""/></li>
                                    <li><img src="newview/images/pic_example04.jpg" width="60" height="60" alt=""/></li>
                                    <li><img src="newview/images/pic_example05.jpg" width="60" height="60" alt=""/></li>
                                    <li><img src="newview/images/pic_example01.jpg" width="60" height="60" alt=""/></li>
                                    <li><img src="newview/images/pic_example01.jpg" width="60" height="60" alt=""/></li>
                                    <li><img src="newview/images/pic_example02.jpg" width="60" height="60" alt=""/></li>
                                    <li><img src="newview/images/pic_example03.jpg" width="60" height="60" alt=""/></li>
                                    <li><img src="newview/images/pic_example04.jpg" width="60" height="60" alt=""/></li>
                                    <li><img src="newview/images/pic_example05.jpg" width="60" height="60" alt=""/></li>
                                    <li><img src="newview/images/pic_example01.jpg" width="60" height="60" alt=""/></li>
                                    <li><img src="newview/images/pic_example01.jpg" width="60" height="60" alt=""/></li>
                                    <li><img src="newview/images/pic_example02.jpg" width="60" height="60" alt=""/></li>
                                    <li><img src="newview/images/pic_example03.jpg" width="60" height="60" alt=""/></li>
                                    <li><img src="newview/images/pic_example01.jpg" width="60" height="60" alt=""/></li>
                                </ul>
                            </div-->
                            <!--form action="accountPicUpload" method="post" enctype="multipart/form-data" id="accountPicUpload"--> 
                            <form id="accountPicUpload">   
						        <span class="accountPicUpload_label">选择文件:</span><input class="accountPicUpload_file" type="file" name="file" width="120px">  
						        <!-- input class="accountPicUpload_submit" type="submit" value="上传"-->
						        <span class="accountPicUpload_submit">上传</span>
						    </form>  
                            <span class="line" style="margin:25px auto;"></span>
                            <!--div class="block_saving_btns">
                                <span class="sure">确定</span><span class="cancel">取消</span>
                            </div-->
                        </div>
                    </div>
            </div>
        </div>
        <div class="BbAccountInfoWrap">
        	<div class="BbAccountPic">
                <span class="account_pic"><img id="account_pic_img" src=<%=session.getAttribute("urlphoto")%> width="160" height="160" alt=""/></span>
                <span class="account_text">修改头像</span>
            </div>
            <div class="BbAccountInfo">
                <div class="account_title">
                	<span class="name">账号信息</span>
                    <span class="modify account">修改</span>
                </div>
                <div class="detailsinfo" style="margin-top:10px;">
                	<span class="left">用户名：</span>
                    <span class="right">张三</span>
                </div>
                <div class="detailsinfo">
                	<span class="left">账号：</span>
                    <span class="right">admin001</span>
                </div>
                <div class="detailsinfo">
                	<span class="left">密码：</span>
                    <input type="password" value="123456"><span class="visible"></span><button>修改密码</button>
                </div>
                <div class="detailsinfo">
                	<span class="left">手机号：</span>
                    <span class="right">13333333333</span>
                </div>
                <div class="detailsinfo">
                	<span class="left">地址：</span>
                    <span class="right">北京市海淀区</span>
                </div>
                <div class="account_title" style="margin-top:20px;">
                	<span class="name">服务信息</span>
                    <span class="modify service">修改</span>
                </div>
                <div class="application">
                	<span class="seperation_line account">农业遥感应用</span>
                    <ul class="application_one account" id="services_ul">
                        <li>
                            <span class="mark"></span><span class="text services_ul_li">农作物分类与面积统计</span>
                        </li>
                        <li>
                            <span class="mark"></span><span class="text services_ul_li">农业病虫害监测</span>
                        </li>
                        <li>
                            <span class="mark"></span><span class="text services_ul_li">农作物长势监测</span>
                        </li>
                        <li>
                            <span class="mark"></span><span class="text services_ul_li">土壤墒情监测</span>
                        </li>
                        <!--li>
                            <span class="mark"></span><span class="text services_ul_li">土壤肥力监测</span>
                        </li-->
                        <li>
                            <span class="mark"></span><span class="text services_ul_li">农作物估产</span>
                        </li>
                    </ul>
                    
                    <span class="seperation_line account">其他应用</span>
                    <ul class="application_one account">
                        <li>
                            <span class="mark"></span><span class="text">应用服务A</span>
                        </li>
                        <li>
                            <span class="mark"></span><span class="text">应用服务B</span>
                        </li>
                        <li>
                            <span class="mark"></span><span class="text">应用服务C</span>
                        </li>
                    </ul>
                   
                </div>
                <div class="bbservice_time">
                	<p class="service">服务时间：<span class="time" id="serviceBeginTime">2017-05-06</span>到<span class="time" id="serviceEndTime">2017-05-06</span></p>
                </div>
            </div>
        </div>
  </div>
</div>
</body>
</html>