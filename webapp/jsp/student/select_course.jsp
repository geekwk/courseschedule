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
                        <h2>全部课程 <sall>/selectCourses</sall></h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li style="padding-right: 350px;padding-top: 10px">
                                    <label>注:</label>
                                    <i class="fa fa-check blue"></i>:已选课程
                                    <i class="fa fa-check"></i>:未选课程
                            </li>
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <table id="datatable-plans" class="table table-striped table-bordered">
                            <thead style="background-color: #dddddd">
                            <tr>
                                <th>序号</th>
                                <th>课程ID</th>
                                <th>课程名</th>
                                <th>学时</th>
                                <th>描述信息</th>
                                <th>操作</th>
                            </tr>
                            </thead>

                            <tbody>
                            </tbody>
                        </table>
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
            type:"POST",
            url:"/plan/plansOfStudent",
            data:{
                studentId:${student.id}
            },
            success:function (resp) {
                console.log(resp)
                data = resp.data.plans
                selected = resp.data.selected;
                var table = $("#datatable-plans").dataTable(buttonsGroup)
                table.fnClearTable()
                var showData = []

                for(var i = 0;i<data.length;i++){
                    showData[i] = [i+1,data[i].course.id,data[i].course.name,data[i].course.period,data[i].info,getoperator(data[i].course.id,selected[i])]
                }
                if(showData.length>0) {
                    //console.log(showData)
                    table.fnAddData(showData)
                    addClick()
                }
            }
        })
    })
    
    function addClick() {
        $('.opentable .fa-chevron-down').on('click', function() {
            $(this).toggleClass("fa-chevron-up fa-chevron-down")
            _tr = this.parentNode.parentNode.parentNode.parentNode.parentNode
            //console.log(this)
            var table = $('#datatable-plans').dataTable()
            var courseInfo = table.fnGetData(_tr)
            var temp
            //console.log(courseInfo)
            if(table.fnIsOpen(_tr)){
                table.fnClose(_tr)
            }else{
                temp = table.fnOpen(_tr,getTemplete(courseInfo))
            }
            console.log(temp)
            loadTeachingclasses(courseInfo)
        } );
    }

    function loadTeachingclasses(courseInfo) {
        var tableid = "teachingclass"+courseInfo[1]
        $.ajax({
            url:"/teachingclass/teachingclassesOfCourse",
            type:"POST",
            data:{
                studentId:${student.id},
                courseId:courseInfo[1]
            },
            success:function (resp) {
                //console.log(resp.data)
                data = resp.data.teachingclasses
                var table = $("#"+tableid).dataTable(buttonsGroup)
                table.fnClearTable()
                var showData = []
                for(var i = 0;i<data.length;i++){
                    showData[i] = [i+1,data[i].teachingclassId,data[i].courseName,data[i].teacherName,data[i].info,data[i].number,"<input type=\"radio\" value=\""+data[i].teachingclassId+"\"  name=\"course"+courseInfo[1]+"\" "+ data[i].checked+">"]
                }
                if(showData.length>0) {
                    //console.log(showData)
                    table.fnAddData(showData)
                }
            }
        })
    }

    function update_course_select(courseInfo) {
        var name = "course"+courseInfo[1];
        $.ajax({
            url:"/teachingclass/selectTeachingclass",
            type:"POST",
            data:{
                studentId:${student.id},
                teachingclassId:$("[name=course"+courseInfo[1]+"]:checked").val()
            },
            success:function (resp) {
                $("#check"+courseInfo[1]).addClass("blue")
                //$("#chevron"+courseInfo[1]).click()
                //$("#chevron"+courseInfo[1]).click()
                alert(resp.message)
                loadTeachingclasses(courseInfo)
            }
        })
    }

    function getoperator(id,selected) {
        var operator = "<ul class=\"nav nvabar-right panel_toolbox\">\n" +
            "                                            <li><a title=\"教学班列表\" class=\"opentable\"><i id=\"chevron"+id+"\" class=\"fa fa-chevron-down\"></i></a>\n" +
            "                                            </li>\n" +
            "                                            <li>\n"
        if(selected)
            operator+="                                  <a title=\"选课状态\" role=\"button\"  aria-expanded=\"false\"><i id=\"check"+id+"\" class=\"fa fa-check blue\"></i></a>\n"
        else
            operator+="                                  <a title=\"选课状态\" role=\"button\"  aria-expanded=\"false\"><i id=\"check"+id+"\" class=\"fa fa-check\"></i></a>\n"
        operator+="                                      </li>\n" +
            "                                        </ul>"
        return operator;
    }

    function getTemplete(courseInfo) {
        var templete="" +
            "<div class=\"col-md-12 col-sm-12 col-xs-12 \"  style='background-color: #dddddd'>\n" +
            "                <div class=\"x_panel\">\n" +
            "                    <div class=\"x_title\">\n" +
            "                        <h2>教学班选择 <small>/"+courseInfo[2]+"</small></h2>\n"  +
            "                        <ul class=\"nav navbar-right panel_toolbox\">\n" +
            "                            <li><button onclick=\'update_course_select("+JSON.stringify(courseInfo)+")\'  title='提交' class=\"btn btn-primary\"> 提交 </button>\n" +
            "                            </li>\n" +
            "                        </ul>"+
            "                        <div class=\"clearfix\"></div>\n" +
            "                    </div>\n" +
            "                    <div class=\"x_content\">\n" +
            "                        <table id=\"teachingclass"+ courseInfo[1] +"\" class=\"table table-striped table-bordered\">\n" +
            "                            <thead>\n" +
            "                            <tr>\n" +
            "                                <th>序号</th>\n" +
            "                                <th>教学班ID</th>\n" +
            "                                <th>课程名</th>\n" +
            "                                <th>教师名称</th>\n" +
            "                                <th>具体信息</th>\n" +
            "                                <th>已选人数/总容量</th>\n" +
            "                                <th>选择</th>\n" +
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