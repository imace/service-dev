package com.sonymobile.sonysales.dao;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.sina.sae.util.SaeUserInfo;

public class BaseDAO {

    private static Connection conn = null;

    static {
        try {
//          Class.forName("com.mysql.jdbc.Driver");
//          conn = DriverManager.getConnection("jdbc:mysql://localhost/app_sonyfifa",
//                  "root", "root");
            
            String username=SaeUserInfo.getAccessKey();
            String password=SaeUserInfo.getSecretKey();
            String driver="com.mysql.jdbc.Driver";
            Class.forName(driver).newInstance();
            conn=DriverManager.getConnection("jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_sonyfifa",username,password);
//            
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("建立数据库连接失败...");
        }
    }

    /**
     * @param sql
     *            查询语句
     * @param clazz
     *            转换的类
     * @return
     * */
    public static List<Object> findBySql(String sql, Class<?> clazz) {
        try {
            ResultSet set = query(sql);
            List<Object> list = new ArrayList<Object>();
            Map<Integer, String> map = getColumnMap(set);
            while (set.next()) {
                Object o = clazz.newInstance();
                int length = set.getMetaData().getColumnCount();
                for (int i = 1; i <= length; i++) {
                    invokeSetMethod(o, map.get(i - 1), set.getObject(i));
                }
                list.add(o);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static ResultSet query(String sql) throws Exception {
        ResultSet set = null;
        if (conn == null) {
            throw new SQLException("初始化连接错误!!");
        }
        System.out.println("执行查询，查询语句：" + sql);
        set = conn.createStatement().executeQuery(sql);
        return set;
    }
    
    public static String update(String sql) {
            int result = 0;
            try {

                if (conn == null) {
                    throw new SQLException("初始化连接错误!!");
                }
                System.out.println("执行更新，更新语句：" + sql);
                result = conn.createStatement().executeUpdate(sql);
            } catch (Exception e) {
                e.printStackTrace();
            } 
            if(result==0) {
                //1:成功，2：失败
                return "{\"result\":\"2\"}"; 
            } else {
                return "{\"result\":\"1\"}";
            }
     }
       

    public static List<JSONObject> findBySql(String sql) {

        List<JSONObject> list = new ArrayList<JSONObject>();
        try {
            ResultSet set = query(sql);
            Map<Integer, String> map = getColumnMap(set);
            while (set.next()) {
                JSONObject json = new JSONObject();
                int length = set.getMetaData().getColumnCount();
                for (int i = 1; i <= length; i++) {
                    json.element(map.get(i), set.getObject(i));
                }
                list.add(json);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<JSONObject> findBySql(Class<?> clazz) {
        List<JSONObject> list = new ArrayList<JSONObject>();
        try {
            ResultSet set = query(buildSql(clazz, null));
            Map<Integer, String> map = getFieldMap(clazz);
            while (set.next()) {
                JSONObject json = new JSONObject();
                int length = set.getMetaData().getColumnCount();
                for (int i = 1; i <= length; i++) {
                    json.element(map.get(i - 1), set.getObject(i));
                }
                list.add(json);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Object findByObject(Class<?> clazz, String table) {
        try {
            ResultSet set = query(buildSql(clazz, table));
            List<Object> list = new ArrayList<Object>();
            Map<Integer, String> map = getFieldMap(clazz);
            while (set.next()) {
                Object o = clazz.newInstance();
                int length = set.getMetaData().getColumnCount();
                for (int i = 1; i <= length; i++) {
                    invokeSetMethod(o, map.get(i - 1), set.getObject(i));
                }
                list.add(o);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String buildSql(Class<?> clazz, String table) {
        Map<Integer, String> map = getFieldMap(clazz);
        int size = map.size();
        String sql = " select ";
        for (int i = 0; i < size; i++) {
            sql += " t." + map.get(i);
            if (i < size - 1) {
                sql += ",";
            }
        }
        if (table == null) {
            table = clazz.getSimpleName();
        }
        sql += " from " + table.toLowerCase() + " t";
        return sql;
    }

    public static void invokeSetMethod(Object o, String fieldName, Object object) {
        try {
            String methodName = "set" + fieldName.substring(0, 1).toUpperCase()
                    + fieldName.substring(1, fieldName.length());

            Field field = o.getClass().getDeclaredField(fieldName);
            Method method = o.getClass().getMethod(methodName, field.getType());
            if (method != null) {
                method.invoke(o, object);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Map<Integer, String> getFieldMap(Class<?> clazz) {
        try {
            Map<Integer, String> map = new HashMap<Integer, String>();
            Field[] fields = clazz.getDeclaredFields();
            for (int i = 0; i < fields.length; i++) {
                Field field = fields[i];
                map.put(i, field.getName());
            }
            return map;
        } catch (Exception e) {
            return null;
        }
    }

    public static Map<Integer, String> getColumnMap(ResultSet set) {
        if (set != null) {
            try {
                Map<Integer, String> map = new HashMap<Integer, String>();
                ResultSetMetaData metaData = set.getMetaData();
                int count = metaData.getColumnCount();
                for (int i = 1; i <= count; i++) {
                    map.put(i, metaData.getColumnName(i));
                }
                return map;
            } catch (Exception e) {
                return null;
            }
        }
        return null;
    }

    public static void main(String[] args) {
        System.out
                .println(BaseDAO
                        .findBySql(" select  t.id, t.name, t.component, t.description, t.type, t.icon, t.sort from resource t where t.parent_id is null"));
    }
}