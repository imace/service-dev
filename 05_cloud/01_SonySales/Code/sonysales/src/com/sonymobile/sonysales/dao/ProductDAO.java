package com.sonymobile.sonysales.dao;

import java.util.List;

import com.sonymobile.sonysales.model.HibernateUtil;

public class ProductDAO {
	public static List<?> getProductList() {
		HibernateUtil hibernateUtil = new HibernateUtil();

		String hql = "from Product p order by p.createTime desc";

		return hibernateUtil.getListByHql(hql, null, 0, 0);
	}
}
