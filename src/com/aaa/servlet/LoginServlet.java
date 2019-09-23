package com.aaa.servlet;

import com.aaa.dao.JDBCUtils;
import com.aaa.dao.UserDao;
import com.aaa.dao.UserDaoImpl;
import com.aaa.entity.User;
import com.aaa.service.UserService;
import com.aaa.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "LoginServlet",urlPatterns = {"/loginser"}/*,loadOnStartup = 1*/)
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置接收和响应式的编码方式
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");

        //从页面上获取对应名称参数的值
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String save=request.getParameter("save");



        if (username!=null&&password!=null&&!username.trim().equals("")&&!password.trim().equals("")){
            //根据页面数据赋值的user
            User user=new User(username,password);
            //UserDao userDao=new UserDaoImpl();
            //查询过后返回的数据user1
            //Map<String,Object> user1=userDao.checkLogin(user);

            UserService userService=new UserServiceImpl();
            Map<String,Object> user1=userService.checkUser(user);
            //user1 就是map
            if (user1!=null){
                //System.out.println(user1);
                HttpSession session=request.getSession();                 //user1 就是map
                session.setAttribute("users",user1.get("username"));  //map的方法？？？,根据sql查询出的表  get(key),key为字符串
                response.sendRedirect("index.jsp");                    //map存放的是一堆(列)键值对
                System.out.println("登录成功");                       //map是满足条件的user信息（并不是user对象），user（name,password,...）
            }else {
                System.out.println("输入的用户名密码不正确");
                response.sendRedirect("err.jsp");
            }

        }else {
            response.sendRedirect("err.jsp");
        }


       /*User user1=null;
//        System.out.println(username+password+save);
        //username!=null用于判断页面上有username这个元素（Parameter）
        //!username.trim().equals("")表示username的值不为空
        if (username!=null&&password!=null&&!username.trim().equals("")&&!password.trim().equals("")){
            user=new User(username,password);
            *//*UserDao userDao=new UserDaoImpl();
            userDao.addUser(user);*//*
        }else {
            response.sendRedirect("err.jsp");
        }

        if (user!=null){
//session
                //在servlet中通过request对象获取session对象并为session赋值
                HttpSession session=request.getSession();
                //存数据到session对象中 （获取时在jsp页面获取）
                session.setAttribute("user",user.getName());

                //客户端重定向
                //response.sendRedirect("index.jsp");

                //服务器端转发
                //request.getRequestDispatcher("index.jsp").forward(request,response);
//cookie
                if (save.equals("1")){
                    //在servlet中新建cookie对象并为cookie赋值  Cookie(String name, String value)
                    Cookie cookie=new Cookie("userc",username);
                    //cookie.setMaxAge(0);
                    //把cookie添加到response对象中
                    response.addCookie(cookie);
                    System.out.println("cookie已经添加到response");
                }else {
                    System.out.println("没有创建cookie");
                }

                response.sendRedirect("index.jsp");
                System.out.println("hhhhh");
        }*/

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
