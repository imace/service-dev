<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, maximum-scale=1.0 minimum-scale=1.0">
<link rel="stylesheet"
	href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" media="screen and (max-device-width:320px) and (-webkit-device-pixel-ratio:1)" href="<%=Constant.HOST%>/css/site_320.css">
<link rel="stylesheet" type="text/css" media="screen and (min-device-width:321px) and (max-device-width:480px) and (-webkit-device-pixel-ratio:1)" href="<%=Constant.HOST%>/css/site_540.css">
<link rel="stylesheet" type="text/css" media="screen and (max-device-width:640px) and (-webkit-device-pixel-ratio:1.5)" href="<%=Constant.HOST%>/css/site_320.css">
<link rel="stylesheet" type="text/css" media="screen and (max-device-width:720px) and (-webkit-device-pixel-ratio:2)" href="<%=Constant.HOST%>/css/site_320.css">
<link rel="stylesheet" type="text/css" media="screen and (min-device-width:641px) and (max-device-width:720px) and (-webkit-device-pixel-ratio: 1.5)" href="<%=Constant.HOST%>/css/site_540.css">
<link rel="stylesheet" type="text/css" media="screen and (min-device-width:721px) and (device-width:960px) and (-webkit-device-pixel-ratio:1.5)" href="<%=Constant.HOST%>/css/site_720.css">
<link rel="stylesheet" type="text/css" media="screen and (min-device-width:721px) and (max-device-width:1280px) and (-webkit-device-pixel-ratio: 2)" href="<%=Constant.HOST%>/css/site_720.css">
<link rel="stylesheet" type="text/css" media="screen and (max-device-width:1080px) and (-webkit-device-pixel-ratio: 3)" href="<%=Constant.HOST%>/css/site_320.css">
<link rel="stylesheet" type="text/css" media="screen and (min-device-width:1081px) and (max-device-width:1920px) and (-webkit-device-pixel-ratio: 3)" href="<%=Constant.HOST%>/css/site_720.css">
	
<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<script
	src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="<%=Constant.HOST%>/js/relation.js"></script>
<title>支持我,得大奖!</title>
</head>
<body>

	<%
		String fromid = (String) request.getAttribute("fromid");
		String toid = (String) request.getAttribute("toid");
		String fromnickname = (String) request.getAttribute("fromnickname");
		String tonickname = (String) request.getAttribute("tonickname");
		String oauthtoidlink = (String) request
				.getAttribute("oauthtoidlink");
		String fromimg = (String) request.getAttribute("fromimg");
		String toimg = (String) request.getAttribute("toimg");
	%>
	<div class="container page_background">
		<div class="row">
			<div class="col-xs-12">
				<div class="text_mainBody common_style">
					Hi, 亲, 我(<%=fromnickname%>)对索尼FIFA手机志在必得, 请你拉我一票, 同时你也可以获得打折惠,
					请完成简单2步:
				</div>
				<div class="text_highlight common_style">1.点击支持  2.完成关注</div>
				<img alt="fifa" style="max-width: 100%;"
					src="/img/banner_recevier.png">
				<div class="text_subHeader common_style">支持您的好友</div>
				<div id="personalInfo">
					<div class="text_mainBody common_style">为了支持您的好友, 需要首先点击下面按钮获取您的个人信息。</div>
					<hr>
					<a href="<%=oauthtoidlink%>"
						style="display: block; background-color: #7adb81; border-color: #7adb81;"
						class="btn btn-primary btn-lg active" role="button">获取个人信息</a>
				</div>
				<div id="supportFriend" class="text-center">
					<form action="<%=Constant.HOST%>/sharepage">
						<hr>
						<div class="row">
							<div class="col-xs-1"></div>
							<div class="col-xs-3" id="tonickname">
								<img alt="fifa" style="max-width: 100%;" src="<%=toimg%>"><br>
								<%=tonickname%>
								<input type="hidden" name="user2" value="<%=toid%>">
							</div>
							<div class="col-xs-4">
								<button type="submit" class="btn btn-success btn-block text_support_btn">点击支持</button>
								<br> <img alt="fifa" style="max-width: 100%;"
									src="/img/arrow.png">
							</div>
							<div class="col-xs-3">
								<img alt="fifa" style="max-width: 100%;" src="<%=fromimg%>"><br>
								<%=fromnickname%>
								<input type="hidden" name="user1" value="<%=fromid%>">
							</div>
							<div class="col-xs-1"></div>
						</div>
						<hr>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>