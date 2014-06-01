<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@page import="com.sonymobile.sonysales.util.Base64Coder"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<script src="http://lib.sinaapp.com/js/jquery/1.10.2/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css"
  media="screen and (max-device-width:480px)"
  href="<%=request.getContextPath()%>/css/320.css">
  
<link rel="stylesheet" type="text/css"
  media="screen and (min-device-width:481px) and (max-device-width:540px) and (-webkit-device-pixel-ratio: 1.5)"
  href="<%=request.getContextPath()%>/css/360.css">
  
  <!-- iphone4 & iphone4s -->
<link rel="stylesheet" type="text/css"
  media="screen and (min-device-width:541px) and (max-device-width:640px) and (max-device-height:960px) and (-webkit-device-pixel-ratio: 2)"
  href="<%=request.getContextPath()%>/css/320.css">
  
  <!-- iphone5 -->
  <link rel="stylesheet" type="text/css"
  media="screen and (min-device-width:541px) and (max-device-width:640px) and (min-device-height:961px) and (-webkit-device-pixel-ratio: 2)"
  href="<%=request.getContextPath()%>/css/480.css">
  
<link rel="stylesheet" type="text/css"
  media="screen and (min-device-width:641px) and (max-device-width:720px) and (-webkit-device-pixel-ratio: 1.5)"
  href="<%=request.getContextPath()%>/css/480.css">
  
<link rel="stylesheet" type="text/css"
  media="screen and (min-device-width:721px) and (max-device-width:1080px) and (-webkit-device-pixel-ratio: 3)"
  href="<%=request.getContextPath()%>/css/360.css">
<title>活动详情</title>
</head>
<body class="base_font_size" style="margin:0;background-color:#f8f7f5">


            <div>
                <div id="intro" style="text-align:center;word-wrap:break-word;word-break:break-all;">
                    <div style="font-size:larger;">
                    <p>
                        请在pc端浏览器输入下面链接进行后续购买。
                        </p>
                    </div>
                    <div id="product_div" style="text-align:center">
                    <p>
								            <img src="<%=request.getContextPath()%>/img/PC_product.png" id="PC_product_img" style="margin-left:10px"/>
								            </p>
								        </div>
                    <div style="text-align:center;font-size:260%;font-weight:bold;padding-top:3px;">
                                                http://item.jd.com/1107153627
                    </div> 
                </div>
            </div>



	<script type="text/javascript">

	$(document).ready(function(){
        $("#PC_product_img").css("width", document.body.clientWidth/2); 
        $("#intro").css("width", document.body.clientWidth-20); 
       
        });
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