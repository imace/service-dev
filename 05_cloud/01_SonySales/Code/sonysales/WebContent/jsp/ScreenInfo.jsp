<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.sonymobile.sonysales.util.Constant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<script src="http://lib.sinaapp.com/js/jquery/1.10.2/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<title>Screen Info</title>
</head>
<body class="base_font_size">
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
	<p>拉友买开关: <%=com.sonymobile.sonysales.util.Constant.properties
					.getProperty("LAYOUBUY_SWITCH")%></p>
</body>
</html>