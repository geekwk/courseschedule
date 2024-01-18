<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
    <title>login</title>

    <jsp:include page="../include/css.jsp"/>
    <jsp:include page="../include/js.jsp"/>
    <link href="../../static/css/bootstrap/3.3.7/bootstrap.min.css" rel="stylesheet">
    <style>
        body{
            background: url("../../static/img/bg2.jpg");
            animation-name:myfirst;
            animation-duration:12s;
            /*变换时间*/
            animation-delay:2s;
            /*动画开始时间*/
            animation-iteration-count:infinite;
            /*下一周期循环播放*/
            animation-play-state:running;
            /*动画开始运行*/
        }
        /*@keyframes myfirst*/
        /*{*/
        /*0%   {background:url("static/img/1.jpg");}*/
        /*34%  {background:url("static/img/2.jpg");}*/
        /*67%  {background:url("static/img/1.jpg");}*/
        /*100% {background:url("static/img/1.jpg");}*/
        /*}*/
        .form{
            background: rgba(255,255,255,0.1);
            width:400px;
            margin-top: 200px;
            margin-left: 900px;
            color: white;
        }
        /*阴影*/
        .fa{display: inline-block;top: 27px;left: 6px;position: relative;color: #ccc;}
        input[type="text"],input[type="password"]{padding-left:26px;}
        .checkbox{padding-left:21px;}
    </style>



</head>
<body>

<header>
    <div class="navbar navbar-dark shadow-sm" style="background-color: #999999">
        <div class="container d-flex justify-content-between">
            <strong style="color: white;font-size: 35px;">选排课管理系统<small style="font-size: 20px;margin-left: 20px">Course Schedule System</small></strong>
        </div>
    </div>
</header>
<div>
    <div class="container">
        <div class="form row">
            <div class="form-horizontal col-md-offset-3" id="login_form">
                <h3 class="form-title">登录<span style="color: red;font-size: small" id="warning"></span></h3>
                <div class="col-md-9">
                    <div class="form-group">
                        <i class="fa fa-user fa-lg"></i>
                        <input class="form-control required" type="text" placeholder="Username" id="username" name="username" autofocus="autofocus" maxlength="20"/>
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock fa-lg"></i>
                        <input class="form-control required" type="password" placeholder="Password" id="password" name="password"/>
                    </div>

                    <div class="form-group">
                        <label class="checkbox">
                            <input type="checkbox" name="remember" value="1"/>记住我
                        </label>
                    </div>


                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <label class="btn active">
                            <input type="radio" name="type" id="option1"value="1" checked> 学生
                        </label>
                        <label class="btn ">
                            <input type="radio" name="type" id="option2" value="2"> 教师
                        </label>
                        <label class="btn">
                            <input type="radio" name="type" id="option3" value="3"> 管理员
                        </label>
                    </div>

                    <div class="form-group col-md-offset-9">
                        <button type="submit" class="btn btn-success pull-left" onclick="login()">登录</button>
                        <button type="reset" class="btn btn-warning pull-right">重置</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function login() {
        $.ajax({
            type:"POST",
            url:"/login/login",
            data: {
                username: $("#username").val(),
                password: $("#password").val(),
                type: $("input:checked").val()
            },
            success:function (resp) {
                if(resp.status){
                    window.location = "/"+resp.data.type+"/"+resp.data.type
                }else{
                    console.log(resp)
                    document.getElementById("warning").innerText = resp.message
                }
            }
        })
    }
</script>
</body>



</html>