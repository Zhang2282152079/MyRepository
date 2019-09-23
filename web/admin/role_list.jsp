<%@ page import="com.aaa.entity.Pager" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 张有科520
  Date: 2019-09-19
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>角色列表</title>
    <style>
        table{
            border-collapse: collapse;
            border: 1px solid black;
            width: 80%;
            margin: 0px auto;
        }
        td{
            border: 1px solid black;
            text-align: center;
        }
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
<table class="table table-bordered table-hover">
    <tr>
        <td>ID</td>
        <td>角色名</td>
        <td>角色状态</td>
        <td>角色描述</td>
    </tr>
        <%
            if (request.getAttribute("pager")!=null){
                //获取request中的数据，默认类型是：object
                //List<Map> maplist= (List<Map>) request.getAttribute("maplist");
                Pager pager= (Pager) request.getAttribute("pager");
                List<Map> mapList=pager.getData();
                for (Map map : mapList) {
        %>
    <tr>
        <td><%=map.get("id")%></td>   <%--username为数据库中的属性名字--%>
        <td><%=map.get("rolename")%></td>
        <td><%=map.get("state")%></td>
        <td><%=map.get("remark")%></td>
        <%--<td>
            <a href="<%=pageContext.getServletContext().getContextPath()%>/deleteSer?id=<%=map.get("id")%>" onclick="return confirm('确认删除?')">删除</a>
            &lt;%&ndash;通过超链接访问seloneSer（servlet）,虽然这个页面上的request没有关闭，但和后面的request不是同一个&ndash;%&gt;
            <a href="./seloneSer?id=<%=map.get("id")%>" >修改</a>
        </td>--%>
    </tr>
    <%-- <a href="<%=pageContext.getServletContext().getContextPath()%>/userDelete.action?id=<%=user.get("id")%>" onclick="return confirm('忍心要删除我么？')">删除</a> --%>
        <%
                }
            }
        %>
</table>
<div>
    <%--每点一次超链接（访问一次servlet）就生成一个新的pager对象--%>
    <a href="rlistSer?pageNo=1">首页</a>
    <%--把上次查出的pager对象的prev作为此次创建pager对象的的参数pageNo--%>
    <a href="rlistSer?pageNo=${pager.prev}">上页</a>
    <a href="rlistSer?pageNo=${pager.next}">下页</a>
    <a href="rlistSer?pageNo=${pager.pages}">尾页</a>
</div>
</body>
</html>
