<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@ page contentType="text/html; charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, maximum-scale=1.0 minimum-scale=1.0">
<title>����FIFA�����</title>
</head>
<body>
<%
String openId = request.getParameter("id");
%>
<div>
<img alt="" src="http://www.fevaworks.net/wp-content/uploads/2013/11/kv21.jpg">
<h1>����FIFA�����</h1>
FIFA 2014, ����������<br>
˭�����Ϊ���Ӯ��<br>
�벻��Ҳ��������������ĵĻ��<br>
<br>
�μ������������л����ó�ֵ������FIFA�ֻ��������Ի�ù�ע���ֽ��������ַ��ֽ�<br>
<br>
�߹���·����ǧ���Ŵ����<br>
�����λ������Ҫ�ȵ�2018������������������<br>
<br>
<a href="<%=Constant.HOST%>/getNameList">�鿴�󽱰�</a><br>
<a href="<%=Constant.HOST%>/activitypage?id=<%=openId%>">������,���ֻ�!</a><br>
<a href="<%=Constant.HOST%>/lashouactivity?id=<%=openId%>">�����򣬻񽱽�!</a><br>
<a href="<%=Constant.HOST%>/jsp/Description.jsp?id=<%=openId%>">FIFA���£�׬����</a><br>
</div>
</body>
</html>