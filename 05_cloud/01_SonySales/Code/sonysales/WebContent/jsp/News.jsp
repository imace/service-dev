<%@ page import="com.sonymobile.sonysales.util.Constant"%>
<%@ page import="com.sonymobile.sonysales.util.Coder"%>
<%@ page import="com.sonymobile.sonysales.util.DateUtil"%>
<%@ page import="java.util.Hashtable"%>
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
<script src="<%=request.getContextPath()%>/js/relation.js"></script>
<script
	src="http://lib.sinaapp.com/js/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<title>世界杯活动快报</title>
</head>
<body class="base_font_size">
	<%
		String fromid = (String)request.getAttribute("fid");
			String toid = (String)request.getAttribute("tid");
			String info = (String)request.getAttribute("info");
			String createTime = (String)request.getAttribute("createTime");

			boolean isShared = toid != null && !toid.equals(fromid);

			if (!isShared) {
			    String message = "打开链接，点击支持您的朋友，并额外有惊喜！";
			    String title = "打开世界杯快报链接，点击支持好友，多谢！(一个月内有效)";
			    if (DateUtil.isEnd()) {
			        message = "打开链接，点击支持您的朋友，并额外有惊喜！";
			        title = "打开世界杯快报链接，点击支持好友，多谢！(活动已结束)";
			    }
		String imgurl = request.getScheme() + "://"
				+ request.getServerName() + "/img/entry_bulletin.jpg";
		String newsUrl = request.getScheme() + "://" + request.getServerName() + "/news";
		String redirectHost = Constant.IS_USE_SELF_OAUTH ? Constant.OAUTH_REDIRECT_HOST
				: Constant.SECOND_OAUTH_REDIRECT_HOST;

		Hashtable<String, String> parameters = new Hashtable<String, String>();
		parameters.put("fid", fromid);
		parameters.put("i", Constant.OAUTH_IDENTIFIER);
		String codedState = Coder.generateOAuthStateFromUrl(newsUrl, parameters);

		String url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ Constant.APP_ID
				+ "&redirect_uri="+ redirectHost
				+ "&response_type=code&scope="+ Constant.WECHAT_OAUTH_SCOPES.BASE.getValue()
				+ "&state="+ codedState + "#wechat_redirect";
		out.print("<script type=\"text/javascript\">var dataForWeixin={appId:\"\","
				+ "MsgImg:\""
				+ imgurl
				+ "\", TLImg:\""
				+ imgurl
				+ "\", url:\""
				+ url
				+ "\", title:\""
				+ title
		   + "\", desc:\""
				+ message
				+ "\", fakeid:\"\",callback:function(){/*alert('感谢分享, 更多惊喜请继续关注!-SonyXpria');*/}};</script>");
			}
	%>
    <%
        if (!isShared) {
    %>
 <div id="tips_div">
 <img src="<%=request.getContextPath()%>/img/tips.png" style="z-index:2;position:fixed;height:18%;max-height:18%;top:0;right:0" id="tips_img"/><div id="close_tips" onclick="closeTips()" style="z-index:2;position:fixed;width:8%;height:6%;right:0;top:12%;"></div>
 </div>
     <%
         }
     %>
	<div class="container page_background">
		<div class="row">
			<div class="col-xs-12">
				<div id="title" class="text_header common_style"
					style="margin: 8px; max-width: 96%; margin-left: 2%">世界杯活动快报</div>

				<div id="banner_img_div" style="text-align: center">
					<img
						src="<%=request.getContextPath()%>/img/banner_popularity_zhanbao.jpg"
						id="banner_img" style="width: 96%; max-width: 96%;" />
				</div>
				<br>
				<%
					if (!isShared) {
				%>
				<div style="display: block;">
					<p class="text_highlight common_style"
						style="padding-top: 10px; width: 96%; max-width: 96%; margin-left: 2%">
						点击右上角<img src="<%=request.getContextPath()%>/img/overflow.png"
							class="point_pic_width"
							style="margin-left: 2px; margin-right: 2px" />并<img
							src="<%=request.getContextPath()%>/img/share.png"
							class="point_pic_width"
							style="margin-left: 2px; margin-right: 2px" />发送给朋友
					</p>
				</div>
				<%
					}
				%>
				<br>
				<div class="row">
					<div class="col-xs-12">
						<div class="text_mainBody"
							style="max-width: 96%; width: 96%; margin-left: 2%; line-height: 150%;">
							<%=info%>
						</div>
					</div>
				</div>
				<%-- <div class="row">
					<div class="col-xs-12" style="color: gray; text-aglin: right;">
						索尼Xperia发布于 :<%=createTime%>
					</div>
				</div> --%>
				<br>
				<%
					if (isShared) {
								String relationUrl = request.getContextPath()+"/relationpage?fid="+fromid+"&openid="+toid;
				%>
				<br>
       <div class="row">
          <div class="col-xs-12">
             <div class="text_mainBody"
                 style="max-width: 96%; width: 96%; margin-left: 2%; line-height: 150%;margin-bottom:0.8em">
                 *点击“支持好友”，帮TA登上人气榜
             </div>
          </div>
      </div>
				<div class="row">
					<div class="col-xs-12">
						<a href="<%=relationUrl%>"  data-openId="<%=toid %>" data-pageName="6" data-operation="16" data-host="<%=request.getScheme()%>://<%=request.getServerName()%>" 
							style="display: block;padding:0.7em;font-size:1.8em"
							class="btn btn-success btn-block text_support_btn loghandler" role="button">支持好友</a>
					</div>
				</div>
				<br>
				<%
					}else{
				%>
				<br>
				<div class="row">
          <div class="col-xs-12">
             <div class="text_mainBody"
                 style="max-width: 96%; width: 96%; margin-left: 2%; line-height: 150%;margin-bottom:0.8em">
                 *点击下面按钮，查看活动详情
             </div>
          </div>
      </div>
				<div class="row">
					<div class="col-xs-12">
						<a data-openId="<%=toid %>" data-pageName="6" data-operation="17" data-host="<%=request.getScheme()%>://<%=request.getServerName()%>" 
							href="<%=request.getContextPath()%>/activitypage?id=<%=fromid%>"
							style="display: block;padding:0.7em;font-size:1.8em"
							class="btn btn-success btn-block text_support_btn loghandler" role="button">发快报，拉人气，得大奖 </a>
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
 function closeTips() {
     $("#tips_div").hide();
     }
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