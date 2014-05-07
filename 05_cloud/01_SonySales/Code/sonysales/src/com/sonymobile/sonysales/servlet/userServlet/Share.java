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
public class Share extends HttpServlet {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2170271794700562161L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        try {  
	            String user1 = request.getParameter("user1");
	            String user2 = request.getParameter("user2");
	            response.setContentType("application/json;charset=UTF-8");
	            response.setCharacterEncoding("UTF-8");

	            HttpSession session = request.getSession();
	    		session.setAttribute("user1", user1);
	    		session.setAttribute("user2", user2);
	    		
	    		if (request.getServerName().equals("localhost")) {
	    			response.sendRedirect("/sonysales/jsp/SharePage.jsp");
				}else {
					response.sendRedirect("http://mp.weixin.qq.com/s?__biz=MzA5NDAwODUxMQ==&mid=10013503&idx=2&sn=1cbb860dc2db0a5af0bcc9e4941612dd#rd");
				}
	        } catch (JSONException e) {  
	            e.printStackTrace();  
	        }
	}
	
	/**
	 * 
	 */
	public Share() {
		// TODO Auto-generated constructor stub
	}

}
