<%@ page contentType="text/html; charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, maximum-scale=1.0 minimum-scale=1.0">
<link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
<link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap-theme.min.css">
<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
<title>SharePage</title>
</head>
<body>


<%
String user1=(String)session.getAttribute("user1");
String user2=(String)session.getAttribute("user2");
out.print("user1 = "+user1);
out.print("user2 = "+user2);
%>
	<hr>
	<div class="row">
		<div class="col-xs-12">
			<h5>索尼Xpria(微信产生)</h5>
			<br>
			<img class="img-rounded" style="width:300px; height:300px;" alt="fifa"
				src="http://www.yooyoo360.com/photo/2009-1-1/20090112200838440.jpg">
			<h3>第二步. 完成关注</h3>
			<br> <img class="img-rounded" alt="fifa"
				src="http://www.sonystyle.com.cn/products/xperia/images/xperia_m51w/pro_img/z1_m51w_y1_b.jpg"><br>
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



</body>
</html>