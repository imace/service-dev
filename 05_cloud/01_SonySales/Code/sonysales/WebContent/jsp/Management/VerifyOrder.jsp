<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.sonymobile.sonysales.util.Constant"%>
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
						<i class="icon-th-large"></i> 单号验证
					</h1>
					<div class="row">
						<div class="span9">
							<div class="widget">
								<div class="widget-header">
									<h3>京东单号验证</h3>
								</div>
								<div class="widget-content">
									<div class="tabbable">
										<ul class="nav nav-tabs">
											<li class="active"><a href="#" data-toggle="tab">验单操作</a>
											</li>
										</ul>
										<br />
										<div class="tab-content">
											<div class="tab-pane active" id="1">
												<form id="edit-profile" class="form-horizontal" />
												<fieldset>
													<div class="control-group">
														<label class="control-label" for="firstname">订单号</label>
														<div class="controls">
															<input type="text" class="input-medium" id="firstname"
																value="" placeholder="请输入订单号" />
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->

													<div class="form-actions">
														<button type="submit" class="btn btn-primary">验证</button>
														<button class="btn">取消</button>
													</div>
													<!-- /form-actions -->
												</fieldset>
												</form>
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
</body>
</html>