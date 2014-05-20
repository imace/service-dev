package com.sonymobile.sonysales.servlet.UserAdminServlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONException;

import com.sonymobile.sonysales.model.Administrator;
import com.sonymobile.sonysales.model.Role;
import com.sonymobile.sonysales.service.UserAdminService;

public class AddRole extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		try {
			      response = initHeader(response);

    			   String code = request.getParameter("code");
    			   String name = request.getParameter("name");

		        if(code==null || code.trim().equals("") || name==null || name.trim().equals("")) {
		            request.setAttribute("msg", "角色代码或角色名称为空！");
                    request.getRequestDispatcher("/jsp/Management/addRole.jsp").forward(request,
                            response);
                    return;
		        }
		        UserAdminService userAdminService = new UserAdminService();
		        Role Role = userAdminService.getRoleByCode(code);
           if(Role!=null) {
               request.setAttribute("msg", "角色代码已存在！");
               request.getRequestDispatcher("/jsp/Management/addRole.jsp").forward(request,
                       response);
           } else {
               Role = new Role();
               Role.setCode(code);
               Role.setName(name);
               Date date = new Date();
               SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmm");
               String now = df.format(date);
               Role.setCreateTime(now);
               if(userAdminService.addRole(Role)) {
                   request.getRequestDispatcher("/Management/getRoleList").forward(request,
                           response);
               } else {
                   request.setAttribute("msg", "添加角色失败！");
                   request.getRequestDispatcher("/jsp/Management/addRole.jsp").forward(request,
                           response);
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