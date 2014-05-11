package com.sonymobile.sonysales.servlet.userServlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.sonymobile.sonysales.service.MyFIFAService;

public class ShowUserInfoServlet extends HttpServlet {
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String openId = (String) request.getParameter("id");
		MyFIFAService myFIFAService = new MyFIFAService();
		
//		String userJson = myFIFAService.getUser(openId);
//		JSONObject userJO = JSONObject.fromObject(userJson);
//		String phoneNum = userJO.getString("phoneNum");
//		String email = userJO.getString("email");
//		String address = userJO.getString("address");
//		String jdId = userJO.getString("jdId");
//		String points = userJO.getString("points");
		
		@SuppressWarnings("static-access")
		List<?> list = myFIFAService.getPointsOrder(openId);

		Object[] attributes = (Object[])list.get(0);
		String phoneNum = attributes[2].toString();
		String email =  attributes[3].toString();
		String address =  attributes[4].toString();
		String jdId =  attributes[5].toString();
		String points =  attributes[6].toString();
		String pointsOrder =  attributes[9].toString();

		@SuppressWarnings("static-access")
		List<?> supporters = myFIFAService.getSupporters(openId);
		String supporterJS = JSONArray.fromObject(supporters).toString();

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
