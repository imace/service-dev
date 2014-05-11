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
		String fromid = (String) request.getAttribute("fromid");
		String toid = (String) request.getAttribute("toid");
		String fromnickname = (String) request.getAttribute("fromnickname");
		String tonickname = (String) request.getAttribute("tonickname");
		String oauthtoidlink = (String) request.getAttribute("oauthtoidlink");
		String fromimg=(String) request.getAttribute("fromimg");
		String toimg=(String) request.getAttribute("toimg");
	%>
<div class="container" style="background:url(/img/stamp.png) right bottom  no-repeat; background-size:55%;">
	<div style="margin:10px;">
	<div class="row" style="font-family: Droid Sans Fallback;">
		<div class="col-xs-12">
			Hi, 亲, 我(<%=fromnickname%>)对索尼FIFA手机志在必得, 请你拉我一票, 同时你也可以获得打折惠, 请完成简单2步:<br>
			<h4 style="color:#cea14b">1. 点击支持  2. 完成关注  即可获得下面奖品</h4>
			<img alt="fifa" style="max-width:100%;" src="/img/banner_recevier.png" >
			<h4 style="color:#22bff2">支持您的好友</h4>
			<div id="personalInfo">
			<h4>为了支持您的好友, 需要首先点击下面按钮获取您的个人信息。</h4>
				<hr>
				<a href="<%=oauthtoidlink%>" style="display: block; background-color:#7adb81;border-color:#7adb81" class="btn btn-primary btn-lg active" role="button" id="clickoauth">获取个人信息</a>
			</div>
			<div id="supportFriend">
			<form action="<%=Constant.HOST%>/sharepage">
				<hr>
				<div class="row">
				<div class="col-xs-1">
				</div>
				<div class="col-xs-3">
				<img alt="fifa" style="max-width:100%;" src="<%=fromimg%>" ><br>
						<%=fromnickname%>
						<input type="hidden" name="user1" value="<%=fromid%>">
				</div>
				<div class="col-xs-4">
				<button type="submit" class="btn btn-success btn-lg" style="max-width:100%;">点击支持</button><br>
							<img alt="fifa" style="max-width:100%;" src="/img/arrow.png" >
				</div>
				
				<div class="col-xs-3" id="tonickname">
				<img alt="fifa" style="max-width:100%;" src="<%=toimg%>" ><br>
						<%=tonickname%>
						<input type="hidden" name="user2" id="user2"value="<%=toid%>">
				</div>
				<div class="col-xs-1">
				</div>
				</div>
			</form>
			</div>
		</div>
	</div>
	<hr>
</div>
</div>
	<script type="text/javascript">
		(function() {
			document.addEventListener('WeixinJSBridgeReady',
					function onBridgeReady() {
						WeixinJSBridge.call('hideToolbar');
					});
		})();

		jQuery(function() {
			var tonickname = $('#tonickname');
			var personalInfo = $("#personalInfo");
			var supportFriend = $("#supportFriend");
			//alert(tonickname.text());
			if (tonickname.text().indexOf("我")>=0) {
				personalInfo.show();
				supportFriend.hide();
			} else {
				personalInfo.hide();
				supportFriend.show();
				
				//only for test
				//personalInfo.show();
				//supportFriend.hide();
			}
		});
	</script>
</body>
</html>