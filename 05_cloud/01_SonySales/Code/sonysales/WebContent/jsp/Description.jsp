<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.sonymobile.sonysales.util.Constant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<script src="<%=request.getContextPath()%>/js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" type="text/css"
	media="screen and (max-device-width:480px)"
	href="<%=request.getContextPath()%>/css/site_320.css">

<link rel="stylesheet" type="text/css"
	media="screen and (min-device-width:481px) and (max-device-width:540px) and (-webkit-device-pixel-ratio: 1.5)"
	href="<%=request.getContextPath()%>/css/site_360.css">

<!-- iphone4 & iphone4s -->
<link rel="stylesheet" type="text/css"
	media="screen and (min-device-width:541px) and (max-device-width:640px) and (max-device-height:960px) and (-webkit-device-pixel-ratio: 2)"
	href="<%=request.getContextPath()%>/css/site_320.css">

<!-- iphone5 -->
<link rel="stylesheet" type="text/css"
	media="screen and (min-device-width:541px) and (max-device-width:640px) and (min-device-height:961px) and (-webkit-device-pixel-ratio: 2)"
	href="<%=request.getContextPath()%>/css/site_480.css">

<link rel="stylesheet" type="text/css"
	media="screen and (min-device-width:641px) and (max-device-width:720px) and (-webkit-device-pixel-ratio: 1.5)"
	href="<%=request.getContextPath()%>/css/site_480.css">

<link rel="stylesheet" type="text/css"
	media="screen and (min-device-width:721px) and (max-device-width:1080px) and (-webkit-device-pixel-ratio: 3)"
	href="<%=request.getContextPath()%>/css/site_360.css">
<title>索尼FIFA2014世界杯狂热季</title>

<style type="text/css">
<%
if (com.sonymobile.sonysales.util.Constant.properties.getProperty("LAYOUBUY_SWITCH").contains("ON")) { %> .btn {
	border: none;
	max-width: 20%;
	width: 20%;
	max-height: 14.5%;
	height: 14.5%;
	border-radius: 100%;
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
<%
}
%>

<%
if (com.sonymobile.sonysales.util.Constant.properties.getProperty("LAYOUBUY_SWITCH").contains("OFF")) { %> .btn {
	border: none;
	max-width: 20%;
	width: 20%;
	max-height: 14.5%;
	height: 14.5%;
	border-radius: 100%;
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
<%
}
%>

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
		String message = "索尼 FIFA 2014 活动介绍";
		String url = request.getScheme() + "://" + request.getServerName() + "/Description";
		out.print("<script type=\"text/javascript\">var dataForWeixin={appId:\"\","
				+ "url:\""
				+ url
				+ "\", title:\"索尼 FIFA 2014 世界杯狂热季\","
				+ "desc:\""
				+ message
				+ "\", fakeid:\"\",callback:function(){/*alert('感谢分享, 更多惊喜请继续关注!-SonyXpria');*/}};</script>");
	%>

	<%
		String openId = (String) request.getParameter("id");

		if (openId == null) {
			openId = (String) request.getAttribute("id");
		}

		if (openId == null) {
			response.sendRedirect(request.getContextPath()+"/Description");
		}
	%>
	<div>
		<div id="title" class="text_header common_style"
			style="margin: 8px; max-width: 96%; margin-left: 2%">索尼 FIFA
			2014 世界杯狂热季</div>
		<div id="banner_img_div" style="text-align: center">
			<img src="<%=request.getContextPath()%>/img/banner_popularity.jpg"
				id="banner_img" style="width: 96%; max-width: 96%;" />
		</div>
		<br>
		<div id="intro">
			<div class="text_subHeader"
				style="max-width: 96%; width: 96%; margin-left: 2%; line-height: 150%;">索尼
				FIFA 2014 活动介绍</div>
			<div class="text_mainBody"
				style="max-width: 96%; width: 96%; margin-left: 2%; line-height: 150%;">
				FIFA , 2014 , 赛事重来 ,<br> 谁将会成为最后赢家？<br> 想不想也参与这个激动人心的活动？<br>
				<br>
			</div>
			<div class="text_highlight"
				style="max-width: 96%; width: 96%; margin-left: 2%; line-height: 150%;">
				参加这个活动，不仅有机会获得超值索尼FIFA手机，还可以获得关注优惠券和拉友买奖金。 <br> <br> <br>
				<br>
			</div>

		</div>
	</div>
	<br>
	<br>
	
	
	
	<!-- ===============================Layou Buy=============================== -->
	<%
		if (com.sonymobile.sonysales.util.Constant.properties.getProperty(
				"LAYOUBUY_SWITCH").contains("ON")) {
	%>
	<div id="bgImg_div">
		<img src="<%=request.getContextPath()%>/img/main_panel_all_word.png"
			id="bgImg" class="bottom" style="width: 100%; max-width: 100%;" />
	</div>

	<input onFocus="this.blur()" type="button" id="button1" value=""
		class="btn"
		onclick="window.open('<%=request.getContextPath()%>/getNameList?id=<%=openId%>')"
		style="margin-left: 3.5%" />

	<input onFocus="this.blur()" type="button" id="button2" value=""
		class="btn"
		onclick="window.open('<%=request.getContextPath()%>/activitypage?id=<%=openId%>')"
		style="margin-left: 27.5%" />

	<input onFocus="this.blur()" type="button" id="button3" value=""
		class="btn"
		onclick="window.open('<%=request.getContextPath()%>/lashouactivity?id=<%=openId%>')"
		style="margin-left: 51.5%" />

	<input onFocus="this.blur()" type="button" id="button4" value=""
		class="btn"
		onclick="window.open('<%=request.getContextPath()%>/myInfo?id=<%=openId%>')"
		style="margin-left: 75.5%" />
	<%
		}
	%>
	<!-- ===============================End=============================== -->
	<!-- ===============================Layou Buy=============================== -->
	<%
		if (com.sonymobile.sonysales.util.Constant.properties.getProperty(
				"LAYOUBUY_SWITCH").contains("OFF")) {
	%>
	<div id="bgImg_div">
		<img src="<%=request.getContextPath()%>/img/main_panel_all_word_3.png"
			id="bgImg" class="bottom" style="width: 100%; max-width: 100%;" />
	</div>

	<input onFocus="this.blur()" type="button" id="button1" value=""
		class="btn"
		onclick="window.open('<%=request.getContextPath()%>/getNameList?id=<%=openId%>')"
		style="margin-left: 10%" />

	<input onFocus="this.blur()" type="button" id="button2" value=""
		class="btn"
		onclick="window.open('<%=request.getContextPath()%>/activitypage?id=<%=openId%>')"
		style="margin-left: 40%" />

	<input onFocus="this.blur()" type="button" id="button4" value=""
		class="btn"
		onclick="window.open('<%=request.getContextPath()%>/myInfo?id=<%=openId%>')"
		style="margin-left: 70%" />	
	<%
		}
	%>
	<script type="text/javascript">
		$(document).ready(
				function() {
					/**
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
					*/
				});

		(function(){
			   var onBridgeReady=function(){
			   WeixinJSBridge.on('menu:share:appmessage', function(argv){
			      WeixinJSBridge.invoke('sendAppMessage',{
			         "appid":dataForWeixin.appId,
			         "img_url":dataForWeixin.MsgImg,
			         "img_width":"120",
			         "img_height":"120",
			         "link":dataForWeixin.url,
			         "desc":dataForWeixin.desc,
			         "title":dataForWeixin.title
			      }, function(res){(dataForWeixin.callback)();});
			   });
			   WeixinJSBridge.on('menu:share:timeline', function(argv){
			      (dataForWeixin.callback)();
			      WeixinJSBridge.invoke('shareTimeline',{
			         "img_url":dataForWeixin.TLImg,
			         "img_width":"120",
			         "img_height":"120",
			         "link":dataForWeixin.url,
			         "desc":dataForWeixin.desc,
			         "title":dataForWeixin.title
			      }, function(res){});
			   });
			   WeixinJSBridge.on('menu:share:weibo', function(argv){
			      WeixinJSBridge.invoke('shareWeibo',{
			         "content":dataForWeixin.title,
			         "url":dataForWeixin.url
			      }, function(res){(dataForWeixin.callback)();});
			   });
			   WeixinJSBridge.on('menu:share:facebook', function(argv){
			      (dataForWeixin.callback)();
			      WeixinJSBridge.invoke('shareFB',{
			         "img_url":dataForWeixin.TLImg,
			         "img_width":"120",
			         "img_height":"120",
			         "link":dataForWeixin.url,
			         "desc":dataForWeixin.desc,
			         "title":dataForWeixin.title
			      }, function(res){});
			   });
			};

			if(document.addEventListener){
			   document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
			}else if(document.attachEvent){
			   document.attachEvent('WeixinJSBridgeReady'   , onBridgeReady);
			   document.attachEvent('onWeixinJSBridgeReady' , onBridgeReady);
			}
			document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
			    WeixinJSBridge.call('hideToolbar');
			});
			})();
	</script>
</body>
</html>
