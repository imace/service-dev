/**
 * 
 */
package com.sonymobile.sonysales.servlet.userServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONException;

/**
 * @author 28852095
 *
 */
public class Activity extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2599554002105011383L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
		
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        try {  
	            String openId = request.getParameter("id");
	            response.setContentType("application/json;charset=UTF-8");
	            response.setCharacterEncoding("UTF-8");

	            HttpSession session = request.getSession();
	    		session.setAttribute("openid", openId);
	    			    		
	    		request.setAttribute("openid", openId);	    		
	    		if (request.getServerName().equals("localhost")) {
	    			//response.sendRedirect("/sonysales/jsp/ActivityPage.jsp");
	    			request.getRequestDispatcher("/sonysales/jsp/ActivityPage.jsp").forward(request, response);
				}else {
					//response.sendRedirect("/jsp/ActivityPage.jsp");	
					request.getRequestDispatcher("/jsp/ActivityPage.jsp").forward(request, response);
				}
	        } catch (JSONException e) {  
	            e.printStackTrace();  
	        }
	}
	
	/**
	 * 
	 */
	public Activity() {
		// TODO Auto-generated constructor stub
	}

}
