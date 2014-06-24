package com.sonymobile.sonysales.dao;

import java.util.ArrayList;
import java.util.List;

import com.sonymobile.sonysales.model.Blacklist;
import com.sonymobile.sonysales.model.HibernateUtil;

public class BlacklistDAO {

	public static boolean isInBlacklist(long userId) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		ArrayList<String> columnName = new ArrayList<String>();
		columnName.add("userId");
		ArrayList<Object> columeValue = new ArrayList<Object>();
		columeValue.add(userId);
		List<?> list = hibernateUtil.getObjectByColumnName(Blacklist.class,
				columnName, columeValue);

		return list != null && list.size() > 0;
	}

	
}