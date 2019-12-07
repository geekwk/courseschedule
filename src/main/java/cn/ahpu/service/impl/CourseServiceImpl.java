package cn.ahpu.service.impl;

import cn.ahpu.mapper.*;
import cn.ahpu.pojo.*;
import cn.ahpu.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service("courseService")
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseMapper courseMapper;
    @Autowired
    private AcademyMapper academyMapper;

    @Override
    public List<Course> getAllCourses() {
        return courseMapper.getAllCoursesCascade();
    }

    @Override
    public void addCourse(Course course) {
        courseMapper.addCourse(course);
    }

    @Override
    public void updateCourseWithAcademyName(Course course) {
        int id = academyMapper.getAcademyIdByName(course.getAcademy().getName());
        course.getAcademy().setId(id);
        courseMapper.updateCourse(course);
    }

    @Override
    public void deleteCourse(int id) {
        courseMapper.deleteCourse(id);
    }

    @Override
    public List<String> getAllCourseName() {
        return courseMapper.getAllCourseName();
    }

    @Override
    public List<Course> getAllCoursesCascade() {
        return courseMapper.getAllCoursesCascade();
    }

    @Override
    public Course getCourseById(int id) {
        return courseMapper.getCourseById(id);
    }
}
