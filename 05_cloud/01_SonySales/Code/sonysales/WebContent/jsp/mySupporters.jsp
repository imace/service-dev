<%@page import="com.sonymobile.sonysales.util.Constant"%>
<%@page import="com.sonymobile.sonysales.model.User"%>
<%@page import="com.sonymobile.sonysales.entity.Supporter"%>
<%@page import="com.sonymobile.sonysales.util.DateUtil"%>
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
<title>有谁支持我</title>
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
    width:14%;
}
.col2{
    width:38%;
}
.col3{
    width:48%;
}

.overText{
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
#poplist_div {
    overflow: auto;
    height: 36em;
    border-top-width: 0.3em;
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
        Logger logger = Logger.getLogger(com.sonymobile.sonysales.servlet.popularityServlet.GetMySupporters.class.getName());
        List<Supporter> mySupporters = null;
        String openId = null;
        try{
            mySupporters = (List<Supporter>)request.getAttribute("mySupporters");
            if (mySupporters != null) {
                logger.debug("mySupporters.jsp->mySupporters size is "+ mySupporters.size());
            } else {
                logger.debug("mySupporters.jsp->mySupporters is null");
            }
            openId = (String)request.getAttribute("openId");

        }
        catch (Exception e) {
            logger.error("mySupporters.jsp->front-end-page in exception : " + e.getMessage());
            response.sendRedirect(request.getContextPath()+"/jsp/errorhandler.jsp?errnum=0101&errmsg="+e.getMessage());
        }
    %>
                <%
                if (DateUtil.isEnd()) {
                %>
    <div id="title" class="text_header"
        style="margin-left: 2%; margin-top: 0.7em;">索尼世界杯好友支持列表(<font style="color: #e82827">活动已结束</font>)</div>
                  <%
                    } else {
                %>
                    <div id="title" class="text_header"
        style="margin-left: 2%; margin-top: 0.7em;">索尼世界杯好友支持列表</div>
                <%
                    }
                %>
    <div id="pop_div" style="padding-top: 0.1em; margin-left: 2%">
        <div id="pop_title"
            style="height: 4em; text-align: left; float: left">
            <div class="text_subHeader"
                style="padding-top: 1.2em; padding-right: 30px">支持我的好友</div>
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
            <table id="pop_table1" style="max-width: 100%; width: 100%;"
                cellSpacing=0 cellPadding=0 align=center border=1>
                          <%
                  if(mySupporters!=null&&mySupporters.size()!=0) {
                        %>

                               <% 
                      for(int i=0;i<mySupporters.size();i++) {
                               %>
                             <tr>
                                 <td class="col1"><%=i+1%></td>
                                 <td class="overText col2"><%=mySupporters.get(i).getNickname()%></td>
                                 <td class="overText col3"><%=DateUtil.toFormalDateStr(mySupporters.get(i).getCreateTime())%></td>
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
             <table style="max-width: 100%; width: 100%;"
                cellSpacing=0 cellPadding=0 align=center border=1>
                <tr>
                    <td style="text-align: center; border-top: medium none;border-top:none;height:22em"><div
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
    </div>
    <div id="rob1"  data-openId="<%=openId %>" data-pageName="7" data-operation="20" data-host="<%=request.getScheme()%>://<%=request.getServerName()%>" class="loghandler"
        style="border-radius:4px; max-width: 95%; margin-bottom: 1em; margin-left: 2.5%; margin-top: 1em; height: 5em; text-align: center; border: 1px solid #d9d9d9; background-color: #e82827;"
        onclick="window.location.href='<%=request.getScheme() + "://" + request.getServerName()%>/activitypage?id=<%=openId%>'">
        <div style="font-size: 1.8em; color: white; margin-top: 0.85em">拉人气</div>
    </div>


   

    <script type="text/javascript">  
    var poplist_div1=document.getElementById("poplist_div1");  
    var poplist_div=document.getElementById("poplist_div"); 
    var pop_point_td=document.getElementById("pop_point_td"); 
    
    window.onload = function() {
       if((poplist_div.offsetHeight-poplist_div1.offsetHeight)>30){
            //var text = 'before poplist_div1.offsetHeight:' + poplist_div1.offsetHeight + ' poplist_div.offsetHeight:' + poplist_div.offsetHeight + ' pop_point_td.offsetHeight:'+pop_point_td.offsetHeight+ ' pop_top_img.offsetHeight:'+pop_top_img.offsetHeight;  
           // document.getElementById("beforeresult").innerHTML = text;
            
            $("#pop_point_td").css("height", (poplist_div.offsetHeight-poplist_div1.offsetHeight-10)+"px");
            document.getElementById("pop_point_td").style.display="";
            //var text = ' poplist_div1.offsetHeight:' + poplist_div1.offsetHeight + ' poplist_div.offsetHeight:' + poplist_div.offsetHeight + ' pop_point_td.offsetHeight:'+pop_point_td.offsetHeight+ ' pop_top_img.offsetHeight:'+pop_top_img.offsetHeight;    
            //document.getElementById("result").innerHTML = text; 
            }
    }
      $(document).ready(function(){

              
          $("#rob1").on("vmousedown",function() {
              $(this).css("background-color","#910202");
                          });
          $("#rob1").on("vmouseup",function() {
              $("#rob1").css("background-color","#e82827");
                          });
          
          });

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