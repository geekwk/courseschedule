<%--
  Created by IntelliJ IDEA.
  User: wk_ac
  Date: 2019/4/15
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <style>
        .tanchu, .tanchu_teacherList {
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


        <jsp:include page="nav.jsp"></jsp:include>

        <!-- page content -->
        <div class="right_col" role="main">
            <!-- top tiles -->
            <div class="page-title">
                <div class="title_left">
                    <h3>课程管理 <small> /course</small></h3>
                </div>
            </div>
            <div class="clearfix"></div>
            <!--课程信息-->
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>全部课程 <sall>/allCourses</sall></h2>
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
                        <table id="datatable-courses" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>课程ID</th>
                                <th>课程名</th>
                                <th>学分</th>
                                <th>学时</th>
                                <th>开课学院</th>
                                <th>描述信息</th>
                                <th>操作</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="course" items="${courses}" varStatus="status">
                                <tr class="operate_flag">
                                    <td>${status.count}</td>
                                    <td>${course.id}</td>
                                    <td>${course.name}</td>
                                    <td>${course.credit}</td>
                                    <td>${course.period}</td>
                                    <td>${course.academy.name}</td>
                                    <td>${course.info}</td>
                                    <td>
                                        <ul class="nav nvabar-right panel_toolbox">
                                            <li><a title="教师列表" class="opentable"><i class="fa fa-chevron-down"></i></a>
                                            </li>
                                            <li>
                                                <a title="编辑课程信息" role="button" aria-expanded="false"><i class="fa fa-edit"></i></a>
                                            </li>
                                            <li><a title="删除该课程" class="deletetable"><i class="fa fa-close"></i></a>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--添加课程-->
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>添加课程 <small>/addCourse</small></h2>

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
                        <div data-parsley-validate class="form-horizontal form-label-left">

                            <div class="form-group">
                                <label class="control-label col-md-1 col-sm-3 col-xs-12" >课程名称:<span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="coursename" required="required" class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-1 col-sm-3 col-xs-12" >学分: <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="credit" name="last-name" required="required" class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="control-label col-md-1 col-sm-3 col-xs-12">学时:<span class="required">*</span></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="period" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-1 col-sm-3 col-xs-12">开课学院</label>
                                <div class="col-md-6 col-sm-9 col-xs-12">
                                    <select class="form-control" id="academy">
                                        <c:forEach var="item" items="${allAcademy}">
                                            <option value="${item.id}">${item.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-1 col-sm-3 col-xs-12">描述:</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="info" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                </div>
                            </div>

                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-1">
                                    <button type="submit" id="upload" class="btn btn-success" onclick="addcourse()">添加</button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <!--弹出框-修改课程信息-->
            <div class="tanchu">
                <div class="col-md-6 col-xs-12" style="position: absolute;top:20%;left:25%">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>修改信息课程 <small>/updateCourse</small></h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <br />
                            <div id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" >序号:<span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" id="tc_id" required="required" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" >课程ID: <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" id="tc_courseid" name="last-name" required="required" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label  class="control-label col-md-3 col-sm-3 col-xs-12">课程名:<span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="tc_coursename" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label  class="control-label col-md-3 col-sm-3 col-xs-12">学分:<span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="tc_credit" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label  class="control-label col-md-3 col-sm-3 col-xs-12">学时:<span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="tc_period" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">开课学院</label>
                                    <div class="col-md-6 col-sm-9 col-xs-12">
                                        <input type="text" name="country" id="tc_academy" class="form-control col-md-10"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">描述信息:</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="tc_info" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                    </div>
                                </div>

                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                        <button type="submit" id="tc_upload" class="btn btn-success" onclick="updatecourse()">更新</button>
                                        <button class="btn btn-primary" type="reset" onclick="reset()">重置</button>
                                        <button class="btn btn-primary " type="button" onclick="canceltanchu()">取消</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--弹出框-添加教师-->
            <div class="tanchu_teacherList" id="panel_addteacher">
                <div class="col-md-6 col-xs-12" style="position: absolute;top:20%;left:25%">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>添加授课教师 <small>/addTeacher</small></h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <br />
                            <div id="demo-form3" data-parsley-validate class="form-horizontal form-label-left">


                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" >课程ID: <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input disabled type="text" id="tc_addteacher_courseid" name="last-name" required="required" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label  class="control-label col-md-3 col-sm-3 col-xs-12">课程名:<span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input disabled id="tc_addteacher_coursename" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label  class="control-label col-md-3 col-sm-3 col-xs-12">课程名:<span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input disabled id="tc_addteacher_academy" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label  class="control-label col-md-3 col-sm-3 col-xs-12">教师:<span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="tc_addteacher_teacher" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                    </div>
                                </div>

                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                        <button type="submit" id="tc_addteacher_add" class="btn btn-success" onclick="addTeacher()">添加</button>
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
    var _tr;
    $(document).ready(function () {
        $('#datatable-courses tbody td').on( 'click', '.fa-edit', function () {
            _tr = this.parentNode.parentNode.parentNode.parentNode.parentNode
            $("#tc_id").val(_tr.cells[0].innerHTML).attr("disabled",true)
            $("#tc_courseid").val(_tr.cells[1].innerHTML).attr("disabled",true)
            $("#tc_coursename").val(_tr.cells[2].innerHTML)
            $("#tc_credit").val(_tr.cells[3].innerHTML)
            $("#tc_period").val(_tr.cells[4].innerHTML)
            $("#tc_academy").val(_tr.cells[5].innerHTML)
            $("#tc_info").val(_tr.cells[6].innerHTML)
            $(".tanchu").show()
        } );
        // Panel toolbox
        $('.opentable .fa-chevron-down').on('click', function() {
            var $BOX_PANEL = $(this).closest('.operate_flag'),
                $ICON = $(this)
                $BOX_CONTENT = $BOX_PANEL.find('.x_content');

            getTeacherListOfCourse(this.parentNode.parentNode.parentNode.parentNode.parentNode)

            // fix for some div with hardcoded fix class
            if ($BOX_PANEL.attr('style')) {
                $BOX_CONTENT.slideToggle(200, function(){
                    $BOX_PANEL.removeAttr('style');
                });
            } else {
                $BOX_CONTENT.slideToggle(200);
                $BOX_PANEL.css('height', 'auto');
            }
            $ICON.toggleClass('fa-chevron-up fa-chevron-down')
        });
        //删除课程
        $('.deletetable').click(function () {
            var _tr = this.parentNode.parentNode.parentNode
            var oTable = $('#datatable-courses').dataTable()
            var pos = oTable.fnGetPosition(_tr);
            var data = oTable.fnGetData(_tr.parentNode);
            if(confirm("确定要删除记录\n"+data[2]+"?")) {
                oTable.fnDeleteRow(pos[0])
                deletecourse(data)
            }
        });

        $('#datatable-courses').dataTable(buttonsGroup)

    })

    function getTeacherListOfCourse(course){
        var table = $('#datatable-courses').dataTable()
        var courseInfo = table.fnGetData(course)
        if(table.fnIsOpen(course)){
            table.fnClose(course)
        }else{
            table.fnOpen(course,getTemplete(courseInfo))
        }

        $.ajax({
            type:"POST",
            url:"/teacher/teacherListOfCourse",
            data:{
                id:courseInfo[1]
            },
            success:function (resp) {
                teacherList = resp.data.teacherList
                table = $("#teacherList"+courseInfo[1]).dataTable()
                if(teacherList[0]!=null)
                    table.fnAddData(teacherList)
            }
        })

    }


    function reset() {
        _this = _tr
        $("#tc_id").val(_this.cells[0].innerHTML).attr("disabled",true)
        $("#tc_courseid").val(_this.cells[1].innerHTML).attr("disabled",true)
        $("#tc_coursename").val(_this.cells[2].innerHTML)
        $("#tc_credit").val(_this.cells[3].innerHTML)
        $("#tc_period").val(_this.cells[4].innerHTML)
        $("#tc_academy").val(_this.cells[5].innerHTML)
        $("#tc_info").val(_this.cells[6].innerHTML)
    }

    //添加课程信息
    function  addcourse(){
        $.ajax({
            type:"POST",
            url: "/course/addcourse",
            data:{
                name:$("#coursename").val(),
                credit:$("#credit").val(),
                period:$("#period").val(),
                academyId:$("#academy").val(),
                info:$("#info").val()
            },
            success: function(resp){
                alert(resp.message)
            }

        })
    }
    <!--更新课程-->
    function  updatecourse(){
        $.ajax({
            type:"POST",
            url: "/course/updatecourse",
            data:{
                id:$("#tc_courseid").val(),
                name:$("#tc_coursename").val(),
                credit:$("#tc_credit").val(),
                period:$("#tc_period").val(),
                academyname:$("#tc_academy").val().trim(),
                info:$("#tc_info").val()
            },
            success: function(resp){
                alert(resp.message)
                if(resp.status == 1){
                    _tr.cells[2].innerHTML = $("#tc_coursename").val()
                    _tr.cells[3].innerHTML = $("#tc_credit").val()
                    _tr.cells[4].innerHTML = $("#tc_period").val()
                    _tr.cells[5].innerHTML = $("#tc_academy").val()
                    _tr.cells[6].innerHTML = $("#tc_info").val()
                }
                //$('#datatable-courses').DataTable().destroy()
                //$('#datatable-courses').DataTable()
            }

        })
    }
    <!--删除课程-->
    function deletecourse(course) {
        $.ajax({
            url:"/course/deletecourse",
            type:"POST",
            data:{
                id:course[1]
            },
            success:function (resp) {
                alert(resp.message)
            }

        })
    }
    //弹出框关闭
    function canceltanchu() {
        $(".tanchu,.tanchu_teacherList").hide()
        $(document).unbind('mousewheel');
    }

    //弹出框-添加教师列表

    
    function panel_addteacher_open(courseInfo) {
        $(".tanchu_teacherList").show()
        $(document).bind('mousewheel', function(event, delta) {return false;})
        $("#panel_addteacher").show()
        $("#tc_addteacher_courseid").val(courseInfo[1])
        $("#tc_addteacher_coursename").val(courseInfo[2])
        $("#tc_addteacher_academy").val(courseInfo[5])
        autoComplete("tc_addteacher_teacher","/teacher/teacherListOfAcademy",{academyName:courseInfo[5]})
    }


    //添加教师
    function addTeacher(){

        $("#tc_addteacher_courseid").val()
        teacher = $("#tc_addteacher_teacher").val();
        id = teacher.substr(teacher.length-6-1,6)
        $.ajax({
            url:"/teacher/addTeacherOfCourse",
            type:"POST",
            data:{
                teacherUserName:id,
                courseId: $("#tc_addteacher_courseid").val()
            },
            success:function (resp) {
                alert(resp.message)
            }
        })
    }

    function getTemplete(courseInfo) {
        var templete="" +
            "<div class=\"col-md-12 col-sm-12 col-xs-12 \"  style='background-color: #dddddd'>\n" +
            "                <div class=\"x_panel\">\n" +
            "                    <div class=\"x_title\">\n" +
            "                        <h2>授课教师 <sall>/teacherList</sall></h2>\n"  +
            "                        <ul class=\"nav navbar-right panel_toolbox\">\n" +
            "                            <li><a onclick=\'panel_addteacher_open("+JSON.stringify(courseInfo)+")\'  title='添加教师' class=\"collapse-link\"><i class=\"fa fa-plus\"></i></a>\n" +
            "                            </li>\n" +
            "                        </ul>"+
            "                        <div class=\"clearfix\"></div>\n" +
            "                    </div>\n" +
            "                    <div class=\"x_content\">\n" +
            "                        <table id=\"teacherList"+ courseInfo[1] +"\" class=\"table table-striped table-bordered\">\n" +
            "                            <thead>\n" +
            "                            <tr>\n" +
            "                                <th>序号</th>\n" +
            "                                <th>工号</th>\n" +
            "                                <th>姓名</th>\n" +
            "                                <th>所属学院</th>\n" +
            "                                <th>电话</th>\n" +
            "                                <th>地址</th>\n" +
            "                            </tr>\n" +
            "                            </thead>\n" +
            "                            <tbody>\n" +
            "                            </tbody>\n" +
            "                        </table>\n" +
            "                    </div>\n" +
            "                </div>\n" +
            "            </div>"
        return templete
    }


</script>
</body>
</html>