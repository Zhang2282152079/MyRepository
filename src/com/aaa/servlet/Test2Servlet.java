package com.aaa.servlet;

import com.aaa.dao.UserDao;
import com.aaa.dao.UserDaoImpl;
import com.aaa.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Test2Servlet",urlPatterns = {"/test2"},loadOnStartup = 1)
public class Test2Servlet extends HttpServlet {
    /**
     * Servlet类有doPost(HttpServletRequest request, HttpServletResponse response)方法
     *
     * 参数HttpServletRequest的实例request
     *
     * request.getParameter(String var1)方法获取到页面内容
     */

    //
    //
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //servlet在接参之前先设置编码方式request.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        //设置响应的编码response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        //根据名字获取对应的参数值
        //获取jsp页面上一个字符串类型的参数的值
        //Returns the value of a request parameter as a String, or null if the parameter does not exist.
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        User user=new User(username,password);
        System.out.println(user.getName()+user.getPwd());
        UserDao dao=new UserDaoImpl();
        int a=dao.addUser(user);

        if (a>0){
            //idea控制台输出
            System.out.println("注册成功");

            //服务器端转发
                /*1、地址栏不会发生变化
                  2、效率高
                  3、携带数据：request中的数据*/
            request.getRequestDispatcher("index.jsp").forward(request,response);

            PrintWriter writer=response.getWriter();
            writer.print("<h1>"+user+"</h1>");

        }else {
            System.out.println("注册失败");
            response.sendRedirect("err.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
