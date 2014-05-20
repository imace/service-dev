<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.sonymobile.sonysales.util.Constant"%>
<div class="account-container">
	<div class="account-avatar">
		<img src="<%=Constant.HOST%>/css/weichat.jpg" alt="" class="thumbnail" />
	</div>
	<div class="account-details">
		<span class="account-name">用户1</span> <span class="account-role">管理员</span>
		<span class="account-actions"> </span>
	</div>
</div>
<hr />
<ul id="main-nav" class="nav nav-tabs nav-stacked">
	<li class="active"><a href="#"> <i class="icon-home"></i>订单管理
	</a></li>
	<li><a href="<%=Constant.HOST%>/jsp/Management/UploadExcel.jsp">
			<i class="icon-home"></i> 拉友买订单导入
	</a></li>
	<li><a href="<%=Constant.HOST%>/jsp/Management/VerifyOrder.jsp">
			<i class="icon-pushpin"></i> 拉手团晒单验证
	</a></li>
	<li><a href="<%=Constant.HOST%>/jsp/Management/MainPage.jsp">
			<i class="icon-th-list"></i> 拉手团订单查询
	</a></li>
	<li class="active"><a href="#"> <i class="icon-home"></i>用户管理
	</a></li>
	<li><a
		href="<%=request.getContextPath()%>/Management/getAdministratorList">
			<i class="icon-th-list"></i> 用户管理
	</a></li>
<<<<<<< HEAD
	<li><a href="#"> <i class="icon-th-list"></i> 权限管理
=======
	<li><a href="<%=request.getContextPath()%>/Management/getRoleList"> <i class="icon-th-list"></i>
			角色管理
>>>>>>> modify role
	</a></li>
</ul>
<hr />
<div class="sidebar-extra"></div>
<br />
