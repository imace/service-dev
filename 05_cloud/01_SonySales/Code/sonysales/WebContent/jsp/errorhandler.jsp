<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.sonymobile.sonysales.util.Constant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css"
  media="screen and (max-device-width:480px)"
  href="<%=request.getContextPath()%>/css/320.css">
  
<link rel="stylesheet" type="text/css"
  media="screen and (min-device-width:481px) and (max-device-width:540px) and (-webkit-device-pixel-ratio: 1.5)"
  href="<%=request.getContextPath()%>/css/360.css">
  
  <!-- iphone4 & iphone4s -->
<link rel="stylesheet" type="text/css"
  media="screen and (min-device-width:541px) and (max-device-width:640px) and (max-device-height:960px) and (-webkit-device-pixel-ratio: 2)"
  href="<%=request.getContextPath()%>/css/320.css">
  
  <!-- iphone5 -->
  <link rel="stylesheet" type="text/css"
  media="screen and (min-device-width:541px) and (max-device-width:640px) and (min-device-height:961px) and (-webkit-device-pixel-ratio: 2)"
  href="<%=request.getContextPath()%>/css/480.css">
  
<link rel="stylesheet" type="text/css"
  media="screen and (min-device-width:641px) and (max-device-width:720px) and (-webkit-device-pixel-ratio: 1.5)"
  href="<%=request.getContextPath()%>/css/480.css">
  
<link rel="stylesheet" type="text/css"
  media="screen and (min-device-width:721px) and (max-device-width:1080px) and (-webkit-device-pixel-ratio: 3)"
  href="<%=request.getContextPath()%>/css/360.css">
<script src="<%=request.getContextPath()%>/js/jquery-1.7.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<title>Error Page</title>
</head>
<body class="base_font_size">
	<%
		String errnum = java.net.URLDecoder.decode(request.getParameter("errnum"), "utf-8");
		String errmsg = java.net.URLDecoder.decode(request.getParameter("errmsg"), "utf-8");
	%>
	<hr>
	<div class="container page_background">
		<div class="row" style="font-family: Droid Sans Fallback;">
			<div class="col-xs-12">
				<div class="text_mainBody common_style">
					很抱歉, 出错了!!!<br><br> 错误代码:<%=errnum%><br>错误信息:<%=errmsg%></div>
				<%-- <div class="text_mainBody common_style">
					<a href="<%=request.getContextPath()%>/Description">点击返回</a>
				</div> --%>
			</div>
		</div>
		<hr>
	</div>
	<hr>
</body>
</html>