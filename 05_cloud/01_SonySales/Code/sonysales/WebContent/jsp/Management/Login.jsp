<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.sonymobile.sonysales.util.Constant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="viewport"
	content="width=device-width, maximum-scale=1.0 minimum-scale=1.0">
<script src="<%=request.getContextPath()%>/js/jquery-1.7.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/adminia.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/adminia-responsive.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css">
<title>登陆</title>
</head>
<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="#">微信后台管理系统登录</a>
				<div class="nav-collapse">
					<ul class="nav pull-right">
						<li class=""><a href="javascript:;"><i
								class="icon-chevron-left"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="login-container">
		<div id="login-header">
			<h3>登录</h3>
		</div>
		<!-- /login-header -->
		<div id="login-content" class="clearfix">
			<form action="<%=request.getContextPath()%>/Management/login" method="post">
			<fieldset>
				<div class="control-group">
					<label class="control-label" for="userName">用户名</label>
					<div class="controls">
						<input type="text" class="" id="userName" name="userName"/>
					</div> 
				</div>
				<div class="control-group">
					<label class="control-label" for="password">密码</label>
					<div class="controls">
						<input type="password" class="" id="password" name="password"/>
					</div>
				</div>
			</fieldset>
			<!--  
			<div id="remember-me" class="pull-left">
				<input type="checkbox" name="remember" id="remember" /> <label
					id="remember-label" for="remember">记住</label>
			</div>
			-->
			<div class="pull-right">
				<button type="submit" class="btn btn-warning btn-large">登录</button>
			</div>
			</form>
			
		</div>
		<div style="color:red;font-size:larger;margin-top:10px"><%=request.getAttribute("msg")==null?"":request.getAttribute("msg") %></div>
	</div>
	   
</body>
</html>