package com.sonymobile.sonysales.servlet.LashouBuy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.sonymobile.sonysales.util.Constant;

import net.sf.json.JSONException;

public class LashouFollow extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(LashouFollow.class
			.getName());

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String fromid = request.getParameter("fid");
			String toid = request.getParameter("tid");
			String attention = request.getParameter("attention");
			String oauthtoidlink = request.getParameter("oauthtoidlink");

			if (attention.contains("0") && oauthtoidlink != null) {
				response.sendRedirect(oauthtoidlink);
			}
			response.setContentType("application/json;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");

			if (request.getServerName().equals("localhost")) {
				response.sendRedirect(request.getContextPath()
						+ "/jsp/LaPopularity/LashouFollow.jsp");
			} else {
				String url = "";
				if (attention.contains("0")) {
					url = Constant.ATTENTION_PAGE;
				} else {
					url = request.getContextPath() + "/lashouactivity?id="
							+ toid;
				}
				response.sendRedirect(url);
			}
		} catch (JSONException e) {
			logger.error("LashouFollow->doPost() in exception : "
					+ e.getMessage());
			e.printStackTrace();
		}
	}
}
