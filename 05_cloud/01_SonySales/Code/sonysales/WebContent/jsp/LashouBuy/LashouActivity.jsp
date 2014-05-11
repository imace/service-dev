<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@page import="com.sonymobile.sonysales.util.Base64Coder"%>
<%@ page contentType="text/html; charset=gb2312"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html charset=gb2312">
<meta name="viewport" content="width=device-width, maximum-scale=1.0 minimum-scale=1.0">
<link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
<link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap-theme.min.css">
<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
<title>索尼拉手买, 他实惠, 我受益!</title>
</head>
<body>
	<%
		String openid =(String)request.getAttribute("openid");
		String nickname =(String)request.getAttribute("nickname");
		nickname=(nickname==null?"":"("+nickname+")");
		String message="Hi, 亲, 我"+nickname+"对索尼FIFA志在必得, 请你拉我一票!你也可以获得打折优惠券!";
		String imgurl=Constant.HOST+"/img/entry3.png";
		String relationUrl = Base64Coder.convertStrToBase64(Constant.HOST + "/lashourelation");
		String url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ Constant.APP_ID
				+ "&redirect_uri="+ Constant.HOST
				+ "/wechat_authorize?fromid="+ openid
				+ "&response_type=code&scope="+ Constant.WECHAT_OAUTH_SCOPES.BASE.getValue()
				+ "&state="+ relationUrl + "#wechat_redirect";
		out.print("<script type=\"text/javascript\">var dataForWeixin={appId:\"\","
				+ "MsgImg:\""+ imgurl
				+ "\", TLImg:\""+ imgurl
				+ "\", url:\""+ url
				+ "\", title:\"拉友买, 他实惠, 我受益!\","
				+ "desc:\""+ message
				+ "\", fakeid:\"\",callback:function(){/*alert('感谢分享, 更多惊喜请继续关注!-SonyXpria');*/}};</script>");
	%>
	<hr>
	<div class="row">
		<div class="col-xs-4">
			<img class="img-rounded" alt="fifa"
				src="http://www.sonystyle.com.cn/products/xperia/images/xperia_m51w/pro_img/z1_m51w_y1_b.jpg">
		</div>
		<div class="col-xs-8">
			超值, <br>
			<h2>索尼FIFA手机等你来拿</h2>
		</div>
	</div>

	<div class="row">
		<div class="col-xs-12">
			亲, 索尼FIFA 活动正在进行, 推送消息给你朋友, 你的朋友可获得50元优惠券, 同时如果他购买手机, 你即可获得50元奖金.<br>
			<h2>点击右上角->发送给朋友</h2>
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-xs-5">
			<img class="img-rounded" alt="fifa"
				src="http://www.sonystyle.com.cn/products/xperia/images/xperia_t2_xm50h.png">
		</div>
		<div class="col-xs-7">
			<div class="row">
				<div class="col-xs-12">商品描述, 点击购买</div>
			</div>
			<div class="row">
				<div class="col-xs-6">
					<button type="button" class="btn btn-success">PC 购买</button>
				</div>
				<div class="col-xs-6">
					<button type="button" class="btn btn-warning">手机购买</button>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<button type="button" class="btn btn-primary">我的折扣券</button>
				</div>
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