package com.sonymobile.sonysales.service;

import com.sonymobile.sonysales.dao.UserDAO;

    public class NameListService {
    
        private UserDAO userDAO = new UserDAO();
        
        public String getUser(String openId) {
            return userDAO.getUser(openId);
        }
}
