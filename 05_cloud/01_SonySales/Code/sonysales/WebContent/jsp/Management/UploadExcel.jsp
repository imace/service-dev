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
<link rel="stylesheet" href="http://lib.sinaapp.com/js/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="http://lib.sinaapp.com/js/bootstrap/3.0.0/css/bootstrap-theme.min.css">
<script src="http://lib.sinaapp.com/js/jquery/1.10.2/jquery-1.10.2.min.js"></script>
<script src="http://lib.sinaapp.com/js/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/adminia.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/adminia-responsive.css">
<title>拉友买订单导入</title>
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
						<i class="icon-th-large"></i>拉友买订单导入
					</h1>
					<div class="row">
						<div class="span9">
							<div class="widget">
								<div class="widget-header">
									<h3>拉友买订单导入</h3>
								</div>
								<div class="widget-content">
									<div class="tabbable">

										<div class="tab-content">
											<div class="tab-pane active" id="1">
												<ul class="nav nav-tabs">
													<li class="active"><a href="#" data-toggle="tab">导入操作</a>
													</li>
												</ul>
												<br />
												<form
													action="<%=request.getContextPath()%>/Management/fileupload"
													class="form-horizontal" enctype="multipart/form-data"
													method="post" style="border:1px solid #aaaaaa; background:#eeeeee; padding:15px;">
													<fieldset>
														<div class="control-group">
															<label class="control-label">请选择订单Excel表格:</label>
															<div class="controls">
																<input type="file" name="excelname" id="inputuploadfile" />
															</div>
														</div>
														<div class="form-actions">
															<button type="submit" class="btn btn-primary"
																style="width: 100px; padding: 10px;">上传</button>
														</div>
													</fieldset>
												</form>
												<%
													String path = request.getContextPath();
													String basePath = request.getScheme() + "://"
															+ request.getServerName() + ":" + request.getServerPort()
															+ path + "/upload/";
												%>
												<a
													href="<%=basePath + (String) request.getAttribute("excelname")%>">${requestScope.excelname }</a>
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