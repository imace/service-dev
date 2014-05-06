package com.sonymobile.sonysales.servlet.userServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.sonymobile.sonysales.entity.DefaultWechatInfoImpl;
import com.sonymobile.sonysales.entity.IWechatInfo;
import com.sonymobile.sonysales.entity.json.AccessToken;
import com.sonymobile.sonysales.entity.json.SaeFetchUrlResult;
import com.sonymobile.sonysales.util.Base64Coder;
import com.sonymobile.sonysales.util.Constant;
import com.sonymobile.sonysales.util.HttpConnetcion;

public class OAuthServlet extends HttpServlet {
	private IWechatInfo wechatInfo;

	public OAuthServlet() {
		wechatInfo = new DefaultWechatInfoImpl();
	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String oauthCode = request.getParameter("code");
		String oauthState = request.getParameter("state");
		String fromOpenId = request.getParameter("id");

		String tokenUrl = buildGetAccessTokenUrl(oauthCode);
		SaeFetchUrlResult result = HttpConnetcion.saeHttpGetRequest(tokenUrl);

		JSONObject jsonObject = JSONObject.fromObject(result.getBody());
		AccessToken accessToken = (AccessToken) JSONObject.toBean(jsonObject,
				AccessToken.class);
		String oauthOpenId = accessToken.getOpenid();

		// build the response redirect url
		String url = Base64Coder.convertBase64ToStr(oauthState);
		StringBuilder sb = new StringBuilder(url);
		if (oauthOpenId != null && !oauthOpenId.isEmpty()) {
			sb.append('?');
			sb.append("toid=");
			sb.append(oauthOpenId);
		}
		if (fromOpenId != null && !fromOpenId.isEmpty()) {
			if (oauthOpenId != null && !oauthOpenId.isEmpty()) {
				sb.append('&');
			} else {
				sb.append('?');
			}
			sb.append("fromid=");
			sb.append(fromOpenId);
		}

		response.sendRedirect(sb.toString());
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

}
