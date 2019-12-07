<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="/admin/admin" class="site_title"><i class="fa fa-table"></i><span>Course Schedule</span></a>
        </div>

        <div class="clearfix"></div>

        <!-- menu profile quick info -->
        <div class="profile clearfix">
            <div class="profile_pic">
                <img src="../../static/img/user.png" alt="..." class="img-circle profile_img">
            </div>
            <div class="profile_info">
                <span>Welcome,Admin</span>
                <h2>${admin.name}</h2>
            </div>
        </div>
        <!-- /menu profile quick info -->

        <br />

        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <ul class="nav side-menu">

                    <li><a><i class="fa fa-user blue"></i> 用户信息管理 <span class="fa fa-chevron-down"></span></a>

                        <ul class="nav child_menu">
                            <li><a href="/admin/load_teacher_info">教师管理</a></li>
                            <li><a href="/admin/load_student_info">学生管理</a></li>
                        </ul>
                    </li>

                    <li><a><i class="fa fa-institution blue"></i> 校教学机构管理 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">

                            <li><a href="/admin/load_academy_info">院系管理</a></li>

                            <li><a href="/admin/load_depart_info">专业管理</a></li>

                            <li><a href="/admin/load_class_info">行政班管理</a></li>
                        </ul>
                    </li>

                    <li><a><i class="fa fa-building blue"></i> 教室管理 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="/admin/load_classroom_info">添加教室</a></li>
                            <li><a href="/admin/load_classroom_course">查看教室课表</a></li>
                        </ul>
                    </li>


                    <li><a><i class="fa fa-book blue"></i> 课程管理 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="/admin/load_course_info">课程管理</a></li>
                            <li><a href="/admin/load_plan_info">教学计划管理</a></li>
                        </ul>
                    </li>

                    <li><a><i class="fa fa-table blue"></i> 排课 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="/admin/load_course_schedule">一键排课</a></li>
                            <li><a href="/admin/admin">选排课排课维护</a></li>
                        </ul>
                    </li>

                </ul>
            </div>
        </div>
        <!-- /sidebar menu -->

        <!-- /menu footer buttons -->
        <div class="sidebar-footer hidden-small">
            <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Logout" href="/login/logout">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
            </a>
        </div>
        <!-- /menu footer buttons -->
    </div>
</div>

<!-- top navigation -->
<div class="top_nav">
    <div class="nav_menu">
        <nav>
            <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>

            <ul class="nav navbar-nav navbar-right">
                <li class="">
                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <img src="../../static/img/user.png" alt="">${admin.name}
                        <span class=" fa fa-angle-down"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                        <li><a href="/login/logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                        <li><a href="javascript:;">Help</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!-- /top navigation -->