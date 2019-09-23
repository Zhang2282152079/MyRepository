package com.aaa.servlet;

import com.aaa.entity.Pager;
import com.aaa.service.RoleService;
import com.aaa.service.RoleServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RoleListServlet",urlPatterns = {"/rlistSer"})
public class RoleListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String pageNo= request.getParameter("pageNo"); //可以从地址栏获取
        if (pageNo==null){
            pageNo="1";
        }
        RoleService roleService=new RoleServiceImpl();
        Pager pager=roleService.queryByPages(Integer.parseInt(pageNo));
        request.setAttribute("pager",pager);
        request.getRequestDispatcher("admin/role_list.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
