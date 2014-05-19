package com.sonymobile.sonysales.servlet.UserAdminServlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;

import com.sonymobile.sonysales.model.Administrator;
import com.sonymobile.sonysales.service.UserAdminService;
import com.sonymobile.sonysales.util.CodeMsg;

public class SaveAdministrator extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		try {
			      response = initHeader(response);

    			   String userName = request.getParameter("userName");
    			   String password = request.getParameter("password");
    			   String id = request.getParameter("id");

    			   if(id==null) {
    			       System.out.println("【SaveAdministrator id为空！】");
    			       return;
    			   }
		        if(userName==null || userName.trim().equals("") || password==null || password.trim().equals("")) {
		            request.setAttribute("msg", "用户名或密码不能为空！");
                    request.getRequestDispatcher("/jsp/Management/editAdministrator.jsp").forward(request,
                            response);
		        }
		        UserAdminService userAdminService = new UserAdminService();
           Administrator administrator = userAdminService.getAdministratorById(Long.parseLong(id));
           if(administrator!=null) {
               administrator.setUserName(userName);
               administrator.setPassword(password);
               boolean bool = userAdminService.update(administrator);
               if(!bool) {
                   request.setAttribute("msg", "更新失败！");
                   request.getRequestDispatcher("/jsp/Management/editAdministrator.jsp").forward(request,
                           response);
               } else {
                   request.getRequestDispatcher("/Management/getAdministratorList").forward(request,
                           response);
               }
           } else {
               request.setAttribute("msg", "用户不存在！");
               request.getRequestDispatcher("/jsp/Management/editAdministrator.jsp").forward(request,
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