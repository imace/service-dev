package com.sonymobile.sonysales.entity;

import com.sonymobile.sonysales.entity.json.WechatUserInfo;

public interface IWechatInfo {
	/**
	 * Get the appid of the public Wechat account
	 * */
	public String getAppId();

	/**
	 * Get the appsecret of the public Wechat account
	 * */
	public String getAppSecret();

	/**
	 * Get the Wechat user infomation via the openid
	 * 
	 * @param openid
	 *            the user's openid for the public Wechat account
	 * 
	 * @return the user's information
	 * */
	public WechatUserInfo getWebChatUserInfo(String OpenId);
}
