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
                    <h3>学生列表</h3>
                </div>
            </div>
            <div class="clearfix"></div>
            <c:forEach var="item" items="${teachingclassesAndStudents}">
                <div class="col-md-12 col-sm-12 col-xs-12 templete">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="color: #2196F3;">${item.teachingclass.course.name}</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <table id="datatable_students" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>学号</th>
                                    <th>班级</th>
                                    <th>姓名</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="student" items="${item.students}" varStatus="status">
                                    <tr>
                                        <td>${status.count}</td>
                                        <td>${student.username}</td>
                                        <td>${student.clazz.name}</td>
                                        <td>${student.name}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            </c:forEach>
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
        $("table").each(function () {
            $(this).dataTable(buttonsGroup)
        })
    })

</script>

</body>
</html>