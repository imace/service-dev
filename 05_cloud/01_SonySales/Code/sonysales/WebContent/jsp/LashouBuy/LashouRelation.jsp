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
<title>֧����,�ô�!</title>
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
			Hi, ��, ��(<%=fromnickname%>)���ڲμ�����FIFA�, �����֧�ֲ���ɹ�ע���Ի��50Ԫ�����ۿ�ȯ, ͬʱ��Ҳ���Ի�ý����Ŷ, �ǳ���л��, ���������������:<br>
			<h3>1. ���֧��</h3>
			<br>
			<h3>2. ��ɹ�ע</h3>
			<br> <img class="img-rounded" alt="fifa"
				src="http://www.sonystyle.com.cn/products/xperia/images/xperia_m51w/pro_img/z1_m51w_y1_b.jpg"><br>
				<hr>
				<!-- <input type="text" placeholder="�������ǳ�" name="yournickname"/> -->
				<a href="<%=oauthtoidlink%>" style="display:block;" id="clickoauth">��������, ����֧����!</a>
				<hr>
			<form action="<%=Constant.HOST%>/LashouFollow">
				<table>
					<tr>
						<td><%=fromnickname%></td>
						<td><input type="hidden" name="user1" value="<%=fromid%>"></td>
						<td>
							<button type="submit" class="btn btn-success btn-lg">֧����!</button>
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
    if(tonickname.text()=='��'){
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