package com.sonymobile.sonysales.servlet.LashouBuy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONException;

import org.apache.log4j.Logger;

import com.sonymobile.sonysales.entity.DefaultWechatInfoImpl;
import com.sonymobile.sonysales.entity.json.WechatUserInfo;
import com.sonymobile.sonysales.model.User;
import com.sonymobile.sonysales.service.MyFIFAService;
import com.sonymobile.sonysales.service.PopularityService;

public class LashouActivity extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(LashouActivity.class
			.getName());

	public LashouActivity() {
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String openId = request.getParameter("id");
			// get user nick name for add user
			User user = MyFIFAService.getUserByOpenId(openId);
			String nickname = null;
			if (user != null) {
				nickname = user.getNickname();
			} else {
				WechatUserInfo userInfo = DefaultWechatInfoImpl.getInstance()
						.getWebChatUserInfo(openId);
				if (userInfo != null) {
					nickname = userInfo.getNickname();
					AddUser(openId, nickname);
				}
			}
			response.setContentType("application/json;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			request.setAttribute("openid", openId);
			request.setAttribute("nickname", nickname);
			request.getRequestDispatcher("/jsp/LashouBuy/LashouActivity.jsp")
					.forward(request, response);
		} catch (JSONException e) {
			logger.error("LashouActivity->doPost() in exception : "
					+ e.getMessage());
			e.printStackTrace();
		}
	}

	public static boolean AddUser(String openid, String nickname) {
		try {
			User user = new User();
			user.setOpenId(openid);
			user.setNickname(nickname);
			PopularityService.addUser(user);
			return true;
		} catch (Exception e) {
			logger.error("LashouActivity->AddUser() in exception : "
					+ e.getMessage());
			return false;
		}
	}
}
