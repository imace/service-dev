package com.sonymobile.sonysales.dao;

import java.util.ArrayList;
import java.util.List;

import com.sonymobile.sonysales.model.Administrator;
import com.sonymobile.sonysales.model.HibernateUtil;
import com.sonymobile.sonysales.model.Permission;

public class PermissionDAO {


	public static boolean add(Permission permission) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		return hibernateUtil.addObject(permission);
	}

	public static boolean update(Permission permission) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		return hibernateUtil.updateObject(permission);
	}
	
   public static Permission getPermissionById(long id) {
        HibernateUtil hibernateUtil = new HibernateUtil();

        ArrayList<String> columnName = new ArrayList<String>();
        columnName.add("id");
        ArrayList<Object> columeValue = new ArrayList<Object>();
        columeValue.add(id);
        List<?> list = hibernateUtil.getObjectByColumnName(Permission.class,
                columnName, columeValue);

        if (list == null || list.size() == 0) {
            return null;
        }

        return (Permission) list.get(0);
    }

   public static Administrator getPermissionByCode(String code) {
       HibernateUtil hibernateUtil = new HibernateUtil();

       ArrayList<String> columnName = new ArrayList<String>();
       columnName.add("code");
       ArrayList<Object> columeValue = new ArrayList<Object>();
       columeValue.add(code);
       List<?> list = hibernateUtil.getObjectByColumnName(Administrator.class,
               columnName, columeValue);
       if (list == null || list.size() == 0) {
           return null;
       }
       return (Administrator) list.get(0);
   }
   
   public static List<?> getPermissionList() {
       HibernateUtil hibernateUtil = new HibernateUtil();

       String hql = "from Permission p order by p.createTime desc";

       return hibernateUtil.getListByHql(hql, null, 0, 0);
   }
   
   public static boolean deletePermissionById(long id) {
       HibernateUtil hibernateUtil = new HibernateUtil();
       
       String hsql = "delete from Permission p where p.id="+id;

       return hibernateUtil.excuteUpdate(hsql);
   }
}