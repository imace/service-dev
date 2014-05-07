/**
 * 
 */
package com.sonymobile.sonysales.servlet.userServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

import com.sonymobile.sonysales.entity.DefaultWechatInfoImpl;
import com.sonymobile.sonysales.entity.IWechatInfo;
import com.sonymobile.sonysales.entity.json.SaeFetchUrlResult;
import com.sonymobile.sonysales.entity.json.WechatUserInfo;
import com.sonymobile.sonysales.util.Base64Coder;
import com.sonymobile.sonysales.util.Constant;
import com.sonymobile.sonysales.util.HttpConnetcion;

/**
 * @author 28852095
 * 
 */
public class Relation extends HttpServlet {

	/**
	 *
	 */
	private static final long serialVersionUID = 3477353244980948618L;

	private static Logger logger = Logger.getLogger(Relation.class.getName());
	private IWechatInfo wechatInfo;

	public Relation() {
		wechatInfo = new DefaultWechatInfoImpl();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
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
					fromnickname = GetNickNamebyOpenId(fromid);
				}

				if (toname != null) {
					tonickname = toname;
				} else {
					tonickname = GetNickNamebyOpenId(toid);
				}

				String relationUrl = Base64Coder
						.convertStrToBase64(Constant.HOST + "/relationpage");
				/*
				 * if (tonickname == null) { tonickname =
				 * getOAuthUserInfo(fromid, relationUrl,
				 * response).getNickname(); }
				 */

				request.setAttribute("fromid", fromid);
				request.setAttribute("toid", toid);
				String oauthtoidlink = buildGetOAuthUserInfoUrl(fromid,
						fromnickname, relationUrl);

				if (tonickname == null) {
					request.setAttribute("oauthtoidlink", oauthtoidlink);
				}

				request.setAttribute("fromnickname",
						fromnickname == null ? "cannot get name" : fromnickname);
				request.setAttribute("tonickname",
						tonickname == null ? "cannot get name" : tonickname);
			} else {
				// forward to error page
				request.setAttribute("fromid", fromid);
				request.setAttribute("toid", toid);
				request.setAttribute("fromnickname", "Ëû");
				request.setAttribute("tonickname", "ÎÒ");
			}
			request.getRequestDispatcher("/jsp/RelationPage.jsp").forward(request, response);
		} catch (JSONException e) {
			logger.error("Relation in json convert : " + e.getMessage());
			e.printStackTrace();
		}
	}

	private String GetNickNamebyOpenId(String openid) {
		String nickName = "";
		String getwechatinfourl = "http://1.sonyfifadev.sinaapp.com/WeChat/getuserinfo.php";
		String url = getwechatinfourl + "?id=" + openid;
		try {
			SaeFetchUrlResult result = HttpConnetcion.saeHttpGetRequest(url);
			JSONObject jsonObject = JSONObject.fromObject(result.getBody());
			WechatUserInfo weChatUserInfo1 = (WechatUserInfo) JSONObject
					.toBean(jsonObject, WechatUserInfo.class);
			nickName = weChatUserInfo1.getNickname();
		} catch (Exception e) {
			nickName = null;
		}
		return nickName;
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
