package com.sonymobile.sonysales.servlet.userServlet;

import java.io.IOException;
import java.net.URLEncoder;

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
import com.sonymobile.sonysales.util.Coder;
import com.sonymobile.sonysales.util.Constant;
import com.sonymobile.sonysales.util.HttpConnetcion;
import com.sonymobile.sonysales.util.JSONConverter;
import com.sonymobile.sonysales.util.ResultMsg;

@SuppressWarnings("serial")
public class OAuthServlet extends HttpServlet {
	private IWechatInfo wechatInfo;
	private static Logger logger = Logger.getLogger(OAuthServlet.class
			.getName());

	public OAuthServlet() {
		wechatInfo = DefaultWechatInfoImpl.getInstance();
	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String oauthCode = request.getParameter("code");
		String oauthState = request.getParameter("state");
		if (oauthCode == null || oauthCode.isEmpty()
				|| oauthCode.equals(Constant.WECHAT_OAUTH2_AUTHORIZE_DENY)) {
			String reason = request.getParameter("reason");
			oauthState = (reason != null && !reason.isEmpty()) ? reason
					: oauthState;
			requestOAuthAgain(response, oauthState);
			return;
		}

		String tokenUrl = buildGetAccessTokenUrl(oauthCode);
		SaeFetchUrlResult result = HttpConnetcion.saeHttpGetRequest(tokenUrl);

		if (result.getErrNumber() == Constant.SAE_FETCHURL_SUCCESS_CODE) {
			JSONObject jsonObject = JSONConverter
					.convertString2JSONObject(result.getBody());
			if (jsonObject == null) {
				requestErrorPageInJSONObjectParseWork(request, response);
				return;
			}
			AccessToken accessToken = (AccessToken) JSONObject.toBean(
					jsonObject, AccessToken.class);
			String oauthOpenId = accessToken.getOpenid();
			String scope = accessToken.getScope();

			if (oauthOpenId == null || oauthOpenId.isEmpty()) {
				logger.error("Get OAuth Error : " + result.getBody());
				JSONObject jsonErr = JSONConverter
						.convertString2JSONObject(result.getBody());
				WechatError error = (WechatError) JSONObject.toBean(jsonErr,
						WechatError.class);
				if (jsonErr == null) {
					requestErrorPageInJSONObjectParseWork(request, response);
					return;
				}
				// TODO : OAuth error message
			} else {
				if (Constant.WECHAT_OAUTH_SCOPES.BASE.getValue().equals(scope)) {
					responseSnsapibase(oauthState, oauthOpenId, response);
				} else {
					String token = accessToken.getAccess_token();
					responseSnsapiUserinfo(oauthState, oauthOpenId, token,
							request, response);
				}
			}
		} else {
			// TODO : Show http connection error message
			logger.error("Connected to OAuth Error : " + result.toString());
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

	private void responseSnsapibase(String oauthState, String oauthOpenId,
			HttpServletResponse response) throws IOException {
		// build the response redirect url
		String url = Coder.decodeOAuthStateToUrl(oauthState);
		StringBuilder sb = new StringBuilder(url);
		if (!url.contains("?")) {
			sb.append('?');
			sb.append("tid=");
		} else {
			sb.append("&tid=");
		}
		sb.append(oauthOpenId);

		response.sendRedirect(sb.toString());

	}

	private void responseSnsapiUserinfo(String oauthState, String oauthOpenId,
			String token, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String userInfoUrl = buildGetUserinfoUrl(token, oauthOpenId);
		SaeFetchUrlResult result = HttpConnetcion
				.saeHttpGetRequest(userInfoUrl);
		if (result.getErrNumber() == 0) {
			JSONObject jsonObject = JSONConverter
					.convertString2JSONObject(result.getBody());
			if (jsonObject == null) {
				requestErrorPageInJSONObjectParseWork(request, response);
				return;
			}
			WechatUserInfo userInfo = (WechatUserInfo) JSONObject.toBean(
					jsonObject, WechatUserInfo.class);
			if (oauthOpenId == null || oauthOpenId.isEmpty()) {
				logger.error("Get OAuth Error : " + result.getBody());
				JSONObject jsonErr = JSONConverter
						.convertString2JSONObject(result.getBody());
				WechatError error = (WechatError) JSONObject.toBean(jsonErr,
						WechatError.class);
				if (jsonErr == null) {
					requestErrorPageInJSONObjectParseWork(request, response);
					return;
				}
				// TODO : OAuth error message

			} else {
				String url = Coder.decodeOAuthStateToUrl(oauthState);
				StringBuilder sb = new StringBuilder(url);
				if (!url.contains("?")) {
					sb.append('?');
					sb.append("tid=");
				} else {
					sb.append("&tid=");
				}
				sb.append(oauthOpenId);
				sb.append("&toname=");
				sb.append(userInfo.getNickname());
				sb.append("&toheadimgurl=");
				sb.append(userInfo.getHeadimgurl());
				response.sendRedirect(sb.toString());
			}
		} else {
			// TODO : Show http connection error message
			logger.error("Get OAuth UserInfo : " + result.toString());
		}
	}

	/**
	 * The OAuth request the the OAuth again if user pressed "cancel" button
	 * again.
	 * */
	private void requestOAuthAgain(HttpServletResponse response, String state)
			throws IOException {
		StringBuilder sb = new StringBuilder(
				Constant.WECHAT_OAUTH2_AUTHORIZE_URL);
		sb.append('?');
		sb.append("appid=");
		sb.append(Constant.APP_ID);
		sb.append("&redirect_uri=");
		String redirectHost = Constant.IS_USE_SELF_OAUTH ? Constant.OAUTH_REDIRECT_HOST
				: Constant.SECOND_OAUTH_REDIRECT_HOST;
		sb.append(redirectHost);
		sb.append("&response_type=code&scope=");
		sb.append(Constant.WECHAT_OAUTH_SCOPES.USERINFO.getValue());
		sb.append("&state=");
		sb.append(state);
		sb.append("#wechat_redirect");

		response.sendRedirect(sb.toString());
	}

	private void requestErrorPageInJSONObjectParseWork(
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		StringBuilder url = new StringBuilder(request.getContextPath());
		url.append("/jsp/errorhandler.jsp");
		url.append('?');
		url.append("errnum=");
		url.append(ResultMsg.ERROR_CODE_IN_NETWORK_CONNECTION);
		url.append("&errmsg=");
		url.append(URLEncoder.encode(
				ResultMsg.ERROR_MESSAGE_IN_NETWORK_CONNECTION, "utf-8"));

		logger.info(url.toString());
		response.sendRedirect(url.toString());
	}
	
	private void getOAuthIdentifier(String url) {
		
	}
}
