<%@page import="com.sonymobile.sonysales.util.Constant"%>
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
<title>快来领取优惠券啦!</title>
</head>
<body>

	<%
		String fromid = (String)request.getAttribute("fromid");
		String toid = (String)request.getAttribute("toid");		
		String fromnickname = (String)request.getAttribute("fromnickname");
		String tonickname = (String)request.getAttribute("tonickname");
		String oauthtoidlink = (String)request.getAttribute("oauthtoidlink");
	%>
	<hr>
	<div class="row">
		<div class="col-xs-12">
			Hi, 亲, 我(<%=fromnickname%>)正在参加索尼FIFA活动, 如果你支持并完成关注可以获得50元购买折扣券, 同时我也可以获得奖金的哦, 非常感谢咯, 仅需完成以下两步:<br>
			<h5>1. 立即购买</h5>
			<h5>2. 完成关注</h5>
			<br> <img class="img-rounded" alt="fifa"
				src="http://img14.360buyimg.com/n1/g15/M08/16/0E/rBEhWVNM4rsIAAAAAAELASvYq4EAAL12gLe8tAAAQsZ648.jpg"><br>
				<hr>
			<form action="<%=Constant.HOST%>/lashoufollow">
				<table>
					<tr>
						<td>
							<button type="submit" class="btn btn-success btn-lg">立即购买!</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
<script type="text/javascript">
(function(){
document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
	WeixinJSBridge.call('hideToolbar');
});
})();
</script>

</body>
</html>