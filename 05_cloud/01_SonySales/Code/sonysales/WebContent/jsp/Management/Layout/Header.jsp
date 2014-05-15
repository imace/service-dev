<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.sonymobile.sonysales.util.Constant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="viewport"
	content="width=device-width, maximum-scale=1.0 minimum-scale=1.0">

<script src="<%=Constant.HOST%>/js/jquery-1.7.2.min.js"></script>
<script src="<%=Constant.HOST%>/js/bootstrap.js"></script>
<link rel="stylesheet" href="<%=Constant.HOST%>/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=Constant.HOST%>/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="<%=Constant.HOST%>/css/adminia.css">
<link rel="stylesheet"
	href="<%=Constant.HOST%>/css/adminia-responsive.css">

<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".nav-collapse"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a> <a class="brand" href="#">微信后台管理系统</a>
			<div class="nav-collapse">
				<ul class="nav pull-right">
					<li></li>
					<li class="divider-vertical"></li>
					<li class="dropdown"><a data-toggle="dropdown"
						class="dropdown-toggle " href="#"> 设置 <b class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a href="#"><i class="icon-user"></i> 帐户设置 </a></li>
							<li><a href="#"><i class="icon-lock"></i> 更改密码</a></li>
							<li class="divider"></li>
							<li><a href="#"><i class="icon-off"></i> 退出系统</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
</div>
</html>