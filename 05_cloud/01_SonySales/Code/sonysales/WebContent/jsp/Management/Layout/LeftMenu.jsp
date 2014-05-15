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


<div class="account-container">
	<div class="account-avatar">
		<img src="../../css/weichat.jpg" alt="" class="thumbnail" />
	</div>
	<div class="account-details">
		<span class="account-name">用户1</span> <span class="account-role">管理员</span>
		<span class="account-actions"> </span>
	</div>
</div>
<hr />
<ul id="main-nav" class="nav nav-tabs nav-stacked">
	<li class="active"><a href="#"> <i class="icon-home"></i>
	</a></li>
	<li><a href="UploadExcel.jsp"> <i class="icon-home"></i>
			拉友买订单导入
	</a></li>
	<li><a href="VerifyOrder.jsp"> <i class="icon-pushpin"></i>
			拉手团晒单验证
	</a></li>
	<li><a href="MainPage.jsp"> <i class="icon-th-list"></i>
			拉手团订单查询
	</a></li>
</ul>
<hr />
<div class="sidebar-extra"></div>
<br />
</html>