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
<title>���Ļ�����Ϣ</title>
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

	���Ļ�����Ϣ��
	<br> ---------------------------------
	<br> ������ȷ��д���Ա���������ϵ�����������ʸ���֤�����ǳ�ŵ������������Ϣ����ת����й¶���Լ�������ҵ��;��
	<br>
	<form name="userInfoForm" action="updateUser" method="post">
		<div id="showInfo">
			�绰��
			<%=phoneNum%><br> ���䣺<%=email%><br> ��ַ��<%=address%><br>
			�����˺ţ�<%=jdId%><br>
		</div>
		<div id="editInfo" style="display: none">
			�绰�� <input name="phoneNum" type="text" id="phoneNum"
				style="width: 120px"><br> ���䣺<input name="email"
				type="text" id="email" style="width: 120px"><br> ��ַ��<input
				name="address" type="text" id="address" style="width: 120px"><br>
			�����˺ţ�<input name="jdId" type="text" id="jdId" style="width: 120px"><br>
		</div>
		�������Ҫ�ʵݽ�Ʒ����ȡ��������д��ʵ��Ϣ�� <br> <input id="edit" type="submit"
			value="�༭" onclick="edit()"> <input id="save" type="submit"
			value="����" onclick="save()" style="display: none"> <br>
	</form>
	<div>
		<h2>��������</h2>
		<hr>
		���Ѿ��������������£�<br> ���Ѿ����<%=points%>�����㣬Ŀǰ����<%=pointsOrder%>λ����������Ŷ��
	</div>
	<div>
		<%
			JSONArray supporterJA = JSONArray.fromObject(supporterJS);
			int supporterCount = supporterJA.size();
			int money = supporterCount * Constant.FEEDBACK_SINGLE_MONEY;
		%>
		���Ѿ���ȡ<%=supporterCount%>�����ѵ�֧�ֽ������ֹ����������Ի��<%=money%>Ԫ����������������Ϣ���£�<br>
		<table border="1">
			<%
				for (int i = 0; i < supporterCount; i++) {
					JSONArray jo = supporterJA.getJSONArray(i);
					String nickname = jo.getString(0);
					String createTime = jo.getString(1);
			%>
			<tr>
				<td><%=nickname%>����<%=createTime%>֧��������</td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	<br> �����Żݾ�
	<br> ---------------------------------
	<br>
	<input type="submit" value="�����ȡ�Żݾ�">
	<br>
</body>
</html>