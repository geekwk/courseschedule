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
    <link rel="icon" href="images/favicon.ico" type="image/ico" />
    <title>Course Schedule!</title>
    <jsp:include page="../include/css.jsp"></jsp:include>
</head>9

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <!-- side top navigation -->
        <jsp:include page="nav.jsp"></jsp:include>

        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>排课系统</h3>
                    </div>

                    <div class="title_right">
                        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search for...">
                                <span class="input-group-btn">
                              <button class="btn btn-default" type="button">Go!</button>
                          </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>排课<small>/courseSchedule</small></h2>
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
                                <!-- Smart Wizard -->
                                <div id="wizard" class="form_wizard wizard_horizontal">
                                    <ul class="wizard_steps">
                                        <li>
                                            <a href="#step-1">
                                                <span class="step_no">1</span>
                                                <span class="step_descr">
                                              步骤 1<br />
                                              <small>选择年份,学期</small>
                                          </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#step-2">
                                                <span class="step_no">2</span>
                                                <span class="step_descr">
                                              步骤 2<br />
                                              <small>选择需要排课的专业</small>
                                          </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#step-3">
                                                <span class="step_no">3</span>
                                                <span class="step_descr">
                                              步骤 3<br />
                                              <small>生成教学班</small>
                                          </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#step-4">
                                                <span class="step_no">4</span>
                                                <span class="step_descr">
                                              步骤 4<br />
                                              <small>添加用于排课的教室</small>
                                          </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#step-5">
                                                <span class="step_no">5</span>
                                                <span class="step_descr">
                                              步骤 5<br />
                                              <small>排课</small>
                                          </span>
                                            </a>
                                        </li>
                                    </ul>
                                    <div id="step-1">
                                        <div class="form-horizontal form-label-left">
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">年份选择: <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select id="year" required="required" class="form-control col-md-7 col-xs-12">
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">学期选择:</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div id="gender" class="btn-group" data-toggle="buttons">
                                                        <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                            <input type="radio" class="term"  name="term" value="1"> &nbsp; 第一学期 &nbsp;
                                                        </label>
                                                        <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                            <input type="radio" class="term"  name="term" value="2"> &nbsp; 第二学期 &nbsp;
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="step-2">
                                        <c:forEach var = "item" items="${academyAndDeparts}">
                                            <h2 class="StepTitle">${item.academy.name}</h2>
                                            <c:forEach var = "depart" items="${item.departs}">
                                                <div class="form-group">
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" class="flat depart"value="${depart.id}" checked="checked"> ${depart.name}
                                                        </label>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:forEach>
                                    </div>
                                    <div id="step-3">
                                        <div class="x_panel" id="panel-teachingclasses" >
                                            <div class="x_title">
                                                <h2>教学班 <small>/teachingClasses</small></h2>
                                                <ul class="nav navbar-right panel_toolbox">
                                                    <li><input type="button" class="btn btn-primary" name = "addTeachClass" value="生成教学班" onclick="addTeachingClass()"></li>
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
                                                <table id="datatable-teachingclasses" class="table table-striped table-bordered" style="overflow-y:auto">
                                                    <thead>
                                                    <tr>
                                                        <th>序号</th>
                                                        <th>课程名</th>
                                                        <th>教师</th>
                                                        <th>学生数量</th>
                                                        <th>起始周</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="step-4">
                                        <div class="x_content">

                                            <div class="table-responsive">
                                                <table class="table table-striped jambo_table bulk_action">
                                                    <thead>
                                                        <tr class="headings">
                                                            <th>
                                                                <input type="checkbox" id="check-all" class="flat">
                                                            </th>
                                                            <th class="column-title">教室编号</th>
                                                            <th class="column-title">教室容量(人)</th>
                                                            <th class="column-title">信息</th>
                                                            </th>
                                                            <th class="bulk-actions" colspan="7">
                                                                <a class="antoo" style="color:#fff; font-weight:500;">教室选择:( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                                                            </th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>

                                                        <c:forEach var = "classroom" items="${classrooms}" varStatus="status">

                                                            <c:if test="${status.index%2==0}">
                                                                <tr class="even pointer">
                                                            </c:if>
                                                            <c:if test="${status.index%2==1}">
                                                                <tr class="odd pointer">
                                                            </c:if>

                                                                <td class="a-center ">
                                                                    <input type="checkbox" class="flat classroom" value="${classroom.classroom}" name="table_records">
                                                                </td>
                                                                <td>${classroom.classroom}</td>
                                                                <td>${classroom.number}</td>
                                                                <td>${classroom.classroom.substring(0,1)}号教学楼,${classroom.classroom.substring(2,5)}教室</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="step-5">
                                        <div class="x_panel">
                                            <div class="x_title">
                                                <h2>排课<small>/courseSchedule</small></h2>
                                                <ul class="nav navbar-right panel_toolbox">
                                                    <li><input type="button" class="btn btn-primary" name = "addTeachClass" value="排课" onclick="schedule()"></li>
                                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                                    </li>
                                                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                                                    </li>
                                                </ul>
                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="x_content">
                                                <table id="dataTable-schedule" class="table table-striped table-bordered" style="overflow-y:auto">
                                                    <thead>
                                                    <tr>
                                                        <th>序号</th>
                                                        <th>课程名</th>
                                                        <th>教师</th>
                                                        <th>教室</th>
                                                        <th>星期</th>
                                                        <th>上课时间</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End SmartWizard Content -->

                                <%--<div>--%>
                                    <%--<input type="button" value="getdata" onclick="getdata()">--%>
                                <%--</div>--%>

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
    var date = new Date()
    var year = date.getFullYear()
    var month = date.getMonth()
    year = year
    for(var i = -2;i<2;i++){
        if(i == 0 && month>7)
            $("#year").append($("<option selected value=\""+(year+i)+" \">"+(year+i) +"~"+(year+i+1)+"</option>"))
        else if(i ==-1 && month<7)
            $("#year").append($("<option selected value=\""+(year+i)+" \">"+(year+i) +"~"+(year+i+1)+"</option>"))
        else
            $("#year").append($("<option value=\""+(year+i)+" \">"+(year+i) +"~"+(year+i+1)+"</option>"))
    }

    function getdata(){
        var checkID = []
        var _year = $("#year").val()
        var _term = $(".term:checked").val()
        $(".depart:checked").each(function(){
            checkID.push(this.value)
        })
        var classroom=[]
        $(".classroom").each(function () {
            classroom.push(this.value)
        })
        console.log(_year)
        console.log(_term)
        console.log(checkID)
        console.log(classroom)
    }
    
    function addTeachingClass() {
        var checkID = []
        var _year = $("#year").val()
        var _term = $(".term:checked").val()
        $(".depart:checked").each(function(){
            checkID[checkID.length] = $(this).val()
        })
        $.ajax({
            url:"/courseSchedule/addTeachingClass",
            type:"POST",
            data:{
                year:_year,
                term:_term,
                departId:JSON.stringify(checkID)
            },
            success:function (resp) {
                data = resp.data.teachingclasses
                var table = $("#datatable-teachingclasses").dataTable(buttonsGroup)
                table.fnClearTable()
                var showData = []
                for(var i = 0;i<data.length;i++){
                    showData[i] = [i+1,data[i].course.name,data[i].teacher.name,data[i].number,data[i].start+'-'+data[i].end]
                }
                if(showData.length>0) {
                    table.fnAddData(showData)
                    $(".stepContainer").css("height","auto")
                }
            }
        })
    }

    function schedule() {
        var checkID = []
        var classroom=[]

        var _year = $("#year").val()
        var _term = $(".term:checked").val()
        $(".depart:checked").each(function(){
            checkID.push(this.value)
        })
        $(".classroom").each(function () {
            classroom.push(this.value)
        })

        $.ajax({
            url:"/courseSchedule/courseSchedule",
            type:"POST",
            data:{
                year:_year,
                term:_term,
                departIdOfJson:JSON.stringify(checkID),
                classroomsOfJson:JSON.stringify(classroom)
            },
            success:function (resp) {
                console.log(resp)
                data = resp.data.schedule
                var table = $("#dataTable-schedule").dataTable(buttonsGroup)
                table.fnClearTable()
                var showData = []
                for(var i = 0;i<data.length;i++){
                    showData[i] = [i+1,data[i].teachingclass.course.name,data[i].teachingclass.teacher.name,data[i].classroom.classroom,data[i].day,"第"+((2*data[i].time) - 1) +","+2*data[i].time+"节课"]
                }
                if(showData.length>0) {
                    table.fnAddData(showData)
                    $(".stepContainer").css("height","auto")
                }
            }
        })

    }
    
</script>

</body>
</html>