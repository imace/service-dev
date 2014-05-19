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
import javax.servlet.http.HttpSession;

import com.sonymobile.sonysales.util.CookieHelper;


public class LoginFilter implements Filter{  
    
    @Override  
    public void init(FilterConfig filterConfig) throws ServletException {  
        // TODO Auto-generated method stub  
          
    }  
  
    @Override  
    public void doFilter(ServletRequest request, ServletResponse response,  
            FilterChain chain) throws IOException, ServletException {  
              
        HttpServletResponse resp = (HttpServletResponse)response;  
        HttpServletRequest req = (HttpServletRequest)request;  
          
        //System.out.println(req.getRequestURL());  
        String requestURL = req.getRequestURL().toString();  
        String requestName = requestURL.substring(requestURL.lastIndexOf("/")+1);  
        //System.out.println(requestName);  
  
        //拦截地址中login.html及以.js和.css结尾的请求地址  
    if(requestName.equals("login")||requestName.equals("Login.jsp")||requestName.matches(".*\\.js$")||requestName.matches(".*\\.css$")){  
            //System.out.println(requestName);  
            //跳到下一步请求  
            chain.doFilter(request, response);  
            return; 
            
        }  
          
//        HttpSession session = req.getSession(true);  
//          
//        String username =  (String) session.getAttribute("userName");

        String userName = CookieHelper.getValueFromCookieByName(req, "userName");
        System.out.println("【LoginFilter userName】:"+userName); 
        if(userName == null||"".equals(userName)){  
            resp.sendRedirect(req.getContextPath()+"/jsp/Management/Login.jsp"); 
        }else {  
            chain.doFilter(request,response);  
        }  
    }  
  
    @Override  
    public void destroy() {  
        // TODO Auto-generated method stub  
          
    }  
  
}  