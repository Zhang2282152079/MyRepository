<%--
  Created by IntelliJ IDEA.
  User: 张有科520
  Date: 2019-09-07
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>错误页面</title>
</head>
<body>
    <h3>Something wrong is here</h3>
    <%=request.getAttribute("msg")%>
</body>
</html>
