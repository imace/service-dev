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
<title>支持我,得大奖!</title>
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
			<h3>1. 点击支持</h3>
			<br>
			<h3>2. 完成关注</h3>
			<br> <img class="img-rounded" alt="fifa"
				src="http://www.sonystyle.com.cn/products/xperia/images/xperia_m51w/pro_img/z1_m51w_y1_b.jpg"><br>
				<hr>
				<!-- <input type="text" placeholder="请输入昵称" name="yournickname"/> -->
				<a href="<%=oauthtoidlink%>" style="display:block;" id="clickoauth">请点击这里, 继续支持他!</a>
				<hr>
			<form action="<%=Constant.HOST%>/LashouFollow">
				<table>
					<tr>
						<td><%=fromnickname%></td>
						<td><input type="hidden" name="user1" value="<%=fromid%>"></td>
						<td>
							<button type="submit" class="btn btn-success btn-lg">支持他!</button>
						</td>
						<td id="tonickname"><%=tonickname%></td>
						<td><input type="hidden" name="user2" id="user2" value="<%=toid%>"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<hr>
	
<script type="text/javascript">
(function(){
document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
	WeixinJSBridge.call('hideToolbar');
});
})();

jQuery(function () {
    var tonickname = $('#tonickname');
    var form = $("form");
    var oauthlink=$("#clickoauth");
    if(tonickname.text()=='我'){
    	oauthlink.show();
    	form.hide();
    }else{
    	oauthlink.hide();
    	from.show();
    }
});
</script>

</body>
</html>