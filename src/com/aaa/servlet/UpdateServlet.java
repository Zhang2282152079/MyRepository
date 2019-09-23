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

@WebServlet(name = "UpdateServlet",urlPatterns = {"/updateSer"})
public class UpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");

        int id= Integer.parseInt(request.getParameter("id"));
        String username=request.getParameter("username");
        //String password=request.getParameter("password");
        String workno=request.getParameter("workno");
        String phone=request.getParameter("phone");
        String sex=request.getParameter("sex");
        String birth=request.getParameter("birth");
        User user=new User(id,username,null,workno,phone,sex,java.sql.Date.valueOf(birth));
        /*UserService userService=new UserServiceImpl();
        int a=userService.updateUser(user);*/
        UserDao userDao=new UserDaoImpl();
        int a=userDao.updateUser(user);
        if (a>0){
            response.sendRedirect("ulistSer");
        }else {
            request.setAttribute("msg","修改失败");
            request.getRequestDispatcher("err.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
