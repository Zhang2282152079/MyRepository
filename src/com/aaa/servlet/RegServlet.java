package com.aaa.servlet;

import com.aaa.dao.UserDao;
import com.aaa.dao.UserDaoImpl;
import com.aaa.entity.User;
import com.aaa.service.UserService;
import com.aaa.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegServlet",urlPatterns = {"/regSer"})
public class RegServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //servlet在接参之前先设置编码方式request.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        //设置响应的编码response.setContentType("text/html;charset=UTF-8");

//        insert into t_user(username, password, workno, phone, sex, birth) values (?,?,?,?,?)
        response.setContentType("text/html;charset=UTF-8");
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String workno=request.getParameter("workno");
        String phone=request.getParameter("phone");

        String sex=request.getParameter("sex");
        String birth=request.getParameter("birth");

        if (username!=null&&password!=null&&!username.trim().equals("")&&!password.trim().equals("")){
            //System.out.println("你好");
            User user=new User(username,password,workno,phone,sex,java.sql.Date.valueOf(birth));
            /*UserDao userDao=new UserDaoImpl();
            //userDao.checkUser(user);
            userDao.addUser(user);*/

            UserService userService=new UserServiceImpl();
            int a=userService.addUser(user);
            if (a>0){
                //response.sendRedirect("index.jsp");

                request.setAttribute("msg","注册成功");
                request.getRequestDispatcher("index.jsp").forward(request,response);

                //System.out.println("注册成功");
            }

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
