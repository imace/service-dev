<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.sonymobile.sonysales.util.Constant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<title>索尼FIFA2014世界杯狂热季</title>

<style type="text/css">
<%
if (com.sonymobile.sonysales.util.Constant.LAYOUBUY_SWITCH.contains("ON")) { %> .btn {
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
if (com.sonymobile.sonysales.util.Constant.LAYOUBUY_SWITCH.contains("OFF")) { %> .btn {
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
<body class="base_font_size" style="margin: 0; background-color: #f8f7f5">
	<%
		String message = "索尼 FIFA 2014 活动介绍";
		String url = request.getScheme() + "://" + request.getServerName() + "/Description";
		/* out.print("<script type=\"text/javascript\">var dataForWeixin={appId:\"\","
				+ "url:\""
				+ url
				+ "\", title:\"索尼 FIFA 2014 世界杯狂热季\","
				+ "desc:\""
				+ message
				+ "\", fakeid:\"\",callback:function(){}};</script>"); */
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
			<img src="<%=request.getContextPath()%>/img/banner_main.jpg"
				id="banner_img" style="width: 96%; max-width: 96%;" />
		</div>
		<br>
		<div id="intro">
			<div class="text_subHeader"
				style="max-width: 96%; width: 96%; margin-left: 2%; line-height: 150%;">索尼
				FIFA 2014 活动介绍</div>
			<div class="text_mainBody"
				style="max-width: 96%; width: 96%; margin-left: 2%; line-height: 150%;">
				2014世界杯,赛事重燃, <br>
				索尼Xperia与您激情盛夏,<br>
				谁将会成为最后赢家？<br> 
				快来参与这个激动人心的活动吧!<br>
				<br>
			</div>
			<div class="text_highlight"
				style="max-width: 96%; width: 96%; margin-left: 2%; line-height: 150%;">
				参加这个活动，不仅有机会获得索尼FIFA精美大奖，还有多款FIFA世界杯特惠索尼手机供您选择。  <br> <br> <br>
				<br>
			</div>

		</div>
	</div>
	<br>
	<br>
	
	
	
	<!-- ===============================Layou Buy=============================== -->
	<%
		if (com.sonymobile.sonysales.util.Constant.LAYOUBUY_SWITCH.contains("ON")) {
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
		if (com.sonymobile.sonysales.util.Constant.LAYOUBUY_SWITCH.contains("OFF")) {
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
	<!-- ===============================End=============================== -->
	<script type="text/javascript">
		(function(){
			document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
			    WeixinJSBridge.call('hideToolbar');
			});
			})();
	</script>
</body>
</html>
