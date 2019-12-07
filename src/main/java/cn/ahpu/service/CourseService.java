package cn.ahpu.service;

import cn.ahpu.pojo.Course;
import cn.ahpu.pojo.Plan;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface CourseService {
    List<Course> getAllCourses();

    void addCourse(Course course);

    void updateCourseWithAcademyName(Course course);

    void deleteCourse(int id);

    List<String> getAllCourseName();

    List<Course> getAllCoursesCascade();

    Course getCourseById(int id);
}
