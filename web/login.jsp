<%--
  Created by IntelliJ IDEA.
  User: 张有科520
  Date: 2019-09-10
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
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
</head>
<body>
<form action="loginser" method="post">
    <table>
        <tr>
            <td>用户名</td>
            <td><input type="text" name="username"></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input type="password" name="password"></td>
        </tr>
        <tr>
            <td>启用cookie存放用户信息</td>
            <td><input type="checkbox" name="save" value="1"/>是</td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="登录">
                <input type="reset" value="重置">
            </td>
        </tr>

    </table>
</form>
</body>
</html>
