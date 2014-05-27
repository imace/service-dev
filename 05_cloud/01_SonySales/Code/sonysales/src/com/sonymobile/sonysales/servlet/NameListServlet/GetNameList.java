package com.sonymobile.sonysales.servlet.NameListServlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import net.sf.json.JSONException;

import com.sonymobile.sonysales.model.User;
import com.sonymobile.sonysales.service.NameListService;
import com.sonymobile.sonysales.servlet.LaPopularityServlet.Activity;

public class GetNameList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(GetNameList.class.getName());
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		try {
			response = initHeader(response);

			request.setAttribute("userList",
					NameListService.getNameListOfPopularity("20"));

			request.setAttribute("supporterList",
					NameListService.getNameListOfHandle("20"));
			
			String openId = request.getParameter("id");
			request.setAttribute("openId", openId);
//			List<User> userList = (List<User>)request.getAttribute("userList");
//			if(userList!=null&&userList.size()>0) {
//			    System.out.println("【GetNameList userList.size()】:"+userList.size());
//			} else {
//			    System.out.println("【GetNameList userList is null】");
//			}
			request.getRequestDispatcher("/jsp/nameList.jsp").forward(request,
					response);
		} catch (JSONException e) { 
			logger.error("GetNameList->doPost() in exception : " + e.getMessage());
			response.sendRedirect(request.getContextPath()+"/jsp/errorhandler.jsp?errnum=0100&errmsg="+e.getMessage());
		}
	}

	private static HttpServletResponse initHeader(HttpServletResponse response) {
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("text/plain; charset=UTF-8");
		// response.setContentType("text/json; charset=UTF-8");
		return response;
	}

}