<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.sonymobile.sonysales.model.Administrator"%>
<%@page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="viewport"
	content="width=device-width, maximum-scale=1.0 minimum-scale=1.0">
<script src="<%=request.getContextPath()%>/js/jquery-1.7.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/adminia.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/adminia-responsive.css">
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
						<i class="icon-th-large"></i>用户管理
					</h1>
					
					<div class="row">
						<div class="span9">
							<div class="widget">

								<div class="widget widget-table">
									<div class="widget-header">
										<i class="icon-th-list"></i>
										<h3>用户列表</h3>
										<a href="<%=request.getContextPath()%>/jsp/Management/addAdministrator.jsp"><button  class="btn btn-primary" style="float:right;margin:5px">添加用户</button></a>
									</div>
									<!-- /widget-header -->

									<div class="widget-content">
										<table class="table table-striped table-bordered">
                                    <%
                   List<Administrator> administratorList = (List<Administrator>)request.getAttribute("administratorList");
                                    %>
											<thead>
												<tr>
													<th>序号</th>
													<th>用户名</th>
													<th>添加时间</th>
												</tr>
											</thead>
											<tbody>
									  <%  
								       if(administratorList!=null&&administratorList.size()!=0) {
								       for(int i=0;i<administratorList.size();i++) {
								        %>  
						         <tr>
						           <td><%=i+1 %></td>
						           <td><%=administratorList.get(i).getUserName() %></td>
						           <td><%=administratorList.get(i).getCreateTime() %></td>
						           <td class="action-td">
                        <a href="<%=request.getContextPath()%>/Management/editAdministrator?id=<%=administratorList.get(i).getId()%>" class="btn btn-small btn-warning">
                                <i  style="font-size:9px" >修改</i>                                                                
                        </a>                                    
                        <a href="<%=request.getContextPath()%>/Management/deleteAdministratorById?id=<%=administratorList.get(i).getId()%>" class="btn btn-small">
                                <i style="font-size:9px">删除</i>                                            
                        </a>
                    </td>
						         </tr>
											</tbody>
											<%
											   }
								       }
                                        %>
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