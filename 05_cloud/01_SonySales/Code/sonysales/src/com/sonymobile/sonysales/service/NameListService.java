package com.sonymobile.sonysales.service;

import com.sonymobile.sonysales.dao.HandleDAO;
import com.sonymobile.sonysales.dao.UserDAO;

    public class NameListService {
    
        private UserDAO userDAO = new UserDAO();
        
        private HandleDAO HandleDAO = new HandleDAO();
        
                 //获取人气榜
        public String getNameListOfPopularity(String limit) {
            return userDAO.getUserList(limit, "points");
        }
        
                //获取拉手榜
        public String getNameListOfHandle(String limit) {
            return HandleDAO.getSupporterCount(limit);
        }
}
