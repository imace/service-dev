<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="http://lib.sinaapp.com/js/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="http://lib.sinaapp.com/js/bootstrap/3.0.0/css/bootstrap-theme.min.css">
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
<script src="http://lib.sinaapp.com/js/jquery/1.10.2/jquery-1.10.2.min.js"></script>
<script src="http://lib.sinaapp.com/js/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/relation.js"></script>
<title>支持我,得大奖!</title>
</head>
<body class="base_font_size">

	<%
		String fromid = (String) request.getAttribute("fromid");
		String toid = (String) request.getAttribute("toid");
		String fromnickname = (String) request.getAttribute("fromnickname");
		String tonickname = (String) request.getAttribute("tonickname");
		String oauthtoidlink = (String) request.getAttribute("oauthtoidlink");
		String fromimg = (String) request.getAttribute("fromimg");
		String toimg = (String) request.getAttribute("toimg");
		String attention = (String) request.getAttribute("attention");
	%>
	<div class="container page_background" style="padding-left: 2%;padding-right: 2%;padding-top: 8px;max-width: 96%; width: 96%">
		<div class="row">
			<div class="col-xs-12">
				<div class="text_mainBody">
					Hi, 亲, 我(<%=fromnickname%>)对<span style="color: #cea14b">索尼FIFA手机</span>志在必得,
					请你拉我一票, 同时你也可以获得<span style="color: #cea14b">打折优惠</span>.<br>只需2步即可完成:
				</div>
				<div class="text_highlight">1.点击支持 2.完成关注</div>
				<br> <br> <br>
				<div class="text_subHeader">第1步: 点击"支持"</div>
				<hr style="border: 1px solid #22bff2;">
				<div id="personalInfo">
					<div class="text_mainBody">为了支持您的好友,
						需要首先点击下面按钮获取您的个人信息。</div>
					<hr>
					<a href="<%=oauthtoidlink%>"
						style="display: block; background-color: #7adb81; border-color: #7adb81;"
						class="btn btn-primary btn-lg active" role="button">获取个人信息</a>
				</div>
				<div id="supportFriend" class="text-center">
					<form action="<%=request.getContextPath()%>/sharepage" method="post">
						<div class="row">
							<div class="col-xs-4">
								<div style="position: relative; padding: 1px;">
									<img class="img-circle"
										style="max-width: 100%; max-height: 100%; border: 3px solid transparent; display: block; padding: 3px;"
										src="<%=fromimg%>"> <img class="img-circle"
										style="max-width: 100%; max-height: 100%; position: absolute; left: 0; top: 0; border: 1px solid #f0f0f0; margin: 1px;"
										src="<%=request.getContextPath()%>/img/circle.png">
								</div>
								<%=fromnickname%>
								<input type="hidden" name="fromid" value="<%=fromid%>">
								<input type="hidden" name="attention" value="<%=attention%>">
								<input type="hidden" name="oauthtoidlink" value="<%=oauthtoidlink%>">
							</div>
							<div class="col-xs-4">
								<br> <br> <img alt="fifa" style="max-width: 100%;"
									src="<%=request.getContextPath()%>/img/arrow.png">
							</div>
							<div class="col-xs-4">
								<span id="tonickname" style="display: none;"><%=tonickname%></span>
								<img alt="fifa" style="max-width: 100%;" src="<%=toimg%>"><br>
								FIFA手机 <input type="hidden" name="toid" value="<%=toid%>">
							</div>
						</div>
						<br> <br> <br> <br>
						<div class="row">
							<div class="col-xs-12">
								<button type="submit" style="display: block;"
									class="btn btn-success btn-block text_support_btn">支持</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>