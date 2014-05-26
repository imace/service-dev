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
<link rel="stylesheet" type="text/css"
	media="screen and (max-device-width:320px) and (-webkit-device-pixel-ratio:1)"
	href="<%=request.getContextPath()%>/css/site_320.css">
<link rel="stylesheet" type="text/css"
	media="screen and (min-device-width:321px) and (max-device-width:480px) and (-webkit-device-pixel-ratio:1)"
	href="<%=request.getContextPath()%>/css/site_540.css">
<link rel="stylesheet" type="text/css"
	media="screen and (max-device-width:640px) and (-webkit-device-pixel-ratio:1.5)"
	href="<%=request.getContextPath()%>/css/site_320.css">
<link rel="stylesheet" type="text/css"
	media="screen and (max-device-width:720px) and (-webkit-device-pixel-ratio:2)"
	href="<%=request.getContextPath()%>/css/site_320.css">
<link rel="stylesheet" type="text/css"
	media="screen and (min-device-width:641px) and (max-device-width:720px) and (-webkit-device-pixel-ratio: 1.5)"
	href="<%=request.getContextPath()%>/css/site_540.css">
<link rel="stylesheet" type="text/css"
	media="screen and (min-device-width:721px) and (device-width:960px) and (-webkit-device-pixel-ratio:1.5)"
	href="<%=request.getContextPath()%>/css/site_720.css">
<link rel="stylesheet" type="text/css"
	media="screen and (min-device-width:721px) and (max-device-width:1280px) and (-webkit-device-pixel-ratio: 2)"
	href="<%=request.getContextPath()%>/css/site_720.css">
<link rel="stylesheet" type="text/css"
	media="screen and (max-device-width:1080px) and (-webkit-device-pixel-ratio: 3)"
	href="<%=request.getContextPath()%>/css/site_320.css">
<link rel="stylesheet" type="text/css"
	media="screen and (min-device-width:1081px) and (max-device-width:1920px) and (-webkit-device-pixel-ratio: 3)"
	href="<%=request.getContextPath()%>/css/site_720.css">
<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<script
	src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/relation.js"></script>
<title>拉友买, 他得实惠, 我得奖金!</title>
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
		String attention = (String) request.getAttribute("attention");
	%>
	<div class="container page_background">
		<div class="row">
			<div class="col-xs-12">
				<div class="text_mainBody common_style">
					Hi, 亲, 我(<%=fromnickname%>)正在参加<span class="text_highlight">索尼FIFA</span>活动</br>
					如果你支持并完成关注,即可获得50元购买<span class="text_highlight">折扣券</span>!<br>
					如果你完成购买手机, 我还可获得<span class="text_highlight">奖金</span>哦!<br>非常感谢咯.<br>只需2步即可完成:
				</div>
				<div class="text_highlight common_style">1.点击"支持" 2.完成关注</div>
				<br> <br>
				<div class="text_subHeader common_style">第1步: 点击支持</div>
				<hr style="border: 1px solid #22bff2;">
				<div id="personalInfo">
					<div class="text_mainBody common_style">为了支持您的好友,
						需要首先点击下面按钮获取您的个人信息。</div>
					<hr>
					<a href="<%=oauthtoidlink%>"
						style="display: block; background-color: #7adb81; border-color: #7adb81;"
						class="btn btn-primary btn-lg active" role="button">获取个人信息</a>
				</div>
				<div id="supportFriend" class="text-center">
					<form action="<%=request.getContextPath()%>/lashoufollow">
						<div class="row">
							<div class="col-xs-4">
								<div style="position: relative; padding: 1px;">
									<img class="img-circle"
										style="max-width: 100%; max-height: 100%; border: 3px solid transparent; display: block; padding: 3px;"
										src="<%=fromimg%>"> <img class="img-circle"
										style="max-width: 100%; max-height: 100%; position: absolute; left: 0; top: 0; border: 1px solid #f0f0f0; margin: 1px;"
										src="/img/circle.png">
								</div>
								<%=fromnickname%>
								<input type="hidden" name="fromid" value="<%=fromid%>">
								<input type="hidden" name="attention" value="<%=attention%>">
								<input type="hidden" name="oauthtoidlink" value="<%=oauthtoidlink%>">
							</div>
							<div class="col-xs-4">
								<br> <br> <img alt="fifa" style="max-width: 100%;"
									src="/img/arrow.png">
							</div>
							<div class="col-xs-4" id="tonickname">
								<span id="tonickname" style="display: none;"><%=tonickname%></span>
								<img alt="fifa" style="max-width: 100%;" src="<%=toimg%>"><br>
								FIFA手机 <input type="hidden" name="toid" value="<%=toid%>">
							</div>
						</div>
						<br> <br>
						<div class="row">
							<div class="col-xs-1"></div>
							<button type="submit" style="display: block;"
								class="btn btn-success btn-block text_support_btn col-xs-10">支持</button>
							<div class="col-xs-1"></div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>