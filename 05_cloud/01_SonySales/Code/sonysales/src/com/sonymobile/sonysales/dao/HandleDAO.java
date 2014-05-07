package com.sonymobile.sonysales.dao;

import java.util.ArrayList;
import java.util.List;

import com.sonymobile.sonysales.model.Handle;
import com.sonymobile.sonysales.model.HibernateUtil;

public class HandleDAO {
	public static boolean addHandle(Handle handle) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		return hibernateUtil.addObject(handle);
	}

	public static boolean ExistRecordInHandle(Handle handle) {
		HibernateUtil hibernateUtil = new HibernateUtil();

		ArrayList<String> columnName = new ArrayList<String>();
		columnName.add("ownerUserId");
		columnName.add("supporterUserId");
		ArrayList<Object> columeValue = new ArrayList<Object>();
		columeValue.add(handle.getOwnerUserId());
		columeValue.add(handle.getSupporterUserId());
		List<Object> list = hibernateUtil.getObjectByColumnName(Handle.class,
				columnName, columeValue);
		return list.size() > 0;
	}
}