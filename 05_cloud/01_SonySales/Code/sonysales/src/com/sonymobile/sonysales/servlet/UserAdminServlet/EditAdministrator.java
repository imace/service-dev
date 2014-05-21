package com.sonymobile.sonysales.servlet.UserAdminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONException;

import com.sonymobile.sonysales.model.Administrator;
import com.sonymobile.sonysales.model.Role;
import com.sonymobile.sonysales.service.UserAdminService;

public class EditAdministrator extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		try {
			      response = initHeader(response);

    			   String id = request.getParameter("id");

		        if(id==null || id.trim().equals("")) {
	                System.out.println("【EditAdministrator id is null】");
                  return;
		        }
		        System.out.println("id:"+id);
		        UserAdminService userAdminService = new UserAdminService();
           Administrator administrator = userAdminService.getAdministratorById(Long.parseLong(id));
           if(administrator==null) {
               System.out.println("【EditAdministrator administrator is null】");
               return;
           } else {
               if(administrator.getRoleId()!=0) {
                   Role role = userAdminService.getRoleById(administrator.getRoleId());
                   request.setAttribute("role",
                           role);
               }
               request.setAttribute("administrator",
                       administrator);
               request.setAttribute("roleList",
                       userAdminService.getRoleList());
               request.getRequestDispatcher("/jsp/Management/EditAdministrator.jsp").forward(request,
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