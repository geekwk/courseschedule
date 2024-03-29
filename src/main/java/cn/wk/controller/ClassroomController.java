package cn.wk.controller;

import cn.wk.pojo.Classroom;
import cn.wk.pojo.Result;
import cn.wk.pojo.Schedule;
import cn.wk.service.ClassroomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/classroom")
public class ClassroomController {

    @Autowired
    private ClassroomService classroomService;

    @RequestMapping("/allClassrooms")
    public Result getAllClassrooms(){
        return Result.success("加载成功!").add("classrooms",classroomService.getAllClassroom());
    }

    @RequestMapping("/addClassroom")
    public Result addClassrooms(String classroomName,Integer classroomNumber,String classroomInfo){
        classroomService.addClassroom(classroomName,classroomNumber,classroomInfo);
        return Result.success("添加成功!");
    }

    @RequestMapping("/classroomCourseTable")
    public Result getClassroomCourseTable(String classroomName){
        Classroom classroom = classroomService.getClassroomByClassroom(classroomName);
        List<Schedule>list = classroomService.getClassroomCourseTable(classroom);
        return Result.success("加载成功").add("schedule",list);

    }
}
