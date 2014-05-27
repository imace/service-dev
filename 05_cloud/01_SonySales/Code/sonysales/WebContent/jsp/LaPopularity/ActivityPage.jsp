<%@page import="com.sonymobile.sonysales.servlet.LaPopularityServlet.Activity"%>
<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@page import="com.sonymobile.sonysales.util.Base64Coder"%>
<%@page import="org.apache.log4j.Logger"%>
<%@ page contentType="text/html; charset=UTF-8"%>

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
  
<link rel="stylesheet" type="text/css"
  media="screen and (min-device-width:541px) and (max-device-width:640px) and (-webkit-device-pixel-ratio: 2)"
  href="<%=request.getContextPath()%>/css/site_320.css">
  
<link rel="stylesheet" type="text/css"
  media="screen and (min-device-width:641px) and (max-device-width:720px) and (-webkit-device-pixel-ratio: 1.5)"
  href="<%=request.getContextPath()%>/css/site_480.css">
  
<link rel="stylesheet" type="text/css"
  media="screen and (min-device-width:721px) and (max-device-width:1080px) and (-webkit-device-pixel-ratio: 3)"
  href="<%=request.getContextPath()%>/css/site_360.css">
<title>拉人气，得大奖!</title>
</head>
<body style="margin:0;background-color:#f8f7f5">

	<%
	Logger logger = Logger.getLogger(Activity.class.getName());
	try{
		String openid =(String)request.getAttribute("openid");
		String nickname =(String)request.getAttribute("nickname");
		nickname=(nickname==null?"":"("+nickname+")");
		String message="Hi, 亲, 我"+nickname+"对索尼FIFA志在必得, 请你拉我一票!";
		String imgurl=request.getScheme() + "://" + request.getServerName() + "/img/entry2.png";	
		String relationUrl = Base64Coder.convertStrToBase64(request.getScheme() + "://" + request.getServerName() + "/relationpage");
		String url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ Constant.APP_ID
				+ "&redirect_uri="+ Constant.OAUTH_REDIRECT_HOST
				+ "/wechat_authorize?fromid="+ openid
				+ "&response_type=code&scope="+ Constant.WECHAT_OAUTH_SCOPES.BASE.getValue()
				+ "&state="+ relationUrl + "#wechat_redirect";
		out.print("<script type=\"text/javascript\">var dataForWeixin={appId:\"\","
				+ "MsgImg:\""+ imgurl
				+ "\", TLImg:\""+ imgurl
				+ "\", url:\""+ url
				+ "\", title:\"拉人气, 得大奖\", desc:\""+ message
				+ "\", fakeid:\"\",callback:function(){/*alert('感谢分享, 更多惊喜请继续关注!-SonyXpria');*/}};</script>");
	}
    catch (Exception e) {
		logger.error("ActivityPage.jsp->front-end-page in exception : " + e.getMessage());
		response.sendRedirect(request.getContextPath()+"/jsp/errorhandler.jsp?errnum=0111&errmsg="+e.getMessage());
	}
	%>

<div>
                <div id="title" class="text_header common_style" style="margin:8px;max-width:96%;margin-left:2%">拉人气,得大奖！</div>
                <div id="banner_img_div" style="text-align: center">
                    <img src="<%=request.getContextPath()%>/img/banner_popularity.jpg" id="banner_img" style="width:96%;max-width:96%;"/>
                </div>
                 <p class="text_highlight common_style" style="padding-top:10px;width:96%;max-width:96%;margin-left:2%">
                                                         点击右上角<img src="<%=request.getContextPath()%>/img/overflow.png" class="point_pic_width" style="margin-left:2px;margin-right:2px"/>或<img src="<%=request.getContextPath()%>/img/share.png" class="point_pic_width" style="margin-left:2px;margin-right:2px"/>发送给朋友
                             </p>
                <div id="intro" >
                    <div class="text_subHeader" style="max-width:96%;width:96%;margin-left:2%;line-height:150%;">
                                    大力神杯拉人气活动规则
                    </div>
                    <div class="text_mainBody" style="max-width:96%;width:96%;margin-left:2%;line-height:150%;">
                    1.发送此信息给朋友<br>
                    2.人气榜前8名,即可获得精美手机一部(官方定制)<br/>
                    3.每拉一个朋友激活10000人气积分呦!
                    </div>
                </div>
        </div>
<div class="scroll_div_height" style="position:absolute;width:100%;max-width:100%;"></div>
        <div id="touchBox" style="width:100%;max-width:100%;">
        <div  style="position:relative;" >
               <img src="<%=request.getContextPath()%>/img/product_top_all_1.png" style="width:100%;max-width:100%;margin-top:0" id="top_img"/><div id="click_div" onclick="clickDiv()" style="position:absolute;width:20%;height:80%;right:7%;top:15%;"></div>
               </div>
            <div  style="background-color:white;">
             <div id="buy" style="width:96%;max-width:96%;margin-left:2%;margin-top:-4px;height:51px;text-align:center;border:1px solid #d9d9d9;background-color:#e82827;" onclick="draw()">
                <div style="font-size:larger;color:white;padding-top:15px" id="buyNow" >使用优惠券立即购买</div>
             </div>
            </div>
            <div id="content" style="display:none;background-color:white;height:62px">
                <div id="bttons" style="max-width:96%;width:96%;margin-left:2%;padding-top:10px;">
                    <div id="pcbuy" style="max-width:48%;width:48%;height:50px;text-align:center;border:1px solid #bfbfbf;float:left" onclick="window.location.href='<%=Constant.HOST%>/jsp/productPage.jsp'">
                        <div><img src="<%=request.getContextPath()%>/img/http_icn.png" style="height:30px;float:left;margin-left:10px;padding-top:12px"/></div>
                        <div style="font-size:larger;color:rgb(116, 105, 105);padding-top:15px;padding-right:30px">PC购买</div>
                    </div>
                    <div id="discount" style="max-width:48%;width:48%;height:50px;text-align:center;border:1px solid #bfbfbf;float:right" onclick="window.location.href='http://passport.jd.com/new/login.aspx?ReturnUrl=http%3A%2F%2Fquan.jd.com%2Fuser_quan.action'">
                        <div><img src="<%=request.getContextPath()%>/img/discount_icn.png" style="height:30px;float:left;margin-left:10px;padding-top:10px"/></div>
                        <div style="font-size:larger;color:rgb(116, 105, 105);padding-top:15px;padding-right:30px">优惠券</div>
                    </div>
                </div>
            </div>
            <div style="background-color:white;height:10px"></div>
        </div>

    <script type="text/javascript">
    var open = false;
    $(document).ready(function(){
          $("#touchBox").css({position: "fixed",'bottom':0,'z-index':1}); 
        //var windowHeight = window.innerHeight;
        //var windowWidth = $("#top_img").width();
        //alert("windowWidth:"+windowWidth);
        //alert("document.body.clientWidth:"+document.body.clientWidth);
        //windowWidth = windowWidth+15;
        //document.getElementById("top_img").width=windowWidth;
        //document.getElementById("content").width=windowWidth;
        //$("#banner_img").css("width", windowWidth-20); 
        //$("#title").css("width", windowWidth-20); 
        //$("#intro").css("width", windowWidth-20); 
        //$("#buy").css("width", windowWidth-22); 
        //$("#bttons").css("width", windowWidth-22); 
        //$("#desc").css("width", document.body.clientWidth-20); 
        //$("#pcbuy").css("width", (windowWidth-20)/2-7); 
        //$("#discount").css("width", (windowWidth-20)/2-7); 
        
        var startX,startY,endX,endY
     var scrollTopVal=0; //左右滑动请自行修改
        document.getElementById("touchBox").addEventListener("touchstart", touchStart, false);
        document.getElementById("touchBox").addEventListener("touchmove", touchMove, false);
        document.getElementById("touchBox").addEventListener("touchend", touchEnd, false);
        document.getElementById("touchBox").addEventListener("touchcancel", touchEnd, false);

        function touchStart(event){
           
        var touch = event.touches[0];

        startY = touch.pageY;
        endY = startY;
        }
        
        function touchMove(event){

        var touch = event.touches[0];

        endY = touch.pageY;

        }


        function touchEnd(event){
            if((endY-startY)>10) {//下滑
                   $("#top_img").attr("src","<%=request.getContextPath()%>/img/product_top_all_1.png"); 
                document.getElementById("content").style.display="none";
                $("#touchBox").css({position: "fixed",'bottom':0,'z-index':1});
                $("#buyNow").text("使用优惠券立即购买");
                open = false;

                }
            if((startY-endY)>10) {//上滑
                  $("#top_img").attr("src","<%=request.getContextPath()%>/img/product_top_all_2.png"); 
                //$("#desc").css("height", 100); 
                //$("#desc").css("overflow-y", "auto"); 
                document.getElementById("content").style.display="";
                $("#touchBox").css({position: "fixed",'bottom':0,'z-index':1}); 
                $("#buyNow").text("手机购买");
                open = true;
                }
        }
       
        });
    
    function draw() {
        if(!open) {
       document.getElementById("content").style.display="";
       $("#touchBox").css({position: "fixed",'bottom':0,'z-index':1}); 
       $("#top_img").attr("src","<%=request.getContextPath()%>/img/product_top_all_2.png"); 
       $("#buyNow").text("手机购买");
       open = true;
       } else {
           window.location.href='http://m.jd.com/product/813097.html';
                }
            }
    function clickDiv() {
        if(!open) {
       document.getElementById("content").style.display="";
       $("#touchBox").css({position: "fixed",'bottom':0,'z-index':1}); 
       $("#top_img").attr("src","<%=request.getContextPath()%>/img/product_top_all_2.png"); 
       $("#buyNow").text("手机购买");
       open = true;
       } else {
    	    document.getElementById("content").style.display="none";
        $("#touchBox").css({position: "fixed",'bottom':0,'z-index':1}); 
        $("#top_img").attr("src","<%=request.getContextPath()%>/img/product_top_all_1.png"); 
        $("#buyNow").text("使用优惠券立即购买");
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