<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.sonymobile.sonysales.util.Constant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html charset=UTF-8">
<meta name="viewport"
	content="width=device-width, maximum-scale=1.0 minimum-scale=1.0">
<script src="<%=request.getContextPath()%>/js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" type="text/css"
	media="screen and (max-device-width:320px) and (-webkit-device-pixel-ratio:1)"
	href="<%=Constant.HOST%>/css/site_320.css">
<link rel="stylesheet" type="text/css"
	media="screen and (min-device-width:321px) and (max-device-width:480px) and (-webkit-device-pixel-ratio:1)"
	href="<%=Constant.HOST%>/css/site_540.css">
<link rel="stylesheet" type="text/css"
	media="screen and (max-device-width:640px) and (-webkit-device-pixel-ratio:1.5)"
	href="<%=Constant.HOST%>/css/site_320.css">
<link rel="stylesheet" type="text/css"
	media="screen and (max-device-width:720px) and (-webkit-device-pixel-ratio:2)"
	href="<%=Constant.HOST%>/css/site_320.css">

<link rel="stylesheet" type="text/css"
	media="screen and (min-device-width:641px) and (max-device-width:720px) and (-webkit-device-pixel-ratio: 1.5)"
	href="<%=Constant.HOST%>/css/site_540.css">

<link rel="stylesheet" type="text/css"
	media="screen and (min-device-width:721px) and (device-width:960px) and (-webkit-device-pixel-ratio:1.5)"
	href="<%=Constant.HOST%>/css/site_720.css">

<link rel="stylesheet" type="text/css"
	media="screen and (max-device-width:1080px) and (-webkit-device-pixel-ratio: 3)"
	href="<%=Constant.HOST%>/css/site_320.css">

<link rel="stylesheet" type="text/css"
	media="screen and (min-device-width:721px) and (max-device-width:1280px) and (-webkit-device-pixel-ratio: 2)"
	href="<%=Constant.HOST%>/css/site_720.css">
<link rel="stylesheet" type="text/css"
	media="screen and (min-device-width:1081px) and (max-device-width:1920px) and (-webkit-device-pixel-ratio: 3)"
	href="<%=Constant.HOST%>/css/site_720.css">
<title>Screen Info</title>
</head>
<body>
	<div class="text_highlight common_style">
		<br>网页可见区域宽：
		<script>
			document.write(document.body.clientWidth)
		</script>
		<br> <br>网页可见区域高：
		<script>
			document.write(document.body.clientHeight)
		</script>
		<br> <br>网页可见区域宽：
		<script>
			document.write(document.body.offsetWidth)
		</script>
		<br> <br>网页可见区域高：
		<script>
			document.write(document.body.offsetHeight)
		</script>
		<br> <br>网页正文全文宽：
		<script>
			document.write(document.body.scrollWidth)
		</script>
		<br> <br>网页正文全文高：
		<script>
			document.write(document.body.scrollHeight)
		</script>
		<br> <br>网页被卷去的高：
		<script>
			document.write(document.body.scrollTop)
		</script>
		<br> <br>网页被卷去的左：
		<script>
			document.write(document.body.scrollLeft)
		</script>
		<br> <br>网页正文部分上：
		<script>
			document.write(window.screenTop)
		</script>
		<br> <br>网页正文部分左：
		<script>
			document.write(window.screenLeft)
		</script>
		<br> <br>屏幕分辨率的高：
		<script>
			document.write(window.screen.height)
		</script>
		<br> <br>屏幕分辨率的宽：
		<script>
			document.write(window.screen.width)
		</script>
		<br> <br>屏幕可用工作区高度：
		<script>
			document.write(window.screen.availHeight)
		</script>
		<br> <br>屏幕可用工作区宽度：
		<script>
			document.write(window.screen.availWidth)
		</script>
		<br> <br>屏幕设备像素比：
		<script>
			document.write(window.devicePixelRatio)
		</script>
	</div>
</body>
</html>