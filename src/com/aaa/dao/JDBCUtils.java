package com.aaa.dao;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.io.FileReader;
import java.io.IOException;
import java.net.URL;
import java.sql.*;
import java.util.*;

public class JDBCUtils {
    protected static String url=null;
    protected static String user=null;
    protected static String password=null;
    protected static String driver=null;
    protected static DataSource dataSource=null;

    //必须作为属性，供全部方法使用，保证对同一个conn对象操作
    protected Connection conn=null;  //不能是静态的，因为如果是静态的，类加载是调用一次，只能生成一个conn;
    //                                        方法不能是静态的，静态方法只能使用静态属性
    protected PreparedStatement statement=null;
    protected ResultSet resultSet=null;

    //静态代码块中只能处理异常，抛异常要借助方法才能抛
    /*static {
        //读取资源（配置）文件，获取值

        try {
            //1. 创建Properties集合类
            Properties properties=new Properties();
            //2. 加载文件
            //获取src路径下文件的方式--->ClassLoder 类加载器
            ClassLoader classLoader=JDBCUtils.class.getClassLoader();
            URL res=classLoader.getResource("jdbc.properties");
            String path=res.getPath();

            //properties.load(new FileReader("F:\\IdeaProjects\\Itcast\\demo1_jdbc\\src\\jdbc.properties"));
            properties.load(new FileReader(path));

            //3. 获取数据，赋值
            url=properties.getProperty("url");
            user=properties.getProperty("user");
            password=properties.getProperty("password");
            driver=properties.getProperty("driver");

            //注册驱动
            Class.forName(driver);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }*/

    static {
        try {
            //初始化上下文对象  目的：访问JNDI中的东西
            Context ctx=new InitialContext();
            //访问资源:java:comp/env/:根目录;
            // lookup("java:comp/env/jdbc/test1")返回值类型为Object
            dataSource= (DataSource) ctx.lookup("java:comp/env/jdbc/test1");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    // 获取连接对象
    //不写成传参的是因为需要传参的话，调用getConnection()方法时还要传参，没有达到简化的效果
    //这里用到了配置文件properties
    public /*static*/ Connection getConnection() throws SQLException {
        /*conn= DriverManager.getConnection(url,user,password);
        return conn;*/

        conn=dataSource.getConnection();
        return conn;
    }

    //非查询操作 ,里面包含了关闭方法
    public  int executeUpdate(String sql,Object[] params){

        int count=-1;
        //Statement statement=null;//执行一次非查询操作，生成一个statement对象。 一样的，都是，执行一次非查询操作，生成一个statement对象
        try {
            conn=getConnection();
            statement= conn.prepareStatement(sql);

            if (params!=null){
                for (int i=0;i<params.length;i++){
                    Object p=params[i];
                    statement.setObject(i+1,p);
                }
            }

            count= statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll(null,statement,conn);
        }
        return count;
    }
//prepareStament ? 的位置不确定，个数不确定，无法封装到basedao
    //查询操作
    /*public List<User> executeQuary(String sql){
        List<User> userList=new ArrayList<>();
        try {
            statement=conn.prepareStatement(sql);
            *//*statement.setString(1,"王菲");
            statement.setString(2,"莱昂纳多");*//*
            resultSet=statement.executeQuery();
            while (resultSet.next()){
                int id= resultSet.getInt(1);
                String name = resultSet.getString(2);
                String pwd=resultSet.getString("password");
                String workno= resultSet.getString(4);
                User user=new User(id,name,pwd,workno);
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll(resultSet,statement,null);
        }
        return userList;
    }*/

    public List<Map> executeQuary(String sql,Object[] params){
        List<Map> mapList=new ArrayList<>();
        try {
            conn=getConnection();
            statement=conn.prepareStatement(sql);
            /*statement.setString(1,"王菲");
            statement.setString(2,"莱昂纳多");*/

            /*statement.setString(1,"5");
            statement.setString(2,"6");*/

            //遍历Object数组，把要设置的 ? 的值从数组中读出来
            //参数的顺序要和占位符一致
            if (params!=null){
                for (int i=0;i<params.length;i++){
                    Object p=params[i];
                    statement.setObject(i+1,p);
                }
            }

            resultSet=statement.executeQuery();



            //获取结果集的元数据对象：获取当前sql对应的结构：列数、类型、名称
            ResultSetMetaData metaData=resultSet.getMetaData();
            //获取当前查询的列的数量
            int columnCount= metaData.getColumnCount();
            while (resultSet.next()){
                Map<String,Object> row=new HashMap<>();
                for (int i=1;i<=columnCount;i++){
                    row.put(metaData.getColumnLabel(i),resultSet.getObject(i));  //  姓名 : "王菲"  密码 : "0121" ...  workno=001, password=0121, phone=null, sex=男, birth=null, id=18, username=王菲
                }
                mapList.add(row);
            }


            /*while (resultSet.next()){
                int id= resultSet.getInt(1);
                String name = resultSet.getString(2);
                String pwd=resultSet.getString("password");
                String workno= resultSet.getString(4);
                User user=new User(id,name,pwd,workno);
                userList.add(user);
            }*/
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll(resultSet,statement,conn);
        }
        return mapList;
    }

    //释放资源
    public static void closeAll(ResultSet resultSet, Statement statement, Connection conn){
        if (resultSet!=null){
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (statement!=null){
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn!=null){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
