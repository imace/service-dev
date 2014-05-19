package com.sonymobile.sonysales.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.sonymobile.sonysales.dao.MatchDAO;
import com.sonymobile.sonysales.model.Match;

public class MatchService {

	// add match
	public static boolean addMatch(Match match) {

		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmm");
		String now = df.format(date);

		match.setCreateTime(now);
		return MatchDAO.addMatch(match);
	}

	// get today's match
	public static Match getTodayMatch() {

		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		String now = df.format(date);

		return MatchDAO.getMatchByTime(now);
	}

	// update match
	public static boolean updateMatch(Match match) {

		return MatchDAO.updateMatch(match);
	}
}
