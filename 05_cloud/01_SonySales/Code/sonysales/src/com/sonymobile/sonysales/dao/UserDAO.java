package com.sonymobile.sonysales.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sonymobile.sonysales.model.HibernateUtil;
import com.sonymobile.sonysales.model.User;

public class UserDAO {

	public static List<?> getUserList(String limit, String orderby) {
		HibernateUtil hibernateUtil = new HibernateUtil();

		String hql = "from User u where u.points>0 order by u." + orderby
				+ " desc, u.createTime, u.openId ";

		int maxResults = 0;
		try {
			maxResults = Integer.parseInt(limit);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hibernateUtil.getListByHql(hql, null, 0, maxResults);
	}

	public static List<?> getPointsOrder(String openId) {
		HibernateUtil hibernateUtil = new HibernateUtil();

		String hql = "select new com.sonymobile.sonysales.entity.PointsOrder(u2.nickname,u2.focusFlag,u2.phoneNum,u2.email,u2.address,u2.jdId,u2.points,u2.focusTime,u2.createTime, (select count(*) from User u1 where u1.points>u2.points or (u1.points=u2.points and u1.createTime < u2.createTime) or (u1.points=u2.points and u1.createTime = u2.createTime and u1.openId <= u2.openId))) from User u2 where u2.openId='"
				+ openId + "'";

		return hibernateUtil.getListByHql(hql, null, 0, 0);
	}

	public static boolean addUser(User user) {
		boolean ret = false;

		HibernateUtil hibernateUtil = new HibernateUtil();

		if (user != null && hibernateUtil != null) {
			Date date = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmm");
			String now = df.format(date);
			user.setCreateTime(now);
			ret = hibernateUtil.addObject(user);
		}
		return ret;
	}

	public static boolean updateUser(User user) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		return hibernateUtil.updateObject(user);
	}

	public static User getUserById(long id) {
		HibernateUtil hibernateUtil = new HibernateUtil();

		ArrayList<String> columnName = new ArrayList<String>();
		columnName.add("id");
		ArrayList<Object> columeValue = new ArrayList<Object>();
		columeValue.add(id);
		List<?> list = hibernateUtil.getObjectByColumnName(User.class,
				columnName, columeValue);

		if (list == null || list.size() == 0) {
			return null;
		}

		return (User) list.get(0);
	}

	public static User getUserByOpenId(String openId) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		ArrayList<String> columnName = new ArrayList<String>();
		columnName.add("openId");
		ArrayList<Object> columeValue = new ArrayList<Object>();
		columeValue.add(openId);
		List<?> list = hibernateUtil.getObjectByColumnName(User.class,
				columnName, columeValue);

		if (list == null || list.size() == 0) {
			return null;
		}

		return (User) list.get(0);
	}

	public static boolean ExistOpenIdInUser(String openId) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		ArrayList<String> columnName = new ArrayList<String>();
		columnName.add("openId");
		ArrayList<Object> columeValue = new ArrayList<Object>();
		columeValue.add(openId);
		List<?> list = hibernateUtil.getObjectByColumnName(User.class,
				columnName, columeValue);

		return list != null && list.size() > 0;
	}

	public static boolean ExistJdIdInUser(String jdId) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		ArrayList<String> columnName = new ArrayList<String>();
		columnName.add("jdId");
		ArrayList<Object> columeValue = new ArrayList<Object>();
		columeValue.add(jdId);
		List<?> list = hibernateUtil.getObjectByColumnName(User.class,
				columnName, columeValue);
		return list != null && list.size() > 0;
	}

	public static User getUserByJdId(String ownJdId) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		ArrayList<String> columnName = new ArrayList<String>();
		columnName.add("jdId");
		ArrayList<Object> columeValue = new ArrayList<Object>();
		columeValue.add(ownJdId);
		List<?> list = hibernateUtil.getObjectByColumnName(User.class,
				columnName, columeValue);

		if (list == null || list.size() == 0) {
			return null;
		}

		return (User) list.get(0);
	}
}