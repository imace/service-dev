<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.sonymobile.sonysales.util.Constant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html charset=UTF-8">
<meta name="viewport"
	content="width=device-width, maximum-scale=1.0 minimum-scale=1.0">
<script src="../../js/jquery-2.1.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	media="screen and (max-device-width:320px) and (-webkit-device-pixel-ratio:1)"
	href="<%=Constant.HOST%>/css/site_320.css">
<link rel="stylesheet" type="text/css"
	media="screen and (min-device-width:321px) and (max-device-width:480px) and (-webkit-device-pixel-ratio:1)"
	href="<%=Constant.HOST%>/css/site_540.css">
<link rel="stylesheet" type="text/css"
	media="screen and (max-device-width:640px) and (-webkit-device-pixel-ratio:1.5)"
	href="<%=Constant.HOST%>/css/site_320.css">
<link rel="stylesheet" type="text/css"
	media="screen and (max-device-width:720px) and (-webkit-device-pixel-ratio:2)"
	href="<%=Constant.HOST%>/css/site_320.css">

<link rel="stylesheet" type="text/css"
	media="screen and (min-device-width:641px) and (max-device-width:720px) and (-webkit-device-pixel-ratio: 1.5)"
	href="<%=Constant.HOST%>/css/site_540.css">

<link rel="stylesheet" type="text/css"
	media="screen and (min-device-width:721px) and (device-width:960px) and (-webkit-device-pixel-ratio:1.5)"
	href="<%=Constant.HOST%>/css/site_720.css">

<link rel="stylesheet" type="text/css"
	media="screen and (max-device-width:1080px) and (-webkit-device-pixel-ratio: 3)"
	href="<%=Constant.HOST%>/css/site_320.css">

<link rel="stylesheet" type="text/css"
	media="screen and (min-device-width:721px) and (max-device-width:1280px) and (-webkit-device-pixel-ratio: 2)"
	href="<%=Constant.HOST%>/css/site_720.css">
<link rel="stylesheet" type="text/css"
	media="screen and (min-device-width:1081px) and (max-device-width:1920px) and (-webkit-device-pixel-ratio: 3)"
	href="<%=Constant.HOST%>/css/site_720.css">
<title>索尼FIFA2014世界杯狂热季</title>

<style type="text/css">
.btn {
	border: none;
	width: 120px;
	height: 120px;
	border-radius: 60px;
	position: fixed;
	bottom: 0;
	background-color: transparent;
	outline-style: none;
	outline: none;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	-o-user-select: none;
	user-select: none;
	border-color: transparent;
	box-shadow: 0 0;
}

.btn:active {
	box-shadow: 0 0;
}

.btn:focus {
	box-shadow: 0 0;
}

.bottom {
	position: fixed;
	bottom: 0;
}
</style>
</head>
<body style="margin: 0; background-color: #f8f7f5">
	<%
		String openId = request.getParameter("id");
	%>
	<div>
		<div id="title" class="text_header common_style">索尼FIFA2014世界杯狂热季</div>
		<div id="banner_img_div" style="margin-left: 10px; margin-top: 20px;">
			<img src="<%=Constant.HOST%>/img/banner_popularity.png"
				id="banner_img" />
		</div>
		<br>
		<div id="intro">
			<div class="text_subHeader common_style">索尼 FIFA 2014 活动介绍</div>
			<div class="text_mainBody common_style">
				FIFA , 2014 , 赛事重来 ,<br> 谁将会成为最后赢家？<br> 想不想也参与这个激动人心的活动？<br>
				<br>
			</div>
			<div class="text_highlight common_style">
				参加这个活动，不仅有机会获得超值索尼FIFA手机，还可以获得关注奖金和拉手获现金。 <br> <br>
			</div>

		</div>
	</div>
	<br>
	<br>
	<div id="bgImg_div">
		<img src="<%=Constant.HOST%>/img/main_panel_all_word.png" id="bgImg"
			class="bottom" />
	</div>

	<input onFocus="this.blur()" type="button" id="button1" value=""
		class="btn"
		onclick="window.open('<%=Constant.HOST%>/getNameList?id=<%=openId%>')" />

	<input onFocus="this.blur()" type="button" id="button2" value=""
		class="btn"
		onclick="window.open('<%=Constant.HOST%>/activitypage?id=<%=openId%>')" />

	<input onFocus="this.blur()" type="button" id="button3" value=""
		class="btn"
		onclick="window.open('<%=Constant.HOST%>/lashouactivity?id=<%=openId%>')" />

	<input onFocus="this.blur()" type="button" id="button4" value=""
		class="btn"
		onclick="window.open('<%=Constant.HOST%>/myInfo?id=<%=openId%>')" />

	<script type="text/javascript">
		$(document).ready(
				function() {
					$("#banner_img").css("width",
							document.body.clientWidth - 20);
					$("#bgImg").css("width", document.body.clientWidth);
					$("#intro").css("width", document.body.clientWidth - 20);
					$("#button1").css("width",
							(document.body.clientWidth - 50) / 4);
					$("#button1").css("height",
							(document.body.clientWidth - 50) / 4);
					$("#button1").css("left", 10);
					$("#button2").css("width",
							(document.body.clientWidth - 50) / 4);
					$("#button2").css("height",
							(document.body.clientWidth - 50) / 4);
					$("#button2").css("left",
							(document.body.clientWidth + 30) / 4);
					$("#button3").css("width",
							(document.body.clientWidth - 50) / 4);
					$("#button3").css("height",
							(document.body.clientWidth - 50) / 4);
					$("#button3").css("left",
							(document.body.clientWidth + 10) / 2);
					$("#button4").css("width",
							(document.body.clientWidth - 50) / 4);
					$("#button4").css("height",
							(document.body.clientWidth - 50) / 4);
					$("#button4").css("left",
							(document.body.clientWidth * 3 + 10) / 4);
				});
	</script>
</body>
</html>
