<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@ page contentType="text/html; charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, maximum-scale=1.0 minimum-scale=1.0">
<title>您的基本信息</title>
</head>
<body>
	<script language="javascript">
		function edit() {
			document.getElementById('showInfo').style.display = "none";
			document.getElementById('editInfo').style.display = "";
			document.getElementById('edit').style.display = "none";
			document.getElementById('save').style.display = "";
		}
		function save() {
			document.getElementById('showInfo').style.display = "";
			document.getElementById('editInfo').style.display = "none";
			document.getElementById('edit').style.display = "";
			document.getElementById('save').style.display = "none";

		}
	</script>
	<%
		String phoneNum = (String) request.getAttribute("phoneNum");
		String email = (String) request.getAttribute("email");
		String address = (String) request.getAttribute("address");
		String jdId = (String) request.getAttribute("jdId");
		String points = (String) request.getAttribute("points");
		String pointsOrder = (String) request.getAttribute("pointsOrder");
		String supporterJS = (String) request.getAttribute("supporterJS");

		PrintWriter outwriter = response.getWriter();
	%>

	您的基本信息：
	<br> ---------------------------------
	<br> （请正确填写，以便我们能联系到您，及获奖资格认证。我们承诺，不对您的信息进行转发，泄露，以及其他商业用途）
	<br>
	<form name="userInfoForm" action="updateUser" method="post">
		<div id="showInfo">
			电话：
			<%=phoneNum%><br> 邮箱：<%=email%><br> 地址：<%=address%><br>
			京东账号：<%=jdId%><br>
		</div>
		<div id="editInfo" style="display: none">
			电话： <input name="phoneNum" type="text" id="phoneNum"
				style="width: 120px"><br> 邮箱：<input name="email"
				type="text" id="email" style="width: 120px"><br> 地址：<input
				name="address" type="text" id="address" style="width: 120px"><br>
			京东账号：<input name="jdId" type="text" id="jdId" style="width: 120px"><br>
		</div>
		（如果需要邮递奖品或领取奖金，请填写真实信息） <br> <input id="edit" type="submit"
			value="编辑" onclick="edit()"> <input id="save" type="submit"
			value="保存" onclick="save()" style="display: none"> <br>
	</form>
	<div>
		<h2>您的人气</h2>
		<hr>
		您已经获得人气情况如下：<br> 您已经获得<%=points%>人气点，目前排名<%=pointsOrder%>位，继续加油哦！
	</div>
	<div>
		<%
			JSONArray supporterJA = JSONArray.fromObject(supporterJS);
			int supporterCount = supporterJA.size();
			int money = supporterCount * Constant.FEEDBACK_SINGLE_MONEY;
		%>
		您已经获取<%=supporterCount%>个好友的支持进行拉手购买活动，最多可以获得<%=money%>元返金，您的拉手团信息如下：<br>
		<table border="1">
			<%
				for (int i = 0; i < supporterCount; i++) {
					JSONArray jo = supporterJA.getJSONArray(i);
					String nickname = jo.getString(0);
					String createTime = jo.getString(1);
			%>
			<tr>
				<td><%=nickname%>已于<%=createTime%>支持了您！</td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	<br> 您的优惠卷：
	<br> ---------------------------------
	<br>
	<input type="submit" value="点击获取优惠卷">
	<br>
</body>
</html>