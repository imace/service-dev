package com.sonymobile.sonysales.servlet.NameListServlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import com.sonymobile.sonysales.service.NameListService;

/**
 *  获得拉手榜单
 *  eg:
 *  input:
 *  http://localhost:10000/sonysales/getNameListOfHandle?json={"limit":"2"}
 *  output:
 *  [{"nickname":"测试","count":2}, {"nickname":"test2","count":1}]
 */ 
public class GetNameListOfHandle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		JSONObject requestJSONObject;
		try {
			requestJSONObject = JSONObject.fromObject(request
					.getParameter("json"));
			String limit = requestJSONObject.getString("limit");
			response = initHeader(response);
			List<?> list = NameListService.getNameListOfHandle(limit);
			response.getWriter().write(JSONArray.fromObject(list).toString());
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