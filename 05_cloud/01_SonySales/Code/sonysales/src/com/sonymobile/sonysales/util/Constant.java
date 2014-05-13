package com.sonymobile.sonysales.util;

public final class Constant {
	// Debug with Bo's account
	public static final String APP_ID = "wxe2fed806213159c7";
	public static final String APP_SECRET = "24151f5740661c0afafd8f8145ce2061";
	// Test link
	public static final String HOST = "http://sonyfifa.sinaapp.com";

//	// Test with Pingfanghe's account 
//	public static final String APP_ID = "wxd6c996ffd460c4b7";
//	public static final String APP_SECRET = "a57f48290475ab4efd80bcfedee277c5";
//	// Release link
//	public static final String HOST = "http://sonysales.sinaapp.com";

	public static final int SAE_FETCHURL_SUCCESS_CODE = 0;
	
	public static final int FEEDBACK_SINGLE_MONEY =  50;

	public static final String MASTER_ACCOUNT_HOST = "http://1.sonyfifadev.sinaapp.com/WeChat/";
	public static final String MASTER_ACCOUNT_GETUSERINFO_PATH="getuserinfo.php";

	// The links of Wechat OAUTH links
	public static final String WECHAT_OAUTH2_AUTHORIZE_URL = "https://open.weixin.qq.com/connect/oauth2/authorize";
	public static final String WECHAT_OAUTH2_ACCESSTOKEN_URL = "https://api.weixin.qq.com/sns/oauth2/access_token";
	public static final String WECHAT_OAUTH2_USERINFO_URL = "https://api.weixin.qq.com/sns/userinfo";
	public static final String WECHAT_OAUTH_EXTRA_STRING = "#wechat_redirect";
	// The Wechat oauth scopes
	public enum WECHAT_OAUTH_SCOPES {
		BASE("snsapi_base"), USERINFO("snsapi_userinfo");

		private final String scope;

		WECHAT_OAUTH_SCOPES(String value) {
			this.scope = value;
		}

		public String getValue() {
			return scope;
		}

	};
}
