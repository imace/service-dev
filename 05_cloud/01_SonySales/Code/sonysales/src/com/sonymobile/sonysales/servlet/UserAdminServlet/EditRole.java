package com.sonymobile.sonysales.servlet.UserAdminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONException;

import com.sonymobile.sonysales.model.Role;
import com.sonymobile.sonysales.service.UserAdminService;

public class EditRole extends HttpServlet {
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
	                System.out.println("【EditRole id is null】");
                  return;
		        }
		        System.out.println("id:"+id);
		        UserAdminService userAdminService = new UserAdminService();
		        Role Role = userAdminService.getRoleById(Long.parseLong(id));
           if(Role==null) {
               System.out.println("【EditRole administrator is null】");
               return;
           } else {
               request.setAttribute("Role",
                       Role);
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