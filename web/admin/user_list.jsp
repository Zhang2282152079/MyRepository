<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.aaa.entity.User" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.aaa.entity.Pager" %>

<%--
  Created by IntelliJ IDEA.
  User: ���п�520
  Date: 2019-09-10
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gbk" language="java" %>
<html>
<head>
    <title>�û��б�</title>
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
            /*���Զ�λҪ��ƫ���������ʹ��*/
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
    <a href="../index.jsp">������ҳ</a>
    <table class="table table-bordered table-hover">
        <tr>
            <td>����</td>
            <td>����</td>
            <td>����</td>
            <td>�绰</td>
            <td>�Ա�</td>
            <td>����</td>
            <td>����</td>

        </tr>
        <%--<%
            List<User> userList =new ArrayList<>();
            User user1=new User("����","123456",java.sql.Date.valueOf("2005-1-1"));
            userList.add(user1);
            userList.add(new User("С����","qwert",java.sql.Date.valueOf("2003-11-1")));
            userList.add(new User("��������","zxcvb",java.sql.Date.valueOf("2012-12-12")));
            out.print(user1);
            for (User user : userList) {
                out.print("<tr>");
                //out�����ö��� ���ͣ�JspWriter ����
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
            User user1=new User("����","123456",java.sql.Date.valueOf("2005-1-1"));
            userList.add(user1);
            userList.add(new User("С����","qwert",java.sql.Date.valueOf("2003-11-1")));
            userList.add(new User("��������","zxcvb",java.sql.Date.valueOf("2012-12-12")));*/

            //for (User user : userList) {

            //if (request.getAttribute("maplist")!=null){
            if (request.getAttribute("pager")!=null){
                //��ȡrequest�е����ݣ�Ĭ�������ǣ�object
                //List<Map> maplist= (List<Map>) request.getAttribute("maplist");
                Pager pager= (Pager) request.getAttribute("pager");
                List<Map> mapList=pager.getData();
                for (Map map : mapList) {
        %>

        <tr>
            <td><%=map.get("username")%></td>   <%--usernameΪ���ݿ��е���������--%>
            <td><%=map.get("password")%></td>
            <td><%=map.get("workno")%></td>
            <td><%=map.get("phone")%></td>
            <td><%=map.get("sex")%></td>
            <td><%=map.get("birth")%></td>
            <td>
                <a href="<%=pageContext.getServletContext().getContextPath()%>/deleteSer?id=<%=map.get("id")%>" onclick="return confirm('ȷ��ɾ��?')">ɾ��</a>
                <%--ͨ�������ӷ���seloneSer��servlet��,��Ȼ���ҳ���ϵ�requestû�йرգ����ͺ����request����ͬһ��--%>
                <a href="./seloneSer?id=<%=map.get("id")%>" >�޸�</a>
            </td>
        </tr>
<%-- <a href="<%=pageContext.getServletContext().getContextPath()%>/userDelete.action?id=<%=user.get("id")%>" onclick="return confirm('����Ҫɾ����ô��')">ɾ��</a> --%>
        <%
                }
            }
        %>
    </table>
    <div>
        <%--ÿ��һ�γ����ӣ�����һ��servlet��������һ���µ�pager����--%>
        <a href="ulistSer?pageNo=1">��ҳ</a>
            <%--���ϴβ����pager�����prev��Ϊ�˴δ���pager����ĵĲ���pageNo--%>
        <a href="ulistSer?pageNo=${pager.prev}">��ҳ</a>
        <a href="ulistSer?pageNo=${pager.next}">��ҳ</a>
        <a href="ulistSer?pageNo=${pager.pages}">βҳ</a>
    </div>

</body>
</html>
