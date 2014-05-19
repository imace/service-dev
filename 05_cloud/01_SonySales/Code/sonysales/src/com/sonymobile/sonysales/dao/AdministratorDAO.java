package com.sonymobile.sonysales.dao;

import java.util.ArrayList;
import java.util.List;

import com.sonymobile.sonysales.model.Administrator;
import com.sonymobile.sonysales.model.HibernateUtil;
import com.sonymobile.sonysales.model.User;

public class AdministratorDAO {


	public static boolean add(Administrator administrator) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		return hibernateUtil.addObject(administrator);
	}

	public static boolean update(Administrator administrator) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		return hibernateUtil.updateObject(administrator);
	}
	
   public static Administrator getAdministratorById(long id) {
        HibernateUtil hibernateUtil = new HibernateUtil();

        ArrayList<String> columnName = new ArrayList<String>();
        columnName.add("id");
        ArrayList<Object> columeValue = new ArrayList<Object>();
        columeValue.add(id);
        List<?> list = hibernateUtil.getObjectByColumnName(Administrator.class,
                columnName, columeValue);

        if (list == null || list.size() == 0) {
            return null;
        }

        return (Administrator) list.get(0);
    }

   public static Administrator getAdministratorByUserName(String userName) {
       HibernateUtil hibernateUtil = new HibernateUtil();

       ArrayList<String> columnName = new ArrayList<String>();
       columnName.add("userName");
       ArrayList<Object> columeValue = new ArrayList<Object>();
       columeValue.add(userName);
       List<?> list = hibernateUtil.getObjectByColumnName(Administrator.class,
               columnName, columeValue);
       if (list == null || list.size() == 0) {
           return null;
       }
       return (Administrator) list.get(0);
   }
   
   public static List<?> getAdministratorList() {
       HibernateUtil hibernateUtil = new HibernateUtil();

       String hql = "from Administrator a order by a.createTime desc";

       return hibernateUtil.getListByHql(hql, null, 0, 0);
   }
}