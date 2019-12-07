package cn.ahpu.controller;

import cn.ahpu.pojo.Result;
import cn.ahpu.pojo.Schedule;
import cn.ahpu.service.TeachingclassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/teachingclass")
public class TeachingclassController {

    @Autowired
    private TeachingclassService teachingclassService;

    @RequestMapping("/teachingclassesOfCourse")
    public Result teachingclassesOfCourse(Integer studentId,Integer courseId){
        ArrayList<HashMap<String, String>> teachingClassesOfCourse = teachingclassService.getTeachingClassesOfCourse(studentId,courseId);
        return Result.success("加载成功").add("teachingclasses",teachingClassesOfCourse);
    }

    @RequestMapping("/selectTeachingclass")
    public Result selectTeachingclass(Integer studentId,Integer teachingclassId){
        boolean b = teachingclassService.addSelectTeachingclass(studentId, teachingclassId);
        //System.out.println(studentId+" "+ teachingclassId);
        if(!b){
            return Result.fail("选课失败");
        }
        return Result.success("选课成功!");
    }

    @RequestMapping("/courseTableOfStudent")
    public Result getCourseTableOfStudent(Integer studentId){
        List<Schedule> list = teachingclassService.getCourseTableOfStudent(studentId);
        return Result.success("加载成功").add("schedule",list);
    }
    @RequestMapping("/courseTableOfStudentWithTerm")
    public Result getCourseTableOfStudentWithTerm(Integer studentId,Integer term){
        List<Schedule> list = teachingclassService.getCourseTableOfStudentWithTerm(studentId,term);
        return Result.success("加载成功").add("schedule",list);
    }

    @RequestMapping("/courseTableOfTeacher")
    public Result getCourseTableOfTeacher(Integer teacherId){
        List<Schedule> list = teachingclassService.getCourseTableOfTeacher(teacherId);
        return Result.success("加载成功").add("schedule",list);
    }

}
