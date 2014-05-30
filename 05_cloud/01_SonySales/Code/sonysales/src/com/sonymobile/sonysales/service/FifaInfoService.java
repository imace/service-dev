package com.sonymobile.sonysales.service;

import java.util.Map;

import com.sonymobile.sonysales.dao.FifaInfoDAO;
import com.sonymobile.sonysales.model.FifaInfo;
import com.sonymobile.sonysales.util.ResultMsg;

public class FifaInfoService {

	public static Map<?, ?> addFifaInfo(String info) {
		Map<?, ?> retMsg = null;

		if (info != null) {
			FifaInfo fifaInfo = new FifaInfo();
			if (fifaInfo != null) {
				fifaInfo.setInfo(info);
				if (FifaInfoDAO.addFifaInfo(fifaInfo)) {
					retMsg = ResultMsg.SuccessInfo();
				}
			}
		}

		return retMsg;
	}

	// get the latest fifa info
	public static FifaInfo getLatestFifaInfo() {
		return FifaInfoDAO.getLatestFifaInfo();
	}
}
