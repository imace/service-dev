package com.sonymobile.sonysales.servlet.api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sonymobile.sonysales.util.HttpConnetcion;

public final class HttpTestServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<br>");
		out.println("<br>");
		String host = "http://weimarketing.sinaapp.com/weixin/offline/games/usergames/user_120/controller/userinfo.php?id=oHBvQjtNo-0CEHK5phS23m8LCS6E&t=1402283415946&s=7f7d1bf420ef0570dc79012499e6167b";
		String responseStr = HttpConnetcion.httpGetRequest(host);
		out.println(responseStr);
		out.println("<br>");
		out.println("<br>");
		out.println("<br>");
		out.println("<br>");

		String responseStr2 = HttpConnetcion.httpClientGetRequest(host);
		out.println(responseStr2);
		out.println("<br>");
		out.println("<br>");
		out.println("<br>");
		
	}
}
