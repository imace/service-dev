package com.sonymobile.sonysales.servlet.NameListServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.sonymobile.sonysales.service.NameListService;
import com.sonymobile.sonysales.util.Common;
import com.sonymobile.sonysales.util.Constant;

public class GetNameList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(GetNameList.class.getName());
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

			response = initHeader(response);

			request.setAttribute("userList",
					NameListService.getNameListOfPopularity("20"));

			if (Constant.LAYOUBUY_SWITCH.contains("ON")) {
				request.setAttribute("supporterList",
						NameListService.getNameListOfHandle("20"));
			}
			
			String openId = request.getParameter("id");
			Common.updateUserLoginTime(openId);
			request.setAttribute("openId", openId);
			request.getRequestDispatcher("/jsp/nameList.jsp").forward(request,
					response);
	}

	private static HttpServletResponse initHeader(HttpServletResponse response) {
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("text/plain; charset=UTF-8");
		// response.setContentType("text/json; charset=UTF-8");
		return response;
	}

}