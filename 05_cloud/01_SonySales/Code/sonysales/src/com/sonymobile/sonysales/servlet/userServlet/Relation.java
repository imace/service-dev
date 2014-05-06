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

import com.sonymobile.sonysales.entity.json.SaeFetchUrlResult;
import com.sonymobile.sonysales.entity.json.WechatUserInfo;
import com.sonymobile.sonysales.util.HttpConnetcion;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;



/**
 * @author 28852095
 * 
 */
public class Relation extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3477353244980948618L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String fromid = request.getParameter("fromid");
			String toid = request.getParameter("toid");
			response.setContentType("application/json;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			String getwechatinfourl = "http://1.sonyfifadev.sinaapp.com/WeChat/getuserinfo.php";
			if (fromid!=null&&toid!=null) {

				String fromurl = getwechatinfourl + "?id=" + fromid;
				String tourl = getwechatinfourl + "?id=" + toid;

				SaeFetchUrlResult result = HttpConnetcion.saeHttpGetRequest(fromurl);
				JSONObject jsonObject = JSONObject.fromObject(result.getBody());
				WechatUserInfo weChatUserInfo1 = (WechatUserInfo) JSONObject.toBean(jsonObject, WechatUserInfo.class);

				result = HttpConnetcion.saeHttpGetRequest(tourl);
				jsonObject = JSONObject.fromObject(result.getBody());
				WechatUserInfo weChatUserInfo2 = (WechatUserInfo) JSONObject.toBean(jsonObject, WechatUserInfo.class);
				
				String fromnickname = weChatUserInfo1.getNickname();
				String tonickname = weChatUserInfo2.getNickname();
				
				HttpSession session = request.getSession();
				session.setAttribute("fromid", fromid);
				session.setAttribute("toid", toid);
				session.setAttribute("fromnickname", fromnickname==null?"cannot get name":fromnickname);
				session.setAttribute("tonickname", tonickname==null?"cannot get name":tonickname);
			}else {
				//forward to error page
				HttpSession session = request.getSession();
				/*session.setAttribute("fromnickname", "fromnickname");
				session.setAttribute("tonickname", "tonickname");
				session.setAttribute("fromid", "fromid");
				session.setAttribute("toid", "toid");*/
			}
			//only for test
			if (request.getServerName().equals("localhost")) {
				response.sendRedirect("/sonysales/jsp/RelationPage.jsp");
			} else {
				response.sendRedirect("/jsp/RelationPage.jsp");
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 */
	public Relation() {
		// TODO Auto-generated constructor stub
	}

}
