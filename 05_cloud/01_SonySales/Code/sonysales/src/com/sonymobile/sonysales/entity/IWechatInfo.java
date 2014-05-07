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

	/**
	 * Request the Wechat OAuth, user should transfer the "fromid", "fromname"
	 * to the OAUTH redirect url, and the "state" stored the link which is the
	 * link redirect to while OAUTH is done. The state is coded by BASE64.
	 * Please encoded it before you call this method.<br>
	 * It will return the OAuthed user's openid & nickname as "toid"( and
	 * "toname") to "state" url.
	 * 
	 * */
	//public void requestWechatOAuth();

}
