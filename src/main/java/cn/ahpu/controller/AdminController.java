package cn.ahpu.controller;


import cn.ahpu.pojo.Academy;
import cn.ahpu.pojo.Classroom;
import cn.ahpu.pojo.Course;
import cn.ahpu.pojo.Depart;
import cn.ahpu.service.AcademyService;
import cn.ahpu.service.ClassroomService;
import cn.ahpu.service.CourseService;
import cn.ahpu.service.DepartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AcademyService academyService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private DepartService departService;

    @Autowired
    private ClassroomService classroomService;

    @RequestMapping("admin")
    public String jumpToAdmin(){
        return "admin/admin";
    }

    @RequestMapping("/load_teacher_info")
    public String jumpToTeacerInfo(){
        return "admin/teacher_info";
    }

    @RequestMapping("/load_student_info")
    public String jumpToStudentInfo(){
        return "admin/student_info";
    }

    @RequestMapping("/load_academy_info")
    public String jumpToAcademyInfo(){
        return "admin/academy_info";
    }

    @RequestMapping("/load_depart_info")
    public String jumpToDepartInfo(){
        return "admin/depart_info";
    }

    @RequestMapping("/load_class_info")
    public String jumpToClassInfo(){
        return "admin/class_info";
    }

    @RequestMapping("/load_classroom_info")
    public String jumpToClassroomInfo(){
        return "admin/classroom_info";
    }

    @RequestMapping("/load_classroom_course")
    public String jumpToClassroomCourse(){
        return "/admin/classroom_course";
    }


    @RequestMapping("/load_course_info")
    public String jumpToCourseInfo(Model model){
        List<Course> list = courseService.getAllCourses();
        model.addAttribute("courses",list);

        List<Academy> listacademy =  academyService.getAllAcademy();
        listacademy.add(0,new Academy(0,"请选择学院"));

        model.addAttribute("allAcademy",listacademy);

        return "admin/course_info";
    }

    @RequestMapping("/load_plan_info")
    public String jumpToPlanInfo(Model model){
        List<Academy> list =  academyService.getAllAcademy();
        list.add(0,new Academy(0,"请选择学院"));

        model.addAttribute("allAcademy",list);
        return "admin/plan_info";
    }

    @RequestMapping("/load_course_schedule")
    public String jumpToCourseSchedule(Model model){

        /**
         * 排课学院,专业数据获取
         */
        List<Academy> allAcademy = academyService.getAllAcademy();
        ArrayList<HashMap<String, Object>> hashMaps = new ArrayList<>();
        for (Academy a:allAcademy) {
            List<Depart> allDepartByAcademy = departService.getAllDepartByAcademy(a.getId());
            if(allDepartByAcademy.size()==0)
                continue;
            HashMap<String, Object> stringObjectHashMap = new HashMap<>();
            stringObjectHashMap.put("academy",a);
            stringObjectHashMap.put("departs",allDepartByAcademy);
            hashMaps.add(stringObjectHashMap);
        }

        /**
         * 排课教室数据获取
         */
        List<Classroom> classroomList = classroomService.getAllClassroom();


        model.addAttribute("academyAndDeparts",hashMaps);
        model.addAttribute("classrooms",classroomList);
        return "admin/course_schedule";
    }

}
