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

public class UpdateAdministratorState extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		try {
			      response = initHeader(response);

    			   String userName = request.getParameter("username");
    			   String state = request.getParameter("state"); 
    			   String password = request.getParameter("password");
		        String password2 = request.getParameter("password2");

		        if(userName==null || userName.trim().equals("") || password==null || password.trim().equals("")) {
		            return;
		        }
		        //System.out.println("username1:"+username);
		        UserAdminService userAdminService = new UserAdminService();
           Administrator administrator = userAdminService.getAdministratorByUserName(userName);
           if(administrator!=null) {
               Map<?, ?> codeMsg = CodeMsg.GetCodeMsg(CodeMsg.CODE_USERADMIN_USERNAME_EXSISTS, "用户名已存在");
               response.getWriter().write(JSONArray.fromObject(codeMsg).toString());
               response.getWriter().close();
           } else {
               administrator = new Administrator();
               administrator.setUserName(userName);
               administrator.setPassword(password);
               Date date = new Date();
               SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmm");
               String now = df.format(date);
               administrator.setCreateTime(now);
               if(userAdminService.addAdministrator(administrator)) {
                   Map<?, ?> codeMsg = CodeMsg.GetCodeMsg(CodeMsg.CODE_ADD_ADMINISTRATOR_SUCCESS, "添加管理员成功");
                   response.getWriter().write(JSONArray.fromObject(codeMsg).toString());
                   response.getWriter().close();
               } else {
                   Map<?, ?> codeMsg = CodeMsg.GetCodeMsg(CodeMsg.CODE_ADD_ADMINISTRATOR_FAILURE, "添加管理员失败");
                   response.getWriter().write(JSONArray.fromObject(codeMsg).toString());
                   response.getWriter().close();
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