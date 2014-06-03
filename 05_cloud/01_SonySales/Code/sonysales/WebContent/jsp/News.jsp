<%@ page import="com.sonymobile.sonysales.util.Constant"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet"
	href="http://lib.sinaapp.com/js/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://lib.sinaapp.com/js/bootstrap/3.0.0/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/common.css">
<script
	src="http://lib.sinaapp.com/js/jquery/1.10.2/jquery-1.10.2.min.js"></script>
<script
	src="http://lib.sinaapp.com/js/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<title>索尼FIFA2014 快报</title>
</head>
<body class="base_font_size">
	<%
		String fromid = (String) request.getAttribute("fromid");
		String fromname = (String) request.getAttribute("fromname");
		String toid = (String) request.getAttribute("toid");
		String toname = (String) request.getAttribute("toname");
		String toheadimgurl = (String) request.getAttribute("toheadimgurl");
		String info = (String) request.getAttribute("info");
		String createTime = (String) request.getAttribute("createTime");

		boolean isShared = toid != null;
		isShared = true;

		String message = "看世界杯快报额外有惊喜";
		String imgurl = request.getScheme() + "://"
				+ request.getServerName() + "/img/entry_bulletin.jpg";
		String url = request.getScheme() + "://" + request.getServerName()
				+ "/activitypage?id=" + fromid;
		out.print("<script type=\"text/javascript\">var dataForWeixin={appId:\"\","
				+ "MsgImg:\""
				+ imgurl
				+ "\", TLImg:\""
				+ imgurl
				+ "\", url:\""
				+ url
				+ "\", title:\"看报有惊喜\", desc:\""
				+ message
				+ "\", fakeid:\"\",callback:function(){/*alert('感谢分享, 更多惊喜请继续关注!-SonyXpria');*/}};</script>");
	%>
	<div class="container page_background">
		<div class="row">
			<div class="col-xs-12">
				<div id="title" class="text_header common_style"
					style="margin: 8px; max-width: 96%; margin-left: 2%">索尼FIFA2014
					快报</div>
				<%
					if (!isShared) {
				%>
				<div style="display: block;">
					<p class="text_highlight common_style"
						style="padding-top: 10px; width: 96%; max-width: 96%; margin-left: 2%">
						点击右上角<img src="<%=request.getContextPath()%>/img/overflow.png"
							class="point_pic_width"
							style="margin-left: 2px; margin-right: 2px" />或<img
							src="<%=request.getContextPath()%>/img/share.png"
							class="point_pic_width"
							style="margin-left: 2px; margin-right: 2px" />发送给朋友
					</p>
				</div>
				<%
					}
				%>
				<div id="banner_img_div" style="text-align: center">
					<img src="<%=request.getContextPath()%>/img/banner_popularity_zhanbao.jpg"
						id="banner_img" style="width: 96%; max-width: 96%;" />
				</div>
				<br>
				<div class="row">
					<div class="col-xs-12">
						<div class="text_mainBody"
							style="max-width: 96%; width: 96%; margin-left: 2%; line-height: 150%;">
							<%=info%>
						</div>
					</div>
				</div>
				<%-- <div>
					索尼Xperia发布于 :<%=createTime%>
				</div> --%>
				<br>
				<%
					if (isShared) {
				%>
				
				<div class="row">
					<div class="col-xs-12">
						<a
							href="<%=request.getContextPath()%>/relationpage?fromid=<%=fromid%>&fromname=<%=fromname%>&toid=<%=toid%>&toname=<%=toname%>&toheadimgurl=<%=toheadimgurl%>"
							style="display: block; background-color: #22bff2; text-align: center; color: white; border-color: #22bff2;"
							class="btn_decoration btn-lg" role="button">前往支持<%=fromname%>登上人气榜
						</a>
					</div>
				</div>
				<br>
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