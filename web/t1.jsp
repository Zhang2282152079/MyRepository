<%--
  Created by IntelliJ IDEA.
  User: 张有科520
  Date: 2019-09-11
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div>获取项目的根目录</div>
    <%--pageContext 页面上下文，通过pageContext获取到各种其它对象--%>
    <%=pageContext.getServletContext().getContextPath()%>

    <%
 //四个作用域对象，既能存数据又能取数据getAttribute，setAttribute

        //pageContext上下文对象，作用域：当前页面
        pageContext.setAttribute("key","helloworld");  //void setAttribute(String var1, Object var2)
        out.print(pageContext.getAttribute("key"));

        //request请求对象，作用域：一次请求，A页面-->servlet 1(存数据)-->转发servlet 2-->转发到某页面
        request.setAttribute("key","你好");
        request.getAttribute("key");

        //session对象，作用域：一次会话
        session.setAttribute("key","value");
        out.print(session.getAttribute("key"));

        //application应用程序对象，作用域：整个应用的生命周期，可以被所有的客户端共享
        application.setAttribute("key","value");
        application.getAttribute("key");
    %>
</body>
</html>
