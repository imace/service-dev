<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@ page contentType="text/html; charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html charset=gb2312">
<meta name="viewport"
	content="width=device-width, maximum-scale=1.0 minimum-scale=1.0">
<script src="../../js/jquery-2.1.1.min.js"></script>
<title>索尼FIFA2014世界杯狂热季</title>
<style type="text/css">
.btn {
	border: none;
	width: 120px;
	height: 120px;
	border-radius: 60px;
	FONT-SIZE: larger;
	position: fixed;
	bottom: 0;
	background-color: white;
}

.deco {
	TEXT-DECORATION: none;
	outline: none
}
</style>
</head>
<body style="margin: 0; background-color: #f8f7f5">
	<%
		String openId = request.getParameter("id");
	%>
	<div>
		<div id="title" style="margin-left: 10px; font-size: larger">
			<h2>索尼FIFA2014世界杯狂热季</h2>
		</div>
		<div id="banner_img_div">
			<img src="../../img/banner_popularity.png" id="banner_img"
				style="margin-left: 10px" />
		</div>
		<br>
		<div id="intro"
			style="margin-left: 10px; word-wrap: break-word; word-break: break-all;">
			<div
				style="margin-top: 10px; color: rgb(34, 191, 242); font-size: larger; font-family: Droid Sans Fallback;">
				索尼 FIFA 2014 活动介绍</div>
			<div
				style="font-size: larger; color: rgb(62, 62, 62); line-height: 150%; font-family: Droid Sans Fallback;">
				FIFA , 2014 , 赛事重来 ,<br /> 谁将会成为最后赢家？</br> 想不想也参与这个激动人心的活动？</br> </br>
			</div>
			<div
				style="font-size: larger; color: rgb(206, 161, 75); line-height: 150%; font-family: Droid Sans Fallback;">
				参加这个活动，不仅有机会获得超值索尼FIFA手机，还可以获得关注奖金和拉手获现金。 </br> </br>
			</div>
			<div
				style="font-size: larger; color: rgb(62, 62, 62); line-height: 150%; font-family: Droid Sans Fallback;">
				走过，路过，不要错过！</div>
		</div>
	</div>

	<br>

	<br>

	<br>

	<a class="deco" href="<%=Constant.HOST%>/getNameList"><input
		type="button" id="button1" value="查看&#13;&#10;大奖榜单" class="btn" /></a>
	<br>
	<a class="deco" href="<%=Constant.HOST%>/activitypage?id=<%=openId%>"><input
		type="button" id="button2" value="拉人气&#13;&#10;得大奖" class="btn" /></a>
	<br>
	<a class="deco" href="<%=Constant.HOST%>/lashouactivity?id=<%=openId%>"><input
		type="button" id="button3" value="拉友买&#13;&#10;获奖金" class="btn" /></a>
	<br>
	<a class="deco" href="<%=Constant.HOST%>/myInfo?id=<%=openId%>"><input
		type="button" id="button4" value="我的战况" class="btn" /></a>
	<br>
	<script type="text/javascript">
		$(document).ready(
				function() {
					$("#banner_img").css("width",
							document.body.clientWidth - 20);
					$("#intro").css("width", document.body.clientWidth - 20);
					$("#button1").css("width",
							(document.body.clientWidth - 50) / 4);
					$("#button1").css("height",
							(document.body.clientWidth - 50) / 4);
					$("#button1").css("left", 10);

					$("#button2").css("width",
							(document.body.clientWidth - 50) / 4);
					$("#button2").css("height",
							(document.body.clientWidth - 50) / 4);
					$("#button2").css("left",
							(document.body.clientWidth) / 4 + 10);
					$("#button3").css("width",
							(document.body.clientWidth - 50) / 4);
					$("#button3").css("height",
							(document.body.clientWidth - 50) / 4);
					$("#button3").css("left",
							(document.body.clientWidth) / 2 + 10);
					$("#button4").css("width",
							(document.body.clientWidth - 50) / 4);
					$("#button4").css("height",
							(document.body.clientWidth - 50) / 4);
					$("#button4").css("left",
							(document.body.clientWidth * 3) / 4 + 10);
				});
	</script>
</body>
</html>