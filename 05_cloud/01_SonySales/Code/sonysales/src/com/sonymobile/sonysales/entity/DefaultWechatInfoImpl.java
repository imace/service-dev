package com.sonymobile.sonysales.entity;

import com.sonymobile.sonyfifa.util.Constant;

public class DefaultWechatInfoImpl implements IWechatInfo {

	public String getAppId() {
		return Constant.APP_ID;
	}

	public String getAppSecret() {
		return Constant.APP_SECRET;
	}

}
