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
    <%--<style>
        div{
            /*绝对定位要和偏移属性配合使用*/
            position: absolute;
            right: 100px;
            top: 220px;
        }
    </style>--%>
    <%--<script src="../static/js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>

    <%@include file="../common/useBootstrap.jsp"%>

    <script>
        var pager;
        var usermap;
        function queryAll(pageNo) {
            if (pageNo==null) pageNo=1;
            $.ajax({
                type:"GET",
                url:"../ulistSer2",  //此处会进入servlet，实例化servlet对象
                data:{pageNo:pageNo}, //给servlet传递数据
                dataType:'json',      //servlet返回的数据类型
                success:function (data) {  //data:json对象（servlet返回的数据 ，pager对象转的json格式的字符串，此页面上接的json对象）
                    pager=data;
                    $("#tbData").empty();
                    var maplist=data.data;
                    for (var i=0;i<maplist.length;i++){
                        var tr='<tr>'+
                        '<td>'+maplist[i].username+'</td>' +   //maplist第i行的username属性的值
                            '<td>'+maplist[i].password+'</td>'+
                            '<td>'+maplist[i].workno+'</td>' +
                            '<td>'+maplist[i].sex+'</td>' +
                            '<td>'+maplist[i].phone+'</td>' +
                            '<td>'+maplist[i].birth+'</td>' +
                            '<td>'+'<input type="button"  value="修改" onclick="selectOne('+maplist[i].id+')" class="btn btn-primary" data-toggle="modal" data-target="#myModal"/> '+
                            '<input type="button"  value="删除" onclick="deleteOne('+maplist[i].id+')" class="btn btn-primary" /> '+
                            '</td>'+
                            '</tr>';
                        $("#tbData").append(tr);
                        //日期类型为String
                        //alert(typeof (maplist[i].birth));
                    }
                },error:function (xhr,info,e) {
                    alert("错误："+info,e);
                }
            });
        }

        function selectOne(id){
            $.ajax({
                type:"GET",
                url:"../seloneSer2?id="+id,  //此处会进入servlet，实例化servlet对象
                //data:{id:id},          //给servlet传递数据
                dataType:'json',      //servlet返回的数据类型
                success:function(data){
                    usermap=data;
                    //alert(data);
                    //js 把根据id查到的对象信息显示到弹出的框中
                    $("#id").val(data.id);
                    $("#username").val(data.username);
                    $("#workno").val(data.workno);
                    $("#phone").val(data.phone);
                    $("#birth").val(data.birth);
                    if (data.sex=='男'){
                        //$("#boy").checked=true;
                        $("#boy").prop("checked",true);
                    }else {
                        $("#girl").prop("checked",true);
                    }
                }
            });
        }

        function updateOne(/*id*/){
            $.ajax({
                type:'post',
                //url:"../updateSer2?id="+id,
                //data:{/*id:id*/,username:$("#username").val(),workno:$("#workno").val(),phone:$("#phone").val(),sex:$(".sex").val(),birth:$("#birth").val()},
                url:"../updateSer2",
                data:$("#userformForReg").serialize(),//序列化表单数据,把表单的所有数据传到servlet中（url中）,包括隐藏的id
                dataType:'json',
                success:function (data) {
                    //data: 受影响的行数
                    //pager.pageNo即当前页，pager是从servlet得到的包含当前页码的对象
                    /*if (data>0){
                        queryAll(pager.pageNo);
                    }*/
                    //alert(data);
                    alert(data.code+":"+data.content);
                    queryAll(pager.pageNo);
                }
            });
        }

        function deleteOne(id){
            if (confirm('确定要删除吗？')){
                $.ajax({
                    type:"GET",
                    url:"../deleteSer2?id="+id,
                    dataType:'json',
                    success:function (data) {
                        //data的类型为number
                        //alert(typeof (data))
                        if (data>0) {
                            alert("删除成功");
                            queryAll(pager.pageNo);
                        }
                    },error:function (xhr,info,e) {
                        alert("错误："+info+e);
                    }
                });
            }
        }

        function clearData(){
            //重置
            $("#userformForReg")[0].reset();
            $("#id").val(0);
        }

        $(function(){
            queryAll();
        });
    </script>
</head>
<body>
    <a href="../index.jsp">返回首页</a>
    <%--<a href="javascript:void(0)" onclick="selectOne(31)" class="btn btn-primary" data-toggle="modal" data-target="#myModal">注册用户</a>--%>
    <input type="button" value="注册用户" onclick="clearData()" class="btn-success" data-toggle="modal" data-target="#myModal2"/>
    <table class="table table-bordered table-hover">
        <tr>
            <th>姓名</th>
            <th>密码</th>
            <th>工号</th>
            <th>性别</th>
            <th>电话</th>
            <th>生日</th>
            <th>操作</th>
        </tr>

        <tbody id="tbData">

        </tbody>
    </table>
    <div id="control">

        <a href="javascript:void(0)" onclick="queryAll(1)">首页</a>
        <a href="javascript:void(0)" onclick="queryAll(pager.prev)">上页</a>
        <a href="javascript:void(0)" onclick="queryAll(pager.next)">下页</a>
        <a href="javascript:void(0)" onclick="queryAll(pager.last)">尾页</a>

    </div>

    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        员工信息管理 修改用户
                    </h4>
                </div>
                <div class="modal-body">
                    <form <%--action="updateSer2" method="post"--%>  id="userform">
                        <table class="table">
                            <tr>
                                <td>用户名</td>
                                <td>
                                    <%--hidden:隐藏--%>
                                    <input type="text" name="id" <%--id="id"--%>  value=""/>
                                    <input type="text" name="username" id="username" required placeholder="请输入用户名" />
                                </td>
                            </tr>
                            <tr>
                                <td>工号</td>
                                <td><input type="text" name="workno"  id="workno" required placeholder="请输入工号" /></td>
                            </tr>
                            <tr>
                                <td>性别</td>
                                <td>
                                    <%--  <input type="text" id="sex"/>--%>
                                    <input type="radio" class="sex" name="sex" id="boy"  value="男"  />男
                                    <input type="radio" class="sex" name="sex" id="girl" value="女"  />女
                                </td>
                            </tr>
                            <tr>
                                <td>电话</td>
                                <td><input type="text" name="phone" id="phone" /></td>
                            </tr>
                            <tr>
                                <td>生日</td>
                                <td><input type="date" name="birth"  id="birth" /></td>
                            </tr>
                        </table>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" onclick="updateOne(/*usermap.id*/)" data-toggle="modal" data-target="#myModal">
                        提交更改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <%-- 模态框2 --%>
    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel2">
                        员工信息管理 注册用户
                    </h4>
                </div>
                <div class="modal-body">
                    <form <%--action="updateSer2" method="post"--%>  id="userformForReg">
                        <table class="table">
                            <tr>
                                <td>用户名</td>
                                <td>
                                    <%--hidden:隐藏--%>
                                    <input type="text" name="id" id="id"  value=""/>
                                    <input type="text" name="username" id="username" required placeholder="请输入用户名" />
                                </td>
                            </tr>
                            <tr>
                                <td>密码</td>
                                <td><input type="password" name="password" required placeholder="请输入密码"></td>
                            </tr>
                            <tr>
                                <td>工号</td>
                                <td><input type="text" name="workno"  <%--id="workno"--%> required placeholder="请输入工号" /></td>
                            </tr>
                            <tr>
                                <td>性别</td>
                                <td>
                                    <%--  <input type="text" id="sex"/>--%>
                                    <input type="radio" class="sex" name="sex" id="boy"  value="男"  />男
                                    <input type="radio" class="sex" name="sex" id="girl" value="女"  />女
                                </td>
                            </tr>
                            <tr>
                                <td>电话</td>
                                <td><input type="text" name="phone" <%--id="phone"--%> /></td>
                            </tr>
                            <tr>
                                <td>生日</td>
                                <td><input type="date" name="birth"  <%--id="birth"--%> /></td>
                            </tr>
                        </table>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" onclick="updateOne(/*usermap.id*/)" data-toggle="modal" data-target="#myModal2">
                        提交更改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</body>
</html>
