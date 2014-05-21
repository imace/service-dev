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

public class AddAdministrator extends HttpServlet {
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
    			   String[] roles = request.getParameterValues("roles");
    			   

		        if(userName==null || userName.trim().equals("") || password==null || password.trim().equals("")) {
		            request.setAttribute("msg", "用户名或密码为空！");
               request.getRequestDispatcher("/Management/toAddAdministrator").forward(request,
                        response);
               return;
		        }
		        if(roles==null || roles.length==0) {
               request.setAttribute("msg", "请选择角色！");
               request.getRequestDispatcher("/Management/toAddAdministrator").forward(request,
                       response);
               return;
	               }
		        System.out.println("username1:"+userName);
		        UserAdminService userAdminService = new UserAdminService();
           Administrator administrator = userAdminService.getAdministratorByUserName(userName);
           if(administrator!=null) {
               request.setAttribute("msg", "用户名已存在！");
               request.getRequestDispatcher("/Management/toAddAdministrator").forward(request,
                       response);
               return;
           } else {
               administrator = new Administrator();
               administrator.setUserName(userName);
               administrator.setPassword(password);
               Date date = new Date();
               SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmm");
               String now = df.format(date);
               administrator.setCreateTime(now);
               long roleId = 0;
               if(roles!=null&&roles.length>0) {
                   for(int i = 0;i<roles.length;i++) {
                       roleId = Long.parseLong(roles[i]);
                   }
               }
               administrator.setRoleId(roleId);
               if(userAdminService.addAdministrator(administrator)) {
                   request.getRequestDispatcher("/Management/getAdministratorInfoList").forward(request,
                           response);
                   return;
               } else {
                   request.setAttribute("msg", "添加用户失败！");
                   request.getRequestDispatcher("/Management/toAddAdministrator").forward(request,
                           response);
                   return;
               }
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