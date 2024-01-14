package cn.wk.mapper;

import cn.wk.pojo.Course;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CourseMapper {

    List<Course> getAllCoursesCascade();
    Course getCourseById(@Param("id") int id);

    void addCourse(@Param("course") Course course);

    int getIdByCourseName(@Param("name") String name);

    void updateCourse(@Param("course") Course course);

    void deleteCourse(@Param("id") int id);

    List<String> getAllCourseName();
}