package com.sonymobile.sonysales.util;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.sonymobile.sonysales.entity.DefaultWechatInfoImpl;
import com.sonymobile.sonysales.entity.json.WechatUserInfo;
import com.sonymobile.sonysales.model.User;
import com.sonymobile.sonysales.service.PopularityService;

import net.sf.json.JSONObject;

public final class Common {
	private static Logger logger = Logger.getLogger(Common.class.getName());
	
	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("http_client_ip");
		}

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}

		// first ip
		if (ip != null && ip.indexOf(",") != -1) {
			ip = ip.substring(ip.lastIndexOf(",") + 1, ip.length()).trim();
		}

		return ip;
	}

	public static boolean addUser(WechatUserInfo info) {
		try {
			String openId = info.getOpenid();
			User user = PopularityService.getUserByOpenId(openId);
			if (user == null) {
				user = new User();
				user.setOpenId(openId);
			}
			String nickName = info.getNickname();
			if (nickName != null && !nickName.isEmpty()) {
				user.setNickname(nickName);
			}
			user.setFocusFlag(info.getSubscribe());
			user.setUpdateTime(DateUtil.getCurrentDateTime());
			long subscribeTime = info.getSubscribe_time();
			if (subscribeTime != 0) {
				String focusTime = DateUtil.convertLongToString(subscribeTime);
				user.setFocusTime(focusTime);
			}
			PopularityService.addUser(user);
			return true;
		} catch (Exception e) {
			logger.error("Common->AddUser() in exception : " + e.getMessage());
			return false;
		}
	}
	
	public static void updateUserLoginTime(String openId) {
		User user = PopularityService.getUserByOpenId(openId);
		if (user == null) {
			WechatUserInfo info = DefaultWechatInfoImpl.getInstance().getWebChatUserInfo(openId);
			addUser(info);
		} else {
			user.setUpdateTime(DateUtil.getCurrentDateTime());
			PopularityService.addUser(user);
		}
	}

	public static void printObjectAsJson(Object obj) {
		JSONObject jo = JSONObject.fromObject(obj);
		logger.info("~~~~~~~~" + obj.getClass().getName() + " is :"
				+ jo.toString() + "~~~~~~~~");
	}
}
