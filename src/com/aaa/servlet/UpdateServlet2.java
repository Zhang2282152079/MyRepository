package com.aaa.servlet;

import com.aaa.dao.UserDao;
import com.aaa.dao.UserDaoImpl;
import com.aaa.entity.Message;
import com.aaa.entity.User;
import com.aaa.service.UserService;
import com.aaa.service.UserServiceImpl;
import com.alibaba.fastjson.JSON;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateServlet2",urlPatterns = {"/updateSer2"})
public class UpdateServlet2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");

        int id= Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        String username=request.getParameter("username");
        System.out.println(username);   //username 为 null，说明没有从页面上获取到username
        String password=request.getParameter("password");
        System.out.println(password);
        String workno=request.getParameter("workno");
        System.out.println(workno);
        String phone=request.getParameter("phone");
        System.out.println("这是phone"+phone+"你看不见");
        String sex=request.getParameter("sex");
        String birth=request.getParameter("birth");
        //如果jsp页面不给servlet传数据,上面获取到的都为null(页面上无此元素)
        //数据库t_user表中 id,username,password 不允许为空，所有此处生成的user对象执行sql语句时执行不了，属性都为空
        User user=new User();
        if (password==null){
            user=new User(id,username,null,workno,phone,sex,java.sql.Date.valueOf(birth));
        }else {
            user=new User(id,username,password,workno,phone,sex,java.sql.Date.valueOf(birth));

        }
        System.out.println(user);


        /*UserDao userDao=new UserDaoImpl();
        int a=userDao.updateUser(user);*/
        UserService userService=new UserServiceImpl();
        //message是一个对象
        Message message=userService.updateAndAdd(user);
//        int a=userService.updateUser(user);
        System.out.println(message);
        /*if (a>0){
            response.sendRedirect("ulistSer");
        }else {
            request.setAttribute("msg","修改失败");
            request.getRequestDispatcher("err.jsp").forward(request,response);
        }*/
        PrintWriter writer=response.getWriter();
        writer.write(JSON.toJSONString(message));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
