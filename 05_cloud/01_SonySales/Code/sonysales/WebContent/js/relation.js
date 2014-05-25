/**
 * author: Nie, Kevin
 * Function: for 2 relation page 
 */

(function() {
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideToolbar');
	});
})();
jQuery(function() {
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
});