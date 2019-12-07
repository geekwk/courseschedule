package cn.ahpu.controller;

import cn.ahpu.pojo.*;
import cn.ahpu.service.AdminService;
import cn.ahpu.service.StudentService;
import cn.ahpu.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("login")
public class LoginController {

    @Autowired
    private StudentService studentService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private AdminService adminService;

    @RequestMapping("/login")
    @ResponseBody
    public Result login(User user,HttpSession session){
        String type = "login";
        if(user.getType() == 1) {
            Student student = studentService.loginCheck(user);
            if(student!=null){
                session.setAttribute("student",student);
                type = "student";
            }
        }else if(user.getType()==2){
            Teacher teacher = teacherService.loginCheck(user);
            if(teacher!=null) {
                session.setAttribute("teacher",teacher);
                type = "teacher";
            }
        }else if (user.getType()==3){
            Admin admin = adminService.loginCheck(user);
            if(admin!=null){
                session.setAttribute("admin",admin);
                type = "admin";
            }
        }
        if(type.equals("login")){
            return Result.fail("账号或密码错误!");
        }else {
            return Result.success("登录成功!").add("type",type);
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("student");
        session.removeAttribute("teacher");
        session.removeAttribute("admin");
        return "login/login";
    }
}
