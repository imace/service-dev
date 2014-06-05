/**
 * author: Nie, Kevin
 * Function: for 2 relation page 
 */

(function() {
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideToolbar');
	});
})();
$(function() {
	var tonickname = $('#tonickname');
	var personalInfo = $('#personalInfo');
	var supportFriend = $('#supportFriend');
	if (tonickname.text().indexOf('我') >= 0||tonickname.text().indexOf('null') >= 0) {
		/*personalInfo.show();
		supportFriend.hide();*/
		personalInfo.hide();
		supportFriend.show();
	} else {
		personalInfo.hide();
		supportFriend.show();
	}
	
    $('.loghandler').click(function () {
    	var openId = $(this).attr('data-openId');
    	var pageName = $(this).attr('data-pageName');
    	var operation = $(this).attr('data-operation');
    	var host = $(this).attr('data-host');
    	var requrl=host+'/AddLog?openId='+openId+'&pageName='+pageName+'&operation='+operation;
    	alert(requrl);
    	LogHandler(requrl);
    });
    
    function LogHandler(url){
    	QAjax(url, {});
    }
		
	
	function QAjax(url, para, successHandler, errorHandler) {
        if (typeof (para) === "object")
            para = JSON.stringify(para);

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            dataType: "text",
            url: url,
            data: para,
            success: function (data) {
                data = JSON.parse(data);
                var res = data;
                if (res.hasOwnProperty("d")) {
                    res = res.d;
                }
                if (typeof (res) !== "object") {
                    res = data;
                }
                else {
                    if (res.ReturnCode == 0) {
                        res = res.Data;
                    }
                    else if (res.ReturnCode == 4) {
                        LoginFirst();
                        return;
                    }
                }
                if (successHandler != undefined)
                    successHandler(res);
            },
            error: function (xhr, status, error) {
                if (errorHandler == undefined) {
                    var data = eval("(" + xhr.responseText + ")");
                    DisplayError(data.Message);
                }
                else
                    errorHandler(xhr, status, error);
            }
        });
    }
	
});