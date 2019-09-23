package com.aaa.servlet;

import com.aaa.service.UserService;
import com.aaa.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * queryById用于把user信息（从数据库中查出来）在update.jsp中显示出来
 */
@WebServlet(name = "SelectOneServlet",urlPatterns = {"/seloneSer"})
public class SelectOneServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        int id= Integer.parseInt(request.getParameter("id"));
        UserService userService=new UserServiceImpl();
        Map map=userService.queryById(id);
        request.setAttribute("user",map);
        request.getRequestDispatcher("admin/update.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
