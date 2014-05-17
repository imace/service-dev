package com.sonymobile.sonysales.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sonymobile.sonysales.dao.OrderHistoryDAO;
import com.sonymobile.sonysales.dao.UserDAO;
import com.sonymobile.sonysales.entity.AssociationOrders;
import com.sonymobile.sonysales.entity.OrderInfo;
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
		OrderInfo ownerOrder = null;
		List<OrderInfo> supporterOrderList = null;
		String ownJdId = null;
		User ownUser = null;
		String ownOrderId = null;

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
		if (ownerOrder != null) {
			ownerOrder.setNickname(ownNickName);
			ownOrderId = ownerOrder.getOrderNum();
		}

		if (supporterOrderList != null && OrderHistoryDAO.ValidOrderNum(ownOrderId)) {
			int validSupporter = 0;

			for (int index = 0; index < supporterOrderList.size(); index++) {
				OrderInfo supporterOrder = supporterOrderList.get(index);
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

				if (supporterOrder != null) {
					supporterOrder.setVerifyResult(result);
					supporterOrder.setNickname(supporterNickName);
				}
			}

			assOrder.setValidSupporterCount(validSupporter);
		}

		return assOrder;
	}

	public static List<Boolean> saveAssociationOrders(AssociationOrders assOrder) {
		List<Boolean> ret = new ArrayList<Boolean>();

		List<OrderInfo> supporterOrderList = null;
		if (assOrder != null) {
			supporterOrderList = assOrder.getSupptorOrderList();
		}

		if (supporterOrderList != null) {

			for (int index = 0; index < supporterOrderList.size(); index++) {
				OrderInfo supporterOrder = supporterOrderList.get(index);
				String result = supporterOrder.getVerifyResult();
				if (result != null && result.equals(RESULT_CASH_BACK_ALLOW)) {
					String ownOrderNum = assOrder.getOwnerOrder().getOrderNum();
					boolean booRet = OrderHistoryDAO.updateOrderHistory(
							supporterOrder.getOrderNum(), ownOrderNum, 1);
					ret.add(Boolean.valueOf(booRet));
				}
			}
		}

		return ret;
	}

	public static OrderInfo getOrderHistoryByOrderNum(String orderNum) {
		OrderInfo result = new OrderInfo();

		if (result != null) {
			// order num
			result.setOrderNum(orderNum);
			result.setVerifyResult(DEFAULT_INVALID_ORDER);
			result.setJdId(DEFAULT_NICKNAME);
			result.setOwnerNickname(DEFAULT_NICKNAME);

			OrderHistory orderHistory = OrderHistoryDAO
					.getOrderHistoryByOrderNum(orderNum);
			OrderHistory parentOrder = null;
			if (orderHistory != null) {
				// jd id
				String jdId = orderHistory.getJdId();
				if (jdId != null) {
					result.setJdId(jdId);
					User user = UserDAO.getUserByJdId(jdId);
					// nickName
					if (user != null) {
						result.setNickname(user.getNickname());
					}
				}

				int cashFlag = orderHistory.getCashFlag();
				int validOrder = orderHistory.getValidOrder();
				// result
				if (validOrder > 0 && cashFlag > 0) {
					result.setVerifyResult(DEFAULT_CASH_BACK_ALREADY);
				} else if (validOrder > 0 && cashFlag == 0) {
					result.setVerifyResult(RESULT_CASH_BACK_ALLOW);
				}
				String parentOrderNum = orderHistory.getParentOrderNum();
				if (parentOrderNum != null) {
					parentOrder = OrderHistoryDAO
							.getOrderHistoryByOrderNum(parentOrderNum);
				}
			}
			if (parentOrder != null) {

				String jdId = parentOrder.getJdId();
				if (jdId != null) {
					User user = UserDAO.getUserByJdId(jdId);
					// parent nickName
					if (user != null) {
						result.setOwnerNickname(user.getNickname());
					}
				}
			}
		}

		return result;
	}
}
