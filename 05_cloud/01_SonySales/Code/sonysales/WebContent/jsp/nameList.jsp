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
<title>֧����,�ô�!</title>
</head>
<body>

	<%

	 List<User> userList = (List<User>)request.getAttribute("userList");
	 List<MySupportCount> mySupportCountList = (List<MySupportCount>)request.getAttribute("mySupportCountList");
	
	%>
	<p>
	<b>
	�����񱭣������������а�
	</b>
	</p>
	<table border="1" width="80%" cellspacing="0" cellpadding="0">
	   <%  
	   for(int i=0;i<userList.size();i++) {
	       %>
	       <tr>
	       <td><%=i+1 %></td>
	       <td><%=userList.get(i).getNickname() %></td>
	       <td>�Ѿ����<%=userList.get(i).getPoints() %>����ֵ�ˣ�</td>
	       </tr>
	  <% 
	   }
	   %>
	</table>
	   <br/>
	   <p>
    <b>
    �����񱭣������򣬽����
    </b>
    </p>
    <table border="1" width="80%" cellspacing="0" cellpadding="0">
       <%  
       for(int i=0;i<mySupportCountList.size();i++) {
           %>
           <tr>
           <td><%=i+1 %></td>
           <td><%=mySupportCountList.get(i).getNickname() %></td>
           <td>�Ѿ����<%=mySupportCountList.get(i).getCount() %>������֧���ˣ�</td>
           </tr>
      <% 
       }
       %>
    
    </table>




</body>
</html>