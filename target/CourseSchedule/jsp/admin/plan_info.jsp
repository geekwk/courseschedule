<%--
  Created by IntelliJ IDEA.
  User: wk_ac
  Date: 2019/4/15
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Course Schedule!</title>
    <jsp:include page="../include/css.jsp"></jsp:include>
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
                    <h3>教学计划 <small>/plan</small></h3>
                </div>
            </div>
            <div class="col-md-12 col-xs-6">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>人才培养计划 <small>/selectPlan</small></h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <br />
                        <div class="form-horizontal form-label-left">

                            <div class="form-group">
                                <label class="control-label col-md-1 col-sm-3 col-xs-12">学院</label>
                                <div class="col-md-19 col-sm-9 col-xs-12">
                                    <select class="form-control" id="academy">
                                        <c:forEach var="item" items="${allAcademy}">
                                            <option value="${item.id}">${item.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-1 col-sm-3 col-xs-12">专业</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <select class="select2_single form-control" id="depart" >
                                    <option>请选择学院</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-1 col-sm-3 col-xs-12">级别</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <select class="select2_single form-control" id="level" >
                                        <c:forEach var="i" begin="2015" end="2019">
                                            <option value="${i}"> ${i}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-1 col-sm-3 col-xs-12">学期</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <select class="select2_single form-control" id="term" >
                                        <c:forEach var="i" begin="1" end="8">
                                            <option value="${i}"> ${i}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>


            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>培养计划表 <small>/getPlanByTerm</small></h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>

                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Settings 1</a>
                                    </li>
                                    <li><a href="#">Settings 2</a>
                                    </li>
                                </ul>
                            </li>

                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <table id="datatable-plans" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th id="plan__id">序号</th>
                                <th id="plan_id">ID</th>
                                <th id="plan_course_name">课程名</th>
                                <th id="plan_course_academy">开课学院</th>
                                <th id="plan_info">描述信息</th>
                                <th id="plan_operator">操作</th>
                            </tr>
                            </thead>
                            <tbody id="plan_tbody">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>添加培养计划 <small>/addplan</small></h2>

                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Settings 1</a>
                                    </li>
                                    <li><a href="#">Settings 2</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>

                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <br />
                        <div id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">

                            <div class="form-group">
                                <label class="control-label col-md-1 col-sm-3 col-xs-12">选择课程</label>
                                <div class="col-md-6 col-sm-9 col-xs-12">
                                    <input type="text" name="country" id="autocomplete-custom-append-user" class="form-control col-md-10"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-1 col-sm-3 col-xs-12">描述(课程性质):</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="info" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                </div>
                            </div>

                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-1">
                                    <button type="submit" id="upload" class="btn btn-success" onclick="uploadplan()">添加</button>
                                    <button class="btn btn-primary" type="reset" onclick="loadAutoComplete()">重置</button>
                                    <button class="btn btn-primary" type="button" onclick="reloadtable()">取消</button>
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
                Course Schedule System by WangKang
            </div>
            <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
    </div>
</div>

<jsp:include page="../include/js.jsp"></jsp:include>

<script>
    $(document).ready(function () {
        $('#datatable-plans').dataTable(buttonsGroup).fnSetColumnVis(1,false)
        autoComplete("autocomplete-custom-append-user","/course/courseNameList")
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
                loadPlan()
            }
        });
    })

    $("#term,#depart,#level").change(function () {
        loadPlan();
    })

    function loadPlan() {
        $.ajax({
            type:"POST",
            url: "/plan/loadPlan",
            data:{
                departId: $("#depart").val(),
                level:$("#level").val(),
                term:$("#term").val()
            },
            success: function(data){
                plans = data.data.plans
                var table = $("#datatable-plans").dataTable()
                table.fnClearTable()
                var showData = []
                for(var i = 0;i<plans.length;i++){
                    showData[i] = [i+1,plans[i].id,plans[i].course.name,plans[i].course.academy.name,plans[i].info,getOperatorTemplete(plans[i].id,i)]
                }
                if(showData.length>0)
                    table.fnAddData(showData)
            }
        });
    }
    function deletePlan(id,i) {
        if(confirm("确定要删除该培养计划?")){
            $.ajax({
                url:"/plan/deletePlan",
                data:{
                    planId:id
                },
                success:function (resp) {
                    if(resp.status){
                        $("#datatable-plans").dataTable().fnDeleteRow(i)
                    }
                    alert(resp.message);
                }
            })
        }
    }
    //ajax添加培养计划
    function  uploadplan(){
        $.ajax({
            type:"POST",
            url: "/plan/addPlan",
            data:{
                departId:$("#depart").val(),
                courseName:$("#autocomplete-custom-append-user").val().trim(),
                level:$("#level").val(),
                term:$("#term").val(),
                info:$("#info").val()
            },
            success: function(resp){
                loadPlan()
                alert(resp.message)
            }

        })
    }

    function getOperatorTemplete(id,i) {
            temp = "                                 <ul class=\"nav nvabar-right panel_toolbox\">\n" +
            "                                            <li><a onclick=\"deletePlan(" +id+","+i+")\" title=\"删除该课程\" class=\"deletetable\"><i class=\"fa fa-trash\"></i></a>\n" +
            "                                            </li>\n" +
            "                                        </ul>\n"
        return temp;
    }


</script>


</body>
</html>