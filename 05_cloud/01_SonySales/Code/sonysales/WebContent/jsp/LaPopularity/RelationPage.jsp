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
<script src="<%=Constant.HOST%>/js/relation.js"></script>
<title>֧����,�ô�!</title>
</head>
<body>

	<%
		String fromid = (String) request.getAttribute("fromid");
		String toid = (String) request.getAttribute("toid");
		String fromnickname = (String) request.getAttribute("fromnickname");
		String tonickname = (String) request.getAttribute("tonickname");
		String oauthtoidlink = (String) request
				.getAttribute("oauthtoidlink");
		String fromimg = (String) request.getAttribute("fromimg");
		String toimg = (String) request.getAttribute("toimg");
	%>
	<div class="container"
		style="background: url(/img/stamp.png) right bottom no-repeat; background-size: 55%; margin: 10px;">
		<div class="row" style="font-family: Droid Sans Fallback;">
			<div class="col-xs-12">
				<h4>
					Hi, ��, ��(<%=fromnickname%>)������FIFA�ֻ�־�ڱص�, ��������һƱ, ͬʱ��Ҳ���Ի�ô��ۻ�,
					����ɼ�2��:
				</h4>
				<h4 style="color: #cea14b">1. ���֧�� 2. ��ɹ�ע ���ɻ�����潱Ʒ</h4>
				<img alt="fifa" style="max-width: 100%;"
					src="/img/banner_recevier.png">
				<h4 style="color: #22bff2">֧�����ĺ���</h4>
				<div id="personalInfo">
					<h4>Ϊ��֧�����ĺ���, ��Ҫ���ȵ�����水ť��ȡ���ĸ�����Ϣ��</h4>
					<hr>
					<a href="<%=oauthtoidlink%>"
						style="display: block; background-color: #7adb81; border-color: #7adb81;"
						class="btn btn-primary btn-lg active" role="button">��ȡ������Ϣ</a>
				</div>
				<div id="supportFriend" class="text-center">
					<form action="<%=Constant.HOST%>/sharepage">
						<hr>
						<div class="row">
							<div class="col-xs-1"></div>
							<div class="col-xs-3">
								<img alt="fifa" style="max-width: 100%;" src="<%=fromimg%>"><br>
								<%=fromnickname%>
								<input type="hidden" name="user1" value="<%=fromid%>">
							</div>
							<div class="col-xs-4">
								<button type="submit" class="btn btn-success btn-block"
									style="background: #22bff2; border-color: #22bff2; padding: 15px;">���֧��</button>
								<br> <img alt="fifa" style="max-width: 100%;"
									src="/img/arrow.png">
							</div>
							<div class="col-xs-3" id="tonickname">
								<img alt="fifa" style="max-width: 100%;" src="<%=toimg%>"><br>
								<%=tonickname%>
								<input type="hidden" name="user2" value="<%=toid%>">
							</div>
							<div class="col-xs-1"></div>
						</div>
						<hr>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>