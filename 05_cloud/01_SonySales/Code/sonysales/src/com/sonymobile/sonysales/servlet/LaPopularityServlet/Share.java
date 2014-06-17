package com.sonymobile.sonysales.servlet.LaPopularityServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sonymobile.sonysales.util.Constant;

public class Share extends HttpServlet {

	private static final long serialVersionUID = 2170271794700562161L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String toid = request.getParameter("tid");
		String attention = request.getParameter("attention");
		String oauthtoidlink = request.getParameter("oauthtoidlink");

		if ("0".equals(attention) && oauthtoidlink != null) {
			response.sendRedirect(oauthtoidlink);
			return;
		}
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		if (request.getServerName().equals("localhost")) {
			response.sendRedirect(request.getContextPath()
					+ "/jsp/LaPopularity/SharePage.jsp");
			return;
		} else {
			String url = "";
			if ("0".equals(attention)) {
				url = Constant.ATTENTION_PAGE;

			} else {
				url = request.getContextPath() + "/activitypage?id=" + toid;
			}
			response.sendRedirect(url);
			return;
		}
	}
}
