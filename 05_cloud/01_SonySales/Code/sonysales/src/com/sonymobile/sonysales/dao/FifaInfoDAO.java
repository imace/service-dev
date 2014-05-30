package com.sonymobile.sonysales.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.sonymobile.sonysales.model.FifaInfo;
import com.sonymobile.sonysales.model.HibernateUtil;

public class FifaInfoDAO {

	public static boolean addFifaInfo(FifaInfo fifaInfo) {
		boolean ret = false;
		HibernateUtil hibernateUtil = new HibernateUtil();

		if (fifaInfo != null && hibernateUtil != null) {
			Date date = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmm");
			String now = df.format(date);
			fifaInfo.setCreateTime(now);
			ret = hibernateUtil.addObject(fifaInfo);
		}
		return ret;
	}

	public static FifaInfo getLatestFifaInfo() {
		HibernateUtil hibernateUtil = new HibernateUtil();

		String hql = "from FifaInfo p order by p.createTime desc";

		List<?> lst = hibernateUtil.getListByHql(hql, null, 0, 0);

		if (lst == null || lst.size() == 0) {
			return null;
		}

		return (FifaInfo) lst.get(0);
	}
}
