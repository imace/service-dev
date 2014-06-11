package com.sonymobile.sonysales.dao;

import java.util.ArrayList;
import java.util.List;

import com.sonymobile.sonysales.entity.Supporter;
import com.sonymobile.sonysales.model.HibernateUtil;
import com.sonymobile.sonysales.model.Popularity;

public class PopularityDAO {

	public static boolean addPopularity(Popularity popularity) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		return hibernateUtil.addObject(popularity);
	}

	public static boolean ExistRecordInPopularity(Popularity popularity) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		ArrayList<String> columnName = new ArrayList<String>();
		columnName.add("ownerUserId");
		columnName.add("supporterUserId");
		ArrayList<Object> columeValue = new ArrayList<Object>();
		columeValue.add(popularity.getOwnerUserId());
		columeValue.add(popularity.getSupporterUserId());
		List<?> list = hibernateUtil.getObjectByColumnName(Popularity.class,
				columnName, columeValue);

		return list != null && list.size() > 0;
	}
	
  public static List<?> getMySupporters(String openId) {
        HibernateUtil hibernateUtil = new HibernateUtil();

        String hql = "SELECT new com.sonymobile.sonysales.entity.Supporter((select u1.nickname from User u1 where u1.id = p.supporterUserId),p.createTime) FROM Popularity p, User u where p.ownerUserId = u.id"
+" and u.openId='"+openId+"'  order by p.createTime desc";

        return hibernateUtil.getListByHql(hql, null, 0, 0);
    }
}
