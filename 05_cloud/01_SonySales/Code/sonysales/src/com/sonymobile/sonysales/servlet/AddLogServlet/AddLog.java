package com.sonymobile.sonysales.servlet.AddLogServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONException;

import com.sonymobile.sonysales.util.Common;
import com.sonymobile.sonysales.util.LogHelper;

/**
 * Servlet implementation class AddLog
 */
public class AddLog extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		try {
			String openId = request.getParameter("openId");
			String pageName = request.getParameter("pageName");
			String operation = request.getParameter("operation");
			String ip = Common.getIpAddr(request);
			LogHelper.addOperationLog(openId, Integer.parseInt(pageName),
					Integer.parseInt(operation), ip);
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}

}
