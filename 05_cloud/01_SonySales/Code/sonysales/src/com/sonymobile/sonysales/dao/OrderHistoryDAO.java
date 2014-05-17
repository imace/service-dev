package com.sonymobile.sonysales.dao;

import java.util.ArrayList;
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
		HibernateUtil hibernateUtil = new HibernateUtil();
		return hibernateUtil.addObject(orderHistory);
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
