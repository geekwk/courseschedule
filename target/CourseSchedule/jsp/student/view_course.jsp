<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        .ke{
            height:55px;
            line-height: 55px;
            text-align: center
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
                    <h3>Welcome!</h3>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <div class="">
                            <div class="col-md-1">
                                <label class=" col-md-6">学期</label>
                                <select class=" col-md-6" id="term">
                                    <c:forEach var="i" begin="1" end="8">
                                        <option value="${i}" >${i}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <small>/courseTable</small>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a>
                                </li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <table id="coursetable" class="table table-striped table-bordered" style="font-size: larger">
                            <thead style="background-color: #dddddd">
                            <tr >
                                <th><center>时间</center></th>
                                <th><center>星期一</center></th>
                                <th><center>星期二</center></th>
                                <th><center>星期三</center></th>
                                <th><center>星期四</center></th>
                                <th><center>星期五</center></th>
                                <th><center>星期六</center></th>
                                <th><center>星期天</center></th>
                            </tr>
                            </thead>

                            <tbody>
                            <tr style="height: 170px" >
                                <td style="background-color: #dddddd">
                                    <div class="ke">第一节课</div>
                                    <hr/>
                                    <div class="ke">第二节课</div>
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr style="height: 170px">
                                <td style="background-color: #dddddd">
                                    <div  class="ke" >第三节课</div>
                                    <hr/>
                                    <div  class="ke">第四节课</div>
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr style="height: 170px">
                                <td style="background-color: #dddddd">
                                    <div  class="ke">第五节课</div>
                                    <hr/>
                                    <div  class="ke">第六节课</div>
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr style="height: 170px">
                                <td style="background-color: #dddddd">
                                    <div class="ke">第七节课</div>
                                    <hr/>
                                    <div  class="ke">第八节课</div>
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
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
        $("#term  option :first").attr("selected","selected"),
        loadCourseTable()
    })

    $("#term").change(function () {
        loadCourseTable()
    })
    
    function loadCourseTable() {
        var table = $("#coursetable tbody tr td")
        for(i = 0;i<4;i++){
            for(j = 1;j<8;j++){
                table[i*8+j].innerHTML = ""
            }
        }
        $.ajax({
            url:"/teachingclass/courseTableOfStudentWithTerm",
            type:"POST",
            data:{
                term:$("#term :selected").val(),
                studentId:${student.id}
            },
            success:function (resp) {
                var data = resp.data.schedule
                for(i = 0;i<data.length;i++){
                    var x = (data[i].time-1)*8 + data[i].day;
                    //console.log(data[i].time+"      " + data[i].day)
                    info = data[i].teachingclass.course.name+"<br/>"
                    info+=data[i].teachingclass.teacher.name+"<br/>"
                    info+=data[i].classroom.classroom+"<br/>"
                    info+=data[i].teachingclass.start+"-"+data[i].teachingclass.end+"周<br/>"
                    table[x].innerHTML = "<center>"+info+"</ceter>"
                }
            }
        })
    }

</script>

</body>
</html>