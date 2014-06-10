package com.sonymobile.sonysales.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sonymobile.sonysales.util.Common;
import com.sonymobile.sonysales.util.LogHelper;

public class CharacterEncodingFilter implements Filter {

	private FilterConfig config;
	private String encoding;

	public void destroy() {

	}

	// 主要做过滤工作的方法
	// filterchain用不高于调用过滤器链中的下一个过滤器
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// 获取Filter的初始化参数的值
		// String encoding = config.getInitParameter("encoding");
		// System.err.println(encoding);
		if (encoding != null && !"".equals(encoding)) {
			// 设置情节数据的编码方式
			request.setCharacterEncoding(encoding);
			response.setCharacterEncoding(encoding);
		}
		HttpServletRequest req = (HttpServletRequest) request;
		if (req != null) {
			String url = req.getRequestURL().toString();
			if (url != null) {
				if (url.contains("/jsp/Description.jsp")
						|| url.contains("/Description")) {
					String openId = request.getParameter("id");
					if (openId == null) {
						openId = (String) request.getAttribute("id");
					}
					if (openId != null) {
						String ip = Common.getIpAddr(req);
						LogHelper.addPVLog(openId, "描述页", ip);
					}
				} else if (url.contains("/jsp/nameList.jsp")
						|| url.contains("/getNameList")) {
					String openId = (String) request.getParameter("id");
					String ip = Common.getIpAddr(req);
					LogHelper.addPVLog(openId, "大奖榜", ip);
				} else if (url.contains("/jsp/LaPopularity/ActivityPage.jsp")
						|| url.contains("/activitypage")) {
					String openId = (String) request.getParameter("id");
					String ip = Common.getIpAddr(req);
					LogHelper.addPVLog(openId, "拉人气宣传页", ip);
				} else if (url.contains("/jsp/LaPopularity/RelationPage.jsp")
						|| url.contains("/relationpage")) {
					String toid = (String) request.getParameter("openid");
					String ip = Common.getIpAddr(req);
					LogHelper.addPVLog(toid, "拉人气接收页", ip);
				} else if (url.contains("/jsp/ShowUserInfoPage.jsp")
						|| url.contains("/myInfo")) {
					String openId = (String) request.getParameter("id");
					String ip = Common.getIpAddr(req);
					LogHelper.addPVLog(openId, "我的战况", ip);
				} else if (url.contains("/jsp/News.jsp")
						|| url.contains("/news")) {
					String openid = (String) request.getParameter("openid");
					if (openid == null) {
						openid = (String) request.getParameter("fid");
					}
					String ip = Common.getIpAddr(req);
					LogHelper.addPVLog(openid, "快报页", ip);
				} else if (url.endsWith("/") && response instanceof HttpServletResponse) {
					((HttpServletResponse)response).sendRedirect("/jsp/exception/PageNotFound.jsp");
				}
			}
		}
		// 把请求和响应对象传给过滤链中的下一个要调用的过滤器或Servlet
		if (chain != null) {
			chain.doFilter(request, response);
		}
	}

    //Filter初始化是的回调方法
    public void init(FilterConfig filterConfig) throws ServletException {
         this.config = filterConfig;
         this.encoding = filterConfig.getInitParameter("encoding");  

    }
}
