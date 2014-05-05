package com.sonymobile.sonyfifa.util;

public final class Constant {
	public static final String APP_ID = "wxe2fed806213159c7";

	public static final String APP_SECRET = "24151f5740661c0afafd8f8145ce2061";

	public static final String HOST = "http://sonyfifa.sinaapp.com";
	
	public static final String WECHAT_OAUTH_REDIRECT_PATH = "/jsp/relationpage";
	
	public static final String WECHAT_GET_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token";

	public static final String WECHAT_GET_USER_INFO_URL = "https://api.weixin.qq.com/cgi-bin/user/info";

	public static final String WECHAT_OAUTH2_AUTHORIZE_URL = "https://open.weixin.qq.com/connect/oauth2/authorize";
	
	public static final String WECHAT_OAUTH2_ACCESSTOKEN_URL = "https://api.weixin.qq.com/sns/oauth2/access_token";

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

	public static final String WECHAT_OAUTH_POPULARITY_STATE = "SONY_POPULARITY";
	
	public static final String WECHAT_OAUTH_GROUP_BUY_STATE = "SONY_GROUP_BUY";

	public static final String WECHAT_OAUTH_EXTRA_STRING = "#wechat_redirect";
	

}
