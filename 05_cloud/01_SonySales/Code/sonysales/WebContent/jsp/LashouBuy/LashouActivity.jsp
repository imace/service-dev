<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@page import="com.sonymobile.sonysales.util.Coder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.Hashtable"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<script src="http://lib.sinaapp.com/js/jquery/1.10.2/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<title>拉友买!他得实惠,我得奖金!</title>
</head>
<body class="base_font_size" style="margin:0;background-color:#f8f7f5">
	<%
		String openid =(String)request.getAttribute("openid");
		String nickname =(String)request.getAttribute("nickname");
		nickname=(nickname==null?"":"("+nickname+")");
		String message="Hi, 亲, 我"+nickname+"正在参加索尼世界杯惊喜购机活动, 请你支持我一票!你也可以获得打折优惠券!";
		String imgurl=request.getScheme() + "://" + request.getServerName() +"/img/menu_entry3.jpg";
		String relationUrl = request.getScheme() + "://" + request.getServerName() + "/lashourelation";
		String redirectHost = Constant.IS_USE_SELF_OAUTH ? Constant.OAUTH_REDIRECT_HOST
				: Constant.SECOND_OAUTH_REDIRECT_HOST;
		Hashtable<String, String> parameters = new Hashtable<String, String>();
		parameters.put("fid", openid);
		parameters.put("i", Constant.OAUTH_IDENTIFIER);
		String codedState = Coder.generateOAuthStateFromUrl(relationUrl, parameters);
		String url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ Constant.APP_ID
				+ "&redirect_uri="+ redirectHost
				+ "&response_type=code&scope="+ Constant.WECHAT_OAUTH_SCOPES.BASE.getValue()
				+ "&state="+ codedState + "#wechat_redirect";
		out.print("<script type=\"text/javascript\">var dataForWeixin={appId:\"\","
				+ "MsgImg:\""+ imgurl
				+ "\", TLImg:\""+ imgurl
				+ "\", url:\""+ url
				+ "\", title:\"拉友买, 他得实惠, 我得奖金!\","
				+ "desc:\""+ message
				+ "\", fakeid:\"\",callback:function(){/*alert('感谢分享, 更多惊喜请继续关注!-SonyXpria');*/}};</script>");
	%>

<div>
<div id="title" class="text_header common_style" style="margin:8px;max-width:96%;margin-left:2%">拉友买!他得实惠,我得奖金!</div>
   <div id="banner_img_div" style="text-align: center">
             <img src="<%=request.getContextPath()%>/img/banner_popularity.jpg" id="banner_img" style="width:96%;max-width:96%;"/>
         </div>
         <p class="text_highlight common_style" style="padding-top:10px;width:96%;max-width:96%;margin-left:2%">
                                     点击右上角<img src="<%=request.getContextPath()%>/img/overflow.png" class="point_pic_width" style="margin-left:2px;margin-right:2px"/>或<img src="<%=request.getContextPath()%>/img/share.png" class="point_pic_width" style="margin-left:2px;margin-right:2px"/>发送给朋友
         </p>
         <div id="intro" >
             <div class="text_subHeader" style="max-width:96%;width:96%;margin-left:2%;line-height:150%;">
                            大力神杯拉友买活动规则
            </div>
            <div class="text_mainBody" style="max-width:96%;width:96%;margin-left:2%;line-height:150%;">
                1.发送消息给朋友<br/>
                2.你的朋友即可获得50元优惠券<br/>
                3.如果您的朋友购买此定制手机, 您即可获得50元奖金 
            </div>
            
        </div>
</div>
<div style="position:absolute;width:100%;max-width:100%;height:35%;"></div>
        <div id="touchBox" style="width:100%;max-width:100%;">
               <div style="position:relative;">
               <img src="<%=request.getContextPath()%>/img/product_top_all_1.png" style="width:100%;max-width:100%;margin-top:0" id="top_img"/><div id="click_div" onclick="clickDiv()" style="position:absolute;width:20%;height:80%;right:7%;top:15%;"></div>
               </div>
             <div  style="background-color:white;">
             <div id="buy" style="width:96%;max-width:96%;margin-left:2%;margin-top:-4px;height:5.1em;text-align:center;border:1px solid #d9d9d9;background-color:#e82827;" onclick="draw()">
                <div style="font-size:1.8em;color:white;padding-top:0.9em" id="buyNow" >使用优惠券立即购买</div>
             </div>
            </div>
            <div id="content" style="display:none;background-color:white;height:6.2em">
                <div id="bttons" style="max-width:96%;width:96%;margin-left:2%;padding-top:1em;">
                    <div id="pcbuy" style="max-width:48%;width:48%;height:5em;text-align:center;border:1px solid #bfbfbf;float:left" onclick="window.location.href='<%=request.getScheme() + "://" + request.getServerName()%>/jsp/productPage.jsp'">
                        <div><img src="<%=request.getContextPath()%>/img/http_icn.png" style="height:3em;float:left;margin-left:10px;padding-top:1.2em"/></div>
                        <div style="font-size:1.8em;color:rgb(116, 105, 105);padding-top:0.9em;padding-right:3em">PC购买</div>
                    </div>
                    <div id="discount" style="max-width:48%;width:48%;height:5em;text-align:center;border:1px solid #bfbfbf;float:right" onclick="window.location.href='http://passport.jd.com/new/login.aspx?ReturnUrl=http%3A%2F%2Fquan.jd.com%2Fuser_quan.action'">
                        <div><img src="<%=request.getContextPath()%>/img/discount_icn.png" style="height:3em;float:left;margin-left:10px;padding-top:1em"/></div>
                        <div style="font-size:1.8em;color:rgb(116, 105, 105);padding-top:0.9em;padding-right:3em">优惠券</div>
                    </div>
                </div>
            </div>
    <div style="background-color:white;height:10px"></div>
</div>
        

            



    <script type="text/javascript">
  var open = false;
    $(document).ready(function(){
           $("#touchBox").css({position: "fixed",'bottom':0,'z-index':2}); 
        //var windowHeight = window.innerHeight;
        //var windowWidth = $("#top_img").width();
        //document.getElementById("top_img").width=windowWidth;
        //document.getElementById("content").width=windowWidth;
        //$("#banner_img").css("width", windowWidth-20); 
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
                $("#touchBox").css({position: "fixed",'bottom':0,'z-index':2});
                $("#buyNow").text("使用优惠券立即购买");
                open = false;
                }
            if((startY-endY)>10) {//上滑
                  $("#top_img").attr("src","<%=request.getContextPath()%>/img/product_top_all_2.png"); 
                //$("#desc").css("height", 100); 
                //$("#desc").css("overflow-y", "auto"); 
                document.getElementById("content").style.display="";
                $("#touchBox").css({position: "fixed",'bottom':0,'z-index':2}); 
                $("#buyNow").text("手机购买");
                open = true;
                }
        }
     
        });
    
    function draw() {
        if(!open) {
       document.getElementById("content").style.display="";
       $("#touchBox").css({position: "fixed",'bottom':0,'z-index':2}); 
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