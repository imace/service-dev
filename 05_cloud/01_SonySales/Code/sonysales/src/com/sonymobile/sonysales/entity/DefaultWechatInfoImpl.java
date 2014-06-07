package com.sonymobile.sonysales.entity;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

import com.sonymobile.sonysales.entity.json.SaeFetchUrlResult;
import com.sonymobile.sonysales.entity.json.WechatUserInfo;
import com.sonymobile.sonysales.util.Coder;
import com.sonymobile.sonysales.util.Constant;
import com.sonymobile.sonysales.util.HttpConnetcion;
import com.sonymobile.sonysales.util.JSONConverter;

public class DefaultWechatInfoImpl implements IWechatInfo {
	private static DefaultWechatInfoImpl instance = new DefaultWechatInfoImpl();

	private static Logger logger = Logger.getLogger(DefaultWechatInfoImpl.class.getName());

	private DefaultWechatInfoImpl() {

	}

	public static DefaultWechatInfoImpl getInstance() {
		return instance;
	}

	@Override
	public String getAppId() {
		return Constant.APP_ID;
	}

	@Override
	public String getAppSecret() {
		return Constant.APP_SECRET;
	}

	@Override
	public WechatUserInfo getWebChatUserInfo(String openId) {
		WechatUserInfo weChatUserInfo = new WechatUserInfo();
		String url = buildGetUserInfoUrl(openId);
		SaeFetchUrlResult result = HttpConnetcion.saeHttpGetRequest(url);
		if (result.getErrNumber() == Constant.SAE_FETCHURL_SUCCESS_CODE) {
			JSONObject jsonObject = JSONConverter.convertString2JSONObject(result.getBody());
			if (jsonObject != null) {
				weChatUserInfo = (WechatUserInfo) JSONObject.toBean(jsonObject,
						WechatUserInfo.class);
				if (weChatUserInfo !=  null) {
					String nickName = weChatUserInfo.getNickname();
					if (nickName == null || nickName.isEmpty()) {
						logger.warn("Get User("+openId+") info error : " + result.getBody());
					}
				}
			}
		} else {
			logger.warn("HTTP connection error : " + result.toString());
		}

		return weChatUserInfo;
	}
	
	private static String buildGetUserInfoUrl(String openId) {
		StringBuilder urlBuilder = new StringBuilder(Constant.MASTER_ACCOUNT_HOST);
		urlBuilder.append(Constant.MASTER_ACCOUNT_GETUSERINFO_PATH);
		urlBuilder.append("?id=");
		urlBuilder.append(openId);
		urlBuilder.append("&t=");
		long timestamp = System.currentTimeMillis();
		urlBuilder.append(timestamp);
		urlBuilder.append("&s=");
		String signature = Coder.getMD5Signature(Long.toString(timestamp), GET_USERINFO_IDENTIFIER, openId);
		urlBuilder.append(signature);
		
		return urlBuilder.toString();
	}

	/**
	 * Test for get userinfo links
	 * */
	public static void main(String[] args) {
		// Openid on LICHENGKONGJIAN
		String id = "omX94t-Yl0_GJikv-kLuQzUcm3OE";
		System.out.println(buildGetUserInfoUrl(id));
	}
}
