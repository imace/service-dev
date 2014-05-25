<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@page import="com.sonymobile.sonysales.util.Base64Coder"%>
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
<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<script
	src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
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
	media="screen and (max-device-width:1080px) and (-webkit-device-pixel-ratio: 3)"
	href="<%=request.getContextPath()%>/css/site_320.css">

<link rel="stylesheet" type="text/css"
	media="screen and (min-device-width:721px) and (max-device-width:1280px) and (-webkit-device-pixel-ratio: 2)"
	href="<%=request.getContextPath()%>/css/site_720.css">
<link rel="stylesheet" type="text/css"
	media="screen and (min-device-width:1081px) and (max-device-width:1920px) and (-webkit-device-pixel-ratio: 3)"
	href="<%=request.getContextPath()%>/css/site_720.css">
<title>基本信息</title>
<style type="text/css">
.btn_decoration:hover,.btn_decoration:focus {
	text-decoration: none
}
</style>
</head>
<body>
	<%
		String openId = (String) request.getAttribute("openId");
		String points = ((String) request.getAttribute("points")).trim();
		String pointsOrder = (String) request.getAttribute("pointsOrder");
		String supporterJS = (String) request.getAttribute("supporterJS");
		String friendname = (String) request.getAttribute("friendname");

	%>
	
	<div class="container"
		style="background: url(<%=request.getContextPath()%>/img/stamp.png) right bottom no-repeat; background-size: 55%; margin: 10px;">
		<div class="row" style="font-family: Droid Sans Fallback;">
			<div id="title" class="text_header" style="margin-bottom: 10px">您的好友(<%=friendname%>)正在参加索尼FIFA活动</div>
			<div>
				<div class="text_subHeader"
					style="margin-top: 10px; margin-bottom: 10px">(<%=friendname%>)的人气</div>
				<div class="text_mainBody">
					<hr style="border: 1px solid #22bff2; margin-top:-3px;">
					<%
						if (Integer.parseInt(points) == 0) {
					%>
					快给(<%=friendname%>)加油吧!
					<%
						}
					%>
					<%
						if (Integer.parseInt(points) > 0) {
					%>
					(<%=friendname%>)已经获得<span class="text_highlight"><%=points%>人气点</span>，目前排名<span
						class="text_highlight">第<%=pointsOrder%>位
					</span>，继续加油哦！
					<%
						}
					%>
				</div>
			</div>

			<br>

			<div class="text_subHeader"
				style="margin-top: 10px; margin-bottom: 10px">(<%=friendname%>)的拉友团</div>
			<hr style="border: 1px solid #22bff2; margin-top:-3px;">
			<div class="text_mainBody">
				<%
					JSONArray supporterJA = JSONArray.fromObject(supporterJS);
					int supporterCount = supporterJA.size();
					int money = supporterCount * Constant.FEEDBACK_SINGLE_MONEY;

					int emptyObjectCount = 0;
				%>

				<table class="table  table-striped">
					<%
						if (supporterCount > 0) {
							for (int i = 0; i < supporterCount; i++) {
								JSONObject jo = supporterJA.getJSONObject(i);
								String createTime = "";
								String nickname = "";
								if (!jo.isNullObject()) {
									nickname = jo.getString("nickname");
									createTime = jo.getString("createTime");
									StringBuilder sb = new StringBuilder();
									if (createTime != null && !createTime.isEmpty()
											&& createTime.length() > 8) {
										sb.append("已于");
										sb.append(createTime.substring(0, 4));
										sb.append("年");
										sb.append(createTime.substring(4, 6));
										sb.append("月");
										sb.append(createTime.substring(6, 8));
										sb.append("日");
									} else {
										sb.append("已经");
									}
									createTime = sb.toString();
					%>
					<tr>
						<td><%=nickname%></td><td><%=createTime%>支持了(<%=friendname%>)！</td>
					</tr>
					<%
						} else {
									emptyObjectCount++;
								}
							}
						}
						supporterCount -= emptyObjectCount;
					%>
				</table>
				<%
					if (supporterCount < 1) {
				%>
				<tr>
					<td>快给(<%=friendname%>)加油吧!</td>
				</tr>
				<%
					} else {
				%>
				(<%=friendname%>)已经获取<span style="color: #cea14b"><%=supporterCount%>个好友</span>的支持进行拉手购买活动，最多可以获得<span
					style="color: #cea14b"><%=money%>元返金</span>
				<%
					}
				%>
			</div>
		</div>
	</div>

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