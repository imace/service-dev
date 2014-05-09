package com.sonymobile.sonysales.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.sonymobile.sonysales.dao.HandleDAO;
import com.sonymobile.sonysales.dao.UserDAO;
import com.sonymobile.sonysales.model.Handle;
import com.sonymobile.sonysales.model.User;
import com.sonymobile.sonysales.util.ResultMsg;

public class HandleService {
	public static Map<?, ?> addHandle(String ownerOpenId, String supporterOpenId) {
		Map<?, ?> retMsg = null;

		User ownerUser = UserDAO.getUserByOpenId(ownerOpenId);
		User supporterUser = UserDAO.getUserByOpenId(supporterOpenId);

		if (ownerUser == null) {
			retMsg = ResultMsg.OwnerOpenIDNotExistsError();
		} else if (supporterUser == null) {
			retMsg = ResultMsg.SupporterOpenIDNotExistsError();
		} else {
			Handle handle = new Handle();

			Date date = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmm");
			String now = df.format(date);

			handle.setOwnerUserId(ownerUser.getId());
			handle.setSupporterUserId(supporterUser.getId());

			handle.setCreateTime(now);

			if (HandleDAO.ExistRecordInHandle(handle)) {
				retMsg = ResultMsg.SameRecordExistInTable("handle");
			} else if (HandleDAO.addHandle(handle)) {
				// success
				retMsg = ResultMsg.SuccessInfo();
			} else {
				// fail
				retMsg = ResultMsg.FailInOperatingDBError("addHandle.");
			}
		}

		return retMsg;
	}
}
