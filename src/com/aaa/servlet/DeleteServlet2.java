package com.aaa.servlet;

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

@WebServlet(name = "DeleteServlet2",urlPatterns = {"/deleteSer2"})
public class DeleteServlet2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //servlet在接参之前先设置编码方式request.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        //设置响应的编码response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        int id= Integer.parseInt(request.getParameter("id"));
        UserService userService=new UserServiceImpl();
        int a=userService.deleteUser(id);
        /*if (a>0){
            response.sendRedirect("ulistSer");
        }else {
            request.setAttribute("msg","删除用户失败！");
            request.getRequestDispatcher("err.jsp").forward(request,response);
        }*/
        PrintWriter writer=response.getWriter();
        String str= JSON.toJSONString(a);
        writer.print(str);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
