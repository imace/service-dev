package com.sonymobile.sonysales.servlet.popularityServlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import com.sonymobile.sonysales.service.NameListService;
import com.sonymobile.sonysales.service.PopularityService;
import com.sonymobile.sonysales.servlet.NameListServlet.GetNameList;
import com.sonymobile.sonysales.util.Constant;

/**
 *  获取我的拉友支持列表
 *  eg:
 *  input:
 *  http://localhost:10000/sonysales/getSupporters?json={"openId":"1"}
 *  output:
 *  [{"nickname":"test2","createTime":"201405061404"}, {"nickname":"test3","createTime":"201405061405"}]
 */ 
public class GetMySupporters extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(GetMySupporters.class.getName());
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
			String openId = request.getParameter("openId");
			response = initHeader(response);
			List<?> list = PopularityService.getMySupporters(openId);
			request.setAttribute("mySupporters",list);
			request.setAttribute("openId",openId);
			request.getRequestDispatcher("/jsp/mySupporters.jsp").forward(request,
                    response);
	}

	private static HttpServletResponse initHeader(HttpServletResponse response) {
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("text/plain; charset=UTF-8");
		return response;
	}

}