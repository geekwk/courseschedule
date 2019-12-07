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
                    <h3>行政班管理</h3>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>添加行政班级 <sall>/allClass</sall></h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>

                            <li><a onclick="addclass()"><i class="fa fa-plus"></i></a></li>

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

                            <div class="col-md-6 col-sm-6 col-xs-12 form-group">
                                <label class="control-label col-md-2 col-sm-2 col-xs-12">选择专业:</label>
                                <div class="col-md-10 col-sm-10 col-xs-12">
                                    <select class="select2_group form-control" id="depart">
                                    </select>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="x_content">
                        <table id="datatable-classes" class="table table-striped table-bordered">
                            <thead>
                            <tr style="background-color: #dddddd">
                                <th>序号</th>
                                <th>班级</th>
                                <th>级别</th>
                            </tr>
                            </thead>

                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="tanchu" id="panel_addclass">
                <div class="col-md-6 col-xs-12" style="position: absolute;top:20%;left:25%">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>添加行政班 <small>/addClass</small></h2>
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
                                    <label  class="control-label col-md-3 col-sm-3 col-xs-12">专业:<span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input disabled id="tc_depart"  class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label  class="control-label col-md-3 col-sm-3 col-xs-12">班级名:<span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="tc_classname" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label  class="control-label col-md-3 col-sm-3 col-xs-12">级别:<span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="tc_classlevel" class="form-control col-md-7 col-xs-12" type="number" name="middle-name">
                                    </div>
                                </div>

                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                        <button type="submit" id="tc_addteacher_add" class="btn btn-success" onclick="uploadclass()">添加</button>
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
                    if(i==0)
                        html = html+"selected"
                    html = html+" value="+ data.data.departs[i].id + " >" + data.data.departs[i].name + "</option>"
                    $("#depart").append(html)
                }
                loadClass()
            }
        });
    })

    $("#depart").change(function () {
        loadClass()
    })

    function loadClass() {
        $.ajax({
            url:"/class/allClassOfDepart",
            type:"POST",
            data:{
                departId:$("#depart").val()
            },
            success:function (resp) {
                var table = $("#datatable-classes").dataTable(buttonsGroup);
                data = resp.data.classes
                showData = []
                table.fnClearTable()
                for(var i = 0;i<data.length;i++){
                    showData[i] = [i+1,data[i].name,data[i].level]
                }
                table.fnAddData(showData)
            }
        })
    }
    function addclass() {
        $("#tc_academy").val($("#academy option:selected").text())
        $("#tc_depart").val($("#depart option:selected").text())
        $("#tc_classlevel").val(new Date().getFullYear())
        $("#panel_addclass").show()
    }

    function uploadclass() {
        $.ajax({
            url:"/class/addClass",
            type:"POST",
            data:{
                className:$("#tc_classname").val(),
                classLevel:$("#tc_classlevel").val(),
                departId:$("#depart").val()
            },
            success:function (resp) {
                $("#datatable-classes").dataTable().fnAddData([$("table tr").length,$("#tc_classname").val(),$("#tc_classlevel").val()])
                alert(resp.message)
            }
        })
    }

    function canceltanchu() {
        $("#panel_addclass").hide()
    }
</script>

</body>
</html>