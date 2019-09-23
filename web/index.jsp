<%--
  Created by IntelliJ IDEA.
  User: 张有科520
  Date: 2019-09-06
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>我的jsp页面</title>
  </head>
  <body>
  <%--引入别的页面 静态包含和动态包含--%>
  <%--<jsp:include page="head.jsp"></jsp:include>
  <%@include file="head.jsp"%>--%>
    欢迎来到我的页面，莱昂纳多的新电影上映了吗
  <a href="test1">gogogo</a>    <%--加斜杠就是从站点的根目录访问，不要加/ --%>
  <a href="err.jsp">去错误页面</a>
  <a href="register.jsp">注册</a>
  <a href="login.jsp">登录</a>
  <a href="ulistSer">查询显示</a>
  <a href="admin/user_list2.jsp">查询显示2</a>
  <a href="testAjax.jsp">ajax</a>
  <a href="rlistSer">查询显示角色</a>

    <%--在LoginServlet中通过request获取（创建）session并为session赋值--%>
        <%--session中存的user对象的名字(用户名和密码由request对象从网页中获取)--%>
    <%--在index.jsp中通过java代码块获取 session （session在会话中全局有效，每个页面都可以获取）--%>


    <%--根据key获取存在session中的value--%>
 <%-- <%=session.getAttribute("user")%>--%>   <%--user为session对象key的名字，自己起的名字--%>

  <%
    if (session.getAttribute("users")!=null){
      out.print("欢迎你 "+session.getAttribute("users")+" ");
      out.print("<a href=\"outser\">注销</a>");
    }else {
      //out.print("<a href=\"login.jsp\">登录</a>");
    }
  %>

 <%--在Loginservlet中创建cookie 并为cookie赋值，然后把cookie添加到response中
       在index.jsp页面通过request获取cookie
 --%>



  <%--取cookie--%>
    <%--通过request对象获取cookie数组--%>
  <%--<%
    Cookie[] cookies=request.getCookies();//返回值类型为cookie数组

      for (Cookie cookie : cookies) {
        if (cookie!=null){
          //out.print(cookie.getValue());
          if (cookie.getName().equals("userc")){
            out.print("这是cookie中的username："+cookie.getValue());
          }
        }

      }
  %>--%>

  <%--<%=request.getAttribute("msg")%>--%>

  <a href="t1.jsp">t1.jsp</a>
  </body>
</html>
