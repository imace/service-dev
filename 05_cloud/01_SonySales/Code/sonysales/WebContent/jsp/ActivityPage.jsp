<%@ page contentType="text/html; charset=gb2312"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html charset=gb2312">
<meta name="viewport" content="width=device-width, maximum-scale=1.0 minimum-scale=1.0">
<title>�����</title>

<link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
<link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap-theme.min.css">
<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src= "/sonyfifa/js/WeChatShare.js" ></script>

</head>
<body>

<%String openid=(String)session.getAttribute("openid");%>
<% String currenturl = request.getScheme()+"://"+ request.getServerName()+request.getRequestURI()+"?"+request.getQueryString(); %>
<%

String state="SONY_FIFA_POPULARITY";

if(openid==null)
{
	openid="o_2fijpLPf7JsvVZPsiZ1mA5Pk1c";
}
String url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxe2fed806213159c7&redirect_uri=http://sonyfifa.sinaapp.com/wechat_authorize?id="+openid+"&response_type=code&scope=snsapi_base&state="+state+"#wechat_redirect";
String msgimg="http://www.sonystyle.com.cn/images/weibo_share_1.jpg";
String tlimg="http://www.sonystyle.com.cn/images/weibo_share_2.jpg";
out.print("<script type=\"text/javascript\">var dataForWeixin={appId:\"\","+
		"MsgImg:\""+msgimg+"\","+
		"TLImg:\""+tlimg+"\","+
		//"url:\""+url+"?id="+openid+"\","+
		"url:\""+url+"\","+
		"title:\"SONY FIFA �������д�\","+
		"desc:\"Դ��ַ�� "+currenturl+"\","+
		"fakeid:\"\",callback:function(){/*alert('��л����, ���ྪϲ�������ע!-SonyXpria');*/}};</script>");
%>
<hr>
<div class="row">
  <div class="col-xs-4"><img class="img-rounded" alt="fifa" src="http://www.sonystyle.com.cn/products/xperia/images/xperia_m51w/pro_img/z1_m51w_y1_b.jpg"></div>
  <div class="col-xs-8">��ֵ, <br>
  <h2>����FIFA�ֻ���������</h2></div>
</div>

<div class="row">
  <div class="col-xs-12">FIFA�ֻ���, ֻҪ����������ǰ8, ���ɻ������FIFA�ٷ����ƾ����ֻ�һ��. <br>
  <h2>������Ͻ�->���͸�����</h2></div>
</div>
<hr>
<div class="row">
  <div class="col-xs-5"><img class="img-rounded" alt="fifa" src="http://www.sonystyle.com.cn/products/xperia/images/xperia_t2_xm50h.png"></div>
  <div class="col-xs-7">
    <div class="row">
      <div class="col-xs-12">
      ��Ʒ����, �������
      </div>
    </div>
    <div class="row">
      <div class="col-xs-6">
      <button type="button" class="btn btn-success">PC ����</button>
      </div>
            <div class="col-xs-6">
      <button type="button" class="btn btn-warning">�ֻ�����</button>
      </div>
    </div>
        <div class="row">
      <div class="col-xs-12">
      <button type="button" class="btn btn-primary">�ҵ��ۿ�ȯ</button>
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
})();
</script>


</body>
</html>