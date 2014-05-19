<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@page import="com.sonymobile.sonysales.entity.AssociationOrders"%>
<%@page import="com.sonymobile.sonysales.entity.OrderInfo"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="viewport"
	content="width=device-width, maximum-scale=1.0 minimum-scale=1.0">
<script src="<%=Constant.HOST%>/js/jquery-1.7.2.min.js"></script>
<script src="<%=Constant.HOST%>/js/bootstrap.js"></script>
<link rel="stylesheet" href="<%=Constant.HOST%>/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=Constant.HOST%>/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="<%=Constant.HOST%>/css/adminia.css">
<link rel="stylesheet"
	href="<%=Constant.HOST%>/css/adminia-responsive.css">
<title>拉手团晒单验证</title>
</head>
<body>
	<jsp:include page="Layout/Header.jsp"></jsp:include>
	<div id="content">
		<div class="container">
			<div class="row">
				<div class="span3">
					<jsp:include page="Layout/LeftMenu.jsp"></jsp:include>
				</div>
				<div class="span9">
					<h1 class="page-title">
						<i class="icon-th-large"></i>拉手团晒单验证
					</h1>
					<div class="row">
						<div class="span9">
							<div class="widget">
								<div class="widget-header">
									<h3>拉手团晒单验证</h3>
								</div>
								<div class="widget-content">
									<div class="tabbable">
										<ul class="nav nav-tabs">
											<li class="active"><a href="#" data-toggle="tab">导入操作</a>
											</li>
										</ul>
										<br />
										<div class="tab-content">
											<div class="tab-pane active" id="1">
												<form
													action="<%=request.getContextPath()%>/lashoufileupload"
													class="form-horizontal" enctype="multipart/form-data"
													method="post">
													<fieldset>
														<div class="control-group">
															<label class="control-label">请选择订单Excel表格:</label>
															<div class="controls">
																<input type="file" name="lashouexcelname"
																	id="inputuploadfile" />
															</div>
														</div>
														<div class="form-actions">
															<button type="submit" class="btn btn-primary">上传</button>
														</div>
													</fieldset>
												</form>
												<%
													String path = request.getContextPath();
																									String basePath = request.getScheme() + "://"
																											+ request.getServerName() + ":" + request.getServerPort()
																											+ path + "/upload/";
																									AssociationOrders assciationorders = (AssociationOrders) request
																											.getAttribute("Order");
																									if (assciationorders != null) {
												%>

												<h3>发起者订单</h3>
												<table class="table table-striped table-bordered">
													<thead>
														<tr>
															<th>单号</th>
															<th>京东号</th>
															<th>微信昵称</th>
															<th>有效支持者</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td><%=assciationorders.getOwnerOrder().getOrderNum()%></td>
															<td><%=assciationorders.getOwnerOrder().getJdId()%></td>
															<td><%=assciationorders.getOwnerOrder().getNickname()%></td>
															<td><%=assciationorders.getValidSupporterCount()%></td>
														</tr>
													</tbody>
												</table>
												<%
													if (assciationorders.getSupptorOrderList().size() > 0) {
												%>
												<h3>支持者订单</h3>
												<table class="table table-striped table-bordered">
													<thead>
														<tr>
															<th>单号</th>
															<th>京东号</th>
															<th>微信昵称</th>
															<th>验证结果</th>
														</tr>
													</thead>
													<tbody>
														<%
															for(OrderInfo order: assciationorders.getSupptorOrderList()){
														%>
														<tr>
															<td><%=order.getOrderNum()%></td>
															<td><%=order.getJdId()%></td>
															<td><%=order.getNickname()%></td>
															<td><%=order.getVerifyResult()%></td>
														</tr>
														<%
															}
														%>
													</tbody>
												</table>
												<%
													}
												%>
												<a
													href="<%=basePath + (String) request.getAttribute("DownFile")%>"
													class="btn btn-lg">导出结果</a>
												<%
													}
												%>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="Layout/Footer.jsp"></jsp:include>
	<script type="text/javascript">
		$(document).ready(function() {
			$(":submit").attr('disabled', 'true');
			$('#inputuploadfile').change(function() {
				if ($(this).val() != '') {
					$(":submit").removeAttr("disabled");
				}
			});
		});
	</script>
</body>
</html>