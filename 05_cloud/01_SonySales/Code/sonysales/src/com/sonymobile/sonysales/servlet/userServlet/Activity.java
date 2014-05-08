/**
 * 
 */
package com.sonymobile.sonysales.servlet.userServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.sonymobile.sonysales.entity.DefaultWechatInfoImpl;
import com.sonymobile.sonysales.model.User;
import com.sonymobile.sonysales.service.PopularityService;

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
	private static Logger logger = Logger.getLogger(Relation.class.getName());
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
		
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        try {  
	            String openId = request.getParameter("id");
	            //get user nick name for add user
	            String nickname = DefaultWechatInfoImpl.getInstance().getWebChatUserInfo(openId).getNickname();
	            AddUser(openId, nickname);
	            
	            System.out.println("~~~~~~~~~~~~ openid = "+openId+"~~~~~~~~~~~~");
	            response.setContentType("application/json;charset=UTF-8");
	            response.setCharacterEncoding("UTF-8");
	    		request.setAttribute("openid", openId);
	    		request.setAttribute("nickname", nickname);
	    		request.getRequestDispatcher("/jsp/ActivityPage.jsp").forward(request, response);
	        } catch (JSONException e) {  
	            e.printStackTrace();  
	        }
	}
	
	public static boolean AddUser(String openid, String nickname) {
	       try {
	    	   logger.error("Activity : adduser-> openid=" +openid+", nickname="+nickname );
    	       User user=new User();
               user.setOpenId(openid);
               user.setNickname(nickname);	
               PopularityService.addUser(user);	
               return true;	
              } catch (Exception e) {	
                     // TODO: handle exception 	
                     return false;
              }
	       }
	
	/**
	 * 
	 */
	public Activity() {
		// TODO Auto-generated constructor stub
	}

}
