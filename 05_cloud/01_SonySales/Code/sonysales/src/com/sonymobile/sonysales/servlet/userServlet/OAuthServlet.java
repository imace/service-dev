package com.sonymobile.sonysales.servlet.userServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.sonymobile.sonyfifa.entity.json.AccessToken;
import com.sonymobile.sonyfifa.entity.json.SaeFetchUrlResult;
import com.sonymobile.sonyfifa.util.Constant;
import com.sonymobile.sonyfifa.util.HttpConnetcion;
import com.sonymobile.sonysales.entity.DefaultWechatInfoImpl;
import com.sonymobile.sonysales.entity.IWechatInfo;

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

		if (Constant.WECHAT_OAUTH_POPULARITY_STATE.equals(oauthState)) {
			String url = buildGetAccessTokenUrl(oauthCode);
			SaeFetchUrlResult result = HttpConnetcion.saeHttpGetRequest(url);

			JSONObject jsonObject = JSONObject.fromObject(result.getBody());
			AccessToken accessToken  = (AccessToken) JSONObject.toBean(jsonObject,AccessToken.class);
			String oauthOpenId = accessToken.getOpenid();
			if (oauthOpenId == null || oauthOpenId.isEmpty()) {
				// TODO : OAuthOpenId is null
			} else if (oauthOpenId.equals(fromOpenId)) {
				// TODO : Redirect to an error page
			} else {
				StringBuilder sb = new StringBuilder(Constant.HOST);
				sb.append('?');
				sb.append("fromid=");
				sb.append(fromOpenId);
				sb.append("&toid=");
				sb.append(oauthOpenId);

				response.sendRedirect(sb.toString());
			}
			
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

}
