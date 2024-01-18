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
                    <h3>学生管理</h3>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>添加学生 <sall>/addStudent</sall></h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>

                            <li><a onclick="addStudent()"><i class="fa fa-plus"></i></a></li>

                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                        <hr>

                        <div class="row">
                            <div class="col-md-4 form-group">
                                <label class="control-label col-md-2 col-sm-2 col-xs-12">选择学院:</label>
                                <div class="col-md-10 col-sm-10 col-xs-12">
                                    <select class="select2_group form-control" id="academy">
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4 form-group">
                                <label class="control-label col-md-2 col-sm-2 col-xs-12">选择专业:</label>
                                <div class="col-md-10 col-sm-10 col-xs-12">
                                    <select class="select2_group form-control" id="depart">
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4 form-group">
                                <label class="control-label col-md-2 col-sm-2 col-xs-12">选择班级:</label>
                                <div class="col-md-10 col-sm-10 col-xs-12">
                                    <select class="select2_group form-control" id="clazz">
                                    </select>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="x_content">
                        <table id="datatable-students" class="table table-striped table-bordered">
                            <thead>
                            <tr style="background-color: #dddddd">
                                <th>序号</th>
                                <th>学号</th>
                                <th>姓名</th>
                                <th>性别</th>
                                <th>年龄</th>
                            </tr>
                            </thead>

                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="tanchu" id="panel_addstudent">
                <div class="col-md-6 col-xs-12" style="position: absolute;top:20%;left:25%">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>添加学生 <small>/addStudent</small></h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <br />
                            <div id="demo-form3" data-parsley-validate class="form-horizontal form-label-left">
                                <div class="form-group">
                                    <label  class="control-label col-md-3 col-sm-3 col-xs-12">班级:<span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input disabled id="tc_clazz" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
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
                                    <label  class="control-label col-md-3 col-sm-3 col-xs-12">年龄:<span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="tc_age"  class="form-control col-md-7 col-xs-12" type="number" value="22" name="middle-name">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label  class="control-label col-md-3 col-sm-3 col-xs-12">性别:<span class="required">*</span></label>
                                    <div class="col-md-6">
                                        M:
                                        <input type="radio" class="flat" name="gender" id="genderM" value="男" checked="" required /> F:
                                        <input type="radio" class="flat" name="gender" id="genderF" value="女" />
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
                                        <button type="submit" id="tc_addteacher_add" class="btn btn-success" onclick="uploadStudent()">添加</button>
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
<script src="../../static/js/courseSchedule.js"></script>

<script>
    $(document).ready(function () {
        $.ajax({
            url:"/academy/allAcademy",
            type:"POST",
            success:function (resp) {
                console.log(resp)
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
        $.ajax({
            type:"POST",
            url: "/depart/allDepart",
            data:{
                id: $("#academy").val()
            },
            success: function(data){
                $("#depart option").remove();
                for(var i = 0;i<data.data.departs.length;i++) {
                    var html = "<option "
                    if (i == 0)
                        html = html + "selected"
                    html = html + " value=" + data.data.departs[i].id + " >" + data.data.departs[i].name + "</option>"
                    $("#depart").append(html)
                }
                loadClazz()
                loadStudents()
            }
        });
    })

    $("#depart").change(function () {
        loadClazz();
    })

    function loadClazz() {
        $.ajax({
            type:"POST",
            url: "/class/allClassOfDepart",
            data:{
                departId: $("#depart").val()
            },
            success: function(resp){
                $("#clazz option").remove();
                data = resp.data.classes
                console.log(data)
                for(var i = 0;i<data.length;i++) {
                    var html = "<option "
                    if(i==0)
                        html = html+"selected"
                    html = html+" value="+ data[i].id + " >" + data[i].name + "</option>"
                    $("#clazz").append(html)
                }
                loadStudents()
            }
        });
    }
    
    $("#clazz").change(function () {
        loadStudents()
    })

    function loadStudents() {
        $.ajax({
            url:"/student/allStudentOfClass",
            type:"POST",
            data:{
                clazzId:$("#clazz").val()
            },
            success:function (resp) {
                var table = $("#datatable-students").dataTable(buttonsGroup);
                data = resp.data.students
                showData = []
                table.fnClearTable()
                for(var i = 0;i<data.length;i++){
                    showData[i] = [i+1,data[i].username,data[i].name,data[i].sex,data[i].age]
                }
                table.fnAddData(showData)
            }
        })
    }
    function addStudent() {
        $("#tc_clazz").val($("#clazz option:selected").text())
        $.ajax({
            url:"/student/getIdAutoIncrement",
            type:"POST",
            success:function (resp) {
                $("#tc_username").val(resp.data.id)
            }
        })
        $("#panel_addstudent").show()
    }

    function uploadStudent() {
        password1 = $("#tc_password").val();
        password2 = $("#tc_password2").val();
        if(password1 != password2){
            alert("密码不一致!")
            return
        }
        $.ajax({
            url:"/student/addStudent",
            type:"POST",
            data:{
                clazzId:$("#clazz option:selected").val(),
                name:$("#tc_name").val(),
                username:$("#tc_username").val(),
                age:$("#tc_age").val(),
                sex:$("input:checked").val(),
                password:$("#tc_password").val()
            },
            success:function (resp) {
                $("#datatable-students").dataTable().fnAddData([$("table tr").length,$("#tc_username").val(),$("#tc_name").val(),$("input:checked").val(),$("#tc_age").val(),$("#tc_address").val(),])
                alert(resp.message)
            }
        })
    }

    function canceltanchu() {
        $("#panel_addstudent").hide()
    }
</script>

</body>
</html>