package com.sonymobile.sonysales.servlet.LashouBuy;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import net.sf.json.JSONException;
import com.sonymobile.sonysales.entity.DefaultWechatInfoImpl;
import com.sonymobile.sonysales.entity.IWechatInfo;
import com.sonymobile.sonysales.entity.json.WechatUserInfo;
import com.sonymobile.sonysales.service.PopularityService;
import com.sonymobile.sonysales.servlet.LashouBuy.LashouActivity;
import com.sonymobile.sonysales.util.Base64Coder;
import com.sonymobile.sonysales.util.Constant;

/**
 * Servlet implementation class LashouActivity
 */
public class LashouRelation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(LashouRelation.class.getName());
	private IWechatInfo wechatInfo;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LashouRelation() {
    	wechatInfo = DefaultWechatInfoImpl.getInstance();
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
			
			String navurl="/jsp/LashouBuy/LashouRelation.jsp";
			
			String fromid = request.getParameter("fromid");
			String fromname = request.getParameter("fromname");
			
			logger.error("nickname from first page>>>>>>>>>>>> : " + fromname);
			
			String toid = request.getParameter("toid");
			String toname = request.getParameter("toname");
			response.setContentType("application/json;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");

			if (fromid != null && toid != null) {
				String tonickname, fromnickname;
				
				if (fromname != null) {
					fromnickname = fromname;
				} else {
					fromnickname = wechatInfo.getWebChatUserInfo(fromid).getNickname();
				}

				if (toname != null) {
					tonickname = toname;
				} else {
					tonickname = wechatInfo.getWebChatUserInfo(toid).getNickname();
				}
				
				
				// if current user is yourself then nav to other page 
				if (fromid.equals(toid)) {
					logger.error("cannot select yourself.>>>>>>>>>>>> : " + fromid+"____"+toid);
					navurl="/jsp/LashouBuy/LashouFollow.jsp";
				}else {
					String relationUrl = Base64Coder.convertStrToBase64(Constant.HOST + "/lashourelation");
					request.setAttribute("fromid", fromid);
					request.setAttribute("toid", toid);
					String oauthtoidlink = buildGetOAuthUserInfoUrl(fromid, fromnickname, relationUrl);
					request.setAttribute("oauthtoidlink", oauthtoidlink);
					
					//add to-user info
					if (LashouActivity.AddUser(toid, tonickname)) {
						//add popularity
						PopularityService.addPopularity(fromid, toid);
					}
					
					request.setAttribute("fromnickname", fromnickname == null ? "他" : fromnickname);
					request.setAttribute("tonickname", tonickname == null ? "我" : tonickname);
				}
			} else {
				// forward to error page
				request.setAttribute("fromid", fromid);
				request.setAttribute("toid", toid);
				request.setAttribute("fromnickname", "他_");
				request.setAttribute("tonickname", "我");
			}
			request.getRequestDispatcher(navurl).forward(request, response);
		} catch (JSONException e) {
			logger.error("Relation in json convert : " + e.getMessage());
			e.printStackTrace();
		}
	}	

	private String buildGetOAuthUserInfoUrl(String fromid, String fromname,
			String codedUrl) {
		StringBuilder infourl = new StringBuilder(
				Constant.WECHAT_OAUTH2_AUTHORIZE_URL);
		infourl.append('?');
		infourl.append("appid=");
		infourl.append(wechatInfo.getAppId());
		infourl.append("&redirect_uri=");
		infourl.append(Constant.HOST);
		infourl.append("/wechat_authorize?fromid=");
		infourl.append(fromid);
		infourl.append("&fromname=");
		infourl.append(fromname);
		infourl.append("&response_type=code&scope=");
		infourl.append(Constant.WECHAT_OAUTH_SCOPES.USERINFO.getValue());
		infourl.append("&state=");
		infourl.append(codedUrl);
		infourl.append("#wechat_redirect");

		return infourl.toString();
	}

}
