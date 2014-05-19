package com.sonymobile.sonysales.servlet.UserAdminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sonymobile.sonysales.model.Administrator;
import com.sonymobile.sonysales.service.UserAdminService;
import com.sonymobile.sonysales.util.CookieHelper;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

			      response = initHeader(response);

    			   String userName = request.getParameter("userName");
    			   String password = request.getParameter("password");

		        if(userName==null || userName.trim().equals("") || password==null || password.trim().equals("")) {
		            request.setAttribute("msg", "用户名或密码为空！");
		            request.getRequestDispatcher("/jsp/Management/Login.jsp").forward(request,
		                    response);
		            return;
		        }
		        
		        //userName = new String(request.getParameter("userName").getBytes("ISO-8859-1"),"UTF-8");
		        System.out.println("【Login userName】:"+userName);
		        UserAdminService userAdminService = new UserAdminService();
           Administrator administrator = userAdminService.getAdministratorByUserName(userName);
           if(administrator==null) {
               request.setAttribute("msg", "用户名错误！");
               request.getRequestDispatcher("/jsp/Management/Login.jsp").forward(request,
                       response);
               return;
           } else if (!administrator.getPassword().equals(password)) {
               request.setAttribute("msg", "密码错误！");
               request.getRequestDispatcher("/jsp/Management/Login.jsp").forward(request,
                       response);
               return;
           } else {
               CookieHelper.addCookie(response, "userName", administrator.getUserName(), request.getContextPath()+"/");
               request.getRequestDispatcher("/jsp/Management/MainPage.jsp").forward(request,
                       response);
               return;
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