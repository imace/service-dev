package com.sonymobile.sonysales.sevlet.news;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sonymobile.sonysales.model.FifaInfo;
import com.sonymobile.sonysales.service.FifaInfoService;
import com.sonymobile.sonysales.util.DateUtil;

public class NewsSevlet extends HttpServlet {
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String fromid = request.getParameter("fid");
		String toid = request.getParameter("openid");
		
		FifaInfo news = FifaInfoService.getLatestFifaInfo();
		if (news == null) {
			news = new FifaInfo();
		}
		String info = news.getInfo();
		String createTime = DateUtil.toFormalDateStr(news.getCreateTime());

		if (info == null || info.isEmpty()) {
			info = "2014年世界杯将于6月12日-7月13日举办，届时索尼Xperia将与您共度激情盛夏。在此期间，您可以分享世界杯活动快报给您的朋友，参与拉人气大赛，赢取丰厚奖品。";
			createTime = "2014-06-01 00:00:03";
		}

		request.setAttribute("fid", fromid);
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
