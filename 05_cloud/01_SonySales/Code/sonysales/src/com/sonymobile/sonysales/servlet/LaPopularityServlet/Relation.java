/**
 * 
 */
package com.sonymobile.sonysales.servlet.LaPopularityServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONException;
import org.apache.log4j.Logger;
import com.sonymobile.sonysales.entity.DefaultWechatInfoImpl;
import com.sonymobile.sonysales.entity.IWechatInfo;
import com.sonymobile.sonysales.entity.json.WechatUserInfo;
import com.sonymobile.sonysales.service.PopularityService;
import com.sonymobile.sonysales.util.Base64Coder;
import com.sonymobile.sonysales.util.Constant;

/**
 * @author 28852095
 * 
 */
public class Relation extends HttpServlet {

	private static final long serialVersionUID = 3477353244980948618L;
	private static Logger logger = Logger.getLogger(Relation.class.getName());
	private IWechatInfo wechatInfo;

	public Relation() {
		wechatInfo = DefaultWechatInfoImpl.getInstance();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String navurl="/jsp/LaPopularity/RelationPage.jsp";
			String fromid = request.getParameter("fromid");
			String fromname = request.getParameter("fromname");
			String toid = request.getParameter("toid");
			String toname = request.getParameter("toname");
			String fromimg="";
			String toimg="";
			
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
				
				//get img url on here for temporary
				fromimg=wechatInfo.getWebChatUserInfo(fromid).getHeadimgurl();
				toimg=wechatInfo.getWebChatUserInfo(toid).getHeadimgurl();
				
				// if current user is yourself then nav to other page 
				if (fromid.equals(toid)) {
					navurl="/jsp/LaPopularity/SharePage.jsp";
				}else {
					String relationUrl = Base64Coder.convertStrToBase64(Constant.HOST + "/relationpage");
					request.setAttribute("fromid", fromid);
					request.setAttribute("toid", toid);
					String oauthtoidlink = buildGetOAuthUserInfoUrl(fromid, fromnickname, relationUrl);
					request.setAttribute("oauthtoidlink", oauthtoidlink);
					
					//add to-user info
					if (Activity.AddUser(toid, tonickname)) {
						//add popularity
						PopularityService.addPopularity(fromid, toid);
					}
					
					request.setAttribute("fromnickname", fromnickname == null ? "他" : fromnickname);
					request.setAttribute("tonickname", tonickname == null ? "我" : tonickname);
					request.setAttribute("fromimg", fromimg == null ? Constant.HOST+"/img/head1.png" : fromimg);
					request.setAttribute("toimg", toimg == null ? Constant.HOST+"/img/head2.png" : toimg);
					
				}
			} else {
				// forward to error page
				request.setAttribute("fromid", fromid);
				request.setAttribute("toid", toid);
				request.setAttribute("fromnickname", "他_");
				request.setAttribute("tonickname", "我");
				//request.setAttribute("fromimg", Constant.HOST+"/img/head1.png");
				//request.setAttribute("toimg", Constant.HOST+"/img/head2.png");
			}
			request.getRequestDispatcher(navurl).forward(request, response);
		} catch (JSONException e) {
			logger.error("Relation->doPost() in exception : " + e.getMessage());
			e.printStackTrace();
		}
	}

	private WechatUserInfo getOAuthUserInfo(String fromId, String fromName,
			String codedUrl, HttpServletResponse response) {
		String url = buildGetOAuthUserInfoUrl(fromId, fromName, codedUrl);

		WechatUserInfo weChatUserInfo = new WechatUserInfo();

		try {
			response.sendRedirect(url);
			/*
			 * SaeFetchUrlResult result = HttpConnetcion.saeHttpGetRequest(url);
			 * if (result.getErrNumber() == 0) { JSONObject jsonObject =
			 * JSONObject.fromObject(result.getBody()); weChatUserInfo =
			 * (WechatUserInfo) JSONObject.toBean( jsonObject,
			 * WechatUserInfo.class); if (weChatUserInfo.getNickname() == null)
			 * { logger.fatal("Get OAuth user info error : " +
			 * result.getBody()); }
			 * 
			 * } else { // logger.fatal("Get User info err in connection: " +
			 * result.getContent());
			 * 
			 * }
			 */
		} catch (Exception e) {
			logger.fatal("Get User info : " + e.getMessage());
		}
		return weChatUserInfo;

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
