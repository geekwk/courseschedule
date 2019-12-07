package cn.ahpu.controller;

import cn.ahpu.pojo.Academy;
import cn.ahpu.pojo.Result;
import cn.ahpu.pojo.Teacher;
import cn.ahpu.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

    @Autowired
    private TeacherService teacherService;

    @RequestMapping("/info")
    public String info(){
        return "teacher/info";
    }

    @RequestMapping("/teacher")
    public String teacher(){
        return "teacher/teacher";
    }

    @RequestMapping("/view_course_student")
    public String studentListOfCourse(Model model, HttpSession session){
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        List<Map<String,Object>> list = teacherService.getStudentListOfAllTeachingclasses(teacher.getId());
        model.addAttribute("teachingclassesAndStudents",list);
        return "teacher/view_course_student";
    }



    @RequestMapping("/teacherListOfCourse")
    @ResponseBody
    public Result getTeacherListOfCourse(int id){
        try {
            List<ArrayList<String>> teacherListOfCourse = teacherService.getTeacherListOfCourse(id);
            return Result.success("加载成功!").add("teacherList",teacherListOfCourse);
        }catch (Exception e){
            return Result.fail("加载失败!");
        }
    }

    @RequestMapping("teacherListOfAcademy")
    @ResponseBody
    public Result getTeacherListOfAcademy(String academyName){
        List<String> teacherListOfAcademy = teacherService.getTeacherListOfAcademy(academyName);
        return Result.success("加载成功").add("data",teacherListOfAcademy);
    }

    @RequestMapping("/allTeacherOfAcademy")
    @ResponseBody
    public Result getAllTeacherOfAcademy(Integer academyId){
        return Result.success("加载成功").add("teachers",teacherService.getAllTeacherOfAcademy(academyId));
    }

    @RequestMapping("/addTeacherOfCourse")
    @ResponseBody
    public Result addTeacherOfCourse(int teacherUserName,int courseId){
        try {
            teacherService.addTeacherOfCourse(teacherUserName,courseId);
            return Result.success("添加成功");
        }catch (Exception e){
            e.printStackTrace();
            return Result.fail("添加失败");
        }
    }

    @RequestMapping("getIdAutoIncrement")
    @ResponseBody
    public Result getIdAutoIncrement(){
        Integer id = teacherService.getIdAutoIncrement();
        return Result.success("加载成功").add("id",id+100000);
    }

    @RequestMapping("/addTeacher")
    @ResponseBody
    public Result addTeacher(Teacher teacher,Integer academyId){
        teacher.setAcademy(new Academy());
        teacher.getAcademy().setId(academyId);
        teacherService.addTeacher(teacher);
        return Result.success("添加成功");
    }

    @RequestMapping("/getTeacherById")
    @ResponseBody
    public Result getTeacherById(Integer teacherId){
        Teacher teacher = teacherService.getTeacherById(teacherId);
        return Result.success("加载成功").add("teacher",teacher);
    }

    @RequestMapping("/updateInfo")
    @ResponseBody
    public Result updateInfo(Teacher teacher){
        System.out.println(teacher.toString());
        teacherService.updateTeacherInfo(teacher);
        return Result.success("更新成功");
    }

    @RequestMapping("/updatePassword")
    @ResponseBody
    public Result updatePassword(Integer id,String oldpassword,String newpassword){
        Teacher teacher = teacherService.getTeacherById(id);
        if(!teacher.getPassword().equals(oldpassword)){
            return Result.fail("原始密码错误!");
        }else{
            teacherService.updatePassword(id,newpassword);
            return Result.success("成功修改密码!");
        }
    }

}
