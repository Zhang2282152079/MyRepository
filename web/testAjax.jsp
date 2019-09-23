<%--
  Created by IntelliJ IDEA.
  User: 张有科520
  Date: 2019-09-16
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>局部刷新，获取服务器时间</title>
    <script src="static/js/jquery-3.4.1.min.js"></script>
    <script>
         /*alert($);
        // alert(jQuery)
        $(function () {
            alert('hello');
        });*/


         //获取输出流的数据，所以servlet中必须输出
         //data:获取到的数据
        function getDate() {
            $.get('dateSer',function (a) {
                $("#nowdate").html(a)
            }/*,'String'*/);
        }
    </script>
</head>
<body onload="alert(111)">
你好
    <input type="button" value="获取时间" onclick="getDate()">
    <div id="nowdate"></div>
</body>
</html>
