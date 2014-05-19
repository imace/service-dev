package com.sonymobile.sonysales.dao;

import java.util.ArrayList;
import java.util.List;

import com.sonymobile.sonysales.model.HibernateUtil;
import com.sonymobile.sonysales.model.Match;

public class MatchDAO {

	public static boolean addMatch(Match match) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		return hibernateUtil.addObject(match);
	}

	public static boolean updateMatch(Match match) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		return hibernateUtil.updateObject(match);
	}

	public static Match getMatchByTime(String startTime) {
		HibernateUtil hibernateUtil = new HibernateUtil();

		ArrayList<String> columnName = new ArrayList<String>();
		columnName.add("startTime");
		ArrayList<Object> columeValue = new ArrayList<Object>();
		columeValue.add(startTime);
		List<?> list = hibernateUtil.getObjectByColumnName(Match.class,
				columnName, columeValue);

		if (list == null || list.size() == 0) {
			return null;
		}

		return (Match) list.get(0);
	}
}
