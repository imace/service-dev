package com.sonymobile.sonysales.servlet.LaPopularityServlet;

import java.io.IOException;
import java.util.Hashtable;
import java.util.Map;

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
import com.sonymobile.sonysales.util.Common;
import com.sonymobile.sonysales.util.Constant;
import com.sonymobile.sonysales.util.DateUtil;
import com.sonymobile.sonysales.util.ResultMsg;

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
			String tonickname = request.getParameter("nickname");
			String toheadimgurl = request.getParameter("headimgurl");
			String toSubscribeTime = request.getParameter("subscribe_time");
			String subscribe = request.getParameter("subscribe");
			String attention="0";
			boolean isredriect=false;
			
			if (toheadimgurl!=null) {
				isredriect=true;
			}

			String fromimg = "";
			
			response.setContentType("application/json;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			if (fromid != null && toid != null) {
				String fromnickname;
				WechatUserInfo fromUserInfo = wechatInfo.getWebChatUserInfo(fromid);

				// get img url on here for temporary
				fromimg = fromUserInfo.getHeadimgurl();
				fromnickname = fromUserInfo.getNickname();

				WechatUserInfo toUserInfo = null;
				if (tonickname != null) {
					toUserInfo = new WechatUserInfo();
					toUserInfo.setOpenid(toid);
					toUserInfo.setHeadimgurl(toheadimgurl);
					toUserInfo.setNickname(tonickname);
					if (toSubscribeTime!= null && !toSubscribeTime.isEmpty()) {
						toUserInfo.setSubscribe_time(Long.parseLong(toSubscribeTime));
					}
					toUserInfo.setSubscribe(Integer.parseInt(subscribe));
				} else {
					toUserInfo = wechatInfo.getWebChatUserInfo(toid);
					tonickname = toUserInfo.getNickname();
					toheadimgurl = toUserInfo.getHeadimgurl();
				}
				
				if (toheadimgurl!=null) {
					attention="1";
				}


				// if current user is yourself then nav to other page
				if (fromid.equals(toid)) {
					navurl = "/jsp/LaPopularity/SharePage.jsp";
				} else {
					// add to-user info
					if (tonickname != null && Common.addUser(toUserInfo)) {
						// add popularity
						if(!DateUtil.isEnd()) {
							PopularityService.addPopularity(fromid, toid);
						}
						PopularityService.addPopularity(fromid, toid);
					}
					
					if (isredriect) {
						request.getRequestDispatcher("/sharepage?attention=0&tid="+toid).forward(request, response);
						return;
					}
					request.setAttribute("fid", fromid);
					request.setAttribute("tid", toid);
					String relationUrl = request.getScheme() + "://" + request.getServerName() + "/relationpage";
					String redirectHost = Constant.IS_USE_SELF_OAUTH ? Constant.OAUTH_REDIRECT_HOST
							: Constant.SECOND_OAUTH_REDIRECT_HOST;
					Hashtable<String, String> parameters = new Hashtable<String, String>();
					parameters.put("fid", fromid);
					parameters.put("i", Constant.OAUTH_IDENTIFIER);
					String codedState = Coder.generateOAuthStateFromUrl(relationUrl, parameters);
					String oauthtoidlink = buildGetOAuthUserInfoUrl(redirectHost, codedState);
					request.setAttribute("oauthtoidlink", oauthtoidlink);

					request.setAttribute("fromnickname", fromnickname == null ? "他" : fromnickname);
					request.setAttribute("tonickname", tonickname == null ? "我" : tonickname);
					request.setAttribute("fromimg", fromimg == null ? request.getContextPath() + "/img/head1.png" : fromimg);
					request.setAttribute("toimg", request.getContextPath() + "/img/head2.png");
					request.setAttribute("attention", attention);

				}
			} else {
				logger.error("Relation->doPost() emplty openId : fromid = " + fromid + ", toid = " + toid);
				navurl = "/jsp/exception/ServerInternalError.jsp";
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
