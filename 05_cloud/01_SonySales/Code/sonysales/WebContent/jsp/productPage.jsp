<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@page import="com.sonymobile.sonysales.util.Base64Coder"%>
<%@ page contentType="text/html; charset=gb2312"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html charset=gb2312">
<meta name="viewport" content="width=device-width, maximum-scale=1.0 minimum-scale=1.0">
<script src="../js/jquery-2.1.1.min.js"></script>
<title>活动详情</title>
</head>
<body style="margin:0;background-color:#f8f7f5">


            <div>
                <div id="intro" style="margin-left:10px;word-wrap:break-word;word-break:break-all;">
                    <div style="margin-top:10px;color:rgb(0, 173, 255);font-size:larger">
                                    购买链接
                    </div>
                    <div style="font-size:larger;line-height:150%;">
                        请在pc端浏览器输入下面链接<br/>
                        进行后续购买。
                    </div>
                    <div id="product_div">
								            <img src="../img/product.png" id="product_img" style="margin-left:10px"/>
								        </div>
                    <div style="font-size:300%;font-weight:bold;padding-top:3px">
                                                http://item.jd.com/1107153627
                    </div>
                </div>
            </div>



	<script type="text/javascript">

	$(document).ready(function(){
        var windowHeight = window.innerHeight;
        $("#touchBox").css({position: "absolute",'bottom':0,'z-index':2}); 
        document.getElementById("top_img").width=document.body.clientWidth;
        $("#product_img").css("width", document.body.clientWidth/3); 
        $("#intro").css("width", document.body.clientWidth-20); 
       
        });
    
</script>
</body>
</html>