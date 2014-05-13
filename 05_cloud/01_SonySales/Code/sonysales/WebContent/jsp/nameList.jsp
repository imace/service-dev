<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@page import="com.sonymobile.sonysales.model.User"%>
<%@page import="com.sonymobile.sonysales.entity.SupporterCount"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, maximum-scale=1.0 minimum-scale=1.0">
	<script src="js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript">  
        $(document).ready(function(){
            $("#pop_table").css("width", document.body.clientWidth-20);
            $("#handle_table").css("width", document.body.clientWidth-20);
            $("#rob1").css("width", document.body.clientWidth-24);
            $("#rob2").css("width", document.body.clientWidth-24);
            
            });
         
    </script> 
<title></title>
<style type="text/css">  
    table {  
        border-style: solid; 
        BORDER-COLLAPSE: collapse; 
        border-Color:#D1CCC8;
        border-top-width:3px;
        border-top-color:#22bff2
        
    }  
      
    td {  
        BORDER-RIGHT: medium none; 
        BORDER-LEFT: medium none;
        height:35px;
        padding-left:10px
    }  
</style>
</head>
<body>

	<%

	 List<User> userList = (List<User>)request.getAttribute("userList");
	 List<SupporterCount> supporterList = (List<SupporterCount>)request.getAttribute("supporterList");
	 String openId =(String)request.getAttribute("openId");
	
	%>
	<div id="title" style="margin-left:10px">
     <h2>索尼FIFA2014大奖榜奖金榜</h2>
    </div>
    <div id="pop_div" style="padding-top:1px;margin-left:10px">
     <div id="pop_title" style="height:40px;text-align:left;float:left">
         <div style="font-size:larger;color:#22bff2;padding-top:12px;padding-right:30px">人气榜</div>
     </div>
     <div id="pop_image" style="height:40px;text-align:right;float:right;margin-right:13px">
         <div><img src="img/ranking1.png" style="height:40px;float:left;margin-left:10px;"/></div>
     </div>
    </div>
    <table id="pop_table" cellSpacing=0 cellPadding=0 align=center border=1>
	   <%  
	   if(userList!=null) {
	   for(int i=0;i<userList.size();i++) {
	       if(i<3) {
	    %>  
	       <tr>
         <td><div style="color:#e82827"><%=i+1 %></div></td>
         <td><div style="color:#e82827"><%=userList.get(i).getNickname() %></div></td>
         <td>已经获得<font style="color:rgb(190, 155, 43)"><%=userList.get(i).getPoints() %></font>个好友支持了！</td>
         </tr>
	    <%     
	       } else {
	           %>
	         <tr>
           <td><%=i+1 %></td>
           <td><%=userList.get(i).getNickname() %></td>
           <td>已经获得<font style="color:rgb(190, 155, 43)"><%=userList.get(i).getPoints() %></font>个好友支持了！</td>
           </tr>
	         <%  
	       }
	   }
   }
	   %>
	</table>
	    <div id="rob1" style="margin-bottom:30px;margin-left:11px;margin-top:10px;height:50px;text-align:center;border:1px solid #d9d9d9;background-color:#e82827;" onclick="window.location.href='<%=Constant.HOST%>/jsp/LaPopularity/ActivityPage.jsp?id=<%=openId%>'">
       <div style="font-size:larger;color:white;margin-top:12px">还不来抢大奖</div>
    </div>
    
    <div id="pop_div" style="padding-top:1px;margin-left:10px">
     <div id="pop_title" style="height:40px;text-align:left;float:left">
         <div style="font-size:larger;color:#22bff2;padding-top:12px;padding-right:30px">奖金榜</div>
     </div>
     <div id="pop_image" style="height:40px;text-align:right;float:right;margin-right:13px">
         <div><img src="img/ranking2.png" style="height:40px;float:left;margin-left:10px;"/></div>
     </div>
    </div>

    <table id="handle_table" cellSpacing=0 cellPadding=0 align=center border=1>
       <%  
      if(supporterList!=null) {
       for(int i=0;i<supporterList.size();i++) {
           if(i<3) {
               %>  

           <tr>
           <td style="height:55px;"><div style="color:#e82827"><%=i+1 %></div></td>
           <td><div style="line-height:150%";><font style="color:#e82827"><%=supporterList.get(i).getNickname() %></font>，已获得<font style="color:rgb(190, 155, 43)"><%=supporterList.get(i).getCount() %></font>位朋友的拉友买支持，<br/>
           最多可获得现金卷<%=supporterList.get(i).getCount() %>*50的奖金！</div>
           </td>
           </tr>
               <%     
                  } else {
                      %>
           <tr>
           <td style="height:55px"><%=i+1 %></td>
           <td><div style="line-height:150%";><%=supporterList.get(i).getNickname() %>，已获得<font style="color:rgb(190, 155, 43)"><%=supporterList.get(i).getCount() %></font>位朋友的拉友买支持，<br/>
           最多可获得现金卷<%=supporterList.get(i).getCount() %>*50的奖金！</div>
           </td>
           </tr>
      <% 
       }
       }
       }
       %>
    
    </table>


    <div id="rob2" style="margin-bottom:20px;margin-left:11px;margin-top:10px;height:50px;text-align:center;border:1px solid #d9d9d9;background-color:#e82827;" onclick="window.location.href='<%=Constant.HOST%>/jsp/LashouBuy/LashouActivity.jsp?id=<%=openId%>'">
       <div style="font-size:larger;color:white;margin-top:12px">还不来抢奖金</div>
    </div>

</body>
</html>