package com.sonymobile.sonysales.dao;

import java.util.ArrayList;
import java.util.List;

import com.sonymobile.sonysales.model.Handle;
import com.sonymobile.sonysales.model.HibernateUtil;

public class HandleDAO {

        //获得前limit名获得拉手支持最多的用户昵称和支持者数量
    public String getSupporterCount(String limit) {
        String sql = "select u.nickname, l.count from user u,"+
        "(select ownerUserId, count(supporterUserId) count from handle group by ownerUserId order by count desc limit "+limit+") l"+
        " where u.id = l.ownerUserId";
        return BaseDAO.findBySql(sql).toString();
    }
    
        //根据openID查询拉友支持列表
    public String getSupporters(String openId) {
        String sql = "select h1.nickname,h1.createTime from user u1, (select u.nickname, h.createTime,h.ownerUserId from handle h, user u where u.id=h.supporterUserId ) h1"+
        " where  h1.ownerUserId=u1.id and u1.openId="+openId;
        return BaseDAO.findBySql(sql).toString();
    }

	public static boolean addHandle(Handle handle) {
		HibernateUtil hibernateUtil = new HibernateUtil();
		return hibernateUtil.addObject(handle);
	}

	public static boolean ExistRecordInHandle(Handle handle) {
		HibernateUtil hibernateUtil = new HibernateUtil();

		ArrayList<String> columnName = new ArrayList<String>();
		columnName.add("ownerUserId");
		columnName.add("supporterUserId");
		ArrayList<Object> columeValue = new ArrayList<Object>();
		columeValue.add(handle.getOwnerUserId());
		columeValue.add(handle.getSupporterUserId());
		List<Object> list = hibernateUtil.getObjectByColumnName(Handle.class,
				columnName, columeValue);
		return list.size() > 0;
	}
}