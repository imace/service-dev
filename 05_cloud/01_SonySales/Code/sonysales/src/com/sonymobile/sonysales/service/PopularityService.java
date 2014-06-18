package com.sonymobile.sonysales.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.sonymobile.sonysales.dao.PopularityDAO;
import com.sonymobile.sonysales.dao.UserDAO;
import com.sonymobile.sonysales.model.HibernateUtil;
import com.sonymobile.sonysales.model.Popularity;
import com.sonymobile.sonysales.model.User;
import com.sonymobile.sonysales.util.DateUtil;
import com.sonymobile.sonysales.util.ResultMsg;

public class PopularityService {
	private static final Logger logger = Logger.getLogger(PopularityService.class); 

	public static Map<?, ?> addUser(User user) {
		Map<?, ?> retMsg = null;
		String openId = user.getOpenId();
		String jdId = user.getJdId();

		if (openId == null || openId.length() == 0) {
			retMsg = ResultMsg.OpenIDIsNull();
		} else if (UserDAO.ExistOpenIdInUser(openId)) {
			if (UserDAO.updateUser(user)) {
				retMsg = ResultMsg.UpdateUserInfoSuccess();
			} else {
				retMsg = ResultMsg.UpdateUserInfoError();
			}
		} else if (jdId != null && jdId.length() > 0
				&& UserDAO.ExistJdIdInUser(jdId)) {
			retMsg = ResultMsg.JdIDExistsError();
		} else if (UserDAO.addUser(user)) {
			retMsg = ResultMsg.SuccessInfo();
		} else {
			retMsg = ResultMsg.FailInOperatingDBError("addUser");
		}

		logger.debug("PopularityService.addUser retMsg :　CODE=" + retMsg.get(ResultMsg.RESULT_CODE_KEY)+", DESCRIPTION=" + retMsg.get(ResultMsg.RESULT_CODE_DESCRIPTION));
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
					ownerUser.setUpdateTime(DateUtil.getCurrentDateTime());
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

		logger.debug("PopularityService.addPopularity retMsg :　CODE=" + retMsg.get(ResultMsg.RESULT_CODE_KEY)+", DESCRIPTION=" + retMsg.get(ResultMsg.RESULT_CODE_DESCRIPTION));
		return retMsg;
	}

	   // 获取我的人气好友列表
    public static List<?> getMySupporters(String openId) {
        return PopularityDAO.getMySupporters(openId);
	}

	public static User getUserByOpenId(String openId) {
		return UserDAO.getUserByOpenId(openId);
    }
}
