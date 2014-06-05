<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@page import="com.sonymobile.sonysales.util.Base64Coder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet"
	href="http://lib.sinaapp.com/js/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://lib.sinaapp.com/js/bootstrap/3.0.0/css/bootstrap-theme.min.css">
<script src="http://lib.sinaapp.com/js/jquery/1.10.2/jquery-1.10.2.min.js"></script>
<script
	src="http://lib.sinaapp.com/js/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/validaform.css">
  
<script src="<%=request.getContextPath()%>/js/Validform_v5.3.2_min.js"></script>
  
  
<title>我的战况</title>
<style type="text/css">
.btn_decoration:hover,.btn_decoration:focus {
	text-decoration: none
}
</style>
</head>
<body>
	<%
		String openId = (String) request.getAttribute("openId");
		String phoneNum = (String) request.getAttribute("phoneNum");
		String email = ((String) request.getAttribute("email"));
		String address = (String) request.getAttribute("address");
		String jdId = (String) request.getAttribute("jdId");
		String points = ((String) request.getAttribute("points"));
		String pointsOrder = (String) request.getAttribute("pointsOrder");
		String supporterJS = (String) request.getAttribute("supporterJS");
		String friendname = (String) request.getAttribute("myname");
		PrintWriter outwriter = response.getWriter();

		String message = "索尼世界杯人气大奖中(" + friendname + ")的战况!";
		String imgurl = request.getScheme() + "://"
				+ request.getServerName() + "/img/ranking_icn.png";
		String relationUrl = request.getScheme() + "://"
				+ request.getServerName() + "/shareUserInfo?id=" + openId
				+ "&friendname=" + friendname;
		out.print("<script type=\"text/javascript\">var dataForWeixin={appId:\"\","
				+ "MsgImg:\""
				+ imgurl
				+ "\", TLImg:\""
				+ imgurl
				+ "\", url:\""
				+ relationUrl
				+ "\", title:\""
				+ message
				+ "\", desc:\""
				+ message
				+ "\", fakeid:\"\",callback:function(){/*alert('感谢分享, 更多惊喜请继续关注!-SonyXpria');*/}};</script>");
	%>
	<script language="javascript">
		jQuery(function() {
					
			$("#userform").Validform({
				tiptype:function(msg,o,cssctl){
					var objtip=$("#msgdemo2");
					cssctl(objtip,o.type);
					objtip.text(msg);
				},
				datatype:{
					"m" : /^13[0-9]{9}$|14[0-9]{9}|15[0-9]{9}$|18[0-9]{9}$/,
					"e" : /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
				}
			});		

			$('#openId').val('<%=openId%>');
			$('#phoneNum').val('<%=phoneNum%>');
			$('#email').val('<%=email%>');
			$('#address').val('<%=address%>');
			$('#jdId').val('<%=jdId%>');
			
			var url="<%=Constant.HOST%>"+"/updateUserInfo";
			$("form input").attr('disabled', 'true');
			$('#test').click(
					function() {
						if ($('#test').text() == '保存') {
							var actionurl = url + "?openId=";
							if (save()) {
								actionurl += $('#openId').val() + "&phoneNum="
										+ $('#phoneNum').val() + "&email="
										+ $('#email').val() + "&address="
										+ $('#address').val() + "&jdId="
										+ $('#jdId').val();
								$("#userform").attr("action", actionurl);
								$("#userform").submit();
								$('#test').text('编辑');
								$("form input").attr('disabled', 'true');
							}
						} else {
							$('#test').text('保存');
							$('form input').removeAttr("disabled");
						}
						return false;
					});
			var save = function() {
				var mobileNum = $('#phoneNum').val();
				var mail = $('#email').val();
				if (mobileNum.length == 0) {
					return false;
				}
				if (mobileNum.length != 11) {
					return false;
				}
				var myreg = /^(((1[3-9][0-9]{1}))+\d{8})$/;
				if (!myreg.test(mobileNum)) {
					return false;
				}
				var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
				if (!reg.test(mail)) {
	                return false;
	            }
				return true;
			};

		});
	</script>





	<div class="container"
		style="background: url(<%=request.getContextPath()%>/img/stamp.png) right bottom no-repeat; background-size: 55%; margin: 10px;">
		<div class="row base_font_size" style="font-family: Droid Sans Fallback;">
			<div id="title" class="text_header" style="margin-bottom: 10px">我的战况</div>
			<div class="text_subHeader"
				style="margin-top: 10px; margin-bottom: 10px">我的优惠卷</div>
			<div class="text_mainBody">
				<hr style="border: 1px solid #22bff2; margin-top: -3px;">
				多款<span style="color: #cea14b">限量手机</span>, 多种<span
					style="color: #cea14b">优惠券</span>等您来取, PC端领取输入<span
					style="color: #cea14b;font-size:110%"><%=Constant.JD_COUPON_LINK %></span>,手机端领取请点击<span style="color: #cea14b">下面按钮</span>。
			</div>
			<br> <a href="<%=Constant.JD_COUPON_LINK %>"
				style="display: block; background-color: #22bff2; text-align: center; color: white; border-color: #22bff2;"
				class="btn_decoration btn-lg" role="button">手机获取优惠卷</a> <br>
			<div>
				<div class="text_subHeader"
					style="margin-top: 10px; margin-bottom: 10px">我的人气</div>
				<div class="text_mainBody">
					<hr style="border: 1px solid #22bff2; margin-top: -3px;">
					<%
						if (Integer.parseInt(points) == 0) {
					%>
					很抱歉, 您获得<span style="color: #cea14b">0人气点</span>，目前尚无排名，赶快加油吧！
					<%
						}
					%>
					<%
						if (Integer.parseInt(points) > 0) {
					%>
					恭喜! 您已获得&nbsp;<span style="color: #cea14b"><%=Integer.parseInt(points)%></span>&nbsp;名好友支持，并获得&nbsp;<span style="color: #cea14b"><%=Integer.parseInt(points) * 10000%>&nbsp;人气点</span>，目前排名<span
						style="color: #cea14b">第&nbsp;<%=pointsOrder%>&nbsp;位
					</span>，继续加油哦！
					<%
						}
					%>
				</div>
				<br> <a
					href="<%=request.getContextPath()%>/getNameList?id=<%=openId%>"
					style="display: block; background-color: #22bff2; text-align: center; color: white; border-color: #22bff2;"
					class="btn_decoration btn-lg" role="button">查看人气榜</a>
			</div>

			<br>

			<!-- ===============================Layou Buy=============================== -->
			<%
				if (com.sonymobile.sonysales.util.Constant.LAYOUBUY_SWITCH
						.contains("ON")) {
			%>
			<div class="text_subHeader"
				style="margin-top: 10px; margin-bottom: 10px">我的奖金</div>
			<hr style="border: 1px solid #22bff2; margin-top: -3px;">
			<div class="text_mainBody">
				<%
					JSONArray supporterJA = JSONArray.fromObject(supporterJS);
						int supporterCount = supporterJA.size();
						int money = supporterCount * Constant.FEEDBACK_SINGLE_MONEY;

						int emptyObjectCount = 0;
				%>

				<table class="table  table-striped">
					<%
						if (supporterCount > 0) {
								for (int i = 0; i < supporterCount; i++) {
									JSONObject jo = supporterJA.getJSONObject(i);
									String createTime = "";
									String nickname = "";
									if (!jo.isNullObject()) {
										nickname = jo.getString("nickname");
										createTime = jo.getString("createTime");
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
						<td><%=nickname%></td>
						<td><%=createTime%>支持了您！</td>
					</tr>
					<%
						} else {
										emptyObjectCount++;
									}
								}
							}
							supporterCount -= emptyObjectCount;
					%>
				</table>
				<%
					if (supporterCount < 1) {
				%>
				<tr>
					<td>还没有人支持您， 赶紧去拉好友吧！</td>
				</tr>
				<%
					} else {
				%>
				您已经获取<span style="color: #cea14b"><%=supporterCount%>个好友</span>的支持进行拉手购买活动，最多可以获得<span
					style="color: #cea14b"><%=money%>元返金</span>
				<%
					}
				%>
			</div>
			<br> <a
				href="<%=request.getContextPath()%>/getNameList?id=<%=openId%>"
				style="display: block; background-color: #22bff2; text-align: center; color: white; border-color: #22bff2;"
				class="btn_decoration btn-lg" role="button">点击查看奖金榜</a> <br>
			<%
				}
			%>
			<!-- ===============================End=============================== -->

			<div class="text_subHeader"
				style="margin-top: 10px; margin-bottom: 10px">我的信息</div>
			<hr style="border: 1px solid #22bff2; margin-top: -3px;">
			<div class="text_mainBody" style="margin-bottom: 10px;">
				请正确填写，以便我们能联系到您，及获奖资格认证。我们承诺，不对您的信息进行转发，泄露，以及其他商业用途 <br>
			</div>
			<form class="form-horizontal" id="userform" role="form"
				action="<%=request.getContextPath()%>/sonysales/updateUserInfo"
				method="post">
				<input name="openId" type="hidden" id="openId">
				<div class="form-group">
					<label for="phoneNum" class="col-xs-3 control-label text_mainBody">电话：</label>
					<div class="col-xs-9">
						<input type="text" class="form-control" name="phoneNum" datatype="m"
							id="phoneNum" placeholder="电话"  errormsg="·请输入正确的手机号码!" nullmsg="请输入手机号！">
					</div>
				</div>
				<div class="form-group">
					<label for="email" class="col-xs-3 control-label text_mainBody">邮箱：</label>
					<div class="col-xs-9">
						<input type="text" class="form-control" name="email" id="email" datatype="e"
							placeholder="邮箱" errormsg="·请输入正确的邮箱!" nullmsg="请输入邮箱！">
					</div>
				</div>
				<div class="form-group">
					<label for="address" class="col-xs-3 control-label text_mainBody">地址：</label>
					<div class="col-xs-9">
						<input type="text" class="form-control" name="address"
							id="address" placeholder="地址">
					</div>
				</div>

				<!-- ===============================Layou Buy=============================== -->
				<%
					if (com.sonymobile.sonysales.util.Constant.LAYOUBUY_SWITCH
							.contains("ON")) {
				%>
				<div class="form-group">
					<%
						}
					%>
					<%
						if (com.sonymobile.sonysales.util.Constant.LAYOUBUY_SWITCH
								.contains("OFF")) {
					%>
					<div class="form-group" style="display: none;">
						<%
							}
						%>
						<!-- ===============================End=============================== -->
						<label for="jdId" class="col-xs-3 control-label text_mainBody"
							style="padding-right: 0px;">京东账号：</label>
						<div class="col-xs-9">
							<input type="text" class="form-control" name="jdId" id="jdId"
								placeholder="京东账号">
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12">
							<label class="text_highlight">（如果需要邮递奖品，请填写真实信息） </label>
							<br>
							<span id="msgdemo2"></span>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12">
							<a href="#" id="test"
								style="display: block; background-color: #22bff2; text-align: center; color: white; border-color: #22bff2;"
								class="btn-lg active btn_decoration" role="button">编辑</a>
						</div>
					</div>
			</form>
			<br>
			<%-- <hr style="border: 1px dashed #999999;">
			<a href="<%=request.getContextPath()%>/getNameList?id=<%=openId%>" role="button"
				class="btn_decoration btn-lg"
				style="display: block; border: 1px solid #999999; text-align: center; font-size: 20px; color: #3e3e3e;"><img
				src="<%=request.getContextPath()%>/img/ranking_icn.png" alt=""
				style="padding: 0px; border: none; width: 24px; height: 24px; margin: -2px 15px -3px 0px !important;" />查看排行榜信息</a>
			<br> --%>
		</div>
	</div>

	<script type="text/javascript">    
(function(){
   var onBridgeReady=function(){
   WeixinJSBridge.on('menu:share:appmessage', function(argv){
      WeixinJSBridge.invoke('sendAppMessage',{
         "appid":dataForWeixin.appId,
         "img_url":dataForWeixin.MsgImg,
         "img_width":"120",
         "img_height":"120",
         "link":dataForWeixin.url,
         "desc":dataForWeixin.desc,
         "title":dataForWeixin.title
      }, function(res){(dataForWeixin.callback)();});
   });
   WeixinJSBridge.on('menu:share:timeline', function(argv){
	  (dataForWeixin.callback)();
	  WeixinJSBridge.invoke('shareTimeline',{
         "img_url":dataForWeixin.TLImg,
         "img_width":"120",
         "img_height":"120",
         "link":dataForWeixin.url,
         "desc":dataForWeixin.desc,
         "title":dataForWeixin.title
      }, function(res){});
   });
   WeixinJSBridge.on('menu:share:weibo', function(argv){
	  WeixinJSBridge.invoke('shareWeibo',{
         "content":dataForWeixin.title,
         "url":dataForWeixin.url
      }, function(res){(dataForWeixin.callback)();});
   });
   WeixinJSBridge.on('menu:share:facebook', function(argv){
	  (dataForWeixin.callback)();
	  WeixinJSBridge.invoke('shareFB',{
         "img_url":dataForWeixin.TLImg,
         "img_width":"120",
         "img_height":"120",
         "link":dataForWeixin.url,
         "desc":dataForWeixin.desc,
         "title":dataForWeixin.title
      }, function(res){});
   });
};

if(document.addEventListener){
   document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
}else if(document.attachEvent){
   document.attachEvent('WeixinJSBridgeReady'   , onBridgeReady);
   document.attachEvent('onWeixinJSBridgeReady' , onBridgeReady);
}
document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
	WeixinJSBridge.call('hideToolbar');
});
})();
</script>
</body>
</html>