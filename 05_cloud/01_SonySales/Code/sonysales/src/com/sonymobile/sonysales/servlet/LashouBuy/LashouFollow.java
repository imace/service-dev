package com.sonymobile.sonysales.servlet.LashouBuy;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONException;

/**
 * Servlet implementation class LashouActivity
 */
public class LashouFollow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LashouFollow() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {  
    		if (request.getServerName().equals("localhost")) {
    			response.sendRedirect("/jsp/LashouBuy/LashouFollow.jsp");
			}else {
				response.sendRedirect("http://mp.weixin.qq.com/s?__biz=MzA5NDAwODUxMQ==&mid=10013503&idx=2&sn=1cbb860dc2db0a5af0bcc9e4941612dd#rd");
			}
        } catch (JSONException e) {  
            e.printStackTrace();  
        }
	}

}
