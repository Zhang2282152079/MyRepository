package com.aaa.servlet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//urlPatterns:设置servlet的映射路径配置
// 配置load-on-startup属性的，会随着服务器启动而实例化，数字越小，优先级越高，默认为-1 ，0的优先级最高
@WebServlet(name = "Test1Servlet",urlPatterns = {"/test1"},loadOnStartup = 1)
public class Test1Servlet extends HttpServlet {

/**
 * Serverlet接口：
 * 方法：
 *  1. void init(ServletConfig var1) throws ServletException;
 *
 *  //返回ServletConfig对象，该对象包含有初始化 的信息和启动的参数信息
 *  2. ServletConfig getServletConfig();
 * 
 * // tomcat允许servlet对象去响应请求;Called by the servlet container to allow the servlet to respond to a request.
 *  3. void service(ServletRequest var1, ServletResponse var2) throws ServletException, IOException;
 *
 * 4. String getServletInfo();
 *
 *  5. void destroy();
  */



    public Test1Servlet() {
        System.out.println("Serverlet实例化：创建serverlet对象");
    }

    @Override
    public void init() throws ServletException {
        System.out.println("初始化,serverlet对象被放到tomcat容器（服务）中");
    }
//继承自HttpServerlet的方法
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("this is doPost");
    }
//继承自HttpServerlet的方法
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("this is doGet");
        String appname=this.getServletContext().getInitParameter("appname");
        System.out.println(appname);
    }

    @Override
    public void destroy() {
        System.out.println("销毁serverlet对象");
    }
}
