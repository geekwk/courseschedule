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
                    <h3>学院管理</h3>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>添加学院 <sall>/addAcademy</sall></h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>

                            <li><a onclick="addAcademy()"><i class="fa fa-plus"></i></a></li>

                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                        <hr>

                    </div>

                    <div class="x_content">
                        <table id="datatable-academy" class="table table-striped table-bordered">
                            <thead>
                            <tr style="background-color: #dddddd">
                                <th>序号</th>
                                <th>学院</th>
                            </tr>
                            </thead>

                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="tanchu" id="panel_addAcademy">
                <div class="col-md-6 col-xs-12" style="position: absolute;top:20%;left:25%">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>添加学院 <small>/addAcademy</small></h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <br />
                            <div id="demo-form3" data-parsley-validate class="form-horizontal form-label-left">
                                <div class="form-group">
                                    <label  class="control-label col-md-3 col-sm-3 col-xs-12">学院名:<span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="tc_academyname" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                    </div>
                                </div>
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                        <button type="submit" id="tc_addteacher_add" class="btn btn-success" onclick="uploadAcademy()">添加</button>
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
            type: "POST",
            url: "/academy/allAcademy",
            success: function (resp) {
                var table = $("#datatable-academy").dataTable(buttonsGroup);
                data = resp.data.academyList
                showData = []
                table.fnClearTable()
                for (var i = 0; i < data.length; i++) {
                    showData[i] = [i + 1, data[i].name]
                }
                table.fnAddData(showData)
            }
        })
    })

    function addAcademy() {
        $("#panel_addAcademy").show()
    }

    function uploadAcademy() {
        $.ajax({
            url:"/academy/addAcademy",
            type:"POST",
            data:{
                academyName:$("#tc_academyname").val()
            },
            success:function (resp) {
                $("#datatable-academy").dataTable().fnAddData([$("table tr").length,$("#tc_academyname").val()])
                alert(resp.message)
            }
        })
    }

    function canceltanchu() {
        $("#panel_addAcademy").hide()
    }
</script>

</body>
</html>