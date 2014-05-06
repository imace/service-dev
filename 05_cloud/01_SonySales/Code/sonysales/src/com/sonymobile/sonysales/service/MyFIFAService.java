package com.sonymobile.sonysales.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.sonymobile.sonysales.model.HibernateUtil;
import com.sonymobile.sonysales.model.User;
import com.sonymobile.sonysales.model.Popularity;
import com.sonymobile.sonysales.util.ResultMsg;

public class MyFIFAService {

	public String getUser(String openId) {

		HibernateUtil hibernateUtil = new HibernateUtil();

		return JSONArray.fromObject(hibernateUtil.getUserByOpenId(openId))
				.toString();
	}

	public String addUser(User user) {
		Map retMsg = null;

		HibernateUtil hibernateUtil = new HibernateUtil();
		if (hibernateUtil != null) {
			if (hibernateUtil.ExistOpenIdInUser(user.getOpenId())) {
				retMsg = ResultMsg.OpenIDExistsError();
			} else if (hibernateUtil.ExistJdIdInUser(user.getJdId())) {
				retMsg = ResultMsg.JdIDExistsError();
			} else if (hibernateUtil.addUser(user)) {
				retMsg = ResultMsg.SuccessInfo();
			} else {
				retMsg = ResultMsg.FailInOperatingDBError("addUser");
			}
		}
		return JSONObject.fromObject(retMsg).toString();
	}

	public String addPopularity(String ownerOpenId, String supporterOpenId) {
		Map retMsg = null;

		HibernateUtil hibernateUtil = new HibernateUtil();
		if (hibernateUtil != null) {
			User ownerUser = hibernateUtil.getUserByOpenId(ownerOpenId);
			User supporterUser = hibernateUtil.getUserByOpenId(supporterOpenId);

			// ������������������
			if (ownerUser == null) {
				retMsg = ResultMsg.OwnerOpenIDNotExistsError();
			} else if (supporterUser == null) {
				retMsg = ResultMsg.SupporterOpenIDNotExistsError();
			} else {
				Popularity popularity = new Popularity();
				
				Date date = new Date();
				SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmm");
				String now = df.format(date);
				
				popularity.setOwnerUserId(ownerUser.getId());
				popularity.setSupporterUserId(supporterUser.getId());
				
				popularity.setCreateTime(now);
				
				if (hibernateUtil.addPopularity(popularity)) {
					// ���������
					ownerUser.setPoints(ownerUser.getPoints() + 1);
					if (hibernateUtil.updateUser(ownerUser)) {
						retMsg = ResultMsg.SuccessInfo();
					} else {
						retMsg = ResultMsg.FailInOperatingDBError("updateUser");
					}

				} else {
					retMsg = ResultMsg.FailInOperatingDBError("addPopularity");
				}
			}

		}
		return JSONObject.fromObject(retMsg).toString();
	}
}
