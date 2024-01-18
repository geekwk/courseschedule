<%--
  Created by IntelliJ IDEA.
  User: wk_ac
  Date: 2019/4/15
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="images/favicon.ico" type="image/ico" />
    <title>Course Schedule!</title>
    <jsp:include page="../include/css.jsp"></jsp:include>
    <style>
        .tanchu{
            width: 100%;
            height: 100%;
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            background-color: rgba(0, 0, 0, .5);
            z-index: 9999;
        }
    </style>
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <!-- side top navigation -->
        <jsp:include page="nav.jsp"></jsp:include>

        <!-- page content -->
        <div class="right_col" role="main">
            <!-- top tiles -->
            <div class="page-title">
                <div class="title_left">
                    <h3>教师管理</h3>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>添加教师 <sall>/allTeacer</sall></h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>

                            <li><a onclick="addTeacher()"><i class="fa fa-plus"></i></a></li>

                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                        <hr>

                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12 form-group">
                                <label class="control-label col-md-2 col-sm-2 col-xs-12">选择学院:</label>
                                <div class="col-md-10 col-sm-10 col-xs-12">
                                    <select class="select2_group form-control" id="academy">
                                    </select>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="x_content">
                        <table id="datatable-teachers" class="table table-striped table-bordered">
                            <thead>
                            <tr style="background-color: #dddddd">
                                <th>序号</th>
                                <th>编号</th>
                                <th>姓名</th>
                                <th>学院</th>
                                <th>电话</th>
                                <th>地址</th>
                            </tr>
                            </thead>

                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="tanchu" id="panel_addteacher">
                <div class="col-md-6 col-xs-12" style="position: absolute;top:20%;left:25%">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>添加教师 <small>/addTeacher</small></h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <br />
                            <div id="demo-form3" data-parsley-validate class="form-horizontal form-label-left">
                                <div class="form-group">
                                    <label  class="control-label col-md-3 col-sm-3 col-xs-12">学院:<span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input disabled id="tc_academy" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label  class="control-label col-md-3 col-sm-3 col-xs-12">编号:<span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input disabled id="tc_username" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label  class="control-label col-md-3 col-sm-3 col-xs-12">姓名:<span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="tc_name"  class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label  class="control-label col-md-3 col-sm-3 col-xs-12">电话:<span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="tc_phone" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label  class="control-label col-md-3 col-sm-3 col-xs-12">地址:<span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="tc_address" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label  class="control-label col-md-3 col-sm-3 col-xs-12">密码:<span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="password" id="tc_password" class="form-control col-md-7 col-xs-12" name="middle-name">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label  class="control-label col-md-3 col-sm-3 col-xs-12">确认密码:<span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="password" id="tc_password2" class="form-control col-md-7 col-xs-12" name="middle-name">
                                    </div>
                                </div>

                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                        <button type="submit" id="tc_addteacher_add" class="btn btn-success" onclick="uploadTeacher()">添加</button>
                                        <button class="btn btn-primary " type="button" onclick="canceltanchu()">取消</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
            <div class="pull-right">
                Course Schedule System by <a href="https://colorlib.com">WangKang</a>
            </div>
            <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
    </div>
</div>

<jsp:include page="../include/js.jsp"></jsp:include>

<script>
    $(document).ready(function () {
        $.ajax({
            url:"/academy/allAcademy",
            type:"POST",
            success:function (resp) {
                select = $("#academy")
                data = resp.data.academyList
                html = "<option>请选择学院</option>"
                for(var i = 0;i<data.length;i++){
                    html+="<option value=\""+data[i].id+"\">"+data[i].name+"</option>"
                }
                select.append(html)
            }
        })
    })
    $("#academy").change(function () {
        loadTeacher()
    })

    function loadTeacher() {
        $.ajax({
            url:"/teacher/allTeacherOfAcademy",
            type:"POST",
            data:{
                academyId:$("#academy").val()
            },
            success:function (resp) {
                var table = $("#datatable-teachers").dataTable(buttonsGroup);
                data = resp.data.teachers
                showData = []
                table.fnClearTable()
                for(var i = 0;i<data.length;i++){
                    showData[i] = [i+1,data[i].username,data[i].name,data[i].academy.name,data[i].phone,data[i].address]
                }
                table.fnAddData(showData)
            }
        })
    }
    function addTeacher() {
        $("#tc_academy").val($("#academy option:selected").text())
        $("#tc_depart").val($("#depart option:selected").text())
        $("#tc_classlevel").val(new Date().getFullYear())

        $.ajax({
            url:"/teacher/getIdAutoIncrement",
            type:"POST",
            success:function (resp) {
                $("#tc_username").val(resp.data.id)
            }
        })
        $("#panel_addteacher").show()
    }

    function uploadTeacher() {
        password1 = $("#tc_password").val();
        password2 = $("#tc_password2").val();
        if(password1 != password2){
            alert("密码不一致!")
            return
        }
        $.ajax({
            url:"/teacher/addTeacher",
            type:"POST",
            data:{
                academyId:$("#academy option:selected").val(),
                name:$("#tc_name").val(),
                username:$("#tc_username").val(),
                phone:$("#tc_phone").val(),
                address:$("#tc_address").val(),
                password:$("#tc_password").val()
            },
            success:function (resp) {
                $("#datatable-teachers").dataTable().fnAddData([$("table tr").length,$("#tc_username").val(),$("#tc_name").val(),$("#academy option:selected").text(),$("#tc_phone").val(),$("#tc_address").val(),])
                alert(resp.message)
            }
        })
    }

    function canceltanchu() {
        $("#panel_addteacher").hide()
    }

</script>

</body>
</html>