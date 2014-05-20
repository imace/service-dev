package com.sonymobile.sonysales.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieHelper {
    
    /**
     * 设置cookie
     * @param response
     * @param name  cookie名字
     * @param value cookie值
     * @param maxAge cookie生命周期  以秒为单位
     */
    public static void addCookie(HttpServletResponse response,String name,String value, String path){
        Cookie cookie = new Cookie(name,Base64Coder.convertStrToBase64(value));
        //cookie.setPath("/");
        cookie.setPath(path);
        
        //if(maxAge>0)  cookie.setMaxAge(maxAge);
        response.addCookie(cookie);
    }
    /**
     * 根据名字获取cookie
     * @param request
     * @param name cookie名字
     * @return
     */
    public static String getValueFromCookieByName(HttpServletRequest request,String name){
        Map<String,Cookie> cookieMap = ReadCookieMap(request);
        if(cookieMap.containsKey(name)){
            Cookie cookie = (Cookie)cookieMap.get(name);
            if(cookie!=null) {
                return Base64Coder.convertBase64ToStr(cookie.getValue());
            }
        }
            return null;
    }
     
     
     
    /**
     * 将cookie封装到Map里面
     * @param request
     * @return
     */
    private static Map<String,Cookie> ReadCookieMap(HttpServletRequest request){  
        Map<String,Cookie> cookieMap = new HashMap<String,Cookie>();
        Cookie[] cookies = request.getCookies();
        if(null!=cookies){
            for(Cookie cookie : cookies){
                cookieMap.put(cookie.getName(), cookie);
            }
        }
        return cookieMap;
    }
    
    public static void removeAllCookies(HttpServletRequest request, HttpServletResponse response, String path) {
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            cookie.setMaxAge(0);
            cookie.setPath(path);
            response.addCookie(cookie);
        }
    }
    public static void removeCookie(HttpServletResponse response, String name, String path) {
        Cookie newCookie=new Cookie(name,null); //假如要删除名称为name的Cookie
        newCookie.setMaxAge(0); //立即删除型
        newCookie.setPath(path); //项目所有目录均有效，这句很关键，否则不敢保证删除
        response.addCookie(newCookie); //重新写入，将覆盖之前的
    }
}