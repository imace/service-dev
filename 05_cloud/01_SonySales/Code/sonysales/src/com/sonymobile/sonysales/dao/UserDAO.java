package com.sonymobile.sonysales.dao;

import java.util.List;

import net.sf.json.JSONArray;

import com.sonymobile.sonysales.model.User;

public class UserDAO {

    public String getUser(String openId) {
        String sql = "select * from user u where u.openId = '" + openId +"'";
        return BaseDAO.findBySql(sql).toString();
    }
    
    
    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
        String userStr = userDAO.getUser("1");
        JSONArray jSONArray = JSONArray.fromObject(userStr);
        List<User> userList  = (List<User>) JSONArray.toList(jSONArray,User.class);
        System.out.println(userList.get(0).getAddress());
        System.out.println(userList.get(0).getOpenId());
        System.out.println(userList.get(0).getId());
    }
    
}
