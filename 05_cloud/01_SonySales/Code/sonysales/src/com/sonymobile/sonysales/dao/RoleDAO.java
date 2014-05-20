package com.sonymobile.sonysales.dao;

import java.util.ArrayList;
import java.util.List;

import com.sonymobile.sonysales.model.HibernateUtil;
import com.sonymobile.sonysales.model.Role;

public class RoleDAO {


	public static boolean add(Role role) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		return hibernateUtil.addObject(role);
	}

	public static boolean update(Role role) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		return hibernateUtil.updateObject(role);
	}
	
   public static Role getRoleById(long id) {
        HibernateUtil hibernateUtil = new HibernateUtil();

        ArrayList<String> columnName = new ArrayList<String>();
        columnName.add("id");
        ArrayList<Object> columeValue = new ArrayList<Object>();
        columeValue.add(id);
        List<?> list = hibernateUtil.getObjectByColumnName(Role.class,
                columnName, columeValue);

        if (list == null || list.size() == 0) {
            return null;
        }

        return (Role) list.get(0);
    }

   public static Role getRoleByCode(String code) {
       HibernateUtil hibernateUtil = new HibernateUtil();

       ArrayList<String> columnName = new ArrayList<String>();
       columnName.add("code");
       ArrayList<Object> columeValue = new ArrayList<Object>();
       columeValue.add(code);
       List<?> list = hibernateUtil.getObjectByColumnName(Role.class,
               columnName, columeValue);
       if (list == null || list.size() == 0) {
           return null;
       }
       return (Role) list.get(0);
   }
   
   public static List<?> getRoleList() {
       HibernateUtil hibernateUtil = new HibernateUtil();

       String hql = "from Role r order by r.createTime desc";

       return hibernateUtil.getListByHql(hql, null, 0, 0);
   }
   
   public static boolean deleteRoleById(long id) {
       HibernateUtil hibernateUtil = new HibernateUtil();
       
       String hsql = "delete from Role r where r.id="+id;

       return hibernateUtil.excuteUpdate(hsql);
   }
}