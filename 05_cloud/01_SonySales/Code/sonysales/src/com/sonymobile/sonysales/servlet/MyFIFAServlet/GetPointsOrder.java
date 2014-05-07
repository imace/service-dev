package com.sonymobile.sonysales.servlet.MyFIFAServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import com.sonymobile.sonysales.service.MyFIFAService;

/**
 *  获得我的人气及排名
 *  eg:
 *  input:
 *  http://localhost:10000/sonysales/getPointsOrder?json={"openId":"2"}
 *  output:
 *  [{"id":2,"openId":"2","nickname":"test2","focusFlag":1,"phoneNum":"12345678901","email":"123@163.com","address":"地址","jdId":"2","points":3,"focusTime":"201405031403","createTime":"201405041401","pointsOrder":2}]
 */ 
public class GetPointsOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 JSONObject requestJSONObject;  
    try {  
        requestJSONObject = JSONObject.fromObject(request.getParameter("json"));  
        String openId = requestJSONObject.getString("openId");
    		  response = initHeader(response);
    		  MyFIFAService myFIFAService = new MyFIFAService();
    		  response.getWriter().write(myFIFAService.getPointsOrder(openId));
    		  response.getWriter().close();
        } catch (JSONException e) {  
            e.printStackTrace();  
    	        }  
	}
	
	private static HttpServletResponse initHeader(HttpServletResponse response) {
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("text/plain; charset=utf-8"); 
		//response.setContentType("text/json; charset=utf-8"); 
		return response;
	}

}