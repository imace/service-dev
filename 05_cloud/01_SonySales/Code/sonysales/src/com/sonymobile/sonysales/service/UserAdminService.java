package com.sonymobile.sonysales.service;

import java.util.List;

import com.sonymobile.sonysales.dao.AdministratorDAO;
import com.sonymobile.sonysales.dao.RoleDAO;
import com.sonymobile.sonysales.model.Administrator;
import com.sonymobile.sonysales.model.Role;

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
   
   public boolean update(Administrator administrator) {
       return AdministratorDAO.update(administrator);
   }
   
   public boolean deleteAdministratorById(long id) {
       return AdministratorDAO.deleteAdministratorById(id);
   }
   
   public List<?> getRoleList() {
       return RoleDAO.getRoleList();
        }
   
   public boolean addRole(Role role) {
       return RoleDAO.add(role);
   }
   
   public Role getRoleByCode(String code) {
       return RoleDAO.getRoleByCode(code);
        }
   
   public boolean updateRole(Role role) {
       return RoleDAO.update(role);
   }
   
   public Role getRoleById(long id) {
  return RoleDAO.getRoleById(id);
   }
   
   public boolean deleteRoleById(long id) {
       return RoleDAO.deleteRoleById(id);
   }
}
