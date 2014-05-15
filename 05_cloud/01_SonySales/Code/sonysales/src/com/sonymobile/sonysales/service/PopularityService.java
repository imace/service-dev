package com.sonymobile.sonysales.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.sonymobile.sonysales.dao.PopularityDAO;
import com.sonymobile.sonysales.dao.UserDAO;
import com.sonymobile.sonysales.model.HibernateUtil;
import com.sonymobile.sonysales.model.Popularity;
import com.sonymobile.sonysales.model.User;
import com.sonymobile.sonysales.util.ResultMsg;

public class PopularityService {

	public static Map<?, ?> addUser(User user) {
		Map<?, ?> retMsg = null;
		String openId = user.getOpenId();
		String jdId = user.getJdId();

		if (openId == null || openId.length() == 0) {
			retMsg = ResultMsg.OpenIDIsNull();
		} else if (UserDAO.ExistOpenIdInUser(openId)) {
			retMsg = ResultMsg.OpenIDExistsError();
		} else if (jdId != null && jdId.length() > 0
				&& UserDAO.ExistJdIdInUser(jdId)) {
			retMsg = ResultMsg.JdIDExistsError();
		} else if (UserDAO.addUser(user)) {
			retMsg = ResultMsg.SuccessInfo();
		} else {
			retMsg = ResultMsg.FailInOperatingDBError("addUser");
		}

		return retMsg;
	}

	public static Map<?, ?> addPopularity(String ownerOpenId,
			String supporterOpenId) {
		Map<?, ?> retMsg = null;

		HibernateUtil hibernateUtil = new HibernateUtil();
		if (hibernateUtil != null) {
			User ownerUser = UserDAO.getUserByOpenId(ownerOpenId);
			User supporterUser = UserDAO.getUserByOpenId(supporterOpenId);

			// add Popularity
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

				if (PopularityDAO.ExistRecordInPopularity(popularity)) {
					retMsg = ResultMsg.SameRecordExistInTable("popularity");
				} else if (PopularityDAO.addPopularity(popularity)) {
					// popularity + 1
					ownerUser.setPoints(ownerUser.getPoints() + 1);
					if (UserDAO.updateUser(ownerUser)) {
						retMsg = ResultMsg.SuccessInfo();
					} else {
						retMsg = ResultMsg.FailInOperatingDBError("updateUser");
					}

				} else {
					retMsg = ResultMsg.FailInOperatingDBError("addPopularity");
				}
			}

		}
		return retMsg;
	}

}
