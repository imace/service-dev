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
<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>


<script src="<%=Constant.HOST%>/js/bootstrap.js"></script>
<link rel="stylesheet" href="<%=Constant.HOST%>/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=Constant.HOST%>/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="<%=Constant.HOST%>/css/adminia.css">
<link rel="stylesheet"
	href="<%=Constant.HOST%>/css/adminia-responsive.css">
<link rel="stylesheet" href="<%=Constant.HOST%>/css/login.css">

<title>微信后台管理系统</title>
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
										<div class="tab-content">
											<div class="tab-pane active" id="1">
												<form id="edit-profile" class="form-horizontal" />
												<fieldset>
													<div class="control-group">
														<label class="control-label" for="firstname">订单号</label>
														<div class="controls">
															<input type="text" class="input-medium" id="firstname"
																value="" placeholder="请输入订单号" />
															<button type="submit" class="btn btn-primary">查询</button>
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
												</fieldset>
												</form>
											</div>
										</div>
									</div>
								</div>

								<div class="widget widget-table">

									<div class="widget-header">
										<i class="icon-th-list"></i>
										<h3>Table</h3>
									</div>
									<!-- /widget-header -->

									<div class="widget-content">

										<table class="table table-striped table-bordered">
											<thead>
												<tr>
													<th>#</th>
													<th>First Name</th>
													<th>Last Name</th>
													<th>Username</th>
													<th>Company</th>
													<th>&nbsp;</th>
												</tr>
											</thead>

											<tbody>
												<tr>
													<td>1</td>
													<td>Michael</td>
													<td>Jordan</td>
													<td>@mjordan</td>
													<td>Chicago Bulls</td>
													<td class="action-td"><a href="javascript:;"
														class="btn btn-small btn-warning"> <i class="icon-ok">√</i>
													</a> <a href="javascript:;" class="btn btn-small"> <i
															class="icon-remove">X</i>
													</a></td>
												</tr>
												<tr>
													<td>2</td>
													<td>Magic</td>
													<td>Johnson</td>
													<td>@mjohnson</td>
													<td>Los Angeles Lakers</td>
													<td class="action-td"><a href="javascript:;"
														class="btn btn-small btn-warning"> <i class="icon-ok">√</i>
													</a> <a href="javascript:;" class="btn btn-small"> <i
															class="icon-remove">X</i>
													</a></td>
												</tr>
												<tr>
													<td>3</td>
													<td>Charles</td>
													<td>Barkley</td>
													<td>@cbarkley</td>
													<td>Phoenix Suns</td>
													<td class="action-td"><a href="javascript:;"
														class="btn btn-small btn-warning"> <i class="icon-ok">√</i>
													</a> <a href="javascript:;" class="btn btn-small"> <i
															class="icon-remove">X</i>
													</a></td>
												</tr>
												<tr>
													<td>4</td>
													<td>Karl</td>
													<td>Malone</td>
													<td>@kmalone</td>
													<td>Utah Jazz</td>
													<td class="action-td"><a href="javascript:;"
														class="btn btn-small btn-warning"> <i class="icon-ok">√</i>
													</a> <a href="javascript:;" class="btn btn-small"> <i
															class="icon-remove">X</i>
													</a></td>
												</tr>
												<tr>
													<td>5</td>
													<td>David</td>
													<td>Robinson</td>
													<td>@drobinson</td>
													<td>San Antonio Spurs</td>
													<td class="action-td"><a href="javascript:;"
														class="btn btn-small btn-warning"> <i class="icon-ok">√</i>
													</a> <a href="javascript:;" class="btn btn-small"> <i
															class="icon-remove">X</i>
													</a></td>
												</tr>
												<tr>
													<td>6</td>
													<td>Reggie</td>
													<td>Miller</td>
													<td>@rmiller</td>
													<td>Indiana Pacers</td>
													<td class="action-td"><a href="javascript:;"
														class="btn btn-small btn-warning"> <i class="icon-ok">√</i>
													</a> <a href="javascript:;" class="btn btn-small"> <i
															class="icon-remove">X</i>
													</a></td>
												</tr>
												<tr>
													<td>7</td>
													<td>Clyde</td>
													<td>Drexler</td>
													<td>@cdrexler</td>
													<td>Portland Trail Blazers</td>
													<td class="action-td"><a href="javascript:;"
														class="btn btn-small btn-warning"> <i class="icon-ok">√</i>
													</a> <a href="javascript:;" class="btn btn-small"> <i
															class="icon-remove">X</i>
													</a></td>
												</tr>
												<tr>
													<td>8</td>
													<td>Hakeem</td>
													<td>Olajuwon</td>
													<td>@holajuwon</td>
													<td>Houston Rockets</td>
													<td class="action-td"><a href="javascript:;"
														class="btn btn-small btn-warning"> <i class="icon-ok">√</i>
													</a> <a href="javascript:;" class="btn btn-small"> <i
															class="icon-remove">X</i>
													</a></td>
												</tr>
											</tbody>
										</table>

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