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
import java.io.Reader;
import java.util.Map;

/**
 * queryById用于把user信息（从数据库中查出来）在update.jsp中显示出来
 */
@WebServlet(name = "SelectOneServlet2",urlPatterns = {"/seloneSer2"})
public class SelectOneServlet2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        int id= Integer.parseInt(request.getParameter("id"));
        //System.out.println(id);
        UserService userService=new UserServiceImpl();
        Map map=userService.queryById(id);
        //request.setAttribute("user",map);
        //显示的界面是admin/update.jsp，但地址栏还是http://localhost:8080/web1/seloneSer?id=8
        //request.getRequestDispatcher("admin/update.jsp").forward(request,response);

        PrintWriter writer=response.getWriter();
        //writer.print(JSON.toJSONStringWithDateFormat(map,"yyyy-MM-dd"));
        writer.print(JSON.toJSONString(map));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
