package com.sonymobile.sonysales.servlet.DescriptionServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.sonymobile.sonysales.entity.DefaultWechatInfoImpl;
import com.sonymobile.sonysales.servlet.LaPopularityServlet.Activity;
import com.sonymobile.sonysales.util.Base64Coder;
import com.sonymobile.sonysales.util.Constant;

/**
 * Servlet implementation class Description
 */
public class Description extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(Description.class.getName());
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
		String openId = request.getParameter("id");

		if (openId == null) {
			logger.error("Description->Log message : (1) openId == null");
			String toId = request.getParameter("toid");

			if (toId == null) {
				logger.error("Description->Log message : (2) toId == null");
				// get openId
				StringBuilder infourl = new StringBuilder(
						Constant.WECHAT_OAUTH2_AUTHORIZE_URL);
				infourl.append('?');
				infourl.append("appid=");
				infourl.append(DefaultWechatInfoImpl.getInstance().getAppId());
				infourl.append("&redirect_uri=");
				infourl.append(Constant.HOST);
				infourl.append("/wechat_authorize?response_type=code&scope=");
				infourl.append(Constant.WECHAT_OAUTH_SCOPES.BASE.getValue());
				infourl.append("&state=");
				infourl.append(Base64Coder.convertStrToBase64(Constant.HOST
						+ "/Description"));
				infourl.append("#wechat_redirect");

				response.sendRedirect(infourl.toString());
				return;
			} else if (toId != null) {
				// toId
				request.setAttribute("id", toId);
				logger.error("Description->Log message : (3) toId != null; toId="+toId);
			}
		} else {
			// openId
			request.setAttribute("id", openId);
			logger.error("Description->Log message : (4) openId != null; openId="+openId);
		}

		request.getRequestDispatcher("/jsp/Description.jsp").forward(request,
				response);
		return;
	}
}
