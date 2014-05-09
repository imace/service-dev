package com.sonymobile.sonysales.servlet.LashouBuy;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONException;
import org.apache.log4j.Logger;
import com.sonymobile.sonysales.entity.DefaultWechatInfoImpl;
import com.sonymobile.sonysales.model.User;
import com.sonymobile.sonysales.service.PopularityService;

/**
 * Servlet implementation class LashouActivity
 */
public class LashouActivity extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(LashouRelation.class.getName());
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LashouActivity() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
    		request.getRequestDispatcher("/jsp/LashouBuy/LashouActivity.jsp").forward(request, response);
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
}
