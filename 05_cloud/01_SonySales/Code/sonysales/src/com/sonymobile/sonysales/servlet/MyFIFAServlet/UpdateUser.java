package com.sonymobile.sonysales.servlet.MyFIFAServlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import com.sonymobile.sonysales.service.MyFIFAService;

/**
 *  获得我的人气及排名
 *  eg:
 *  input:
 *  http://localhost:10000/sonysales/updateUser?json={"openId":"3","phoneNum":"333","email":"333@qq.com","address":"33a","jdId":"33j"}
 *  output:
 *  {"result":"1"} 成功
 *  {"result":"0"} 失败
 *  {"errorcode":"1"}"; //openId为空
 *  {"errorcode":"2"}"; //用户为空
 */ 
public class UpdateUser extends HttpServlet {
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
			String openId = requestJSONObject.getString("openId");
			String phoneNum = requestJSONObject.getString("phoneNum");
			String email = requestJSONObject.getString("email");
			String address = requestJSONObject.getString("address");
			String jdId = requestJSONObject.getString("jdId");
			response = initHeader(response);
			Map<?, ?> retMsg = MyFIFAService.updateUser(openId, phoneNum,
					email, address, jdId);

			response.getWriter()
					.write(JSONObject.fromObject(retMsg).toString());
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