package com.sonymobile.sonysales.entity;

import org.apache.log4j.Logger;

import net.sf.json.JSONObject;

import com.sonymobile.sonysales.entity.json.SaeFetchUrlResult;
import com.sonymobile.sonysales.entity.json.WechatUserInfo;
import com.sonymobile.sonysales.util.Constant;
import com.sonymobile.sonysales.util.HttpConnetcion;

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

		StringBuilder urlBuilder = new StringBuilder(Constant.MASTER_ACCOUNT_HOST);
		urlBuilder.append(Constant.MASTER_ACCOUNT_GETUSERINFO_PATH);
		urlBuilder.append("?id=");
		urlBuilder.append(openId);
		SaeFetchUrlResult result = HttpConnetcion.saeHttpGetRequest(urlBuilder.toString());
		if (result.getErrNumber() == Constant.SAE_FETCHURL_SUCCESS_CODE) {
			JSONObject jsonObject = JSONObject.fromObject(result.getBody());
			weChatUserInfo = (WechatUserInfo) JSONObject.toBean(jsonObject,
					WechatUserInfo.class);
			String nickName = weChatUserInfo.getNickname();
			if (nickName == null || nickName.isEmpty()) {
				logger.warn("Get User("+openId+") info error : " + result.getBody());
			}
		} else {
			logger.warn("HTTP connection error : " + result.toString());
		}

		return weChatUserInfo;
	}

}
