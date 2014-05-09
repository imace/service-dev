<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@ page contentType="text/html; charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, maximum-scale=1.0 minimum-scale=1.0">
<title>索尼FIFA活动介绍</title>
</head>
<body>
<%
String openId = request.getParameter("id");
%>
<div>
<img alt="" src="http://www.fevaworks.net/wp-content/uploads/2013/11/kv21.jpg">
<h1>索尼FIFA活动介绍</h1>
FIFA 2014, 赛事重来，<br>
谁将会成为最后赢家<br>
想不想也参与这个激动人心的活动？<br>
<br>
参加这个活动，不仅有机会获得超值的索尼FIFA手机，还可以获得关注积分奖励和拉手返现金。<br>
<br>
走过，路过，千万不雅错过！<br>
错过这次机会你就要等到2018年啦啦啦啦！！！！<br>
<br>
<a href="<%=Constant.HOST%>/getNameList">查看大奖榜单</a><br>
<a href="<%=Constant.HOST%>/activitypage?id=<%=openId%>">拉人气,抢手机!</a><br>
<a href="<%=Constant.HOST%>/lashouactivity?id=<%=openId%>">拉友买，获奖金!</a><br>
<a href="<%=Constant.HOST%>/jsp/Description.jsp?id=<%=openId%>">FIFA竞猜，赚人气</a><br>
</div>
</body>
</html>