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
<script src="<%=request.getContextPath()%>/js/relation.js"></script>
<!-- <script src="http://lib.sinaapp.com/js/jquery-mobile/1.3.1/jquery.mobile-1.3.1.min.js"></script> -->
<script src="http://lib.sinaapp.com/js/jquery-mobile/1.0.1/jquery.mobile-1.0.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<title>激情无敌!人气大奖榜</title>
<style type="text/css">
table {
    border-style: solid;
    BORDER-COLLAPSE: collapse;
    border-Color: #D1CCC8;
    table-layout: fixed;
}

td {
    BORDER-RIGHT: medium none;
    BORDER-LEFT: medium none;
    height: 2em;
    font-size:1.6em;
    padding-left:0.2em;
}

.col1{
    width:9%;
}
.col2{
    width:36%;
}
.col3{
    width:55%;
}

.overText{
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
#poplist_div {
    overflow: hidden;
    height: 34.5em;
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
        style="margin-left: 2%; margin-top: 0.7em;">索尼世界杯人气大奖榜单</div>
    <div  class="text_subHeader2"
        style="margin-left: 2%; margin-top: 0.3em;">前10就送<font style="color: #e82827">Smart Watch2</font>,11至20就送<font style="color: #e82827">蓝牙耳机SBH20</font></div>
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
                       <%
                       if(userList!=null&&userList.size()!=0) {
                        %>
            <table style="max-width: 100%; width: 100%;border-bottom:none"
                cellSpacing=0 cellPadding=0 align=center border=1>
                <tr>
                <td style="padding-left:0;border-bottom:none">
					            <div>
					                <img src="<%=request.getContextPath()%>/img/ranking_banner_1_icn.jpg" style="max-width: 100%; width: 100%" id="pop_top_img" />
					            </div>
		            </td>
		            </tr>
            </table>
            <table id="pop_table1" style="max-width: 100%; width: 100%;border-top:none"
                cellSpacing=0 cellPadding=0 align=center border=1>
                <%
                        if(userList.size()<=10) {
                            %>
                        <tr>
                            <td class="col1" style="border-top:none;">1</td>
                            <td class="overText col2" style="border-top:none;"><%=userList.get(0).getNickname()%></td>
                            <td class="overText col3" style="border-top:none;">已获<font style="color: #e82827"><%=userList.get(0).getPoints()%></font>个好友支持！
                            </td>
                        </tr>
                                <% 
                            for(int i=1;i<userList.size();i++) {
                                %>
					                <tr>
					                    <td class="col1"><%=i+1%></td>
					                    <td class="overText col2"><%=userList.get(i).getNickname()%></td>
					                    <td class="overText col3">已获<font style="color: #e82827"><%=userList.get(i).getPoints()%></font>个好友支持！
					                    </td>
					                </tr>
                                <% 
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
                        </table>
                                <% 
                     } else {
                         %>
                         <tr>
                            <td class="col1" style="border-top:none;">1</td>
                            <td class="overText col2" style="border-top:none;"><%=userList.get(0).getNickname()%></td>
                            <td class="overText col3" style="border-top:none;">已获<font style="color: #e82827"><%=userList.get(0).getPoints()%></font>个好友支持！
                            </td>
                        </tr>
                         <% 
                         for(int i=1;i<10;i++) {
                             %>
                        <tr>
                            <td class="col1"><%=i+1%></td>
                            <td class="overText col2"><%=userList.get(i).getNickname()%></td>
                            <td class="overText col3">已获<font style="color: #e82827"><%=userList.get(i).getPoints()%></font>个好友支持！
                            </td>
                        </tr>
                       
                             <% 
                         }
                         %>
                         </table>
                         <table style="max-width: 100%; width: 100%;border-bottom:none"
						                cellSpacing=0 cellPadding=0 align=center border=1>
						                <tr>
							                <td style="padding-left:0;border-bottom:none">
				                       <div>
				                             <img src="<%=request.getContextPath()%>/img/ranking_banner_2_icn.jpg" style="max-width: 100%; width: 100%" id="pop_top_img" />
				                       </div>
			                       </td>
		                       </tr>
	                       </table>
							            <table style="max-width: 100%; width: 100%;border-top:none"
							                cellSpacing=0 cellPadding=0 align=center border=1>
                         <tr>
                            <td class="col1" style="border-top:none;">11</td>
                            <td class="overText col2" style="border-top:none;"><%=userList.get(10).getNickname()%></td>
                            <td class="overText col3" style="border-top:none;">已获<font style="color: #e82827"><%=userList.get(10).getPoints()%></font>个好友支持！
                            </td>
                        </tr>
                         <%
                            for(int i=11;i<userList.size();i++) {
                                %>
                        <tr>
                            <td class="col1"><%=i+1%></td>
                            <td class="overText col2"><%=userList.get(i).getNickname()%></td>
                            <td class="overText col3">已获<font style="color: #e82827"><%=userList.get(i).getPoints()%></font>个好友支持！
                            </td>
                        </tr>
                        
                                <%
                                                                       }
                         %>
                         </table>
                         <%
                                                         }
                 } else {
                %>

             <table style="max-width: 100%; width: 100%;"
                cellSpacing=0 cellPadding=0 align=center border=1>
                <tr>
                <td style="padding-left:0;border-bottom:none">
                            <div>
                                <img src="<%=request.getContextPath()%>/img/ranking_banner_1_icn.jpg" style="max-width: 100%; width: 100%" id="pop_top_img" />
                            </div>
                </td>
                </tr>
                <tr>
                    <td style="text-align: center; border-top: medium none;border-top:none;height:14em"><div
                            style="font-size: 1em;">
                            <font style="color: rgb(128, 124, 115)">人气排名获大奖，</font><font
                                style="color: #e82827">猛点下面按钮！</font>
                        </div></td>
                </tr>
            </table>
                <%
                    }
                %>
            
        </div>
        <div id="poplist_div2" style="display: none">
                       <%
                       if(userList!=null&&userList.size()!=0) {
                        %>
            <table style="max-width: 100%; width: 100%;border-bottom:none"
                cellSpacing=0 cellPadding=0 align=center border=1>
                <tr>
                <td style="padding-left:0;border-bottom:none">
                                <div>
                                    <img src="<%=request.getContextPath()%>/img/ranking_banner_1_icn.jpg" style="max-width: 100%; width: 100%" id="pop_top_img" />
                                </div>
                    </td>
                    </tr>
            </table>
            <table id="pop_table1" style="max-width: 100%; width: 100%;border-top:none"
                cellSpacing=0 cellPadding=0 align=center border=1>
                <%
                        if(userList.size()<=10) {
                            %>
                        <tr>
                            <td class="col1" style="border-top:none;">1</td>
                            <td class="overText col2" style="border-top:none;"><%=userList.get(0).getNickname()%></td>
                            <td class="overText col3" style="border-top:none;">已获<font style="color: #e82827"><%=userList.get(0).getPoints()%></font>个好友支持！
                            </td>
                        </tr>
                                <% 
                            for(int i=1;i<userList.size();i++) {
                                %>
                                    <tr>
                                        <td class="col1"><%=i+1%></td>
                                        <td class="overText col2"><%=userList.get(i).getNickname()%></td>
                                        <td class="overText col3">已获<font style="color: #e82827"><%=userList.get(i).getPoints()%></font>个好友支持！
                                        </td>
                                    </tr>
                                <% 
                                                                     }
                                %>
                        </table>
                                <% 
                     } else {
                         %>
                         <tr>
                            <td class="col1" style="border-top:none;">1</td>
                            <td class="overText col2" style="border-top:none;"><%=userList.get(0).getNickname()%></td>
                            <td class="overText col3" style="border-top:none;">已获<font style="color: #e82827"><%=userList.get(0).getPoints()%></font>个好友支持！
                            </td>
                        </tr>
                         <% 
                         for(int i=1;i<10;i++) {
                             %>
                        <tr>
                            <td class="col1"><%=i+1%></td>
                            <td class="overText col2"><%=userList.get(i).getNickname()%></td>
                            <td class="overText col3">已获<font style="color: #e82827"><%=userList.get(i).getPoints()%></font>个好友支持！
                            </td>
                        </tr>
                       
                             <% 
                         }
                         %>
                         </table>
                         <table style="max-width: 100%; width: 100%;border-bottom:none"
                                        cellSpacing=0 cellPadding=0 align=center border=1>
                                        <tr>
                                            <td style="padding-left:0;border-bottom:none">
                                       <div>
                                             <img src="<%=request.getContextPath()%>/img/ranking_banner_2_icn.jpg" style="max-width: 100%; width: 100%" id="pop_top_img" />
                                       </div>
                                   </td>
                               </tr>
                           </table>
                         <table style="max-width: 100%; width: 100%;border-top:none"
                             cellSpacing=0 cellPadding=0 align=center border=1>
                         <tr>
                            <td class="col1" style="border-top:none;">11</td>
                            <td class="overText col2" style="border-top:none;"><%=userList.get(10).getNickname()%></td>
                            <td class="overText col3" style="border-top:none;">已获<font style="color: #e82827"><%=userList.get(10).getPoints()%></font>个好友支持！
                            </td>
                        </tr>
                         <%
                            for(int i=11;i<userList.size();i++) {
                                %>
                        <tr>
                            <td class="col1"><%=i+1%></td>
                            <td class="overText col2"><%=userList.get(i).getNickname()%></td>
                            <td class="overText col3">已获<font style="color: #e82827"><%=userList.get(i).getPoints()%></font>个好友支持！
                            </td>
                        </tr>
                        
                                <%
                                                                       }
                         %>
                         </table>
                         <%
                                                         }
                 }
                %>
            
        </div>
    </div>
    <div id="rob1"  data-openId="<%=openId %>" data-pageName="2" data-operation="4" data-host="<%=request.getScheme()%>://<%=request.getServerName()%>" class="loghandler"
        style="border-radius:4px; max-width: 95%; margin-bottom: 1em; margin-left: 2.5%; margin-top: 1em; height: 5em; text-align: center; border: 1px solid #d9d9d9; background-color: #e82827;"
        onclick="window.location.href='<%=request.getScheme() + "://" + request.getServerName()%>/activitypage?id=<%=openId%>'">
        <div style="font-size: 1.8em; color: white; margin-top: 0.85em">拉人气</div>
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
        <div style="font-size: 1.8em; color: white; margin-top: 0.85em">抢奖金</div>
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
    if((poplist_div1.offsetHeight-poplist_div.offsetHeight)>0) {
        document.getElementById("poplist_div2").style.display="";
        } else if((poplist_div.offsetHeight-poplist_div1.offsetHeight)>30){
            //var text = 'before poplist_div1.offsetHeight:' + poplist_div1.offsetHeight + ' poplist_div.offsetHeight:' + poplist_div.offsetHeight + ' pop_point_td.offsetHeight:'+pop_point_td.offsetHeight+ ' pop_top_img.offsetHeight:'+pop_top_img.offsetHeight;  
           // document.getElementById("beforeresult").innerHTML = text;
            
            $("#pop_point_td").css("height", (poplist_div.offsetHeight-poplist_div1.offsetHeight-2)+"px");
            document.getElementById("pop_point_td").style.display="";
            //var text = ' poplist_div1.offsetHeight:' + poplist_div1.offsetHeight + ' poplist_div.offsetHeight:' + poplist_div.offsetHeight + ' pop_point_td.offsetHeight:'+pop_point_td.offsetHeight+ ' pop_top_img.offsetHeight:'+pop_top_img.offsetHeight;    
            //document.getElementById("result").innerHTML = text; 
            }
        }
      $(document).ready(function(){
          //var windowWidth = $("#body").width();
        /* 
          $("#rob1").hover(
            function(){
              $(this).css("background-color","#0ACC22");
              },
            function(){
               $(this).css("background-color","#e82827");
              });
              */
              
          $("#rob1").on("vmousedown",function() {
        	  $(this).css("background-color","#910202");
                          });
          $("#rob1").on("vmouseup",function() {
        	  $("#rob1").css("background-color","#e82827");
        	  /*
        	  setTimeout(function(){
                $("#rob1").css("background-color","#e82827");
			                  },600);
              */
                          });
          

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