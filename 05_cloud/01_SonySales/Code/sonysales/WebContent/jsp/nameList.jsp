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
  
<title></title>
<style type="text/css">  
        table {  
            border-style: solid; 
            BORDER-COLLAPSE: collapse; 
            border-Color:#D1CCC8;
            
        }  
          
        td {  
            BORDER-RIGHT: medium none; 
            BORDER-LEFT: medium none;
            height:35px;
            padding-left:10px
        }  
        #poplist_div {  
                        overflow:hidden;
                        height: 252px;
         border-top-width:3px;
         border-top-color:#22bff2;
         margin-left:10px;
         border-top-style:solid
    }  
        #handlelist_div {  
                        overflow:hidden;
                        height: 280px;
         border-top-width:3px;
         border-top-color:#22bff2;
         margin-left:10px;
         border-top-style:solid
    }  
</style>
</head>
<body>
<!--<div id="result" style="border:2px solid red; color:red;">δ�����¼���</div> -->
	<%

	 List<User> userList = (List<User>)request.getAttribute("userList");
	 List<SupporterCount> supporterList = (List<SupporterCount>)request.getAttribute("supporterList");
	 String openId =(String)request.getAttribute("openId");
	
	%>
	<div id="title" style="margin-left:10px">
     <h2>����FIFA2014�󽱰񽱽��</h2>
    </div>
    <div id="pop_div" style="padding-top:1px;margin-left:10px">
     <div id="pop_title" style="height:40px;text-align:left;float:left">
         <div style="font-size:larger;color:#22bff2;padding-top:12px;padding-right:30px">������</div>
     </div>
     <div id="pop_image" style="height:40px;text-align:right;float:right;margin-right:13px">
         <div><img src="img/ranking1.png" style="height:40px;float:left;margin-left:10px;"/></div>
     </div>
    </div>
    <div id="poplist_div">
    <div id = "poplist_div1">
    <table id="pop_table1" cellSpacing=0 cellPadding=0 align=center border=1>
       <%  
       if(userList!=null&&userList.size()!=0) {
       for(int i=0;i<userList.size();i++) {
           if(i<3) {
        %>  
           <tr>
         <td><div style="color:#e82827"><%=i+1 %></div></td>
         <td><div style="color:#e82827"><%=userList.get(i).getNickname() %></div></td>
         <td>�Ѿ����<font style="color:rgb(190, 155, 43)"><%=userList.get(i).getPoints() %></font>������֧���ˣ�</td>
         </tr>
        <%     
           } else {
               %>
             <tr>
           <td><%=i+1 %></td>
           <td><%=userList.get(i).getNickname() %></td>
           <td>�Ѿ����<font style="color:rgb(190, 155, 43)"><%=userList.get(i).getPoints() %></font>������֧���ˣ�</td>
           </tr>
             <%  
           }
       }
       if(userList.size()<=6) {
           int size = userList.size();
           int height = (7-size)*35;
           %>
           <tr><td colspan=3 style="height:<%=height%>px;text-align:center;border-top:medium none;"><div style="font-size:large"><font  style="color:rgb(128, 124, 115)">�������ǹ�ֻ���</font><font  style="color:#e82827">�͵����水ť��</font></div></td></tr>
       <%
       }
   } else {
       %>
       <tr><td id="pop_img_td" style="text-align:center;border-top:medium none;"><div style="margin: 22px;font-size:large"><font  style="color:rgb(128, 124, 115)">�������ǹ�ֻ���</font><font  style="color:#e82827">�͵����水ť��</font></div><div><img src="img/product_3.png" style="height:180px" id="pop_img"/></div></td></tr>
       <%
   }
       %>
	</table>
	</div>
	    <div id = "poplist_div2" style="display:none">
        <table id="pop_table2" cellSpacing=0 cellPadding=0 align=center border=1 style="border-top:aliceblue">
         <%  
       if(userList!=null&&userList.size()!=0) {
       for(int i=0;i<userList.size();i++) {
           if(i<3) {
        %>  
           <tr>
         <td><div style="color:#e82827"><%=i+1 %></div></td>
         <td><div style="color:#e82827"><%=userList.get(i).getNickname() %></div></td>
         <td>�Ѿ����<font style="color:rgb(190, 155, 43)"><%=userList.get(i).getPoints() %></font>������֧���ˣ�</td>
         </tr>
        <%     
           } else {
               %>
             <tr>
           <td><%=i+1 %></td>
           <td><%=userList.get(i).getNickname() %></td>
           <td>�Ѿ����<font style="color:rgb(190, 155, 43)"><%=userList.get(i).getPoints() %></font>������֧���ˣ�</td>
           </tr>
             <%  
           }
       }
   }
       %>
       </table>
    </div>
    </div>
	    <div id="rob1" style="margin-bottom:30px;margin-left:11px;margin-top:10px;height:50px;text-align:center;border:1px solid #d9d9d9;background-color:#e82827;" onclick="window.location.href='<%=Constant.HOST%>/activitypage?id=<%=openId%>'">
       <div style="font-size:larger;color:white;margin-top:12px">����������</div>
    </div>
    
    <div id="pop_div" style="padding-top:1px;margin-left:10px">
     <div id="pop_title" style="height:40px;text-align:left;float:left">
         <div style="font-size:larger;color:#22bff2;padding-top:12px;padding-right:30px">�����</div>
     </div>
     <div id="pop_image" style="height:40px;text-align:right;float:right;margin-right:13px">
         <div><img src="img/ranking2.png" style="height:40px;float:left;margin-left:10px;"/></div>
     </div>
    </div>
<div id="handlelist_div">
    <div id = "handlelist_div1">
    <table id="handle_table1" cellSpacing=0 cellPadding=0 align=center border=1>
       <%  
      if(supporterList!=null&&supporterList.size()!=0) {
       for(int i=0;i<supporterList.size();i++) {
           if(i<3) {
               %>  

           <tr>
           <td style="height:55px;"><div style="color:#e82827"><%=i+1 %></div></td>
           <td><div style="line-height:150%";><font style="color:#e82827"><%=supporterList.get(i).getNickname() %></font>���ѻ��<font style="color:rgb(190, 155, 43)"><%=supporterList.get(i).getCount() %></font>λ���ѵ�������֧�֣�
           ���ɻ���ֽ��<%=supporterList.get(i).getCount() %>*50�Ľ���</div>
           </td>
           </tr>
               <%     
                  } else {
                      %>
           <tr>
           <td style="height:55px"><%=i+1 %></td>
           <td><div style="line-height:150%";><%=supporterList.get(i).getNickname() %>���ѻ��<font style="color:rgb(190, 155, 43)"><%=supporterList.get(i).getCount() %></font>λ���ѵ�������֧�֣�
           ���ɻ���ֽ��<%=supporterList.get(i).getCount() %>*50�Ľ���</div>
           </td>
           </tr>
      <% 
       }
       }
       if(supporterList.size()<5) {
           int size = supporterList.size();
           int height = (5-size)*55;
           %>
           <tr><td colspan=2 style="height:<%=height%>px;text-align:center;border-top:medium none;"><div style="font-size:large"><font  style="color:rgb(128, 124, 115)">�������ǹ�ֻ���</font><font  style="color:#e82827">�͵����水ť��</font></div></td></tr>
       <%
       }
       
       } else {
           %>
           <tr><td style="text-align:center;border-top:medium none;"><div style="margin: 35px;font-size:large"><font  style="color:rgb(128, 124, 115)">�������ǹ�ֻ���</font><font  style="color:#e82827">�͵����水ť��</font></div><div><img src="img/product_3.png" style="height:180px"/></div><td></tr>
           <%
       }
           %>
    </table>
</div>
<div id = "handlelist_div2" style="display:none">
        <table id="handle_table2" cellSpacing=0 cellPadding=0 align=center border=1 style="border-top:aliceblue">
 <%  
      if(supporterList!=null&&supporterList.size()!=0) {
       for(int i=0;i<supporterList.size();i++) {
           if(i<3) {
               %>  

           <tr>
           <td style="height:55px;"><div style="color:#e82827"><%=i+1 %></div></td>
           <td><div style="line-height:150%";><font style="color:#e82827"><%=supporterList.get(i).getNickname() %></font>���ѻ��<font style="color:rgb(190, 155, 43)"><%=supporterList.get(i).getCount() %></font>λ���ѵ�������֧�֣�
           ���ɻ���ֽ��<%=supporterList.get(i).getCount() %>*50�Ľ���</div>
           </td>
           </tr>
               <%     
                  } else {
                      %>
           <tr>
           <td style="height:55px"><%=i+1 %></td>
           <td><div style="line-height:150%";><%=supporterList.get(i).getNickname() %>���ѻ��<font style="color:rgb(190, 155, 43)"><%=supporterList.get(i).getCount() %></font>λ���ѵ�������֧�֣�
           ���ɻ���ֽ��<%=supporterList.get(i).getCount() %>*50�Ľ���</div>
           </td>
           </tr>
      <% 
       }
       }
       }
       %>
        </table>
    </div>
    </div>
    <div id="rob2" style="margin-bottom:20px;margin-left:11px;margin-top:10px;height:50px;text-align:center;border:1px solid #d9d9d9;background-color:#e82827;" onclick="window.location.href='<%=Constant.HOST%>/lashouactivity?id=<%=openId%>'">
       <div style="font-size:larger;color:white;margin-top:12px">������������</div>
    </div>
    
      <script type="text/javascript">  
      var poplist_div1=document.getElementById("poplist_div1");  
      var poplist_div2=document.getElementById("poplist_div2");
      var poplist_div=document.getElementById("poplist_div"); 

      var handlelist_div1=document.getElementById("handlelist_div1");  
      var handlelist_div2=document.getElementById("handlelist_div2");
      var handlelist_div=document.getElementById("handlelist_div"); 
      var speed=50;//���������ֶ����ٶ�  
      
      $(document).ready(function(){
          $("#pop_table1").css("width", document.body.clientWidth-20);
          $("#pop_table2").css("width", document.body.clientWidth-20);
          $("#poplist_div").css("width", document.body.clientWidth-20);
          
          $("#handle_table1").css("width", document.body.clientWidth-20);
          $("#handle_table2").css("width", document.body.clientWidth-20);
          $("#handlelist_div").css("width", document.body.clientWidth-20);
          $("#rob1").css("width", document.body.clientWidth-24);
          $("#rob2").css("width", document.body.clientWidth-24);
          
          
          if(handlelist_div1.offsetHeight>handlelist_div.offsetHeight) {
        	  document.getElementById("handlelist_div2").style.display="";
        	  //document.getElementById("handlelist_div2").remove();
              }
          if(poplist_div1.offsetHeight>poplist_div.offsetHeight) {
        	  document.getElementById("poplist_div2").style.display="";
              //document.getElementById("poplist_div2").remove();
              }
          
        
          });

      //poplist_div2.innerHTML=poplist_div1.innerHTML;//���ƽڵ�  

      function moveTop(){  

          if(poplist_div1.offsetHeight-poplist_div.scrollTop<=0){  
              poplist_div.scrollTop=0;  
          }else{  
              poplist_div.scrollTop++;  
         }  
          if(handlelist_div1.offsetHeight-handlelist_div.scrollTop<=0){  
        	  handlelist_div.scrollTop=0;  
          }else{  
        	  handlelist_div.scrollTop++;  
         }  
         
                  poplist_div.scrollTop++;  
                  handlelist_div.scrollTop++; 
                  //var text = ' handlelist_div1.offsetHeight:' + handlelist_div1.offsetHeight + ' handlelist_div.offsetHeight:' + handlelist_div.offsetHeight + " poplist_div.scrollTop:" + poplist_div.scrollTop;  
                  //document.getElementById("result").innerHTML = text;  

      }  
      var myFunction=setInterval("moveTop()",speed);  
      
    </script> 

</body>
</html>