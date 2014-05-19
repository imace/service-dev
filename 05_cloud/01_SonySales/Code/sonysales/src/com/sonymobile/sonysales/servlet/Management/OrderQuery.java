package com.sonymobile.sonysales.servlet.Management;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sonymobile.sonysales.entity.OrderInfo;
import com.sonymobile.sonysales.service.OrderHistoryService;

/**
 * @author 28852095
 * 
 */
public class OrderQuery extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 设置编码
		String OrderId = request.getParameter("OrderId");
		OrderInfo orderInfo = OrderHistoryService.getOrderHistoryByOrderNum(OrderId);
		
		request.setAttribute("Order", orderInfo);
		request.getRequestDispatcher("/jsp/Management/MainPage.jsp")
				.forward(request, response);
	}
}
