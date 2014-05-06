<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@ page contentType="text/html; charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, maximum-scale=1.0 minimum-scale=1.0">
<link rel="stylesheet"
	href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap-theme.min.css">
<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<script
	src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
<title>支持我,得大奖!</title>
</head>
<body>

	<%
		String fromid = (String) session.getAttribute("fromid");
		String toid = (String) session.getAttribute("toid");		
		String fromnickname = (String) session.getAttribute("fromnickname");
		String tonickname = (String) session.getAttribute("tonickname");
		out.println(fromid);
		out.println(toid);
		out.println(fromnickname);
		out.println(tonickname);
	%>
	<hr>
	<div class="row">
		<div class="col-xs-12">
			Hi, 亲, 我(<%=fromnickname%>)对索尼FIFA手机志在必得, 请你拉我一票, 同时你也可以获得打折惠, 仅需完成以下两步:<br>
			<h3>1. 点击支持</h3>
			<br>
			<h3>2. 完成关注</h3>
			<br> <img class="img-rounded" alt="fifa"
				src="http://www.sonystyle.com.cn/products/xperia/images/xperia_m51w/pro_img/z1_m51w_y1_b.jpg"><br>
			<form action="<%=Constant.HOST%>/sharepage">
				<table>
					<tr>
						<td><%=fromnickname%></td>
						<td><input type=hidden name="user1" value="<%=fromid%>"></td>
						<td>
							<button type="submit" class="btn btn-success btn-lg">点我支持!!</button>
						</td>
						<td><%=tonickname%></td>
						<td><input type="hidden" name="user2" value="<%=toid%>"></td>
					</tr>
				</table>

			</form>
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