package com.sonymobile.sonysales.servlet.popularityServlet;

import java.io.IOException;

import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import com.sonymobile.sonysales.service.PopularityService;

/**
 * Servlet implementation class AddPopularity
 */
public class AddPopularity extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			JSONObject requestJSONObject;
			requestJSONObject = JSONObject.fromObject(request
					.getParameter("json"));

			String ownerOpenId = requestJSONObject.getString("ownerOpenId");
			String supporterOpenId = requestJSONObject
					.getString("supporterOpenId");

			Map<?, ?> retMsg = PopularityService.addPopularity(ownerOpenId,
					supporterOpenId);
			response = initHeader(response);
			response.getWriter()
					.write(JSONObject.fromObject(retMsg).toString());
			response.getWriter().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static HttpServletResponse initHeader(HttpServletResponse response) {
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("text/plain; charset=UTF-8");

		return response;
	}
}
