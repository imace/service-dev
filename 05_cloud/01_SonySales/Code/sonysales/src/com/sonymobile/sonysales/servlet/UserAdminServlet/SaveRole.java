package com.sonymobile.sonysales.servlet.UserAdminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONException;

import com.sonymobile.sonysales.model.Role;
import com.sonymobile.sonysales.service.UserAdminService;

public class SaveRole extends HttpServlet {
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
    			   String id = request.getParameter("id");

    			   if(id==null) {
    			       System.out.println("【SaveRole id为空！】");
    			       return;
    			   }
		        if(code==null || code.trim().equals("") || name==null || name.trim().equals("")) {
		            request.setAttribute("msg", "角色代码或角色名称不能为空！");
                    request.getRequestDispatcher("/jsp/Management/EditRole.jsp").forward(request,
                            response);
		        }
		        UserAdminService userAdminService = new UserAdminService();
		        Role Role = userAdminService.getRoleById(Long.parseLong(id));
           if(Role!=null) {
               Role.setCode(code);
               Role.setName(name);
               boolean bool = userAdminService.updateRole(Role);
               if(!bool) {
                   request.setAttribute("msg", "更新失败！");
                   request.getRequestDispatcher("/jsp/Management/EditRole.jsp").forward(request,
                           response);
               } else {
                   request.getRequestDispatcher("/Management/getRoleList").forward(request,
                           response);
               }
           } else {
               request.setAttribute("msg", "角色不存在！");
               request.getRequestDispatcher("/jsp/Management/EditRole.jsp").forward(request,
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