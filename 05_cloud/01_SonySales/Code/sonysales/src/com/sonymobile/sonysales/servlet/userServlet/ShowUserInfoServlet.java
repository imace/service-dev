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

public class ShowUserInfoServlet extends HttpServlet {
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String openId = (String) request.getParameter("id");

		List<?> list = MyFIFAService.getPointsOrder(openId);
		String userJson = JSONArray.fromObject(list).toString();
		JSONArray userJA = JSONArray.fromObject(userJson);
		String phoneNum="", email="",address="",jdId="",points="",pointsOrder="";
		
		if (userJA.size()>0) {
			JSONObject userJO = userJA.getJSONObject(0);
			phoneNum = userJO.getString("phoneNum");
			email = userJO.getString("email");
			address = userJO.getString("address");
			jdId = userJO.getString("jdId");
			points = userJO.getString("points");
			pointsOrder = userJO.getString("pointsOrder");	
		}
		
		
		List<?> supporters = MyFIFAService.getSupporters(openId);
		String supporterJS = JSONArray.fromObject(supporters).toString();

		request.setAttribute("openId", openId);
		request.setAttribute("phoneNum", phoneNum);
		request.setAttribute("email", email);
		request.setAttribute("address", address);
		request.setAttribute("jdId", jdId);
		request.setAttribute("points", points);
		request.setAttribute("pointsOrder", pointsOrder);
		request.setAttribute("supporterJS", supporterJS);
		request.getRequestDispatcher("/jsp/ShowUserInfoPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
