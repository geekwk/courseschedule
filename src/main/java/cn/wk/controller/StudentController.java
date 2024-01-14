package cn.wk.controller;

import cn.wk.pojo.Clazz;
import cn.wk.pojo.Result;
import cn.wk.pojo.Student;
import cn.wk.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @RequestMapping("/student")
    public String student(){
        return "student/student";
    }
    @RequestMapping("/info")
    public String studentInfo(){
        return "student/info";
    }
    @RequestMapping("/select_course")
    public String selectCourse(){
        return "student/select_course";
    }
    @RequestMapping("/view_course")
    public String viewCourse(){
        return "student/view_course";
    }

    @RequestMapping("/allStudentOfClass")
    @ResponseBody
    public Result getAllStudentOfClass(Integer clazzId){
        List<Student> list = studentService.getAllStudentOfClass(clazzId);
        return Result.success("加载成功").add("students",list);
    }

    @RequestMapping("getIdAutoIncrement")
    @ResponseBody
    public Result getIdAutoIncrement(){
        Integer id = studentService.getIdAutoIncrement();
        return Result.success("加载成功").add("id",id);
    }

    @RequestMapping("/addStudent")
    @ResponseBody
    public Result addTeacher(Student student,Integer clazzId){
        student.setClazz(new Clazz());
        student.getClazz().setId(clazzId);
        studentService.addStudent(student);
        return Result.success("添加成功");
    }

    @RequestMapping("/updatePassword")
    @ResponseBody
    public Result updatePassword(Integer id,String oldpassword,String newpassword){
        Student student = studentService.getStudentById(id);
        if(!student.getPassword().equals(oldpassword)){
            return Result.fail("原始密码错误!");
        }else{
            studentService.updatePassword(id,newpassword);
            return Result.success("成功修改密码!");
        }

    }

}
