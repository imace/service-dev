package com.sonymobile.sonysales.servlet.userServlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.sonymobile.sonysales.entity.DefaultWechatInfoImpl;
import com.sonymobile.sonysales.service.MyFIFAService;
import com.sonymobile.sonysales.util.Constant;

public class ShowUserInfoServlet extends HttpServlet {
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fromid = (String) request.getParameter("id");
		String toid = request.getParameter("toid");
		if (fromid == null) {
			fromid = request.getParameter("fromid");
		}
		if (fromid!=null&&toid!=null&& fromid!=toid) {
			response.sendRedirect(request.getContextPath() + "/activitypage?id=" + toid);
		} else {
			List<?> list = MyFIFAService.getPointsOrder(fromid);
			String userJson = JSONArray.fromObject(list).toString();
			JSONArray userJA = JSONArray.fromObject(userJson);
			String phoneNum = "", email = "", address = "", jdId = "", points = "0", pointsOrder = "0";

			if (userJA.size() > 0) {
				JSONObject userJO = userJA.getJSONObject(0);
			    if (!userJO.isNullObject()) {
					phoneNum = userJO.getString("phoneNum");
					email = userJO.getString("email");
					address = userJO.getString("address");
					jdId = userJO.getString("jdId");
					points = userJO.getString("points");
					pointsOrder = userJO.getString("pointsOrder");
			    }
			}

			List<?> supporters = MyFIFAService.getSupporters(fromid);
			String supporterJS = JSONArray.fromObject(supporters).toString();
			request.setAttribute("openId", fromid);
			request.setAttribute("phoneNum", phoneNum);
			request.setAttribute("email", email);
			request.setAttribute("address", address);
			request.setAttribute("jdId", jdId);
			request.setAttribute("points", points == null ? "0" : points);
			request.setAttribute("pointsOrder", pointsOrder == null ? "0" : pointsOrder);
			request.setAttribute("supporterJS", supporterJS);
			String nickname = DefaultWechatInfoImpl.getInstance().getWebChatUserInfo(fromid).getNickname();
			request.setAttribute("myname", nickname);
			request.getRequestDispatcher("/jsp/ShowUserInfoPage.jsp").forward(request, response);

		}
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
