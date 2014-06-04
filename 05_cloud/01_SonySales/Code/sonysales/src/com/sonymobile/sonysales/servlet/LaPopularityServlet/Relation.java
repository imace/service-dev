package com.sonymobile.sonysales.servlet.LaPopularityServlet;

import java.io.IOException;
import java.util.Hashtable;

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
import com.sonymobile.sonysales.util.Coder;
import com.sonymobile.sonysales.util.Constant;

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

			String navurl = "/jsp/LaPopularity/RelationPage.jsp";
			String fromid = request.getParameter("fid");
			String toid = request.getParameter("openid");
			String toname = request.getParameter("nickname");
			String toheadimgurl = request.getParameter("headimgurl");
			String attention="0";
			boolean isredriect=false;
			
			if (toheadimgurl!=null) {
				isredriect=true;
			}

			String fromimg = "";
			String toimg = toheadimgurl;
			
			response.setContentType("application/json;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			if (fromid != null && toid != null) {
				String tonickname, fromnickname;
				WechatUserInfo fromUserInfo = wechatInfo.getWebChatUserInfo(fromid);

				// get img url on here for temporary
				fromimg = fromUserInfo.getHeadimgurl();
				fromnickname = fromUserInfo.getNickname();

				if (toname != null) {
					tonickname = toname;
				} else {
					WechatUserInfo toUserInfo = wechatInfo.getWebChatUserInfo(toid);
					tonickname = toUserInfo.getNickname();
					toimg = toUserInfo.getHeadimgurl();
				}
				
				if (toimg!=null) {
					attention="1";
				}


				// if current user is yourself then nav to other page
				if (fromid.equals(toid)) {
					navurl = "/jsp/LaPopularity/SharePage.jsp";
				} else {
					String relationUrl = request.getScheme() + "://" + request.getServerName() + "/relationpage";
					request.setAttribute("fid", fromid);
					request.setAttribute("tid", toid);
					String redirectHost = Constant.IS_USE_SELF_OAUTH ? Constant.OAUTH_REDIRECT_HOST
							: Constant.SECOND_OAUTH_REDIRECT_HOST;
					Hashtable<String, String> parameters = new Hashtable<String, String>();
					parameters.put("fid", fromid);
					parameters.put("i", Constant.OAUTH_IDENTIFIER);
					String codedState = Coder.generateOAuthStateFromUrl(relationUrl, parameters);
					String oauthtoidlink = buildGetOAuthUserInfoUrl(redirectHost, codedState);
					request.setAttribute("oauthtoidlink", oauthtoidlink);
					// add to-user info
					if (Activity.AddUser(toid, tonickname)) {
						// add popularity
						PopularityService.addPopularity(fromid, toid);
					}
					
					if (isredriect) {
						response.sendRedirect(request.getContextPath()+"/sharepage?attention=0");
						return;
					}

					request.setAttribute("fromnickname", fromnickname == null ? "他" : fromnickname);
					request.setAttribute("tonickname", tonickname == null ? "我" : tonickname);
					request.setAttribute("fromimg", fromimg == null ? request.getContextPath() + "/img/head1.png" : fromimg);
					request.setAttribute("toimg", request.getContextPath() + "/img/head2.png");
					request.setAttribute("attention", attention);

				}
			} else {
				request.setAttribute("fid", fromid);
				request.setAttribute("tid", toid);
				request.setAttribute("fromnickname", "他_");
				request.setAttribute("tonickname", "我");
				request.setAttribute("fromimg", request.getContextPath() + "/img/head1.png");
				request.setAttribute("toimg", request.getContextPath() + "/img/head2.png");
			}
			request.getRequestDispatcher(navurl).forward(request, response);
			return;
		} catch (JSONException e) {
			logger.error("Relation->doPost() in exception : " + e.getMessage());
			e.printStackTrace();
		}
	}

	private String buildGetOAuthUserInfoUrl(String host, String codedUrl) {
		StringBuilder infourl = new StringBuilder(Constant.WECHAT_OAUTH2_AUTHORIZE_URL);
		infourl.append('?');
		infourl.append("appid=");
		infourl.append(wechatInfo.getAppId());
		infourl.append("&redirect_uri=");
		infourl.append(host);
		infourl.append("&response_type=code&scope=");
		infourl.append(Constant.WECHAT_OAUTH_SCOPES.USERINFO.getValue());
		infourl.append("&state=");
		infourl.append(codedUrl);
		infourl.append("#wechat_redirect");
		return infourl.toString();
	}

}
