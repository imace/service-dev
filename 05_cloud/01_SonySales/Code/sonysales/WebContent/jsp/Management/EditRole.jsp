<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@page import="com.sonymobile.sonysales.model.Role"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<link rel="stylesheet" href="<%=Constant.HOST%>/css/login.css">
<title>编辑角色</title>
</head>
<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="#">编辑角色</a>
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
			<h3>角色信息</h3>
		</div>
		 <%
		 Role role = (Role)request.getAttribute("Role");
          %>
		<!-- /login-header -->
		<div id="login-content" class="clearfix">
			<form action="<%=request.getContextPath()%>/Management/saveRole" method="post">
			<input type="hidden"  name="id" value="<%=role==null?"":role.getId()%>"/>
			<fieldset>
				<div class="control-group">
					<label class="control-label" for="code">角色代码</label>
					<div class="controls">
						<input type="text" class="" id="code" name="code" value="<%=role==null?"":role.getCode()%>"/>
					</div> 
				</div>
				<div class="control-group">
					<label class="control-label" for="name">角色名称</label>
					<div class="controls">
						<input type="text" class="" id="name" name="name" value="<%=role==null?"":role.getName()%>"/>
					</div>
				</div>
			</fieldset>
			<div>
				<button type="submit" class="btn btn-warning btn-large" style="margin-left:240px">修改</button>
			</div>
			</form>
			<div class="pull-right">
         <button class="btn btn-large"  onclick="javascript:window.history.go(-1);" style="margin-top:-55px">取消</button>
     </div>
		</div>
		<div style="color:red;font-size:larger;margin-top:10px"><%=request.getAttribute("msg")==null?"":request.getAttribute("msg") %></div>
	</div>
	   
</body>
</html>