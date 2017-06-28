<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
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
<title>农业遥感| User Login</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />

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
<!-- BEGIN PAGE LEVEL PLUGINS -->
<link href="plugins/assets/css/select2.min.css" rel="stylesheet"
	type="text/css" />
<link href="plugins/assets/css/select2-bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link href="plugins/assets/css/login-2.min.css" rel="stylesheet"
	type="text/css" />
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME LAYOUT STYLES -->
<!-- END THEME LAYOUT STYLES -->
<link rel="icon" type="image/png" href="imgs/logoPic.png" sizes="32x32">

<link href="plugins/laydate/skins/danlan/laydate.css" rel="stylesheet"
	type="text/css" />
<link href="plugins/laydate/need/laydate.css" rel="stylesheet"
	type="text/css" />

<!-- BEGIN LOGIN  -->
<link href="plugins/assets/css/login.css" rel="stylesheet"
	type="text/css" />
<!-- BEGIN 选择行政区划插件 -->
<link href="plugins/assets/css/distpicker.css" rel="stylesheet"
	type="text/css" />
<script class="cssdeck"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

</head>
<!-- END HEAD -->
<body class=" login">
	<!-- BEGIN LOGO -->
	<div class="logo">
		<a href="login"> <img src="imgs/logoPic.png" style="height: 90px;"
			alt="" />
		</a>
		<h1>农业地理可视化大数据平台</h1>
		<br />
		<h2>Agricultural Remote Sensing Visualization Platform</h2>
	</div>
	<!-- END LOGO -->
	<!-- begin myLogin1 -->
	<div class="container">
		<div class="flat-form">
			<ul class="tabs">
				<li><a href="#login" class="active">登陆</a></li>
				<li><a href="#register">注册</a></li>
				<li><a href="#reset">重置密码</a></li>
			</ul>
			<div id="login" class="form-action show">
				<!-- BEGIN LOGIN FORM -->
				<form class="login-form" action=Dologin method="post">
					<div class="alert alert-danger display-hide">
						<button class="close" data-close="alert"></button>
						<span> Enter any username and password. </span>
					</div>
					<div class="form-group">
						<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
						<label class="control-label visible-ie8 visible-ie9">Username</label>
						<input class="form-control form-control-solid placeholder-no-fix"
							type="text" autocomplete="off" placeholder="Username"
							name="username" />
					</div>
					<div class="form-group">
						<label class="control-label visible-ie8 visible-ie9">Password</label>
						<input class="form-control form-control-solid placeholder-no-fix"
							type="password" autocomplete="off" placeholder="Password"
							name="password" />
					</div>
					<div class="form-group margin-top-20">
						<label class="rememberme mt-checkbox mt-checkbox-outline">
							<input type="checkbox" name="remember" value="1" /> 记住我！ <span></span>
						</label>
					</div>
					<div class="form-actions">
						<button type="submit" class="btn red btn-block uppercase">登陆</button>
					</div>
				</form>
				<!-- END LOGIN FORM -->
			</div>
			<!--/#login.form-action-->
			<div id="register" class="form-action hide">
				<!-- BEGIN REGISTRATION FORM -->
				<form class="register-form" action="login" method="post">
					<div class="form-group">
						<label class="control-label visible-ie8 visible-ie9">用户名</label> <input
							class="form-control placeholder-no-fix" type="text"
							placeholder="用户名" name="fullname" />
					</div>
					<div class="form-group">
						<label class="control-label visible-ie8 visible-ie9">密码</label> <input
							class="form-control form-control-solid placeholder-no-fix"
							type="password" autocomplete="off" placeholder="密码"
							name="password" />
					</div>
					<div class="form-group">
						<label class="control-label visible-ie8 visible-ie9">确认密码</label>
						<input class="form-control form-control-solid placeholder-no-fix"
							type="password" autocomplete="off" placeholder="确认密码"
							name="password" />
					</div>
					<p class="hint">请选择行政区划:</p>
					<div data-toggle="distpicker">
						<select class="selectDispicker" data-province="北京市"></select> <select
							class="selectDispicker" data-city="北京市市辖区"></select> <select
							class="selectDispicker" data-district="海淀区"></select>
					</div>
					<p class="hint">请选择服务起止日期:</p>
					<div>
						<input id="DataPicker" class="dateDispicker" type="text"
							style="float: left;" 
							placeholder="请选择服务日期" name="Age" />
					</div>
					<div>
						<input id="DataPicker" class="dateDispicker" type="text"
							style="float: right;" 
							placeholder="请选择服务截止日期" name="Age" />
					</div>
					<div>
					<p class="hint">请选择要订购的产品:</p>
					</div>
					<div class="form-group">
						<label class="control-label visible-ie8 visible-ie9">产品类型</label>
						<select name="country" class="form-control">
							<option value="1">土壤墒情</option>
							<option value="2">农作物分类</option>
							<option value="3">叶面积指数</option>
							<option value="4">农业病虫害</option>
							<option value="5">长势监测与估产</option>
						</select>
					</div>
					<div class="form-group margin-top-20">
						<label class="mt-checkbox mt-checkbox-outline"> <a
							href="javascript:;">条约</a> <input type="checkbox" name="remember"
							value="1" /> <input type="checkbox" name="tnc" /> 我已阅读并同意 <span></span>
						</label>
						<div id="register_tnc_error"></div>
					</div>
					<div class="form-actions">
						<button type="submit" class="btn red btn-block uppercase">注册</button>
					</div>
				</form>
				<!-- END REGISTRATION FORM -->
			</div>
			<!--/#register.form-action-->
			<div id="reset" class="form-action hide">
				<!-- BEGIN FORGOT PASSWORD FORM -->
				<form class="forget-form" action="login" method="post">
					<div class="form-title">
						<span class="form-title">Forget Password ?</span> <span
							class="form-subtitle">Enter your e-mail to reset it.</span>
					</div>
					<div class="form-group">
						<input class="form-control placeholder-no-fix" type="text"
							autocomplete="off" placeholder="Email" name="email" />
					</div>
					<div class="form-actions">
						<button type="button" id="back-btn" class="btn btn-default">Back</button>
						<button type="submit" class="btn btn-primary uppercase pull-right">Submit</button>
					</div>
				</form>
				<!-- END FORGOT PASSWORD FORM -->
			</div>
			<!--/#register.form-action-->
		</div>
	</div>

	<!-- end myLogin1 -->

	<!-- BEGIN LOGIN -->
	<div class="content"></div>
	<div class="copyright hide">2014 © Metronic. Admin Dashboard
		Template.</div>
	<!-- BEGIN CORE PLUGINS -->
	<script src="plugins/assets/js/jquery.min.js" type="text/javascript"></script>
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
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script src="plugins/assets/js/jquery.validate.min.js"
		type="text/javascript"></script>
	<script src="plugins/assets/js/additional-methods.min.js"
		type="text/javascript"></script>
	<script src="plugins/assets/js/select2.full.min.js"
		type="text/javascript"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN THEME GLOBAL SCRIPTS -->
	<script src="plugins/assets/js/app.min.js" type="text/javascript"></script>
	<!-- END THEME GLOBAL SCRIPTS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="plugins/assets/js/login.min.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<!-- BEGIN THEME LAYOUT SCRIPTS -->
	<!-- END THEME LAYOUT SCRIPTS -->
	<script src="plugins/laydate/laydate.js"></script>
	<!-- BEGIN LOGIN SCRIPTS -->
	<script src="plugins/assets/js/login.js" type="text/javascript"></script>
	<!-- BEGIN 行政区划选择插件distpicker -->
	<script src="plugins/assets/js/distpicker.js" type="text/javascript"></script>
	<script>
		laydate({
			elem : '#DataPicker',
			format : 'YYYY-MM-DD', // 分隔符可以任意定义，该例子表示只显示年月
			festival : true, //显示节日
			istoday: true, //是否显示今天
			choose : function(datas) { //选择日期完毕的回调
				//alert('得到：'+datas);
			}
		});
		laydate.skin('danlan');
	</script>
</body>
</html>