<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@page import="com.sonymobile.sonysales.util.Base64Coder"%>
<%@ page contentType="text/html; charset=gb2312"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html charset=gb2312">
<meta name="viewport" content="width=device-width, maximum-scale=1.0 minimum-scale=1.0">
<script src="../../js/jquery-2.1.1.min.js"></script>
<title>活动详情</title>
</head>
<body style="margin:0;background-color:#f8f7f5">

	<%
		String openid =(String)request.getAttribute("openid");
		String nickname =(String)request.getAttribute("nickname");
		nickname=(nickname==null?"":"("+nickname+")");
		String message="Hi, 亲, 我"+nickname+"对索尼FIFA志在必得, 请你拉我一票!";
		String imgurl=Constant.HOST+"/img/entry2.png";	
		String relationUrl = Base64Coder.convertStrToBase64(Constant.HOST + "/relationpage");
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
				+ "\", title:\"拉人气, 得大奖\", desc:\""+ message
				+ "\", fakeid:\"\",callback:function(){/*alert('感谢分享, 更多惊喜请继续关注!-SonyXpria');*/}};</script>");
	%>


            <div>
                <div id="title" style="margin-left:10px;font-size:larger">
                  <h3>超值，索尼FIFA手机等你来拿！</h3>
                </div>
                <div id="banner_img_div">
                    <img src="../../img/banner_popularity.png" id="banner_img" style="margin-left:10px"/>
                </div>
                <div id="intro" style="margin-left:10px;word-wrap:break-word;word-break:break-all;">
                    <div style="margin-top:10px;color:rgb(0, 173, 255);font-size:larger">
                                    大力神杯拉人气活动规则
                    </div>
                    <div style="font-size:larger;line-height:150%;">
                        只要你名列人气排行榜前8<br/>
                        官方定制精美手机一部。</br>
                        每拉一个朋友激活10000人气积分呦！
                    </div>
                    <div style="font-size:140%;color:rgb(148, 140, 140);padding-top:3px">
                                                点击右上角-->发送给朋友
                    </div>
                </div>
        </div>

        <div id="touchBox">
               <img src="../../img/product_top_all_1.png" style="margin-top:0" id="top_img" onclick="draw()"/>
            <div  style="background-color:white;padding-bottom:10px;">
             <div id="buy" style="margin-left:10px;margin-top:-4px;height:51px;text-align:center;border:1px solid #d9d9d9;background-color:#e82827;" onclick="window.location.href='http://www.jd.com'">
                <div style="font-size:larger;color:white;padding-top:15px">立即购买</div>
             </div>
         </div>
            <div id="content" style="display:none;background-color:white">
                <div id="bttons" style="padding-top:1px;margin-left:10px">
                    <div id="pcbuy" style="height:50px;text-align:center;border:1px solid #bfbfbf;float:left" onclick="window.location.href='<%=Constant.HOST%>/jsp/productPage.jsp'">
                        <div><img src="../../img/http_icn.png" style="height:30px;float:left;margin-left:10px;padding-top:12px"/></div>
                        <div style="font-size:larger;color:rgb(116, 105, 105);padding-top:15px;padding-right:30px">PC购买</div>
                    </div>
                    <div id="discount" style="height:50px;text-align:center;border:1px solid #bfbfbf;float:right" onclick="window.location.href='http://passport.jd.com/new/login.aspx?ReturnUrl=http%3A%2F%2Fquan.jd.com%2Fuser_quan.action'">
                        <div><img src="../../img/discount_icn.png" style="height:30px;float:left;margin-left:10px;padding-top:10px"/></div>
                        <div style="font-size:larger;color:rgb(116, 105, 105);padding-top:15px;padding-right:30px">折扣券</div>
                    </div>
                </div>
                <div id="desc" style="margin-left:10px;margin-top:65px;padding-bottom:10px">
                    <div style="font-size:small;font-weight:700">商品描述：</div>
                    <div style="line-height:150%;margin-top:4px;word-wrap:break-word;word-break:break-all;color:rgb(117, 108, 108);font-size:small">
                                索尼SONY公司作为FIFA2014世界杯赞助商，为了凝结住精彩的赛季回忆，特别为世界球迷定制了极具收藏价值的高端智能手机，限量版哟-不要犹豫，记住这个夏天！
                    </div>             
                </div>
            </div>
        </div>

	<script type="text/javascript">

	$(document).ready(function(){
        var windowHeight = window.innerHeight;
        $("#touchBox").css({position: "absolute",'bottom':0,'z-index':2}); 
        document.getElementById("top_img").width=document.body.clientWidth;
        $("#banner_img").css("width", document.body.clientWidth-20); 
        $("#title").css("width", document.body.clientWidth-20); 
        $("#intro").css("width", document.body.clientWidth-20); 
        $("#buy").css("width", document.body.clientWidth-22); 
        $("#bttons").css("width", document.body.clientWidth-22); 
        $("#desc").css("width", document.body.clientWidth-20); 
        $("#pcbuy").css("width", (document.body.clientWidth-20)/2-7); 
        $("#discount").css("width", (document.body.clientWidth-20)/2-7); 
        
       /* var startX,startY,endX,endY
     var scrollTopVal=0; //左右滑动请自行修改
        document.getElementById("touchBox").addEventListener("touchstart", touchStart, false);
        document.getElementById("touchBox").addEventListener("touchmove", touchMove, false);
        document.getElementById("touchBox").addEventListener("touchend", touchEnd, false);

        function touchStart(event){
           
        var touch = event.touches[0];

        startY = touch.pageY;
        
        
        }
        
        function touchMove(event){

        var touch = event.touches[0];

        endY = touch.pageY;
        if((startY-endY)>20) {//上滑
            //$("#desc").css("height", 100); 
            //$("#desc").css("overflow-y", "auto"); 
            document.getElementById("content").style.display="";


            
            
            }
        if((endY-startY)>25) {//下滑
            document.getElementById("content").style.display="none";

            }
       
        

        }


        function touchEnd(event){
            if((endY-startY)>25) {//下滑
                   $("#top_img").attr("src","../../img/product_top_all_1.png"); 
                document.getElementById("content").style.display="none";
                $("#touchBox").css({position: "absolute",'bottom':0,'z-index':2});

                }
            if((startY-endY)>20) {//上滑
                  $("#top_img").attr("src","../../img/product_top_all_2.png"); 
                //$("#desc").css("height", 100); 
                //$("#desc").css("overflow-y", "auto"); 
                document.getElementById("content").style.display="";
                $("#touchBox").css({position: "absolute",'bottom':0,'z-index':2}); 
                }


        }
        */
        });
    
	var open = false;
    function draw() {
        if(!open) {
       document.getElementById("content").style.display="";
       $("#touchBox").css({position: "absolute",'bottom':0,'z-index':2}); 
       $("#top_img").attr("src","../../img/product_top_all_2.png"); 
       open = true;
       } else {
           document.getElementById("content").style.display="none";
         $("#touchBox").css({position: "absolute",'bottom':0,'z-index':2});
         $("#top_img").attr("src","../../img/product_top_all_1.png");
         open = false;
                }
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