<%@ page import="com.sonymobile.sonysales.util.Constant"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<script src="http://lib.sinaapp.com/js/jquery/1.10.2/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/common.css">
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
<title>索尼FIFA快讯</title>
</head>
<body class="base_font_size">
<%
		String fromid = (String)request.getAttribute("fromid");
		String fromname = (String)request.getAttribute("fromname");
		String toid = (String)request.getAttribute("toid");
		String toname = (String)request.getAttribute("toname");
		String toheadimgurl = (String)request.getAttribute("toheadimgurl");
		String info = (String)request.getAttribute("info");
		String createTime = (String)request.getAttribute("createTime");

		boolean isShared = toid != null;
%>
	<hr>
	<div class="page_background">
		<div id="title" class="text_header common_style"
			style="margin: 8px; max-width: 96%; margin-left: 2%">索尼FIFA快讯</div>

<%      if (!isShared) {%>
		<div style="display: block;">
			<p class="text_highlight common_style"
				style="padding-top: 10px; width: 96%; max-width: 96%; margin-left: 2%">
				点击右上角<img src="<%=request.getContextPath()%>/img/overflow.png"
					class="point_pic_width" style="margin-left: 2px; margin-right: 2px" />或<img
					src="<%=request.getContextPath()%>/img/share.png"
					class="point_pic_width" style="margin-left: 2px; margin-right: 2px" />发送给朋友
			</p>
		</div>
<%      }%>

		<div id="banner_img_div" style="text-align: center">
			<img src="<%=request.getContextPath()%>/img/banner_popularity.jpg"
				id="banner_img" style="width: 96%; max-width: 96%;" />
		</div>
		<div class="text_mainBody"
			style="max-width: 96%; width: 96%; margin-left: 2%; line-height: 150%;">
			<%=info%>
		</div>
		<div>
			索尼Xperia发布于 :<%=createTime%>
		</div>

<%      if (isShared) {%>
		<div style="width: 96%; max-width: 96%; margin-left: 2%; margin-top: 4px; height: 5.1em; text-align: center; border: 1px solid #d9d9d9; background-color: #e82827;">
			<a
				href="<%=request.getContextPath()%>/relationpage?fromid=<%=fromid%>&fromname=<%=fromname%>&toid=<%=toid%>&toname=<%=toname%>&toheadimgurl=<%=toheadimgurl%>"
				style="display: block; text-align: center; color: white; border: 1px solid #d9d9d9; background-color: #e82827; text-decoration: none;">前往支持<%=fromname%>登上人气榜</a>
		</div>
<%      }%>
	</div>
</body>
</html>