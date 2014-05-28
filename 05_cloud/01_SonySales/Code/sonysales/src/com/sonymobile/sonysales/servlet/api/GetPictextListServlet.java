package com.sonymobile.sonysales.servlet.api;

import java.io.IOException;
import java.io.Writer;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sonymobile.sonysales.util.Constant;

public class GetPictextListServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String key = request.getParameter("key");
		String fromId = request.getParameter("fromuserid");
		String toId = request.getParameter("touserid");
		
		response = initHeader(response);
		Writer out = response.getWriter();

		if (Constant.SONY_FIFA_KEY.equals(key)) {
			String responseResult = Constant.SONY_FIFA_INDEX_NEWS;
			final String host = request.getScheme() + "://" + request.getServerName();
			responseResult = responseResult.replace("_HOST_", host);

			final String pichost = request.getScheme() + "://" + request.getServerName() + "/img";
			responseResult = responseResult.replace("_PICSHOST_", pichost);

			if (fromId != null && !fromId.isEmpty()) {
				responseResult = responseResult.replace("_fromUser_", fromId);
			}
			if (toId != null && !toId.isEmpty()) {
				responseResult = responseResult.replace("_toUser_", toId);
			}
			if (fromId != null && !fromId.isEmpty() && toId != null && !toId.isEmpty()) {
				Date date = new Date();
				String createTime = Long.toString(date.getTime());
				
				responseResult = responseResult.replace("_createTime_", createTime);
			}


			out.write(responseResult);
		} else {
			out.write("<xml><ErrorCode>1</ErrorCode><ErrorMessage>Unknow key.<ErrorMessage></xml>");
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		doGet(request, response);
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
