<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.sonymobile.sonysales.util.Constant"%>
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
<title>拉手团订单查询</title>
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
						<i class="icon-th-large"></i>拉手团订单查询
					</h1>
					<div class="row">
						<div class="span9">
							<div class="widget">
								<div class="widget-header">
									<h3>拉手团订单查询</h3>
								</div>
								<div class="widget-content">
									<ul class="nav nav-tabs">
										<li class="active"><a href="#" data-toggle="tab">导入操作</a>
										</li>
									</ul>
									<br />
									<div class="tabbable">
										<div class="tab-content">
											<div class="tab-pane active" id="1">
												<form
													action="<%=request.getContextPath()%>/Management/orderquery"
													class="form-horizontal" method="post"
													style="border: 1px solid #aaaaaa; background: #eeeeee; padding: 15px;">
													<fieldset>
														<div class="control-group">
															<label class="control-label" for="OrderId">订单号</label>
															<div class="controls">
																<input type="text" class="input-medium" id="OrderId"
																	name="OrderId" value="" placeholder="请输入订单号" />
																<button type="submit" class="btn btn-primary">查询</button>
															</div>
														</div>
													</fieldset>
												</form>
											</div>
										</div>
									</div>
								</div>

								<div class="widget widget-table">
									<%
										OrderInfo orderInfo = (OrderInfo) request.getAttribute("Order");
										if (orderInfo != null) {
									%>

									<div class="widget-header">
										<i class="icon-th-list"></i>
										<h3>查询结果</h3>
									</div>
									<!-- /widget-header -->

									<div class="widget-content">

										<h3>发起者订单</h3>
										<table class="table table-striped table-bordered">
											<thead>
												<tr>
													<th>单号</th>
													<th>京东号</th>
													<th>微信昵称</th>
													<th>验证结果</th>
													<th>发起者</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><%=orderInfo.getOrderNum()%></td>
													<td><%=orderInfo.getJdId()%></td>
													<td><%=orderInfo.getNickname()%></td>
													<td><%=orderInfo.getVerifyResult()%></td>
													<td><%=orderInfo.getOwnerNickname()%></td>
												</tr>
											</tbody>
										</table>
										<%
											}
										%>

									</div>
									<!-- /widget-content -->
								</div>
								<!-- /widget -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="Layout/Footer.jsp"></jsp:include>
</body>
</html>