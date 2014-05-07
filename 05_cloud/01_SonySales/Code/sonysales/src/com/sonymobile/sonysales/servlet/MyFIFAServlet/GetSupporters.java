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
 *  获取我的拉友支持列表
 *  eg:
 *  input:
 *  http://localhost:10000/sonysales/getSupporters?json={"openId":"1"}
 *  output:
 *  [{"nickname":"test2","createTime":"201405061404"}, {"nickname":"test3","createTime":"201405061405"}]
 */ 
public class GetSupporters extends HttpServlet {
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
    		  response.getWriter().write(myFIFAService.getSupporters(openId));
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