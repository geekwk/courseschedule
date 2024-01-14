package cn.wk.controller;

import cn.wk.pojo.Academy;
import cn.wk.pojo.Course;
import cn.wk.pojo.Result;
import cn.wk.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/course")
public class CourseController {

    @Autowired
    private CourseService courseService;

    @RequestMapping("/courseNameList")
    public Result getCourseList(){
        List<String> courseNameList = courseService.getAllCourseName();
        return Result.success("success").add("data",courseNameList);
    }

    @RequestMapping("/addcourse")
    public Result addCourse(Course course,int academyId){

        System.out.println("Addcourse:"+course.toString()+"&&"+"academyId:"+academyId);
        course.setAcademy(new Academy());
        course.getAcademy().setId(academyId);
        courseService.addCourse(course);
        return Result.success("添加成功");
    }

    @RequestMapping("/updatecourse")
    public Result updateCourse(Course course,String academyname){
        course.setAcademy(new Academy());
        course.getAcademy().setName(academyname);
        try {
            courseService.updateCourseWithAcademyName(course);
            return Result.success("更新成功");
        }catch (Exception e){
            return Result.fail("更新失败,请输入正确的信息!");
        }
    }

    @RequestMapping("/deletecourse")
    public Result deleteCourse(int id){
        try {
            courseService.deleteCourse(id);
            return Result.success("删除成功!");
        }catch (Exception e){
            e.printStackTrace();
            return Result.fail("删除失败!");
        }
    }


}
