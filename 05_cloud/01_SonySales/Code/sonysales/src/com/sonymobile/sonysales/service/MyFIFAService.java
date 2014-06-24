package com.sonymobile.sonysales.service;

import java.util.List;
import java.util.Map;

import com.sonymobile.sonysales.dao.BlacklistDAO;
import com.sonymobile.sonysales.dao.HandleDAO;
import com.sonymobile.sonysales.dao.UserDAO;
import com.sonymobile.sonysales.model.User;
import com.sonymobile.sonysales.util.ResultMsg;

public class MyFIFAService {

	// 获取我的人气及排名
	public static List<?> getPointsOrder(String openId) {
		return UserDAO.getPointsOrder(openId);
	}

	// 获取我的拉友支持列表
	public static List<?> getSupporters(String openId) {
		return HandleDAO.getSupporters(openId);
	}

	// 更新用户基本信息
	public static Map<?, ?> updateUser(String openId, String phoneNum,
			String email, String address, String jdId) {

		Map<?, ?> retMsg = null;
		if (openId == null) {
			retMsg = ResultMsg.OpenIDIsNull();
		} else {
			User user = UserDAO.getUserByOpenId(openId);
			if (user != null) {
				if (phoneNum != null && phoneNum.length() > 0) {
					user.setPhoneNum(phoneNum);
				}
				if (email != null && email.length() > 0) {
					user.setEmail(email);
				}
				if (address != null && address.length() > 0) {
					user.setAddress(address);
				}
				if (jdId != null && jdId.length() > 0) {
					user.setJdId(jdId);
				}

				if (UserDAO.updateUser(user)) {
					retMsg = ResultMsg.SuccessInfo();
				} else {
					retMsg = ResultMsg.FailInOperatingDBError("updateUser");
				}
			} else {
				retMsg = ResultMsg.FailInOperatingDBError("getUserByOpenId");
			}
		}
		return retMsg;
	}

	public static User getUserByOpenId(String openId) {
		return UserDAO.getUserByOpenId(openId);
	}
	
	public static boolean isInBlacklist(String openId) {
		if(openId==null) {
			return false;
		}
		User user = getUserByOpenId(openId);
		if(user==null) {
			return false;
		}
		return BlacklistDAO.isInBlacklist(user.getId());
	}
}
