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
<link rel="stylesheet"
	href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap-theme.min.css">
<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<script
	src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
<title>���Ļ�����Ϣ</title>
</head>
<body>
	<%
		String openId = (String) request.getAttribute("openId");
		String phoneNum = (String) request.getAttribute("phoneNum");
		String email = (String) request.getAttribute("email");
		String address = (String) request.getAttribute("address");
		String jdId = (String) request.getAttribute("jdId");
		String points = (String) request.getAttribute("points");
		String pointsOrder = (String) request.getAttribute("pointsOrder");
		String supporterJS = (String) request.getAttribute("supporterJS");

		PrintWriter outwriter = response.getWriter();
	%>
	<script language="javascript">
		jQuery(function() {

			$('#openId').val(
	<%=openId%>
		);
			$('#phoneNum').val($('#showphoneNum').text());
			$('#email').val($('#showemail').text());
			$('#address').val($('#showaddress').text());
			$('#jdId').val($('#showjdId').text());
			$('#showInfo').hide();
			$('#editInfo').show();

			$("form input").attr('disabled', 'true');
			$('#test').click(function() {
				//alert($('#test').text());
				if ($('#test').text() == '����') {
					$('#test').text('�༭');
					$('form input').removeAttr("disabled");
				} else {
					$('#test').text('����');
					$("form input").attr('disabled', 'true');
				}
				return false;
			});

			var save = function() {
				$mobileNum =
	<%=phoneNum%>
		;
				alert($mobileNum);
				if (mobileNum.length == 0) {
					alert('�������ֻ����룡');
					return false;
				}
				if (mobileNum.length != 11) {
					alert('��������Ч���ֻ����룡');
					return false;
				}

				var myreg = /^(((1[3-9][0-9]{1}))+\d{8})$/;
				if (!myreg.test(mobileNum)) {
					alert('��������Ч���ֻ����룡');
					return false;
				}
				return true;
			};

		});
	</script>


	<div class="container"
		style="background: url(/img/stamp.png) right bottom no-repeat; background-size: 55%; margin: 10px;">
		<div class="row" style="font-family: Droid Sans Fallback;">
			<h2 style="font-style: bold;">���Ļ�����Ϣ</h2>
			<hr>
			������ȷ��д���Ա���������ϵ�����������ʸ���֤�����ǳ�ŵ������������Ϣ����ת����й¶���Լ�������ҵ��;�� <br>
			<form class="form-horizontal" role="form">
				<input name="openId" type="hidden" id="openId">
				<div class="form-group">
					<label for="phoneNum" class="col-sm-2 control-label">�绰��</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="phoneNum"
							id="phoneNum" placeholder="�绰">
					</div>
				</div>
				<div class="form-group">
					<label for="email" class="col-sm-2 control-label">���䣺</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="email" id="email"
							placeholder="����">
					</div>
				</div>
				<div class="form-group">
					<label for="address" class="col-sm-2 control-label">��ַ��</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="address"
							id="address" placeholder="��ַ">
					</div>
				</div>
				<div class="form-group">
					<label for="jdId" class="col-sm-2 control-label">�����˺ţ�</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="jdId" id="jdId"
							placeholder="�����˺�">
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button id="test" class="btn btn-default">�༭</button>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<label> �������Ҫ�ʵݽ�Ʒ����ȡ��������д��ʵ��Ϣ�� </label>
					</div>
				</div>
			</form>

			<br>
			<h2>�����Żݾ�</h2>
			<hr>
			<a href="#" class="btn btn-primary btn-lg active" role="button">�����ȡ�Żݾ�</a>

			<br>

			<div>
				<h2>��������</h2>
				<hr>
				���Ѿ��������������£�<br> ���Ѿ����<%=points%>�����㣬Ŀǰ����<%=pointsOrder%>λ����������Ŷ��
			</div>

			<br>

			<h2>����������</h2>
			<hr>
			<div>
				<%
					JSONArray supporterJA = JSONArray.fromObject(supporterJS);
					int supporterCount = supporterJA.size();
					int money = supporterCount * Constant.FEEDBACK_SINGLE_MONEY;
				%>
				���Ѿ���ȡ<%=supporterCount%>�����ѵ�֧�ֽ������ֹ����������Ի��<%=money%>Ԫ����������������Ϣ���£�<br>
				<table class="table  table-striped">
					<%
						for (int i = 0; i < supporterCount; i++) {
							JSONObject jo = supporterJA.getJSONObject(i);
							String nickname = jo.getString("nickname");
							String createTime = jo.getString("createTime");

							StringBuilder sb = new StringBuilder();
							if (createTime != null && !createTime.isEmpty()
									&& createTime.length() > 8) {
								sb.append("����");
								sb.append(createTime.substring(0, 4));
								sb.append("��");
								sb.append(createTime.substring(4, 6));
								sb.append("��");
								sb.append(createTime.substring(6, 8));
								sb.append("��");
							} else {
								sb.append("�Ѿ�");
							}
							createTime = sb.toString();
					%>
					<tr>
						<td><%=nickname%><%=createTime%>֧��������</td>
					</tr>
					<%
						}
					%>
				</table>
			</div>



<br>

<hr>
<a href="<%=Constant.HOST%>/getNameList" class="btn btn-primary btn-lg active" role="button">�鿴���а���Ϣ</a>



		</div>
	</div>

</body>
</html>