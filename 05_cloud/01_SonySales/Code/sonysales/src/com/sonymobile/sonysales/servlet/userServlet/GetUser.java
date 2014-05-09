package com.sonymobile.sonysales.servlet.userServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import com.sonymobile.sonysales.model.User;
import com.sonymobile.sonysales.service.MyFIFAService;

/**
 * Servlet implementation class addUser
 */
public class GetUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		JSONObject requestJSONObject;
		try {
			requestJSONObject = JSONObject.fromObject(request
					.getParameter("json"));
			String openId = requestJSONObject.getString("openId");
			response = initHeader(response);
			User user = MyFIFAService.getUserByOpenId(openId);
			response.getWriter().write(JSONArray.fromObject(user).toString());
			response.getWriter().close();
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}

	private static HttpServletResponse initHeader(HttpServletResponse response) {
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("text/plain; charset=utf-8");
		// response.setContentType("text/json; charset=utf-8");
		return response;
	}

}
