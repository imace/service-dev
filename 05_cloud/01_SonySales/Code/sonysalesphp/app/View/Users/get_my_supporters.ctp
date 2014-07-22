<!-- File: /app/View/Users/index.ctp -->

<?php echo $this->Html->css('list.css');?>
<body class="base_font_size">

    <div id="title" class="text_header"
        style="margin-left: 2%; margin-top: 0.7em;">索尼世界杯好友支持列表</div>

    <div id="pop_div" style="padding-top: 0.1em; margin-left: 2%">
        <div id="pop_title"
            style="height: 4em; text-align: left; float: left">
            <div class="text_subHeader"
                style="padding-top: 1.2em; padding-right: 30px">支持我的好友</div>
        </div>
        <div id="pop_image"
            style="height: 4em; text-align: right; float: right; margin-right: 13px">
            <div>
                <img src="../img/ranking1.png"
                    style="height: 4em; float: left; margin-left: 10px;" />
            </div>
        </div>
    </div>

    <div id="poplist_div">
        <div id="poplist_div1">
            <table id="pop_table1" style="max-width: 100%; width: 100%;"
                cellSpacing=0 cellPadding=0 align=center border=1>
                       <?php foreach ($mySupporters as $mySupporter): ?>
					    <tr>
					        <td class="col1"><?php echo $mySupporter['Supporter']['nickname']; ?></td>
					        <td class="overText col2">
					            <?php echo $mySupporter['Popularity']['createTime'];?>
					        </td>
					    </tr>
					    <?php endforeach; ?>
                        <tr>
                            <td id="pop_point_td" colspan=3
                                style="display: none;text-align: center; border-top: medium none;"><div
                                    style="font-size: 1em">
                                    <font style="color: rgb(128, 124, 115)">人气排名获大奖，</font><font
                                        style="color: #e82827">猛点下面按钮！</font>
                                </div></td>
                        </tr>
                        </table>
            
        </div>
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
