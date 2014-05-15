package com.sonymobile.sonysales.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sonymobile.sonysales.dao.OrderHistoryDAO;
import com.sonymobile.sonysales.dao.UserDAO;
import com.sonymobile.sonysales.entity.AssociationOrders;
import com.sonymobile.sonysales.model.OrderHistory;
import com.sonymobile.sonysales.model.User;
import com.sonymobile.sonysales.util.ResultMsg;

public class OrderHistoryService {

	public static Map<?, ?> addValidOrderHistory(String orderNum, String jdId) {

		Map<?, ?> retMsg = ResultMsg.ParameterError();

		OrderHistory order = new OrderHistory();
		if (order != null) {
			order.setOrderNum(orderNum);
			order.setJdId(jdId);
			order.setCashFlag(0);
			order.setValidOrder(1);
			retMsg = addOrderHistory(order);
		}
		return retMsg;
	}

	public static Map<?, ?> addOrderHistory(OrderHistory orderHistory) {
		Map<?, ?> retMsg = ResultMsg.ParameterError();

		if (orderHistory != null) {
			String orderNum = orderHistory.getOrderNum();
			if (OrderHistoryDAO.ExistOrderNumInOrderHistory(orderNum)) {
				// orderNum already exist
				retMsg = ResultMsg.OrderNumExistsError();
			} else if (OrderHistoryDAO.addOrderHistory(orderHistory)) {
				retMsg = ResultMsg.SuccessInfo();
			} else {
				retMsg = ResultMsg.FailInOperatingDBError("addOrderHistory");
			}
		}
		return retMsg;
	}

	private static final String DEFAULT_NICKNAME = "Not found";
	private static final String RESULT_CASH_BACK_ALLOW = "可返金";
	private static final String DEFAULT_CASH_BACK_ALREADY = "已返金";
	private static final String DEFAULT_INVALID_ORDER = "无效订单";

	public static AssociationOrders verifyAssociationOrders(
			AssociationOrders assOrder) {
		String ownNickName = DEFAULT_NICKNAME;
		OrderHistory ownerOrder = null;
		List<OrderHistory> supporterOrderList = null;
		String ownJdId = null;
		User ownUser = null;

		if (assOrder != null) {
			ownerOrder = assOrder.getOwnerOrder();
			supporterOrderList = assOrder.getSupptorOrderList();
		}
		if (ownerOrder != null) {
			ownJdId = ownerOrder.getJdId();
		}
		if (ownJdId != null) {
			ownUser = UserDAO.getUserByJdId(ownJdId);
		}
		if (ownUser != null) {
			ownNickName = ownUser.getNickname();
		}

		assOrder.setOwnerNickName(ownNickName);

		if (supporterOrderList != null) {
			int validSupporter = 0;
			List<String> resultList = new ArrayList<String>();
			List<String> supporterNickNameList = new ArrayList<String>();

			for (int index = 0; index < supporterOrderList.size(); index++) {
				OrderHistory supporterOrder = supporterOrderList.get(index);
				String supporterJdId = null;
				User supporter = null;
				String supporterNickName = DEFAULT_NICKNAME;
				String supporterOrderNum = null;
				String result = DEFAULT_INVALID_ORDER;
				if (supporterOrder != null) {
					supporterOrderNum = supporterOrder.getOrderNum();
					supporterJdId = supporterOrder.getJdId();
				}
				if (supporterOrderNum != null) {
					if (OrderHistoryDAO.ValidOrderNum(supporterOrderNum)) {
						// valid order
						if (OrderHistoryDAO.CashFlagMarked(supporterOrderNum)) {
							// cash back already
							result = DEFAULT_CASH_BACK_ALREADY;
						} else {
							// cash back allow
							result = RESULT_CASH_BACK_ALLOW;
							validSupporter++;
						}
					}
				}
				if (supporterJdId != null) {
					supporter = UserDAO.getUserByJdId(supporterJdId);
				}
				if (supporter != null) {
					supporterNickName = supporter.getNickname();
				}
				resultList.add(result);
				supporterNickNameList.add(supporterNickName);
			}

			assOrder.setSupporterNickName(supporterNickNameList);
			assOrder.setResultList(resultList);
			assOrder.setValidSupporterCount(validSupporter);
		}

		return assOrder;
	}

	public static List<Boolean> saveAssociationOrders(AssociationOrders assOrder) {
		List<Boolean> ret = new ArrayList<Boolean>();

		List<OrderHistory> supporterOrderList = null;
		List<String> resultList = null;

		if (assOrder != null) {
			supporterOrderList = assOrder.getSupptorOrderList();
			resultList = assOrder.getResultList();
		}

		if (supporterOrderList != null) {

			for (int index = 0; index < supporterOrderList.size(); index++) {
				OrderHistory supporterOrder = supporterOrderList.get(index);
				String result = resultList.get(index);
				if (result.equals(RESULT_CASH_BACK_ALLOW)) {
					boolean booRet = OrderHistoryDAO.updateOrderHistory(
							supporterOrder.getOrderNum(), 1);
					ret.add(Boolean.valueOf(booRet));
				}

			}
		}

		return ret;
	}

	public static OrderHistory getOrderHistoryByOrderNum(String orderNum) {
		return OrderHistoryDAO.getOrderHistoryByOrderNum(orderNum);
	}
}
