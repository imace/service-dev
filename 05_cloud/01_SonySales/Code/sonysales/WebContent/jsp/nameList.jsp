<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@page import="com.sonymobile.sonysales.model.User"%>
<%@page import="com.sonymobile.sonysales.entity.SupporterCount"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
    content="width=device-width, maximum-scale=1.0 minimum-scale=1.0">
<script src="<%=request.getContextPath()%>/js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" type="text/css"
    media="screen and (max-device-width:320px) and (-webkit-device-pixel-ratio:1)"
    href="<%=request.getContextPath()%>/css/site_320.css">
<link rel="stylesheet" type="text/css"
    media="screen and (min-device-width:321px) and (max-device-width:480px) and (-webkit-device-pixel-ratio:1)"
    href="<%=request.getContextPath()%>/css/site_540.css">
<link rel="stylesheet" type="text/css"
    media="screen and (max-device-width:640px) and (-webkit-device-pixel-ratio:1.5)"
    href="<%=request.getContextPath()%>/css/site_320.css">
<link rel="stylesheet" type="text/css"
    media="screen and (max-device-width:720px) and (-webkit-device-pixel-ratio:2)"
    href="<%=request.getContextPath()%>/css/site_320.css">

<link rel="stylesheet" type="text/css"
    media="screen and (min-device-width:641px) and (max-device-width:720px) and (-webkit-device-pixel-ratio: 1.5)"
    href="<%=request.getContextPath()%>/css/site_540.css">

<link rel="stylesheet" type="text/css"
    media="screen and (min-device-width:721px) and (device-width:960px) and (-webkit-device-pixel-ratio:1.5)"
    href="<%=request.getContextPath()%>/css/site_720.css">

<link rel="stylesheet" type="text/css"
    media="screen and (max-device-width:1080px) and (-webkit-device-pixel-ratio: 3)"
    href="<%=request.getContextPath()%>/css/site_320.css">

<link rel="stylesheet" type="text/css"
    media="screen and (min-device-width:721px) and (max-device-width:1280px) and (-webkit-device-pixel-ratio: 2)"
    href="<%=request.getContextPath()%>/css/site_720.css">
<link rel="stylesheet" type="text/css"
    media="screen and (min-device-width:1081px) and (max-device-width:1920px) and (-webkit-device-pixel-ratio: 3)"
    href="<%=request.getContextPath()%>/css/site_720.css">  
<title>激情无敌!人气大奖榜</title>
<style type="text/css">  
        table {  
            border-style: solid; 
            BORDER-COLLAPSE: collapse; 
            border-Color:#D1CCC8;
            
        }  
          
        td {  
            BORDER-RIGHT: medium none; 
            BORDER-LEFT: medium none;
            height:55px;
            padding-left:10px
        }  
       #poplist_div {  
                        overflow:hidden;
                        height: 280px;
         border-top-width:3px;
         border-top-color:#22bff2;
         margin-left:2%;
         border-top-style:solid;
         max-width:96%;
         width:96%
    }  
        #handlelist_div {  
                        overflow:hidden;
                        height: 280px;
         border-top-width:3px;
         border-top-color:#22bff2;
         margin-left:2%;
         border-top-style:solid;
         max-width:96%;
         width:96%
    }  
</style>
</head>
<body>
<!--<div id="result" style="border:2px solid red; color:red;">未触发事件！</div> -->
    <%

     List<User> userList = (List<User>)request.getAttribute("userList");
     List<SupporterCount> supporterList = (List<SupporterCount>)request.getAttribute("supporterList");
     String openId =(String)request.getAttribute("openId");
    
    %>
    <div id="title" class="text_header" style="margin-left:2%;margin-top:10px;">索尼FIFA2014大奖榜单</div>
    <div id="pop_div" style="padding-top:1px;margin-left:2%">
     <div id="pop_title" style="height:40px;text-align:left;float:left">
         <div class="text_subHeader" style="padding-top:12px;padding-right:30px">人气榜(前8名得大奖)</div>
     </div> 
     <div id="pop_image" style="height:40px;text-align:right;float:right;margin-right:13px">
         <div><img src="img/ranking1.png" style="height:40px;float:left;margin-left:10px;"/></div>
     </div>
    </div>
    <div id="poplist_div">
    <div id = "poplist_div1">
    <table id="pop_table1" style="max-width:100%;width:100%" cellSpacing=0 cellPadding=0 align=center border=1>
       <%  
       if(userList!=null&&userList.size()!=0) {
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
           %>
           <tr><td id ="pop_point_td" colspan=3 style="height:55px;text-align:center;border-top:medium none;"><div style="font-size:large"><font  style="color:rgb(128, 124, 115)">人气排名获大奖，</font><font  style="color:#e82827">猛点下面按钮！</font></div></td></tr>
       <%
   } else {
       %>
       <tr><td id="pop_img_td" style="text-align:center;border-top:medium none;"><div style="margin: 35px;font-size:large"><font  style="color:rgb(128, 124, 115)">人气排名获大奖，</font><font  style="color:#e82827">猛点下面按钮！</font></div><div><img src="img/product_3.jpg" style="height:165px" id="pop_img"/></div></td></tr>
       <%
   }
       %>
    </table>
    </div>
        <div id = "poplist_div2" style="display:none">
        <table id="pop_table2" style="max-width:100%;width:100%" cellSpacing=0 cellPadding=0 align=center border=1 style="border-top:aliceblue">
         <%  
       if(userList!=null&&userList.size()!=0) {
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
    </div>
    </div>
        <div id="rob1" style="max-width:95%;margin-bottom:30px;margin-left:2.5%;margin-top:10px;height:50px;text-align:center;border:1px solid #d9d9d9;background-color:#e82827;" onclick="window.location.href='<%=Constant.HOST%>/activitypage?id=<%=openId%>'">
       <div style="font-size:larger;color:white;margin-top:12px">拉人气</div>
    </div>
    
    <div id="pop_div" style="padding-top:1px;margin-left:2%">
     <div id="pop_title" style="height:40px;text-align:left;float:left">
         <div class="text_subHeader" style="padding-top:12px;padding-right:30px">奖金榜</div>
     </div>
     <div id="pop_image" style="height:40px;text-align:right;float:right;margin-right:13px">
         <div><img src="img/ranking2.png" style="height:40px;float:left;margin-left:10px;"/></div>
     </div>
    </div>
<div id="handlelist_div">
    <div id = "handlelist_div1">
    <table id="handle_table1" style="max-width:100%;width:100%" cellSpacing=0 cellPadding=0 align=center border=1>
       <%  
      if(supporterList!=null&&supporterList.size()!=0) {
       for(int i=0;i<supporterList.size();i++) {
           if(i<3) {
               %>  

           <tr>
           <td style="height:55px;"><div style="color:#e82827"><%=i+1 %></div></td>
           <td><div style="line-height:150%";><font style="color:#e82827"><%=supporterList.get(i).getNickname() %></font>，已获得<font style="color:rgb(190, 155, 43)"><%=supporterList.get(i).getCount() %></font>位朋友的拉友买支持，
           最多可获得现金卷<%=supporterList.get(i).getCount() %>*50的奖金！</div>
           </td>
           </tr>
               <%     
                  } else {
                      %>
           <tr>
           <td style="height:55px"><%=i+1 %></td>
           <td><div style="line-height:150%";><%=supporterList.get(i).getNickname() %>，已获得<font style="color:rgb(190, 155, 43)"><%=supporterList.get(i).getCount() %></font>位朋友的拉友买支持，
           最多可获得现金卷<%=supporterList.get(i).getCount() %>*50的奖金！</div>
           </td>
           </tr>
      <% 
       }
       }
           %>
           <tr><td id="handle_point_td" colspan=2 style="height:55px;text-align:center;border-top:medium none;"><div style="font-size:large"><font  style="color:rgb(128, 124, 115)">好友支持抢奖金，</font><font  style="color:#e82827">猛点下面按钮！</font></div></td></tr>
       <%
       
       } else {
           %>
           <tr><td style="text-align:center;border-top:medium none;"><div style="margin: 35px;font-size:large"><font  style="color:rgb(128, 124, 115)">好友支持抢奖金，</font><font  style="color:#e82827">猛点下面按钮！</font></div><div><img src="img/product_3.png" style="height:165px"/></div><td></tr>
           <%
       }
           %>
    </table>
</div>
<div id = "handlelist_div2" style="display:none">
        <table id="handle_table2" style="max-width:100%;width:100%" cellSpacing=0 cellPadding=0 align=center border=1 style="border-top:aliceblue">
 <%  
      if(supporterList!=null&&supporterList.size()!=0) {
       for(int i=0;i<supporterList.size();i++) {
           if(i<3) {
               %>  

           <tr>
           <td style="height:55px;"><div style="color:#e82827"><%=i+1 %></div></td>
           <td><div style="line-height:150%";><font style="color:#e82827"><%=supporterList.get(i).getNickname() %></font>，已获得<font style="color:rgb(190, 155, 43)"><%=supporterList.get(i).getCount() %></font>位朋友的拉友买支持，
           最多可获得现金卷<%=supporterList.get(i).getCount() %>*50的奖金！</div>
           </td>
           </tr>
               <%     
                  } else {
                      %>
           <tr>
           <td style="height:55px"><%=i+1 %></td>
           <td><div style="line-height:150%";><%=supporterList.get(i).getNickname() %>，已获得<font style="color:rgb(190, 155, 43)"><%=supporterList.get(i).getCount() %></font>位朋友的拉友买支持，
           最多可获得现金卷<%=supporterList.get(i).getCount() %>*50的奖金！</div>
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
    <div id="rob2" style="max-width:95%;margin-bottom:20px;margin-left:2.5%;margin-top:10px;height:50px;text-align:center;border:1px solid #d9d9d9;background-color:#e82827;" onclick="window.location.href='<%=Constant.HOST%>/lashouactivity?id=<%=openId%>'">
       <div style="font-size:larger;color:white;margin-top:12px">抢奖金</div>
    </div>
    
      <script type="text/javascript">  
      var poplist_div1=document.getElementById("poplist_div1");  
      var poplist_div2=document.getElementById("poplist_div2");
      var poplist_div=document.getElementById("poplist_div"); 

      var handlelist_div1=document.getElementById("handlelist_div1");  
      var handlelist_div2=document.getElementById("handlelist_div2");
      var handlelist_div=document.getElementById("handlelist_div"); 
      var speed=50;//设置向上轮动的速度  
      
      $(document).ready(function(){
          //var windowWidth = $("#body").width();
          //$("#pop_table1").css("width", windowWidth-20);
          //$("#pop_table2").css("width", windowWidth-20);
          //$("#poplist_div").css("width", windowWidth-20);
          
          //$("#handle_table1").css("width", windowWidth-20);
          //$("#handle_table2").css("width", windowWidth-20);
          //$("#handlelist_div").css("width", windowWidth-20);
          //$("#rob1").css("width", windowWidth-24);
          //$("#rob2").css("width", windowWidth-24);
          
          if(poplist_div1.offsetHeight>poplist_div.offsetHeight) {
              document.getElementById("poplist_div2").style.display="";
              } else {
                  $("#pop_point_td").css("height", (poplist_div.offsetHeight-poplist_div1.offsetHeight+55)+"px");
                  //var text = ' poplist_div1.offsetHeight:' + poplist_div1.offsetHeight + ' poplist_div.offsetHeight:' + poplist_div.offsetHeight;  
                  //document.getElementById("result").innerHTML = text; 
                  }
         
          if(handlelist_div1.offsetHeight>handlelist_div.offsetHeight) {
              document.getElementById("handlelist_div2").style.display="";
              } else {
                  $("#handle_point_td").css("height", (handlelist_div.offsetHeight-handlelist_div1.offsetHeight+55)+"px");
                  }
         
          });

      //poplist_div2.innerHTML=poplist_div1.innerHTML;//复制节点  

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
                  //var text = ' pop_table1.offsetHeight:' + pop_table1.offsetHeight + ' handlelist_div.offsetHeight:' + handlelist_div.offsetHeight + " poplist_div.scrollTop:" + poplist_div.scrollTop;  
                  //document.getElementById("result").innerHTML = text;  

      }  
      var myFunction=setInterval("moveTop()",speed); 

      (function(){
          var onBridgeReady=function(){
          WeixinJSBridge.on('menu:share:appmessage', function(argv){
             WeixinJSBridge.invoke('sendAppMessage',{
                "appid":dataForWeixin.appId,
                "img_url":dataForWeixin.MsgImg,
                "img_width":"120",
                "img_height":"120",
                "link":dataForWeixin.url,
                "desc":dataForWeixin.desc,
                "title":dataForWeixin.title
             }, function(res){(dataForWeixin.callback)();});
          });
          WeixinJSBridge.on('menu:share:timeline', function(argv){
             (dataForWeixin.callback)();
             WeixinJSBridge.invoke('shareTimeline',{
                "img_url":dataForWeixin.TLImg,
                "img_width":"120",
                "img_height":"120",
                "link":dataForWeixin.url,
                "desc":dataForWeixin.desc,
                "title":dataForWeixin.title
             }, function(res){});
          });
          WeixinJSBridge.on('menu:share:weibo', function(argv){
             WeixinJSBridge.invoke('shareWeibo',{
                "content":dataForWeixin.title,
                "url":dataForWeixin.url
             }, function(res){(dataForWeixin.callback)();});
          });
          WeixinJSBridge.on('menu:share:facebook', function(argv){
             (dataForWeixin.callback)();
             WeixinJSBridge.invoke('shareFB',{
                "img_url":dataForWeixin.TLImg,
                "img_width":"120",
                "img_height":"120",
                "link":dataForWeixin.url,
                "desc":dataForWeixin.desc,
                "title":dataForWeixin.title
             }, function(res){});
          });
       };

       if(document.addEventListener){
          document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
       }else if(document.attachEvent){
          document.attachEvent('WeixinJSBridgeReady'   , onBridgeReady);
          document.attachEvent('onWeixinJSBridgeReady' , onBridgeReady);
       }
       document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
           WeixinJSBridge.call('hideToolbar');
       });
       })(); 
      
    </script> 

</body>
</html>