package com.sonymobile.sonysales.servlet.userServlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.sonymobile.sonysales.model.User;
import com.sonymobile.sonysales.service.PopularityService;

/**
 * Servlet implementation class AddUser
 */
public class AddUser extends HttpServlet {
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
			User user = getUserInfo(request);

			Date date = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmm");
			String now = df.format(date);
			user.setCreateTime(now);
			Map<?, ?> retMsg = PopularityService.addUser(user);

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
		response.setContentType("text/plain; charset=utf-8");
		// response.setContentType("text/json; charset=utf-8");
		return response;
	}

	/**
	 * 
	 */
	private static User getUserInfo(HttpServletRequest request) {

		User user = new User();

		if (request != null && user != null) {

			JSONObject requestJSONObject;
			requestJSONObject = JSONObject.fromObject(request
					.getParameter("json"));
			try {
				String openId = requestJSONObject.getString("openId");
				if (openId != null && openId.length() > 0) {
					user.setOpenId(openId);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				String address = requestJSONObject.getString("address");
				if (address != null && address.length() > 0) {
					user.setAddress(address);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				String email = requestJSONObject.getString("email");
				if (email != null && email.length() > 0) {
					user.setEmail(email);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				int focusFlag = -1;
				focusFlag = requestJSONObject.getInt("focusFlag");
				if (focusFlag != -1) {
					user.setFocusFlag(focusFlag);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				String focusTime = requestJSONObject.getString("focusTime");
				if (focusTime != null && focusTime.length() > 0) {
					user.setFocusTime(focusTime);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				String jdId = requestJSONObject.getString("jdId");
				if (jdId != null && jdId.length() > 0) {
					user.setJdId(jdId);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				String nickname = requestJSONObject.getString("nickname");
				if (nickname != null && nickname.length() > 0) {
					user.setNickname(nickname);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				String phoneNum = requestJSONObject.getString("phoneNum");
				if (phoneNum != null && phoneNum.length() > 0) {
					user.setPhoneNum(phoneNum);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				long points = -1;
				points = requestJSONObject.getLong("points");
				if (points != -1) {
					user.setPoints(points);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return user;
	}
}
