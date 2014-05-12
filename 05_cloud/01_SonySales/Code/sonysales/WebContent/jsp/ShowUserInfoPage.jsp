<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@ page contentType="text/html; charset=UTF-8"%>
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
<title>您的基本信息</title>
</head>
<body>
	<%
		String openId = (String) request.getAttribute("openId");
		String phoneNum = (String) request.getAttribute("phoneNum");
		String email = ((String) request.getAttribute("email"));
		String address = (String) request.getAttribute("address");
		String jdId = (String) request.getAttribute("jdId");
		String points = (String) request.getAttribute("points");
		String pointsOrder = (String) request.getAttribute("pointsOrder");
		String supporterJS = (String) request.getAttribute("supporterJS");
		PrintWriter outwriter = response.getWriter();
	%>
	<script language="javascript">
		jQuery(function() {

			$('#openId').val('<%=openId%>');
			$('#phoneNum').val('<%=phoneNum%>');
			$('#email').val('<%=email%>');
			$('#address').val('<%=address%>');
			$('#jdId').val('<%=jdId%>');
			
			var url="<%=Constant.HOST%>/updateUserInfo";

			$("form input").attr('disabled', 'true');
			$('#test').click(
					function() {
						if ($('#test').text() == '保存') {
							$('#test').text('编辑');
							$("form input").attr('disabled', 'true');
							var actionurl = url + "?openId=";
							if (save()) {
								actionurl += $('#openId').val() + "&phoneNum="
										+ $('#phoneNum').val() + "&email="
										+ $('#email').val() + "&address="
										+ $('#address').val() + "&jdId="
										+ $('#jdId').val();
								$("#userform").attr("action", actionurl);
								$("#userform").submit();
							}
						} else {
							$('#test').text('保存');
							$('form input').removeAttr("disabled");
						}
						return false;
					});
			var save = function() {
				var mobileNum = $('#phoneNum').val();
				if (mobileNum.length == 0) {
					alert('请输入手机号码！');
					return false;
				}
				if (mobileNum.length != 11) {
					alert('请输入有效的手机号码！');
					return false;
				}
				var myreg = /^(((1[3-9][0-9]{1}))+\d{8})$/;
				if (!myreg.test(mobileNum)) {
					alert('请输入有效的手机号码！');
					return false;
				}
				return true;
			};

		});
	</script>
	<div class="container"
		style="background: url(/img/stamp.png) right bottom no-repeat; background-size: 55%; margin: 10px;">
		<div class="row" style="font-family: Droid Sans Fallback;">
			<h2 style="color: #22bff2;">您的基本信息</h2>
			<hr style="border: 1px solid #22bff2;">
			（请正确填写，以便我们能联系到您，及获奖资格认证。我们承诺，不对您的信息进行转发，泄露，以及其他商业用途） <br>
			<%-- <form class="form-horizontal" role="form" action="<%=Constant.HOST%>/updateUserInfo" > --%>
			<form class="form-horizontal" id="userform" role="form"
				action="http://localhost:8888/sonysales/updateUserInfo"
				method="post">
				<input name="openId" type="hidden" id="openId">
				<div class="form-group">
					<label for="phoneNum" class="col-sm-2 control-label">电话：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="phoneNum"
							id="phoneNum" placeholder="电话">
					</div>
				</div>
				<div class="form-group">
					<label for="email" class="col-sm-2 control-label">邮箱：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="email" id="email"
							placeholder="邮箱">
					</div>
				</div>
				<div class="form-group">
					<label for="address" class="col-sm-2 control-label">地址：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="address"
							id="address" placeholder="地址">
					</div>
				</div>
				<div class="form-group">
					<label for="jdId" class="col-sm-2 control-label">京东账号：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="jdId" id="jdId"
							placeholder="京东账号">
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button id="test" class="btn btn-default">编辑</button>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<label style="color: #cea14b">（如果需要邮递奖品或领取奖金，请填写真实信息） </label>
					</div>
				</div>
			</form>

			<br>
			<h2 style="color: #22bff2;">您的优惠卷</h2>
			<hr style="border: 1px solid #22bff2;">
			<a href="#" class="btn btn-primary btn-lg active" role="button">点击获取优惠卷</a>

			<br>

			<div>
				<h2 style="color: #22bff2;">您的人气</h2>
				<hr style="border: 1px solid #22bff2;">
				您已经获得人气情况如下：<br> 您已经获得<%=points%>人气点，目前排名<%=pointsOrder%>位，继续加油哦！
			</div>

			<br>

			<h2 style="color: #22bff2;">您的拉友团</h2>
			<hr style="border: 1px solid #22bff2;">
			<div>
				<%
					JSONArray supporterJA = JSONArray.fromObject(supporterJS);
					int supporterCount = supporterJA.size();
					int money = supporterCount * Constant.FEEDBACK_SINGLE_MONEY;
				%>
				您已经获取<%=supporterCount%>个好友的支持进行拉手购买活动，最多可以获得<%=money%>元返金，您的拉手团信息如下：<br>
				<table class="table  table-striped">
					<%
						if (supporterCount > 0) {
					%>
					<%
						for (int i = 0; i < supporterCount; i++) {
								JSONObject jo = supporterJA.getJSONObject(i);
								String nickname = jo.getString("nickname");
								String createTime = jo.getString("createTime");

								StringBuilder sb = new StringBuilder();
								if (createTime != null && !createTime.isEmpty()
										&& createTime.length() > 8) {
									sb.append("已于");
									sb.append(createTime.substring(0, 4));
									sb.append("年");
									sb.append(createTime.substring(4, 6));
									sb.append("月");
									sb.append(createTime.substring(6, 8));
									sb.append("日");
								} else {
									sb.append("已经");
								}
								createTime = sb.toString();
					%>
					<tr>
						<td><%=nickname%><%=createTime%>支持了您！</td>
					</tr>
					<%
						}
						}
					%>
					<%
						if (supporterCount == 0) {
					%>
					<tr>
						<td>还没有人支持你， 赶紧去拉好友吧！</td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<br>
			<hr style="border: 1px solid #22bff2;">
			<a href="<%=Constant.HOST%>/getNameList"
				class="btn btn-primary btn-lg active" role="button">查看排行榜信息</a>
		</div>
	</div>

</body>
</html>