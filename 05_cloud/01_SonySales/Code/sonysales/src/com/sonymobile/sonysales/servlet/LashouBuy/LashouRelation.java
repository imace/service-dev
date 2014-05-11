package com.sonymobile.sonysales.servlet.LashouBuy;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONException;
import org.apache.log4j.Logger;
import com.sonymobile.sonysales.entity.DefaultWechatInfoImpl;
import com.sonymobile.sonysales.entity.IWechatInfo;
import com.sonymobile.sonysales.service.HandleService;
import com.sonymobile.sonysales.util.Base64Coder;
import com.sonymobile.sonysales.util.Constant;


public class LashouRelation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(LashouRelation.class.getName());
	private IWechatInfo wechatInfo;


    public LashouRelation() {
    	wechatInfo = DefaultWechatInfoImpl.getInstance();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String navurl="/jsp/LashouBuy/LashouRelation.jsp";
			
			String fromid = request.getParameter("fromid");
			String fromname = request.getParameter("fromname");			
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
					navurl="/jsp/LashouBuy/LashouFollow.jsp";
				}else {
					String relationUrl = Base64Coder.convertStrToBase64(Constant.HOST + "/lashourelation");
					request.setAttribute("fromid", fromid);
					request.setAttribute("toid", toid);
					String oauthtoidlink = buildGetOAuthUserInfoUrl(fromid, fromnickname, relationUrl);
					request.setAttribute("oauthtoidlink", oauthtoidlink);
					
					//add to-user info
					if (LashouActivity.AddUser(toid, tonickname)) {
						//add handle
						HandleService.addHandle(fromid, toid);
					}
					
					request.setAttribute("fromnickname", fromnickname == null ? "��" : fromnickname);
					request.setAttribute("tonickname", tonickname == null ? "��" : tonickname);
				}
			} else {
				// forward to error page
				request.setAttribute("fromid", fromid);
				request.setAttribute("toid", toid);
				request.setAttribute("fromnickname", "��_");
				request.setAttribute("tonickname", "��");
			}
			request.getRequestDispatcher(navurl).forward(request, response);
		} catch (JSONException e) {
			logger.error("LashouRelation->doPost() in exception : " + e.getMessage());
			e.printStackTrace();
		}
	}	

	private String buildGetOAuthUserInfoUrl(String fromid, String fromname, String codedUrl) {
		StringBuilder infourl = new StringBuilder(Constant.WECHAT_OAUTH2_AUTHORIZE_URL);
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