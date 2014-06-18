/**
 * 
 */
package com.sonymobile.sonysales.servlet.LaPopularityServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import net.sf.json.JSONException;

import com.sonymobile.sonysales.entity.DefaultWechatInfoImpl;
import com.sonymobile.sonysales.entity.json.WechatUserInfo;
import com.sonymobile.sonysales.util.Common;

/**
 * @author 28852095
 * 
 */
public class Activity extends HttpServlet {

	private static final long serialVersionUID = 2599554002105011383L;
	private static Logger logger = Logger.getLogger(Activity.class.getName());
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String openId = request.getParameter("id");
			// get user nick name for add user
			WechatUserInfo info = DefaultWechatInfoImpl.getInstance().getWebChatUserInfo(openId);
			Common.addUser(info);
			response.setContentType("application/json;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			request.setAttribute("openid", openId);
			request.setAttribute("nickname", info.getNickname());
			request.getRequestDispatcher("/jsp/LaPopularity/ActivityPage.jsp").forward(request, response);
		} catch (JSONException e) {
			logger.error("Activity->doPost() in exception : " + e.getMessage());
			response.sendRedirect(request.getContextPath()+"/jsp/errorhandler.jsp?errnum=0110&errmsg="+e.getMessage());
		}
	}

	public Activity() {
	}

}
