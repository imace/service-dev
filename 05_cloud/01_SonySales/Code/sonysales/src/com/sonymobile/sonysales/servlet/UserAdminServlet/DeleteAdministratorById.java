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
import com.sonymobile.sonysales.service.NameListService;
import com.sonymobile.sonysales.service.UserAdminService;
import com.sonymobile.sonysales.util.CodeMsg;

public class DeleteAdministratorById extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			  HttpServletResponse response) throws ServletException, IOException {

       response = initHeader(response);
       String id = request.getParameter("id");
    
       if(id==null || id.trim().equals("")) {
           System.out.println("【DeleteAdministratorById id为空！】");
           return;
       }
       UserAdminService userAdminService = new UserAdminService();
       boolean bool = userAdminService.deleteAdministratorById(Long.parseLong(id));
       if(bool) {
           request.getRequestDispatcher("/Management/getAdministratorInfoList").forward(request,
                   response);
       } else {
           System.out.println("【DeleteAdministratorById 删除失败！】");
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