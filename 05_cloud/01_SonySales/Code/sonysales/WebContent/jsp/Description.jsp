<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.sonymobile.sonysales.util.Constant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/common.css">
<script src="http://lib.sinaapp.com/js/jquery/1.10.2/jquery-1.10.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/relation.js"></script>
<title>索尼2014世界杯狂热季</title>

<style type="text/css">
<%if (com.sonymobile.sonysales.util.Constant.LAYOUBUY_SWITCH
					.contains("ON")) {%> .btn { border:none;
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

<%}%>
<%if (com.sonymobile.sonysales.util.Constant.LAYOUBUY_SWITCH
					.contains("OFF")) {%> .btn { border:none;
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

<%}%>
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
<body class="base_font_size"
	style="margin: 0; background-color: #f8f7f5">
	<%
		String message = "索尼世界杯惊喜购机活动介绍";
		String url = request.getScheme() + "://" + request.getServerName()
				+ "/Description";
	%>

	<%
		String openId = (String) request.getParameter("id");

		if (openId == null) {
			openId = (String) request.getAttribute("id");
		}

		if (openId == null) {
			response.sendRedirect(request.getContextPath() + "/Description");
		}
	%>
	<div>
		<div id="title" class="text_header common_style"
			style="margin: 8px; max-width: 96%; margin-left: 2%">索尼2014 世界杯狂热季</div>
		<div id="banner_img_div" style="text-align: center">
			<img src="<%=request.getContextPath()%>/img/banner_main.jpg"
				id="banner_img" style="width: 96%; max-width: 96%;" />
		</div>
		<br>
		<div id="intro">
			<div class="text_subHeader"
				style="max-width: 96%; width: 96%; margin-left: 2%; line-height: 150%;">
				索尼世界杯激情购机活动介绍
			</div>
			<div class="text_mainBody"
				style="max-width: 96%; width: 96%; margin-left: 2%; line-height: 150%;">
				2014世界杯，赛事重燃，<br> 索尼Xperia与您激情盛夏，<br> 谁将会成为最后赢家？<br>
				快来参与这个激动人心的活动吧!<br> <br>
			</div>
			<div
				style="max-width: 96%; width: 96%; margin-left: 2%; line-height: 150%;">
				<span class="text_subHeader" style="line-height: 150%;">活动时间：</span>
				<span class="text_mainBody">6月12日 到 6月30日 <br></span>
				<span class="text_subHeader" style="line-height: 150%;">活动规则：</span>
				<span class="text_mainBody">分享世界杯快报，邀请好友获得人气支持。 人气王前10名可获得</span>
				<a  data-openId="<%=openId %>" data-pageName="1" data-operation="18" data-host="<%=request.getScheme()%>://<%=request.getServerName()%>" href="<%=Constant.SW2_LINK%>" class="text_highlight loghandler" style="line-height: 150%;text-decoration:underline;">索尼智能手表Smart Watch 2</a>
				<span class="text_mainBody" style="line-height: 150%;">一块，11至20名可获得</span>
				<a  data-openId="<%=openId %>" data-pageName="1" data-operation="19" data-host="<%=request.getScheme()%>://<%=request.getServerName()%>" href="<%=Constant.SBH20_LINK%>" class="text_highlight loghandler" style="line-height: 150%;text-decoration:underline;">蓝牙耳机SBH20</a>
				<span class="text_mainBody" style="line-height: 150%;">一个，得奖情况请点击“查看大奖榜单”，具体参与点击“拉人气得大奖”按钮。支持您的好友可获得索尼2014世界杯惊喜购机折扣优惠，具体点击“我的战况->我的优惠券”。<br></span>
				<span class="text_subHeader" style="line-height: 150%;">奖品发放：</span>
				<span class="text_mainBody" style="line-height: 150%;">请您在“我的战况->我的信息”里面留下您的手机号码等联系方式，索尼工作人员会与您联系。<br></span>
				<br> <br> <br>
			</div>

		</div>
	</div>
	<br>
	<br>



	<!-- ===============================Layou Buy=============================== -->
	<%
		if (com.sonymobile.sonysales.util.Constant.LAYOUBUY_SWITCH
				.contains("ON")) {
	%>
	<div id="bgImg_div">
		<img src="<%=request.getContextPath()%>/img/main_panel_all_word.png"
			id="bgImg" class="bottom" style="width: 100%; max-width: 100%;" />
	</div>

	<input onFocus="this.blur()" type="button" id="button1" value=""
		class="btn loghandler"  data-openId="<%=openId %>" data-pageName="1" data-operation="1" data-host="<%=request.getScheme()%>://<%=request.getServerName()%>"
		onclick="window.open('<%=request.getContextPath()%>/getNameList?id=<%=openId%>')"
		style="margin-left: 3.5%" />

	<input onFocus="this.blur()" type="button" id="button2" value=""
		class="btn loghandler"  data-openId="<%=openId %>" data-pageName="1" data-operation="2" data-host="<%=request.getScheme()%>://<%=request.getServerName()%>"
		onclick="window.open('<%=request.getContextPath()%>/activitypage?id=<%=openId%>')"
		style="margin-left: 27.5%" />

	<input onFocus="this.blur()" type="button" id="button3" value=""
		class="btn loghandler"  data-openId="<%=openId %>" data-pageName="1" data-operation="100" data-host="<%=request.getScheme()%>://<%=request.getServerName()%>"
		onclick="window.open('<%=request.getContextPath()%>/lashouactivity?id=<%=openId%>')"
		style="margin-left: 51.5%" />

	<input onFocus="this.blur()" type="button" id="button4" value=""
		class="btn loghandler"  data-openId="<%=openId %>" data-pageName="1" data-operation="3" data-host="<%=request.getScheme()%>://<%=request.getServerName()%>"
		onclick="window.open('<%=request.getContextPath()%>/myInfo?id=<%=openId%>')"
		style="margin-left: 75.5%" />
	<%
		}
	%>
	<!-- ===============================End=============================== -->
	<!-- ===============================Layou Buy=============================== -->
	<%
		if (com.sonymobile.sonysales.util.Constant.LAYOUBUY_SWITCH
				.contains("OFF")) {
	%>
	<div id="bgImg_div">
		<img src="<%=request.getContextPath()%>/img/main_panel_all_word_3.png"
			id="bgImg" class="bottom" style="width: 100%; max-width: 100%;" />
	</div>

	<input onFocus="this.blur()" type="button" id="button1" value=""
		class="btn loghandler"  data-openId="<%=openId %>" data-pageName="1" data-operation="1" data-host="<%=request.getScheme()%>://<%=request.getServerName()%>"
		onclick="window.open('<%=request.getContextPath()%>/getNameList?id=<%=openId%>')"
		style="margin-left: 10%" />

	<input onFocus="this.blur()" type="button" id="button2" value=""
		class="btn loghandler"  data-openId="<%=openId %>" data-pageName="1" data-operation="2" data-host="<%=request.getScheme()%>://<%=request.getServerName()%>"
		onclick="window.open('<%=request.getContextPath()%>/activitypage?id=<%=openId%>')"
		style="margin-left: 40%" />

	<input onFocus="this.blur()" type="button" id="button4" value=""
		class="btn loghandler"  data-openId="<%=openId %>" data-pageName="1" data-operation="3" data-host="<%=request.getScheme()%>://<%=request.getServerName()%>"
		onclick="window.open('<%=request.getContextPath()%>/myInfo?id=<%=openId%>')"
		style="margin-left: 70%" />
	<%
		}
	%>
	<!-- ===============================End=============================== -->
	<script type="text/javascript">
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
