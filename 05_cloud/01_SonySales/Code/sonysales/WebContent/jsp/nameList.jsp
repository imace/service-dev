<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@page import="com.sonymobile.sonysales.model.User"%>
<%@page import="com.sonymobile.sonysales.entity.MySupportCount"%>
<%@page import="java.util.List"%>
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
<title>支持我,得大奖!</title>
</head>
<body>

	<%

	 List<User> userList = (List<User>)request.getAttribute("userList");
	 List<MySupportCount> mySupportCountList = (List<MySupportCount>)request.getAttribute("mySupportCountList");
	
	%>
	<p>
	<b>
	大力神杯，拉人气，排行榜！
	</b>
	</p>
	<table border="1" width="80%" cellspacing="0" cellpadding="0">
	   <%  
	   for(int i=0;i<userList.size();i++) {
	       %>
	       <tr>
	       <td><%=i+1 %></td>
	       <td><%=userList.get(i).getNickname() %></td>
	       <td>已经获得<%=userList.get(i).getPoints() %>人气值了！</td>
	       </tr>
	  <% 
	   }
	   %>
	</table>
	   <br/>
	   <p>
    <b>
    大力神杯，拉友买，奖金榜！
    </b>
    </p>
    <table border="1" width="80%" cellspacing="0" cellpadding="0">
       <%  
       for(int i=0;i<mySupportCountList.size();i++) {
           %>
           <tr>
           <td><%=i+1 %></td>
           <td><%=mySupportCountList.get(i).getNickname() %></td>
           <td>已经获得<%=mySupportCountList.get(i).getCount() %>个好友支持了！</td>
           </tr>
      <% 
       }
       %>
    
    </table>




</body>
</html>