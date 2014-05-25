package com.sonymobile.sonysales.servlet.LaPopularityServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import com.sonymobile.sonysales.util.Constant;
import net.sf.json.JSONException;

public class Share extends HttpServlet {

	private static final long serialVersionUID = 2170271794700562161L;
	private static Logger logger = Logger.getLogger(Share.class.getName());

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String fromid = request.getParameter("fromid");
			String toid = request.getParameter("toid");
			String attention = request.getParameter("attention");
			String oauthtoidlink = request.getParameter("oauthtoidlink");

			if (attention.contains("0") && oauthtoidlink != null) {
				response.sendRedirect(oauthtoidlink);
			}
			response.setContentType("application/json;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");

			if (request.getServerName().equals("localhost")) {
				response.sendRedirect(request.getContextPath()
						+ "/jsp/LaPopularity/SharePage.jsp");
			} else {
				String url = "";
				if (attention.contains("0")) {
					url = "http://mp.weixin.qq.com/s?__biz=MzA5NDAwODUxMQ==&mid=200111401&idx=1&sn=c2c817de70b14a702fe02da6997f8f64#rd";

				} else {
					url = request.getContextPath() + "/activitypage?id=" + toid;
				}
				response.sendRedirect(url);
			}
		} catch (JSONException e) {
			logger.error("Share->doPost() in exception : " + e.getMessage());
			e.printStackTrace();
		}
	}
}
