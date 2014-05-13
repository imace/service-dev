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
                <div id="intro" style="text-align:center;word-wrap:break-word;word-break:break-all;">
                    <div style="font-size:larger;">
                    <p>
                        请在pc端浏览器输入下面链接进行后续购买。
                        </p>
                    </div>
                    <div id="product_div" style="text-align:center">
                    <p>
								            <img src="../img/PC_product.png" id="PC_product_img" style="margin-left:10px"/>
								            </p>
								        </div>
                    <div style="text-align:center;font-size:300%;font-weight:bold;padding-top:3px;">
                                                http://item.jd.com/1107153627
                    </div> 
                </div>
            </div>



	<script type="text/javascript">

	$(document).ready(function(){
        $("#PC_product_img").css("width", document.body.clientWidth/3); 
        $("#intro").css("width", document.body.clientWidth-20); 
       
        });
    
</script>
</body>
</html>