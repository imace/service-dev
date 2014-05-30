package com.sonymobile.sonysales.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sonymobile.sonysales.model.HibernateUtil;
import com.sonymobile.sonysales.model.OrderHistory;

public class OrderHistoryDAO {

	public static OrderHistory getOrderHistoryByOrderNum(String orderNum) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		ArrayList<String> columnName = new ArrayList<String>();
		columnName.add("orderNum");
		ArrayList<Object> columeValue = new ArrayList<Object>();
		columeValue.add(orderNum);
		List<?> list = hibernateUtil.getObjectByColumnName(OrderHistory.class,
				columnName, columeValue);

		if (list == null || list.size() == 0) {
			return null;
		}

		return (OrderHistory) list.get(0);
	}

	public static boolean ExistOrderNumInOrderHistory(String orderNum) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		ArrayList<String> columnName = new ArrayList<String>();
		columnName.add("orderNum");
		ArrayList<Object> columeValue = new ArrayList<Object>();
		columeValue.add(orderNum);
		List<?> list = hibernateUtil.getObjectByColumnName(OrderHistory.class,
				columnName, columeValue);

		return list != null && list.size() > 0;
	}

	public static boolean addOrderHistory(OrderHistory orderHistory) {
		boolean ret = false;
		HibernateUtil hibernateUtil = new HibernateUtil();

		if (orderHistory != null && hibernateUtil != null) {
			Date date = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmm");
			String now = df.format(date);
			orderHistory.setCreateTime(now);
			ret = hibernateUtil.addObject(orderHistory);
		}
		return ret;
	}

	public static boolean ValidOrderNum(String supporterOrderNum) {
		OrderHistory order = getOrderHistoryByOrderNum(supporterOrderNum);

		return order != null && order.getValidOrder() > 0;
	}

	public static boolean CashFlagMarked(String supporterOrderNum) {
		OrderHistory order = getOrderHistoryByOrderNum(supporterOrderNum);

		return order != null && order.getCashFlag() > 0;
	}

	public static boolean updateOrderHistory(String orderNum, String parentOrderNum, int cashFlag) {
		boolean ret = false;
		OrderHistory order = getOrderHistoryByOrderNum(orderNum);
		if (order != null) {
			order.setCashFlag(cashFlag);
			order.setParentOrderNum(parentOrderNum);
			HibernateUtil hibernateUtil = new HibernateUtil();
			ret = hibernateUtil.updateObject(order);
		}
		return ret;
	}
}
