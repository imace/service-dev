package com.sonymobile.sonysales.servlet.userServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

import com.sonymobile.sonysales.entity.DefaultWechatInfoImpl;
import com.sonymobile.sonysales.entity.IWechatInfo;
import com.sonymobile.sonysales.entity.json.AccessToken;
import com.sonymobile.sonysales.entity.json.SaeFetchUrlResult;
import com.sonymobile.sonysales.entity.json.WechatError;
import com.sonymobile.sonysales.entity.json.WechatUserInfo;
import com.sonymobile.sonysales.util.Base64Coder;
import com.sonymobile.sonysales.util.Constant;
import com.sonymobile.sonysales.util.HttpConnetcion;

@SuppressWarnings("serial")
public class OAuthServlet extends HttpServlet {
	private IWechatInfo wechatInfo;
	private static Logger logger = Logger.getLogger(OAuthServlet.class
			.getName());

	public OAuthServlet() {
		wechatInfo = new DefaultWechatInfoImpl();
	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String oauthCode = request.getParameter("code");
		String oauthState = request.getParameter("state");
		String fromOpenId = request.getParameter("fromid");
		String fromName = request.getParameter("fromname");

		String tokenUrl = buildGetAccessTokenUrl(oauthCode);
		SaeFetchUrlResult result = HttpConnetcion.saeHttpGetRequest(tokenUrl);

		if (result.getErrNumber() == 0) {
			JSONObject jsonObject = JSONObject.fromObject(result.getBody());
			AccessToken accessToken = (AccessToken) JSONObject.toBean(
					jsonObject, AccessToken.class);
			String oauthOpenId = accessToken.getOpenid();
			String scope = accessToken.getScope();

			if (oauthOpenId == null || oauthOpenId.isEmpty()) {
				logger.error("Get OAuth Error　: " + result.getBody());
				JSONObject jsonErr = JSONObject.fromObject(result.getBody());
				WechatError error = (WechatError) JSONObject.toBean(jsonErr,
						WechatError.class);
				// TODO : OAuth error message
			} else {
				if (Constant.WECHAT_OAUTH_SCOPES.BASE.getValue().equals(scope)) {
					responseSnsapibase(oauthState, fromOpenId, fromName,
							oauthOpenId, response);
				} else {
					String token = accessToken.getAccess_token();
					responseSnsapiUserinfo(oauthState, fromOpenId, fromName,
							oauthOpenId, token, response);
				}
			}
		} else {
			// TODO : Show http connection error message
			logger.error("Connected to OAuth Error　: " + result.toString());
		}
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private String buildGetAccessTokenUrl(String code) {
		StringBuilder getAccessTokenUrlStr = new StringBuilder(
				Constant.WECHAT_OAUTH2_ACCESSTOKEN_URL);
		getAccessTokenUrlStr.append("?appid=");
		getAccessTokenUrlStr.append(wechatInfo.getAppId());
		getAccessTokenUrlStr.append("&secret=");
		getAccessTokenUrlStr.append(wechatInfo.getAppSecret());
		getAccessTokenUrlStr.append("&code=");
		getAccessTokenUrlStr.append(code);
		getAccessTokenUrlStr.append("&grant_type=authorization_code");
		return getAccessTokenUrlStr.toString();
	}

	private String buildGetUserinfoUrl(String token, String openId) {
		StringBuilder getUserInfoUrlStr = new StringBuilder(
				Constant.WECHAT_OAUTH2_USERINFO_URL);
		getUserInfoUrlStr.append("?access_token=");
		getUserInfoUrlStr.append(token);
		getUserInfoUrlStr.append("&openid=");
		getUserInfoUrlStr.append(openId);
		getUserInfoUrlStr.append("&lang=zh_CN");
		return getUserInfoUrlStr.toString();
	}

	private void responseSnsapibase(String oauthState, String fromOpenId,
			String fromName, String oauthOpenId, HttpServletResponse response)
			throws IOException {
		// build the response redirect url
		String url = Base64Coder.convertBase64ToStr(oauthState);
		StringBuilder sb = new StringBuilder(url);
		sb.append('?');
		sb.append("toid=");
		sb.append(oauthOpenId);
		if (fromOpenId != null && !fromOpenId.isEmpty()) {
			sb.append("&fromid=");
			sb.append(fromOpenId);
		}
		if (fromName != null && !fromName.isEmpty()) {
			sb.append("&fromname=");
			sb.append(fromName);
		}

		response.sendRedirect(sb.toString());

	}

	private void responseSnsapiUserinfo(String oauthState, String fromOpenId,
			String fromName, String oauthOpenId, String token,
			HttpServletResponse response) throws IOException {
		String userInfoUrl = buildGetUserinfoUrl(token, oauthOpenId);
		SaeFetchUrlResult result = HttpConnetcion
				.saeHttpGetRequest(userInfoUrl);
		if (result.getErrNumber() == 0) {
			JSONObject jsonObject = JSONObject.fromObject(result.getBody());
			WechatUserInfo userInfo = (WechatUserInfo) JSONObject.toBean(
					jsonObject, WechatUserInfo.class);
			if (oauthOpenId == null || oauthOpenId.isEmpty()) {
				logger.error("Get OAuth Error　: " + result.getBody());
				JSONObject jsonErr = JSONObject.fromObject(result.getBody());
				WechatError error = (WechatError) JSONObject.toBean(jsonErr,
						WechatError.class);
				// TODO : OAuth error message

			} else {
				String url = Base64Coder.convertBase64ToStr(oauthState);
				StringBuilder sb = new StringBuilder(url);
				sb.append('?');
				sb.append("toid=");
				sb.append(oauthOpenId);
				sb.append("&toname=");
				sb.append(userInfo.getNickname());
				if (fromOpenId != null && !fromOpenId.isEmpty()) {
					sb.append("&fromid=");
					sb.append(fromOpenId);
				}
				if (fromName != null && !fromName.isEmpty()) {
					sb.append("&fromname=");
					sb.append(fromName);
				}
				response.sendRedirect(sb.toString());
			}
		} else {
			// TODO : Show http connection error message
			logger.error("Get OAuth UserInfo　: " + result.toString());
		}
	}

}
