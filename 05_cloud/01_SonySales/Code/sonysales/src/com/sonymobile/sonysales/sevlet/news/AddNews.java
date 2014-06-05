package com.sonymobile.sonysales.sevlet.news;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONException;

import com.sonymobile.sonysales.model.FifaInfo;
import com.sonymobile.sonysales.model.Role;
import com.sonymobile.sonysales.service.FifaInfoService;

public class AddNews extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		try {
			      response = initHeader(response);

    			   String info = request.getParameter("info");

		        if(info==null || info.trim().equals("")) {
		            request.setAttribute("msg", "战报内容不能为空！");
                    request.getRequestDispatcher("/jsp/Management/addNews.jsp").forward(request,
                            response);
                    return;
		        }
          if(info!=null&&info.trim().length()>2000) {
                request.setAttribute("msg", "战报内容不能超过2000字符！");
                request.getRequestDispatcher("/jsp/Management/addNews.jsp").forward(request,
                        response);
                return;
	             }
           Map<?, ?> retMsg = FifaInfoService.addFifaInfo(info);
           if(retMsg!=null&&retMsg.get("ResultCode")!=null&&retMsg.get("ResultCode").equals("1")) {
               request.getRequestDispatcher("/jsp/Management/MainPage.jsp").forward(request,
                       response);
           } else {
               request.setAttribute("msg", "录入战报失败！");
               request.getRequestDispatcher("/jsp/Management/addNews.jsp").forward(request,
                       response);
               }
		} catch (JSONException e) { 
			e.printStackTrace();
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