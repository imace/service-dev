package com.sonymobile.sonysales.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.log4j.Logger;

public final class Constant {
	private static Logger logger = Logger.getLogger(Constant.class);
	private static Properties properties = new Properties();
	
	public static final String HOST;
	public static final String APP_ID;
	public static final String APP_SECRET;

	public static final String MASTER_ACCOUNT_HOST;
	public static final String MASTER_ACCOUNT_GETUSERINFO_PATH;
	public static final int FEEDBACK_SINGLE_MONEY;
    
    static {
        InputStream is = ConfigReader.class.getClassLoader()
                .getResourceAsStream("config.properties");
        try {
            properties.load(is);
        } catch (IOException e) {
        	logger.fatal("Constant load config.properties error : ");
            e.printStackTrace();
        }

        HOST = properties.getProperty("HOST");
		APP_ID = properties.getProperty("APP_ID");
		APP_SECRET = properties.getProperty("APP_SECRET");
		
		MASTER_ACCOUNT_HOST = properties.getProperty("MASTER_ACCOUNT_HOST");
		MASTER_ACCOUNT_GETUSERINFO_PATH = properties.getProperty("MASTER_ACCOUNT_GETUSERINFO_PATH");
		
		FEEDBACK_SINGLE_MONEY = Integer.parseInt(properties.getProperty("FEEDBACK_SINGLE_MONEY"));
	}

	public static final int SAE_FETCHURL_SUCCESS_CODE = 0;
	

	/**
	 * The infomation of Wechat OAUTH
	 * */ 
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
