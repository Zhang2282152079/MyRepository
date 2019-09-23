package com.aaa.test1;

import com.aaa.dao.JDBCUtils;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class Test2 {
    public static void main(String[] args) {
        /*JDBCUtils jdbcUtils=new JDBCUtils();
        try {
            Connection conn =jdbcUtils.getConnection();

            String sql="select * from t_user";
            Object[] pra=new Object[]{};
            List<Map> mapList=jdbcUtils.executeQuary(sql,null);
            System.out.println(mapList);
        } catch (SQLException e) {
            e.printStackTrace();
        }*/
        String sql="insert into t_user(username, password, workno, phone, sex, birth) values (?,?,?,?,?,?)";
        Object[] params={"暖暖","0821","a001","15138467680","女","2019-9-12"};
        JDBCUtils jdbcUtils=new JDBCUtils();
        jdbcUtils.executeUpdate(sql,params);
    }
}
