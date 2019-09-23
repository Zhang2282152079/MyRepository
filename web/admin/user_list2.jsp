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
    <%--<style>
        div{
            /*���Զ�λҪ��ƫ���������ʹ��*/
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
                url:"../ulistSer2",  //�˴������servlet��ʵ����servlet����
                data:{pageNo:pageNo}, //��servlet��������
                dataType:'json',      //servlet���ص���������
                success:function (data) {  //data:json����servlet���ص����� ��pager����ת��json��ʽ���ַ�������ҳ���Ͻӵ�json����
                    pager=data;
                    $("#tbData").empty();
                    var maplist=data.data;
                    for (var i=0;i<maplist.length;i++){
                        var tr='<tr>'+
                        '<td>'+maplist[i].username+'</td>' +   //maplist��i�е�username���Ե�ֵ
                            '<td>'+maplist[i].password+'</td>'+
                            '<td>'+maplist[i].workno+'</td>' +
                            '<td>'+maplist[i].sex+'</td>' +
                            '<td>'+maplist[i].phone+'</td>' +
                            '<td>'+maplist[i].birth+'</td>' +
                            '<td>'+'<input type="button"  value="�޸�" onclick="selectOne('+maplist[i].id+')" class="btn btn-primary" data-toggle="modal" data-target="#myModal"/> '+
                            '<input type="button"  value="ɾ��" onclick="deleteOne('+maplist[i].id+')" class="btn btn-primary" /> '+
                            '</td>'+
                            '</tr>';
                        $("#tbData").append(tr);
                        //��������ΪString
                        //alert(typeof (maplist[i].birth));
                    }
                },error:function (xhr,info,e) {
                    alert("����"+info,e);
                }
            });
        }

        function selectOne(id){
            $.ajax({
                type:"GET",
                url:"../seloneSer2?id="+id,  //�˴������servlet��ʵ����servlet����
                //data:{id:id},          //��servlet��������
                dataType:'json',      //servlet���ص���������
                success:function(data){
                    usermap=data;
                    //alert(data);
                    //js �Ѹ���id�鵽�Ķ�����Ϣ��ʾ�������Ŀ���
                    $("#id").val(data.id);
                    $("#username").val(data.username);
                    $("#workno").val(data.workno);
                    $("#phone").val(data.phone);
                    $("#birth").val(data.birth);
                    if (data.sex=='��'){
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
                data:$("#userformForReg").serialize(),//���л�������,�ѱ����������ݴ���servlet�У�url�У�,�������ص�id
                dataType:'json',
                success:function (data) {
                    //data: ��Ӱ�������
                    //pager.pageNo����ǰҳ��pager�Ǵ�servlet�õ��İ�����ǰҳ��Ķ���
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
            if (confirm('ȷ��Ҫɾ����')){
                $.ajax({
                    type:"GET",
                    url:"../deleteSer2?id="+id,
                    dataType:'json',
                    success:function (data) {
                        //data������Ϊnumber
                        //alert(typeof (data))
                        if (data>0) {
                            alert("ɾ���ɹ�");
                            queryAll(pager.pageNo);
                        }
                    },error:function (xhr,info,e) {
                        alert("����"+info+e);
                    }
                });
            }
        }

        function clearData(){
            //����
            $("#userformForReg")[0].reset();
            $("#id").val(0);
        }

        $(function(){
            queryAll();
        });
    </script>
</head>
<body>
    <a href="../index.jsp">������ҳ</a>
    <%--<a href="javascript:void(0)" onclick="selectOne(31)" class="btn btn-primary" data-toggle="modal" data-target="#myModal">ע���û�</a>--%>
    <input type="button" value="ע���û�" onclick="clearData()" class="btn-success" data-toggle="modal" data-target="#myModal2"/>
    <table class="table table-bordered table-hover">
        <tr>
            <th>����</th>
            <th>����</th>
            <th>����</th>
            <th>�Ա�</th>
            <th>�绰</th>
            <th>����</th>
            <th>����</th>
        </tr>

        <tbody id="tbData">

        </tbody>
    </table>
    <div id="control">

        <a href="javascript:void(0)" onclick="queryAll(1)">��ҳ</a>
        <a href="javascript:void(0)" onclick="queryAll(pager.prev)">��ҳ</a>
        <a href="javascript:void(0)" onclick="queryAll(pager.next)">��ҳ</a>
        <a href="javascript:void(0)" onclick="queryAll(pager.last)">βҳ</a>

    </div>

    <!-- ģ̬��Modal�� -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        Ա����Ϣ���� �޸��û�
                    </h4>
                </div>
                <div class="modal-body">
                    <form <%--action="updateSer2" method="post"--%>  id="userform">
                        <table class="table">
                            <tr>
                                <td>�û���</td>
                                <td>
                                    <%--hidden:����--%>
                                    <input type="text" name="id" <%--id="id"--%>  value=""/>
                                    <input type="text" name="username" id="username" required placeholder="�������û���" />
                                </td>
                            </tr>
                            <tr>
                                <td>����</td>
                                <td><input type="text" name="workno"  id="workno" required placeholder="�����빤��" /></td>
                            </tr>
                            <tr>
                                <td>�Ա�</td>
                                <td>
                                    <%--  <input type="text" id="sex"/>--%>
                                    <input type="radio" class="sex" name="sex" id="boy"  value="��"  />��
                                    <input type="radio" class="sex" name="sex" id="girl" value="Ů"  />Ů
                                </td>
                            </tr>
                            <tr>
                                <td>�绰</td>
                                <td><input type="text" name="phone" id="phone" /></td>
                            </tr>
                            <tr>
                                <td>����</td>
                                <td><input type="date" name="birth"  id="birth" /></td>
                            </tr>
                        </table>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">�ر�
                    </button>
                    <button type="button" class="btn btn-primary" onclick="updateOne(/*usermap.id*/)" data-toggle="modal" data-target="#myModal">
                        �ύ����
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <%-- ģ̬��2 --%>
    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel2">
                        Ա����Ϣ���� ע���û�
                    </h4>
                </div>
                <div class="modal-body">
                    <form <%--action="updateSer2" method="post"--%>  id="userformForReg">
                        <table class="table">
                            <tr>
                                <td>�û���</td>
                                <td>
                                    <%--hidden:����--%>
                                    <input type="text" name="id" id="id"  value=""/>
                                    <input type="text" name="username" id="username" required placeholder="�������û���" />
                                </td>
                            </tr>
                            <tr>
                                <td>����</td>
                                <td><input type="password" name="password" required placeholder="����������"></td>
                            </tr>
                            <tr>
                                <td>����</td>
                                <td><input type="text" name="workno"  <%--id="workno"--%> required placeholder="�����빤��" /></td>
                            </tr>
                            <tr>
                                <td>�Ա�</td>
                                <td>
                                    <%--  <input type="text" id="sex"/>--%>
                                    <input type="radio" class="sex" name="sex" id="boy"  value="��"  />��
                                    <input type="radio" class="sex" name="sex" id="girl" value="Ů"  />Ů
                                </td>
                            </tr>
                            <tr>
                                <td>�绰</td>
                                <td><input type="text" name="phone" <%--id="phone"--%> /></td>
                            </tr>
                            <tr>
                                <td>����</td>
                                <td><input type="date" name="birth"  <%--id="birth"--%> /></td>
                            </tr>
                        </table>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">�ر�
                    </button>
                    <button type="button" class="btn btn-primary" onclick="updateOne(/*usermap.id*/)" data-toggle="modal" data-target="#myModal2">
                        �ύ����
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</body>
</html>
