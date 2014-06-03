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

public class NewsSevlet  extends HttpServlet {
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String fromid = request.getParameter("fromid");
		String fromname = request.getParameter("fromname");
		String toid = request.getParameter("toid");
		String toname = request.getParameter("toname");
		String toheadimgurl = request.getParameter("toheadimgurl");
		
		FifaInfo news = FifaInfoService.getLatestFifaInfo();
		String info = news.getInfo();
		String createTime = Common.formatDateString(news.getCreateTime());
		
		if (info == null || info.isEmpty()) {
			info = "2014年世界杯将于6月12日-7月13日开幕，届时索尼Xperia将与您共度激情盛夏。在此期间，您可以分享索尼FIFA快讯给您的朋友，参与拉人气大赛，赢取丰厚奖品。";
			createTime = "2014-06-01 00:00:03";
		}
		if (fromname == null || fromname.isEmpty()) {
			WechatUserInfo user = DefaultWechatInfoImpl.getInstance().getWebChatUserInfo(fromid); 
			fromname = user.getNickname();
		}
		
		request.setAttribute("fromid", fromid);
		request.setAttribute("fromname", fromname);
		request.setAttribute("toid", toid);
		request.setAttribute("info", info);
		request.setAttribute("createTime", createTime);
		request.setAttribute("toname", toname);
		request.setAttribute("toheadimgurl", toheadimgurl);
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
