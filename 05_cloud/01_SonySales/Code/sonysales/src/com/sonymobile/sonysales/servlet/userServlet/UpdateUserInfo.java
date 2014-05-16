package com.sonymobile.sonysales.servlet.userServlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONException;

import com.sonymobile.sonysales.dao.UserDAO;
import com.sonymobile.sonysales.entity.DefaultWechatInfoImpl;
import com.sonymobile.sonysales.entity.json.WechatUserInfo;
import com.sonymobile.sonysales.model.User;
import com.sonymobile.sonysales.service.MyFIFAService;
import com.sonymobile.sonysales.service.PopularityService;
import com.sonymobile.sonysales.util.Constant;

public class UpdateUserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String openId = request.getParameter("openId");
			String phoneNum = request.getParameter("phoneNum");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String jdId = request.getParameter("jdId");
			response = initHeader(response);
			User user = UserDAO.getUserByOpenId(openId);
			if (user != null) {
				Map<?, ?> retMsg = MyFIFAService.updateUser(openId, phoneNum,email, address, jdId);
			}else {
				WechatUserInfo wechatuserinfo=DefaultWechatInfoImpl.getInstance().getWebChatUserInfo(openId);
				String nickname = wechatuserinfo.getNickname();
				User addUser = new User();
				addUser.setOpenId(openId);
				addUser.setNickname(nickname);
				addUser.setNickname(phoneNum);
				addUser.setNickname(email);
				addUser.setNickname(address);
				addUser.setNickname(jdId);
				PopularityService.addUser(addUser);
			}
			response.sendRedirect(Constant.HOST+"/myInfo?id="+openId);
		} catch (JSONException e) {
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