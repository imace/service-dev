<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.sonymobile.sonysales.util.Constant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="http://lib.sinaapp.com/js/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="http://lib.sinaapp.com/js/bootstrap/3.0.0/css/bootstrap-theme.min.css">
<script src="http://lib.sinaapp.com/js/jquery/1.10.2/jquery-1.10.2.min.js"></script>
<script src="http://lib.sinaapp.com/js/bootstrap/3.0.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
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