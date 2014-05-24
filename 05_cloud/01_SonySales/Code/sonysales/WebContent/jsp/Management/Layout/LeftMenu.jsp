<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@page import="com.sonymobile.sonysales.util.CookieHelper"%>
<div class="account-container">
	<div class="account-avatar">
		<img src="<%=request.getContextPath()%>/css/weichat.jpg" alt="" class="thumbnail" />
	</div>
	<div class="account-details">
		<span class="account-name">用户1</span> <span class="account-role">管理员</span>
		<span class="account-actions"> </span>
	</div>
</div>
<hr />
    <% String code = CookieHelper.getValueFromCookieByName(request, "roleCode");%>
<ul id="main-nav" class="nav nav-tabs nav-stacked">
	<li class="active"><a href="#"> <i class="icon-home"></i>订单管理
	</a></li>
	      <% if(code!=null&&(code.equals("excute")||code.equals("admin"))) {
        %>
	<li><a href="<%=request.getContextPath()%>/jsp/Management/UploadExcel.jsp">
			<i class="icon-home"></i> 拉友买订单导入
	</a></li>
	<li><a href="<%=request.getContextPath()%>/jsp/Management/VerifyOrder.jsp">
			<i class="icon-pushpin"></i> 拉手团晒单验证
	</a></li>
	          <% 
    }%>
	   <% if(code!=null&&(code.equals("search")||code.equals("admin"))) {
        %>
        
	<li><a href="<%=request.getContextPath()%>/jsp/Management/MainPage.jsp">
			<i class="icon-th-list"></i> 拉手团订单查询
	</a></li>
	       <% 
    }%>
	<% if(code!=null&&code.equals("admin")) {
        %>
	<li class="active"><a href="#"> <i class="icon-home"></i>用户管理
	</a></li>
    <li><a
        href="<%=request.getContextPath()%>/Management/getAdministratorInfoList">
            <i class="icon-th-list"></i> 用户管理
    </a></li>
    <li><a href="<%=request.getContextPath()%>/Management/getRoleList"> <i class="icon-th-list"></i>
            角色管理
    </a></li>
	    <% 
	}%>

</ul>
<hr />
<div class="sidebar-extra"></div>
<br />
