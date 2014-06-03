package com.sonymobile.sonysales.sevlet.news;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sonymobile.sonysales.entity.DefaultWechatInfoImpl;
import com.sonymobile.sonysales.entity.json.WechatUserInfo;
import com.sonymobile.sonysales.model.FifaInfo;
import com.sonymobile.sonysales.service.FifaInfoService;
import com.sonymobile.sonysales.util.Common;

public class NewsSevlet extends HttpServlet {
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String fromid = request.getParameter("fid");
		String fromname = request.getParameter("fromname");
		String toid = request.getParameter("openid");
		
		FifaInfo news = FifaInfoService.getLatestFifaInfo();
		if (news == null) {
			news = new FifaInfo();
		}
		String info = news.getInfo();
		String createTime = Common.formatDateString(news.getCreateTime());

		if (info == null || info.isEmpty()) {
			info = "2014年世界杯将于6月12日-7月13日举办，届时索尼Xperia将与您共度激情盛夏。在此期间，您可以分享索尼FIFA快讯给您的朋友，参与拉人气大赛，赢取丰厚奖品。";
			createTime = "2014-06-01 00:00:03";
		}
		if (fromname == null || fromname.isEmpty()) {
			WechatUserInfo user = DefaultWechatInfoImpl.getInstance().getWebChatUserInfo(fromid); 
			fromname = user.getNickname();
		}
		
		request.setAttribute("fid", fromid);
		request.setAttribute("fromname", fromname);
		request.setAttribute("tid", toid);
		request.setAttribute("info", info);
		request.setAttribute("createTime", createTime);
		request.getRequestDispatcher("/jsp/News.jsp").forward(
				request, response);
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
