<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.aaa.entity.User" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.aaa.entity.Pager" %>

<%--
  Created by IntelliJ IDEA.
  User: 张有科520
  Date: 2019-09-10
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gbk" language="java" %>
<html>
<head>
    <title>用户列表</title>
    <style>
        /*table{
            border-collapse: collapse;
            border: 1px solid black;
            width: 80%;
            margin: 0px auto;
        }
        td{
            border: 1px solid black;
            text-align: center;
        }*/
        div{
            /*绝对定位要和偏移属性配合使用*/
            position: absolute;
            right: 100px;
            top: 200px;
        }
    </style>
    <script src="../static/js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <a href="../index.jsp">返回首页</a>
    <table class="table table-bordered table-hover">
        <tr>
            <td>姓名</td>
            <td>密码</td>
            <td>工号</td>
            <td>电话</td>
            <td>性别</td>
            <td>生日</td>
            <td>操作</td>

        </tr>
        <%--<%
            List<User> userList =new ArrayList<>();
            User user1=new User("王菲","123456",java.sql.Date.valueOf("2005-1-1"));
            userList.add(user1);
            userList.add(new User("小李子","qwert",java.sql.Date.valueOf("2003-11-1")));
            userList.add(new User("东方不败","zxcvb",java.sql.Date.valueOf("2012-12-12")));
            out.print(user1);
            for (User user : userList) {
                out.print("<tr>");
                //out：内置对象 类型：JspWriter 类型
                out.print("<td>");
                out.print(user.getName());
                out.print("</td>");
                out.print("<td>");
                out.print(user.getPwd());
                out.print("</td>");
                out.print("<td>");
                out.print(user.getBrith());
                out.print("</td>");
                out.print("</tr>");

            }
        %>--%>

        <%
            /*List<User> userList =new ArrayList<>();
            User user1=new User("王菲","123456",java.sql.Date.valueOf("2005-1-1"));
            userList.add(user1);
            userList.add(new User("小李子","qwert",java.sql.Date.valueOf("2003-11-1")));
            userList.add(new User("东方不败","zxcvb",java.sql.Date.valueOf("2012-12-12")));*/

            //for (User user : userList) {

            //if (request.getAttribute("maplist")!=null){
            if (request.getAttribute("pager")!=null){
                //获取request中的数据，默认类型是：object
                //List<Map> maplist= (List<Map>) request.getAttribute("maplist");
                Pager pager= (Pager) request.getAttribute("pager");
                List<Map> mapList=pager.getData();
                for (Map map : mapList) {
        %>

        <tr>
            <td><%=map.get("username")%></td>   <%--username为数据库中的属性名字--%>
            <td><%=map.get("password")%></td>
            <td><%=map.get("workno")%></td>
            <td><%=map.get("phone")%></td>
            <td><%=map.get("sex")%></td>
            <td><%=map.get("birth")%></td>
            <td>
                <a href="<%=pageContext.getServletContext().getContextPath()%>/deleteSer?id=<%=map.get("id")%>" onclick="return confirm('确认删除?')">删除</a>
                <%--通过超链接访问seloneSer（servlet）,虽然这个页面上的request没有关闭，但和后面的request不是同一个--%>
                <a href="./seloneSer?id=<%=map.get("id")%>" >修改</a>
            </td>
        </tr>
<%-- <a href="<%=pageContext.getServletContext().getContextPath()%>/userDelete.action?id=<%=user.get("id")%>" onclick="return confirm('忍心要删除我么？')">删除</a> --%>
        <%
                }
            }
        %>
    </table>
    <div>
        <%--每点一次超链接（访问一次servlet）就生成一个新的pager对象--%>
        <a href="ulistSer?pageNo=1">首页</a>
            <%--把上次查出的pager对象的prev作为此次创建pager对象的的参数pageNo--%>
        <a href="ulistSer?pageNo=${pager.prev}">上页</a>
        <a href="ulistSer?pageNo=${pager.next}">下页</a>
        <a href="ulistSer?pageNo=${pager.pages}">尾页</a>
    </div>

</body>
</html>
