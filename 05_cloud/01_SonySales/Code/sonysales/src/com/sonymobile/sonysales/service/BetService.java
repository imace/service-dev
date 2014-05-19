package com.sonymobile.sonysales.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.sonymobile.sonysales.dao.BetDAO;
import com.sonymobile.sonysales.dao.UserDAO;
import com.sonymobile.sonysales.model.Bet;
import com.sonymobile.sonysales.model.User;
import com.sonymobile.sonysales.util.ResultMsg;

public class BetService {

	// add bet
	public static Map<?, ?> addBet(Bet bet) {
		Map<?, ?> retMsg = ResultMsg.ParameterError();

		if (bet != null && bet.getBetPoints() > 0) {

			User user = UserDAO.getUserById(bet.getUserId());
			long points = 0;
			if (user != null) {
				points = user.getPoints();
			}
			long remainderPoint = points - bet.getBetPoints();
			if (remainderPoint < 0) {
				// points not enough
				retMsg = ResultMsg.PointsNotEnoughError();
			} else {
				Date date = new Date();
				SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmm");
				String now = df.format(date);
				bet.setCreateTime(now);
				// add bet
				if (BetDAO.addBet(bet)) {
					user.setPoints(remainderPoint);
					// update points
					if (UserDAO.updateUser(user)) {
						retMsg = ResultMsg.SuccessInfo();
					} else {
						retMsg = ResultMsg.FailInOperatingDBError("updateUser");
					}
				} else {
					retMsg = ResultMsg.FailInOperatingDBError("addBet");
				}
			}
		}
		return retMsg;
	}
}
