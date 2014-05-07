package com.sonymobile.sonysales.dao;


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