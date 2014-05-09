package com.sonymobile.sonysales.servlet.NameListServlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import com.sonymobile.sonysales.entity.MySupportCount;
import com.sonymobile.sonysales.model.User;
import com.sonymobile.sonysales.service.NameListService;


public class GetNameList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 JSONObject requestJSONObject;  
    try {  
    				response = initHeader(response);
    				NameListService nameListService = new NameListService();
    				String popJson = nameListService.getNameListOfPopularity("5");
    				String handleJson = nameListService.getNameListOfHandle("5");
    				
	        JSONArray popJSONArray = JSONArray.fromObject(popJson);
	        List<User> userList  = (List<User>) JSONArray.toList(popJSONArray,User.class);
	        request.setAttribute("userList", userList);
	        
         JSONArray handleJSONArray = JSONArray.fromObject(handleJson);
         List<MySupportCount> mySupportCountList  = (List<MySupportCount>) JSONArray.toList(handleJSONArray,MySupportCount.class);
         request.setAttribute("mySupportCountList", mySupportCountList);
	            
    				
        request.getRequestDispatcher("/jsp/nameList.jsp").forward(
                request, response);
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