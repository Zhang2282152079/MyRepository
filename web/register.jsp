<%--
  Created by IntelliJ IDEA.
  User: 张有科520
  Date: 2019-09-07
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册页面</title>
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
    <form action="regSer" method="post">
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
                <td>工号</td>
                <td><input type="text" name="workno"></td>
            </tr>
            <tr>
                <td>电话</td>
                <td><input type="text" name="phone"></td>
            </tr>
            <tr>
                <td>性别</td>
                <td>
                    <input type="radio" name="sex" value="男" checked>男
                    <input type="radio" name="sex" value="女">女
                </td>
            </tr>
            <tr>
                <td>生日</td>
                <td><input type="date" name="birth"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="注册">
                    <input type="reset" value="重置">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
