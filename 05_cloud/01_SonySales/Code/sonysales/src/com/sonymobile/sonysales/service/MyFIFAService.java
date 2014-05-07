package com.sonymobile.sonysales.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.sonymobile.sonysales.dao.HandleDAO;
import com.sonymobile.sonysales.dao.UserDAO;
import com.sonymobile.sonysales.model.HibernateUtil;
import com.sonymobile.sonysales.model.Popularity;
import com.sonymobile.sonysales.model.User;
import com.sonymobile.sonysales.util.ResultMsg;

public class MyFIFAService {
    private UserDAO userDAO = new UserDAO();
    private HandleDAO handleDAO = new HandleDAO();
    
          //获取用户基本信息
    public String getUserInfo(String openId) {
        return userDAO.getUser(openId);
    }
    
        //获取我的人气及排名
    public String getPointsOrder(String openId) {
      return userDAO.getPointsOrder(openId);
    }
    
        //获取我的拉友支持列表
    public String getSupporters(String openId) {
      return handleDAO.getSupporters(openId);
    }
    
        //更新用户基本信息
    public String updateUser(String openId, String phoneNum, String email, String address, String jdId) {
        if(openId==null) {
            return "{\"errorcode\":\"1\"}"; //openId为空
        }
      String userStr = userDAO.getUser(openId);
      JSONArray jSONArray = JSONArray.fromObject(userStr);
      if(jSONArray.isEmpty()) {
          return "{\"errorcode\":\"2\"}"; //用户为空
      }
      return userDAO.updateUser(openId, phoneNum, email, address, jdId);
    }
    
	public String getUser(String openId) {

		HibernateUtil hibernateUtil = new HibernateUtil();

		return JSONArray.fromObject(hibernateUtil.getUserByOpenId(openId))
				.toString();
	}

	public String addUser(User user) {
		Map retMsg = null;

		HibernateUtil hibernateUtil = new HibernateUtil();
		if (hibernateUtil != null) {
			if (hibernateUtil.ExistOpenIdInUser(user.getOpenId())) {
				retMsg = ResultMsg.OpenIDExistsError();
			} else if (hibernateUtil.ExistJdIdInUser(user.getJdId())) {
				retMsg = ResultMsg.JdIDExistsError();
			} else if (hibernateUtil.addUser(user)) {
				retMsg = ResultMsg.SuccessInfo();
			} else {
				retMsg = ResultMsg.FailInOperatingDBError("addUser");
			}
		}
		return JSONObject.fromObject(retMsg).toString();
	}

	public String addPopularity(String ownerOpenId, String supporterOpenId) {
		Map retMsg = null;

		HibernateUtil hibernateUtil = new HibernateUtil();
		if (hibernateUtil != null) {
			User ownerUser = hibernateUtil.getUserByOpenId(ownerOpenId);
			User supporterUser = hibernateUtil.getUserByOpenId(supporterOpenId);

			// ������������������
			if (ownerUser == null) {
				retMsg = ResultMsg.OwnerOpenIDNotExistsError();
			} else if (supporterUser == null) {
				retMsg = ResultMsg.SupporterOpenIDNotExistsError();
			} else {
				Popularity popularity = new Popularity();
				
				Date date = new Date();
				SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmm");
				String now = df.format(date);
				
				popularity.setOwnerUserId(ownerUser.getId());
				popularity.setSupporterUserId(supporterUser.getId());
				
				popularity.setCreateTime(now);
				
				if (hibernateUtil.addPopularity(popularity)) {
					// ���������
					ownerUser.setPoints(ownerUser.getPoints() + 1);
					if (hibernateUtil.updateUser(ownerUser)) {
						retMsg = ResultMsg.SuccessInfo();
					} else {
						retMsg = ResultMsg.FailInOperatingDBError("updateUser");
					}

				} else {
					retMsg = ResultMsg.FailInOperatingDBError("addPopularity");
				}
			}

		}
		return JSONObject.fromObject(retMsg).toString();
	}
}
