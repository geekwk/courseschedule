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
    </style>
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">

        <jsp:include page="nav.jsp"></jsp:include>

        <!-- page content -->
        <div class="right_col" role="main">
            <!-- top tiles -->
            <div class="page-title">
                <div class="title_left">
                    <h3>Welcome!</h3>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>信息修改 <sall>/updateInfo</sall></h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-down"></i></a>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content" style="display: none">
                        <div  data-parsley-validate class="form-horizontal form-label-left">
                            <div class="form-group" style="display: none;">
                                <label  class="control-label col-md-3 col-sm-3 col-xs-12">ID:<span class="required">*</span></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="id" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="control-label col-md-3 col-sm-3 col-xs-12">学院:<span class="required">*</span></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input disabled id="academy" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="control-label col-md-3 col-sm-3 col-xs-12">编号:<span class="required">*</span></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input disabled id="username" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="control-label col-md-3 col-sm-3 col-xs-12">姓名:<span class="required">*</span></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="name"  class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="control-label col-md-3 col-sm-3 col-xs-12">电话:<span class="required">*</span></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="phone" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="control-label col-md-3 col-sm-3 col-xs-12">地址:<span class="required">*</span></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="address" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                </div>
                            </div>

                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                    <button type="submit" class="btn btn-success" onclick="updateInfo()">更新</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>密码修改 <sall>/updatePassword</sall></h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-down"></i></a>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content" style="display: none;">
                        <div  data-parsley-validate class="form-horizontal form-label-left">

                            <div class="form-group">
                                <label  class="control-label col-md-3 col-sm-3 col-xs-12">旧密码:<span class="required">*</span></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="password" id="oldPassword" class="form-control col-md-7 col-xs-12" name="middle-name">
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="control-label col-md-3 col-sm-3 col-xs-12">密码:<span class="required">*</span></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="password" id="newPassword" class="form-control col-md-7 col-xs-12" name="middle-name">
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="control-label col-md-3 col-sm-3 col-xs-12">确认密码:<span class="required">*</span></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="password" id="newPassword2" class="form-control col-md-7 col-xs-12" name="middle-name">
                                </div>
                            </div>

                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                    <button type="submit"  class="btn btn-success" onclick="updatePassword()">更新</button>
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
            url:"/teacher/getTeacherById",
            type:"POST",
            data:{
                teacherId:${teacher.id}
            },
            success:function (resp) {
                data = resp.data.teacher
                console.log(data)
                $("#id").val(data.id)
                $("#academy").val(data.academy.name)
                $("#username").val(data.username)
                $("#name").val(data.name)
                $("#phone").val(data.phone)
                $("#address").val(data.address)
            }
        })
    })

    function updateInfo() {
        $.ajax({
            type:"POST",
            url:"/teacher/updateInfo",
            data:{
                id:$("#id").val(),
                name:$("#name").val(),
                phone:$("#phone").val(),
                address:$("#address").val(),
            },
            success:function (resp) {
                alert(resp.message)
            }
        })
    }
    function updatePassword() {
        if($("#newPassword").val() != $("#newPassword2").val()){
            alert("密码不一致!")
            return
        }
        $.ajax({
            type:"POST",
            url:"/teacher/updatePassword",
            data:{
                id:$("#id").val(),
                oldpassword:$("#oldPassword").val(),
                newpassword:$("#newPassword").val()
            },
            success:function (resp) {
                alert(resp.message)
            }
        })
    }

</script>

</body>
</html>