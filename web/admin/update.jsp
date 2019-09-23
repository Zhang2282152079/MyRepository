<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="com.aaa.entity.Pager" %><%--
  Created by IntelliJ IDEA.
  User: 张有科520
  Date: 2019-09-15
  Time: 17:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户信息</title>
    <style>
        table{
            border: 1px solid red;
            width:30%;
            margin: 0px auto;
            border-collapse: collapse;
        }
        td{
            border: 1px solid black;
        }
    </style>
    <%--<style>
        div{
            width: 800px;
            height: 600px;
        }
    </style>--%>
</head>
<body>
<form action="updateSer" method="post">
    <table>
        <tr>
            <td>用户名</td>
            <td>
                <input type="hidden" name="id" value="${user.id}">
                <input type="text" name="username" value="${user.username}">
            </td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input type="password" name="password" value="${user.password}"></td>
        </tr>
        <tr>
            <td>工号</td>
            <td><input type="text" name="workno" value="${user.workno}"></td>
        </tr>
        <tr>
            <td>电话</td>
            <td><input type="text" name="phone" value="${user.phone}"></td>
        </tr>
        <tr>
            <td>性别</td>
            <td>
                <input type="radio" name="sex" value="男" ${user.sex=='男'?'checked':''}>男
                <input type="radio" name="sex" value="女" ${user.sex=='女'?'checked':''}>女
            </td>
        </tr>
        <tr>
            <td>生日</td>
            <td><input type="date" name="birth" value="${user.birth}"></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="修改">
                <input type="reset" value="重置">
            </td>
        </tr>
    </table>
    <%--<div>
        <%
            if (request.getAttribute("pager")!=null) {
                Pager pager = (Pager) request.getAttribute("pager");
                List<Map> mapList = pager.getData();
                for (Map map : mapList) {
                    out.print(map.get("username"));
                }
            }else {
                out.print("获取不到");
            }
        %>

    </div>--%>




</form>
</body>
</html>
