package com.sonymobile.sonysales.dao;

import java.util.ArrayList;
import java.util.List;

import com.sonymobile.sonysales.model.Handle;
import com.sonymobile.sonysales.model.HibernateUtil;

public class HandleDAO {

	public static List<?> getSupporterList(String limit) {
		HibernateUtil hibernateUtil = new HibernateUtil();

		String hql = "select new com.sonymobile.sonysales.entity.Supporter(u.nickname, count(*)) from User as u, Handle as h where u.id = h.ownerUserId group by h.ownerUserId order by 2 desc";

		int maxResults = 0;
		try {
			maxResults = Integer.parseInt(limit);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hibernateUtil.getListByHql(hql, null, 0, maxResults);
	}

	public static List<?> getSupporters(String openId) {
		HibernateUtil hibernateUtil = new HibernateUtil();

		String hql = "select u1.nickname, h.createTime from Handle as h , User as u1, User as u2 where u1.id = h.supporterUserId and u2.id = h.ownerUserId and u2.openId='"
				+ openId + "'";

		return hibernateUtil.getListByHql(hql, null, 0, 0);
	}

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
		List<?> list = hibernateUtil.getObjectByColumnName(Handle.class,
				columnName, columeValue);
		return list != null && list.size() > 0;
	}
}