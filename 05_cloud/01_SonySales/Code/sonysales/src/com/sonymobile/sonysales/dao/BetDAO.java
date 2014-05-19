package com.sonymobile.sonysales.dao;

import com.sonymobile.sonysales.model.Bet;
import com.sonymobile.sonysales.model.HibernateUtil;

public class BetDAO {
	public static boolean addBet(Bet bet) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		return hibernateUtil.addObject(bet);
	}

	public static boolean updateBet(Bet bet) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		return hibernateUtil.updateObject(bet);
	}
}
