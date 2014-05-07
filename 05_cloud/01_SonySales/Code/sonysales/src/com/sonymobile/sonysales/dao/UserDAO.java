package com.sonymobile.sonysales.dao;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import com.sonymobile.sonysales.model.HibernateUtil;
import com.sonymobile.sonysales.model.User;

public class UserDAO {

    public String getUser(String openId) {
        String sql = "select * from user u where u.openId = '" + openId +"'";
        return BaseDAO.findBySql(sql).toString();
    }
    
    public String getUserList(String limit, String orderby) {
        String sql = "select * from user u order by "+ orderby +" desc limit "+limit;
        return BaseDAO.findBySql(sql).toString();
    }
    
    public String getPointsOrder(String openId) {
        String sql = "select a.*, (select count(*) from user where points>=a.points order by points desc) as pointsOrder"+
                " from user a where a.openId="+openId+" order by points desc";
        return BaseDAO.findBySql(sql).toString();
    }
    
    public String updateUser(String openId, String phoneNum, String email, String address, String jdId) {
        
        StringBuilder sql = new StringBuilder();
        sql.append("update user set ");
        if(phoneNum!=null) {
            sql.append("phoneNum='").append(phoneNum).append("',");
        }
        if(email!=null) {
            sql.append("email='").append(email).append("',");
        }
        if(phoneNum!=null) {
            sql.append("address='").append(address).append("',");
        }
        if(phoneNum!=null) {
            sql.append("jdId='").append(jdId).append("',");
        }
        sql = sql.deleteCharAt(sql.lastIndexOf(","));
        sql.append(" where openId='").append(openId).append("'");
        return BaseDAO.update(sql.toString());
    }

	public static boolean addUser(User user) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		return hibernateUtil.addObject(user);
	}
	
	public static boolean updateUser(User user) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		return hibernateUtil.updateObject(user);
	}
	
	public static User getUserById(int id) {
		HibernateUtil hibernateUtil = new HibernateUtil();

		ArrayList<String> columnName = new ArrayList<String>();
		columnName.add("id");
		ArrayList<Object> columeValue = new ArrayList<Object>();
		columeValue.add(id);
		List<Object> list = hibernateUtil.getObjectByColumnName(User.class,
				columnName, columeValue);
		if (list.size() == 0) {
			return null;
		}
		return (User) list.get(0);
	}

	public static User getUserByOpenId(String openId) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		ArrayList<String> columnName = new ArrayList<String>();
		columnName.add("openId");
		ArrayList<Object> columeValue = new ArrayList<Object>();
		columeValue.add(openId);
		List<Object> list = hibernateUtil.getObjectByColumnName(User.class,
				columnName, columeValue);
		if (list.size() == 0) {
			return null;
		}
		return (User) list.get(0);
	}

	public static boolean ExistOpenIdInUser(String openId) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		ArrayList<String> columnName = new ArrayList<String>();
		columnName.add("openId");
		ArrayList<Object> columeValue = new ArrayList<Object>();
		columeValue.add(openId);
		List<Object> list = hibernateUtil.getObjectByColumnName(User.class,
				columnName, columeValue);
		return list.size() > 0;
	}

	public static boolean ExistJdIdInUser(String jdId) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		ArrayList<String> columnName = new ArrayList<String>();
		columnName.add("jdId");
		ArrayList<Object> columeValue = new ArrayList<Object>();
		columeValue.add(jdId);
		List<Object> list = hibernateUtil.getObjectByColumnName(User.class,
				columnName, columeValue);
		return list.size() > 0;
	}

//    public static void main(String[] args) {
//        UserDAO userDAO = new UserDAO();
//        String userStr = userDAO.getUser("1");
//        JSONArray jSONArray = JSONArray.fromObject(userStr);
//        List<User> userList  = (List<User>) JSONArray.toList(jSONArray,User.class);
//        System.out.println(userList.get(0).getAddress());
//        System.out.println(userList.get(0).getOpenId());
//        System.out.println(userList.get(0).getId());
//    }
    
}