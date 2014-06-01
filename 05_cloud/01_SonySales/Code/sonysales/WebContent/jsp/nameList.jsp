<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@page import="com.sonymobile.sonysales.model.User"%>
<%@page import="com.sonymobile.sonysales.entity.SupporterCount"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.log4j.Logger"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<script src="http://lib.sinaapp.com/js/jquery/1.10.2/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css"
  media="screen and (max-device-width:480px)"
  href="<%=request.getContextPath()%>/css/320.css">
  
<link rel="stylesheet" type="text/css"
  media="screen and (min-device-width:481px) and (max-device-width:540px) and (-webkit-device-pixel-ratio: 1.5)"
  href="<%=request.getContextPath()%>/css/360.css">
  
  <!-- iphone4 & iphone4s -->
<link rel="stylesheet" type="text/css"
  media="screen and (min-device-width:541px) and (max-device-width:640px) and (max-device-height:960px) and (-webkit-device-pixel-ratio: 2)"
  href="<%=request.getContextPath()%>/css/320.css">
  
  <!-- iphone5 -->
  <link rel="stylesheet" type="text/css"
  media="screen and (min-device-width:541px) and (max-device-width:640px) and (min-device-height:961px) and (-webkit-device-pixel-ratio: 2)"
  href="<%=request.getContextPath()%>/css/480.css">
  
<link rel="stylesheet" type="text/css"
  media="screen and (min-device-width:641px) and (max-device-width:720px) and (-webkit-device-pixel-ratio: 1.5)"
  href="<%=request.getContextPath()%>/css/480.css">
  
<link rel="stylesheet" type="text/css"
  media="screen and (min-device-width:721px) and (max-device-width:1080px) and (-webkit-device-pixel-ratio: 3)"
  href="<%=request.getContextPath()%>/css/360.css">
<title>激情无敌!人气大奖榜</title>
<style type="text/css">
table {
    border-style: solid;
    BORDER-COLLAPSE: collapse;
    border-Color: #D1CCC8;
}

td {
    BORDER-RIGHT: medium none;
    BORDER-LEFT: medium none;
    height: 2em;
    font-size:1.6em;
    padding-left:8px;
}

#poplist_div {
    overflow: hidden;
    height: 36.5em;
    border-top-width: 0.3em;
    border-top-color: #22bff2;
    margin-left: 2%;
    border-top-style: solid;
    max-width: 96%;
    width: 96%
}

#handlelist_div {
    overflow: hidden;
    height: 280px;
    border-top-width: 3px;
    border-top-color: #22bff2;
    margin-left: 2%;
    border-top-style: solid;
    max-width: 96%;
    width: 96%
}
</style>
</head>
<body class="base_font_size">
    <!--  <div id="beforeresult" style="border:2px solid red; color:red;">未触发事件！</div>
    <div id="result" style="border:2px solid red; color:red;">未触发事件！</div>
    -->
    <%
        Logger logger = Logger.getLogger(com.sonymobile.sonysales.servlet.NameListServlet.GetNameList.class.getName());
        List<User> userList = null;
        List<SupporterCount> supporterList = null;
        String openId = null;
        try{
            userList = (List<User>)request.getAttribute("userList");
            if (userList != null) {
            	logger.debug("nameList.jsp->userList size is "+ userList.size());
            } else {
            	logger.debug("nameList.jsp->userList is null");
            }
            supporterList = (List<SupporterCount>)request.getAttribute("supporterList");
            openId = (String)request.getAttribute("openId");
            
            //String testString=null;
            //testString.substring(5);
        }
        catch (Exception e) {
            logger.error("nameList.jsp->front-end-page in exception : " + e.getMessage());
            response.sendRedirect(request.getContextPath()+"/jsp/errorhandler.jsp?errnum=0101&errmsg="+e.getMessage());
        }
    %>
    <div id="title" class="text_header"
        style="margin-left: 2%; margin-top: 0.7em;">索尼FIFA2014大奖榜单</div>
    <div id="pop_div" style="padding-top: 0.1em; margin-left: 2%">
        <div id="pop_title"
            style="height: 4em; text-align: left; float: left">
            <div class="text_subHeader"
                style="padding-top: 1.2em; padding-right: 30px">人气榜</div>
        </div>
        <div id="pop_image"
            style="height: 4em; text-align: right; float: right; margin-right: 13px">
            <div>
                <img src="<%=request.getContextPath()%>/img/ranking1.png"
                    style="height: 4em; float: left; margin-left: 10px;" />
            </div>
        </div>
    </div>
    <div id="poplist_div">
        <div id="poplist_div1">
            <table id="pop_table1" style="max-width: 100%; width: 100%"
                cellSpacing=0 cellPadding=0 align=center border=1>
                <%
                    if(userList!=null&&userList.size()!=0) {
                        if(userList.size()<=10) {
                            %>
                        <tr>
                            <td colspan=3 style="padding-left:0;border-bottom:none">
                               <div>
                               <img src="<%=request.getContextPath()%>/img/ranking_banner_1_icn.jpg" style="max-width: 100%; width: 100%" id="pop_top_img" />
                               </div>
                           </td>
                        </tr>
                        <tr>
                            <td style="border-top:none">1</td>
                            <td style="border-top:none"><%=userList.get(0).getNickname().length()>4?userList.get(0).getNickname().substring(0,4)+"...":userList.get(0).getNickname()%></td>
                            <td style="border-top:none">已经获得<font style="color: #e82827"><%=userList.get(0).getPoints()%></font>个好友支持了！
                            </td>
                        </tr>
                                <% 
                            for(int i=1;i<userList.size();i++) {
                                %>
					                <tr>
					                    <td ><%=i+1%></td>
					                    <td><%=userList.get(i).getNickname().length()>4?userList.get(i).getNickname().substring(0,4)+"...":userList.get(i).getNickname()%></td>
					                    <td>已经获得<font style="color: #e82827"><%=userList.get(i).getPoints()%></font>个好友支持了！
					                    </td>
					                </tr>
                                <% 
                                                                     }
                     } else {
                         %>
                        <tr>
                            <td colspan=3 style="padding-left:0;border-bottom:none">
                               <div>
                               <img src="<%=request.getContextPath()%>/img/ranking_banner_1_icn.jpg" style="max-width: 100%; width: 100%" id="pop_top_img" />
                               </div>
                           </td>
                        </tr>
                         <tr>
                            <td style="border-top:none">1</td>
                            <td style="border-top:none"><%=userList.get(0).getNickname().length()>4?userList.get(0).getNickname().substring(0,4)+"...":userList.get(0).getNickname()%></td>
                            <td style="border-top:none">已经获得<font style="color: #e82827"><%=userList.get(0).getPoints()%></font>个好友支持了！
                            </td>
                        </tr>
                         <% 
                         for(int i=1;i<10;i++) {
                             %>
                        <tr>
                            <td><%=i+1%></td>
                            <td><%=userList.get(i).getNickname().length()>4?userList.get(i).getNickname().substring(0,4)+"...":userList.get(i).getNickname()%></td>
                            <td>已经获得<font style="color: #e82827"><%=userList.get(i).getPoints()%></font>个好友支持了！
                            </td>
                        </tr>
                             <% 
                         }
                         %>
                         <tr>
                            <td colspan=3 style="padding-left:0;border-bottom:none">
                               <div>
                               <img src="<%=request.getContextPath()%>/img/ranking_banner_2_icn.jpg" style="max-width: 100%; width: 100%" id="pop_top_img" />
                               </div>
                           </td>
                        </tr>
                         <tr>
                            <td style="border-top:none">1</td>
                            <td style="border-top:none"><%=userList.get(0).getNickname().length()>4?userList.get(0).getNickname().substring(0,4)+"...":userList.get(0).getNickname()%></td>
                            <td style="border-top:none">已经获得<font style="color: #e82827"><%=userList.get(0).getPoints()%></font>个好友支持了！
                            </td>
                        </tr>
                         <%
                            for(int i=11;i<userList.size();i++) {
                                %>
                        <tr>
                            <td><%=i+1%></td>
                            <td><%=userList.get(i).getNickname().length()>4?userList.get(i).getNickname().substring(0,4)+"...":userList.get(i).getNickname()%></td>
                            <td>已经获得<font style="color: #e82827"><%=userList.get(i).getPoints()%></font>个好友支持了！
                            </td>
                        </tr>
                                <%
                                                                       }
                                                         }
                        %>
                        <tr>
                            <td id="pop_point_td" colspan=3
                                style="display: none;text-align: center; border-top: medium none;"><div
                                    style="font-size: 1em">
                                    <font style="color: rgb(128, 124, 115)">人气排名获大奖，</font><font
                                        style="color: #e82827">猛点下面按钮！</font>
                                </div></td>
                        </tr>
                        <%  
                 } else {
                %>
                <tr>
                    <td id="pop_img_td"
                        style="text-align: center; border-top: medium none;"><div
                            style="margin: 3.5em; font-size: 1em">
                            <font style="color: rgb(128, 124, 115)">人气排名获大奖，</font><font
                                style="color: #e82827">猛点下面按钮！</font>
                        </div>
                        <div>
                            <img src="<%=request.getContextPath()%>/img/product_3.jpg" style="height: 16.5em" id="pop_img" />
                        </div></td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
        <div id="poplist_div2" style="display: none">
            <table id="pop_table2" style="max-width: 100%; width: 100%"
                cellSpacing=0 cellPadding=0 align=center border=1
                style="border-top:aliceblue">
                <%
                    if(userList!=null&&userList.size()!=0) {
                        if(userList.size()<=10) {
                            %>
                        <tr>
                            <td colspan=3 style="padding-left:0;border-bottom:none">
                               <div>
                               <img src="<%=request.getContextPath()%>/img/ranking_banner_1_icn.jpg" style="max-width: 100%; width: 100%" id="pop_top_img" />
                               </div>
                           </td>
                        </tr>
                        <tr>
                            <td style="border-top:none">1</td>
                            <td style="border-top:none"><%=userList.get(0).getNickname().length()>4?userList.get(0).getNickname().substring(0,4)+"...":userList.get(0).getNickname()%></td>
                            <td style="border-top:none">已经获得<font style="color: #e82827"><%=userList.get(0).getPoints()%></font>个好友支持了！
                            </td>
                        </tr>
                                <% 
                            for(int i=1;i<userList.size();i++) {
                                %>
                                    <tr>
                                        <td><%=i+1%></td>
                                        <td><%=userList.get(i).getNickname().length()>4?userList.get(i).getNickname().substring(0,4)+"...":userList.get(i).getNickname()%></td>
                                        <td>已经获得<font style="color: #e82827"><%=userList.get(i).getPoints()%></font>个好友支持了！
                                        </td>
                                    </tr>
                                <% 
                                                                     }
                     } else {
                         %>
                        <tr>
                            <td colspan=3 style="padding-left:0;border-bottom:none">
                               <div>
                               <img src="<%=request.getContextPath()%>/img/ranking_banner_1_icn.jpg" style="max-width: 100%; width: 100%" id="pop_top_img" />
                               </div>
                           </td>
                        </tr>
                         <tr>
                            <td style="border-top:none">1</td>
                            <td style="border-top:none"><%=userList.get(0).getNickname().length()>4?userList.get(0).getNickname().substring(0,4)+"...":userList.get(0).getNickname()%></td>
                            <td style="border-top:none">已经获得<font style="color: #e82827"><%=userList.get(0).getPoints()%></font>个好友支持了！
                            </td>
                        </tr>
                         <% 
                         for(int i=1;i<10;i++) {
                             %>
                        <tr>
                            <td><%=i+1%></td>
                            <td><%=userList.get(i).getNickname().length()>4?userList.get(i).getNickname().substring(0,4)+"...":userList.get(i).getNickname()%></td>
                            <td>已经获得<font style="color: #e82827"><%=userList.get(i).getPoints()%></font>个好友支持了！
                            </td>
                        </tr>
                             <% 
                         }
                         %>
                         <tr>
                            <td colspan=3 style="padding-left:0;border-bottom:none">
                               <div>
                               <img src="<%=request.getContextPath()%>/img/ranking_banner_2_icn.jpg" style="max-width: 100%; width: 100%" id="pop_top_img" />
                               </div>
                           </td>
                        </tr>
                         <tr>
                            <td style="border-top:none">1</td>
                            <td style="border-top:none"><%=userList.get(0).getNickname().length()>4?userList.get(0).getNickname().substring(0,4)+"...":userList.get(0).getNickname()%></td>
                            <td style="border-top:none">已经获得<font style="color: #e82827"><%=userList.get(0).getPoints()%></font>个好友支持了！
                            </td>
                        </tr>
                         <%
                            for(int i=11;i<userList.size();i++) {
                                %>
                        <tr>
                            <td><%=i+1%></td>
                            <td><%=userList.get(i).getNickname().length()>4?userList.get(i).getNickname().substring(0,4)+"...":userList.get(i).getNickname()%></td>
                            <td>已经获得<font style="color: #e82827"><%=userList.get(i).getPoints()%></font>个好友支持了！
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
    <div id="rob1"
        style="max-width: 95%; margin-bottom: 1em; margin-left: 2.5%; margin-top: 1em; height: 5em; text-align: center; border: 1px solid #d9d9d9; background-color: #e82827;"
        onclick="window.location.href='<%=request.getScheme() + "://" + request.getServerName()%>/activitypage?id=<%=openId%>'">
        <div style="font-size: 1.8em; color: white; margin-top: 0.9em">拉人气</div>
    </div>


    <!-- ===============================Layou Buy=============================== -->
    <%
        if (com.sonymobile.sonysales.util.Constant.properties.getProperty(
                    "LAYOUBUY_SWITCH").contains("ON")) {
    %>
    <div id="pop_div" style="padding-top: 1px; margin-left: 2%">
        <div id="pop_title"
            style="height: 40px; text-align: left; float: left">
            <div class="text_subHeader"
                style="padding-top: 12px; padding-right: 30px">奖金榜</div>
        </div>
        <div id="pop_image"
            style="height: 40px; text-align: right; float: right; margin-right: 13px">
            <div>
                <img src="<%=request.getContextPath()%>/img/ranking2.png"
                    style="height: 40px; float: left; margin-left: 10px;" />
            </div>
        </div>
    </div>
    <div id="handlelist_div">
        <div id="handlelist_div1">
            <table id="handle_table1" style="max-width: 100%; width: 100%"
                cellSpacing=0 cellPadding=0 align=center border=1>
                <%
                    if(supporterList!=null&&supporterList.size()!=0) {
                       for(int i=0;i<supporterList.size();i++) {
                           if(i<3) {
                %>

                <tr>
                    <td style="height: 55px;"><div style="color: #e82827"><%=i+1%></div></td>
                    <td><div style="line-height: 150%";>
                            <font style="color: #e82827"><%=supporterList.get(i).getNickname()%></font>，已获得<font
                                style="color: rgb(190, 155, 43)"><%=supporterList.get(i).getCount()%></font>位朋友的拉友买支持，
                            最多可获得现金卷<%=supporterList.get(i).getCount()%>*50的奖金！
                        </div></td>
                </tr>
                <%
                    } else {
                %>
                <tr>
                    <td style="height: 55px"><%=i+1%></td>
                    <td><div style="line-height: 150%";><%=supporterList.get(i).getNickname()%>，已获得<font
                                style="color: rgb(190, 155, 43)"><%=supporterList.get(i).getCount()%></font>位朋友的拉友买支持，
                            最多可获得现金卷<%=supporterList.get(i).getCount()%>*50的奖金！
                        </div></td>
                </tr>
                <%
                    }
                       }
                %>
                <tr>
                    <td id="handle_point_td" colspan=2
                        style="height: 55px; text-align: center; border-top: medium none;"><div
                            style="font-size: 1em">
                            <font style="color: rgb(128, 124, 115)">好友支持抢奖金，</font><font
                                style="color: #e82827">猛点下面按钮！</font>
                        </div></td>
                </tr>
                <%
                    } else {
                %>
                <tr>
                    <td style="text-align: center; border-top: medium none;"><div
                            style="margin: 35px; font-size: 1em;heigth:4em">
                            <font style="color: rgb(128, 124, 115)">好友支持抢奖金，</font><font
                                style="color: #e82827">猛点下面按钮！</font>
                        </div>
                        <div>
                            <img src="<%=request.getContextPath()%>/img/product_3.png" style="height: 12em" />
                        </div>
                    <td>
                </tr> 
                <%
                    }
                %>
            </table>
        </div>
        <div id="handlelist_div2" style="display: none">
            <table id="handle_table2" style="max-width: 100%; width: 100%"
                cellSpacing=0 cellPadding=0 align=center border=1
                style="border-top:aliceblue">
                <%
                    if(supporterList!=null&&supporterList.size()!=0) {
                       for(int i=0;i<supporterList.size();i++) {
                           if(i<3) {
                %>

                <tr>
                    <td style="height: 55px;"><div style="color: #e82827"><%=i+1%></div></td>
                    <td><div style="line-height: 150%";>
                            <font style="color: #e82827"><%=supporterList.get(i).getNickname()%></font>，已获得<font
                                style="color: rgb(190, 155, 43)"><%=supporterList.get(i).getCount()%></font>位朋友的拉友买支持，
                            最多可获得现金卷<%=supporterList.get(i).getCount()%>*50的奖金！
                        </div></td>
                </tr>
                <%
                    } else {
                %>
                <tr>
                    <td style="height: 55px"><%=i+1%></td>
                    <td><div style="line-height: 150%";><%=supporterList.get(i).getNickname()%>，已获得<font
                                style="color: rgb(190, 155, 43)"><%=supporterList.get(i).getCount()%></font>位朋友的拉友买支持，
                            最多可获得现金卷<%=supporterList.get(i).getCount()%>*50的奖金！
                        </div></td>
                </tr>
                <%
                    }
                       }
                       }
                %>
            </table>
        </div>
    </div>
    <div id="rob2"
        style="max-width: 95%; margin-bottom: 1.2em; margin-left: 2.5%; margin-top: 10px; height: 5em; text-align: center; border: 1px solid #d9d9d9; background-color: #e82827;"
        onclick="window.location.href='<%=request.getScheme() + "://" + request.getServerName()%>/lashouactivity?id=<%=openId%>'">
        <div style="font-size: 1.8em; color: white; margin-top: 0.9em">抢奖金</div>
    </div>
    <%
        }
    %>
    <!-- ===============================End=============================== -->

    <script type="text/javascript">  
    var poplist_div1=document.getElementById("poplist_div1");  
    var poplist_div2=document.getElementById("poplist_div2");
    var poplist_div=document.getElementById("poplist_div"); 
    var pop_point_td=document.getElementById("pop_point_td"); 
    var pop_top_img=document.getElementById("pop_top_img"); 
    
    
    <%
    if (com.sonymobile.sonysales.util.Constant.properties.getProperty(
                "LAYOUBUY_SWITCH").contains("ON")) {
%>
    var handlelist_div1=document.getElementById("handlelist_div1");  
    var handlelist_div2=document.getElementById("handlelist_div2");
    var handlelist_div=document.getElementById("handlelist_div"); 
    <%
    }
%>
//$("img").load(function() {
	window.onload = function() {
    if((poplist_div1.offsetHeight-poplist_div.offsetHeight)>50) {
        document.getElementById("poplist_div2").style.display="";
        } else {
            //var text = 'before poplist_div1.offsetHeight:' + poplist_div1.offsetHeight + ' poplist_div.offsetHeight:' + poplist_div.offsetHeight + ' pop_point_td.offsetHeight:'+pop_point_td.offsetHeight+ ' pop_top_img.offsetHeight:'+pop_top_img.offsetHeight;  
           // document.getElementById("beforeresult").innerHTML = text;
            
            $("#pop_point_td").css("height", (poplist_div.offsetHeight-poplist_div1.offsetHeight)+"px");
            document.getElementById("pop_point_td").style.display="";
            //var text = ' poplist_div1.offsetHeight:' + poplist_div1.offsetHeight + ' poplist_div.offsetHeight:' + poplist_div.offsetHeight + ' pop_point_td.offsetHeight:'+pop_point_td.offsetHeight+ ' pop_top_img.offsetHeight:'+pop_top_img.offsetHeight;    
            //document.getElementById("result").innerHTML = text; 
            }
        }
      $(document).ready(function(){
          //var windowWidth = $("#body").width();

          <%
          if (com.sonymobile.sonysales.util.Constant.properties.getProperty(
                      "LAYOUBUY_SWITCH").contains("ON")) {
      %>
          if(handlelist_div1.offsetHeight>handlelist_div.offsetHeight) {
              document.getElementById("handlelist_div2").style.display="";
              } else {
                  $("#handle_point_td").css("height", (handlelist_div.offsetHeight-handlelist_div1.offsetHeight+55)+"px");
                  }
          <%
          }
      %>
      var speed=50;//设置向上轮动的速度
      var myFunction=setInterval("moveTop()",speed); 
          });

      //poplist_div2.innerHTML=poplist_div1.innerHTML;//复制节点  

      function moveTop(){

          if(poplist_div1.offsetHeight-poplist_div.scrollTop<=0){  
              poplist_div.scrollTop=0;  
          }else{  
              poplist_div.scrollTop++;  
         }  
          <%
          if (com.sonymobile.sonysales.util.Constant.properties.getProperty(
                      "LAYOUBUY_SWITCH").contains("ON")) {
      %>
          if(handlelist_div1.offsetHeight-handlelist_div.scrollTop<=0){  
              handlelist_div.scrollTop=0;  
          }else{  
              handlelist_div.scrollTop++;  
         }  
          handlelist_div.scrollTop++; 
          <%
          }
      %>
         
                  poplist_div.scrollTop++;  
                 
                  //var text = ' pop_table1.offsetHeight:' + pop_table1.offsetHeight + ' handlelist_div.offsetHeight:' + handlelist_div.offsetHeight + " poplist_div.scrollTop:" + poplist_div.scrollTop;  
                  //document.getElementById("result").innerHTML = text;  

      }  

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