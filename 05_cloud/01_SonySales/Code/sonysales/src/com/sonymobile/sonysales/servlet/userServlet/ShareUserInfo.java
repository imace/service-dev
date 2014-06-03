package com.sonymobile.sonysales.servlet.userServlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.sonymobile.sonysales.service.MyFIFAService;
import com.sonymobile.sonysales.util.Constant;

public class ShareUserInfo extends HttpServlet {
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String fromid = (String) request.getParameter("id");
		String friendname = (String) request.getParameter("friendname");
		
		if (fromid == null) {
			fromid = request.getParameter("fid");
		}

		List<?> list = MyFIFAService.getPointsOrder(fromid);
		String userJson = JSONArray.fromObject(list).toString();
		JSONArray userJA = JSONArray.fromObject(userJson);
		String points = "0", pointsOrder = "0";

		if (userJA.size() > 0) {
			JSONObject userJO = userJA.getJSONObject(0);
			if (!userJO.isNullObject()) {
				points = userJO.getString("points");
				pointsOrder = userJO.getString("pointsOrder");
			}
		}

		List<?> supporters = MyFIFAService.getSupporters(fromid);
		String supporterJS = JSONArray.fromObject(supporters).toString();
		request.setAttribute("openId", fromid);
		request.setAttribute("points", points == null ? "0" : points);
		request.setAttribute("pointsOrder", pointsOrder == null ? "0" : pointsOrder);
		request.setAttribute("supporterJS", supporterJS);
		request.setAttribute("friendname", friendname);
		request.getRequestDispatcher("/jsp/ShareUserInfo.jsp").forward(
				request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
