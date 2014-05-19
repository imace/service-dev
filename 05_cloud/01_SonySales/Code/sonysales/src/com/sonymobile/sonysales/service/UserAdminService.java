package com.sonymobile.sonysales.service;

import java.util.List;

import com.sonymobile.sonysales.dao.AdministratorDAO;
import com.sonymobile.sonysales.model.Administrator;

public class UserAdminService {

	// 添加管理员
	public boolean addAdministrator(Administrator administrator) {
		return AdministratorDAO.add(administrator);
	}

	public Administrator getAdministratorById(long id) {
   return AdministratorDAO.getAdministratorById(id);
	}
	
	public Administrator getAdministratorByUserName(String userName) {
   return AdministratorDAO.getAdministratorByUserName(userName);
	}
	
   public List<?> getAdministratorList() {
       return AdministratorDAO.getAdministratorList();
        }
	
}
