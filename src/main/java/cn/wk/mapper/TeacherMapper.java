package cn.wk.mapper;

import cn.wk.pojo.Teacher;
import cn.wk.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeacherMapper {
    Teacher loginCheck(User user);
    List<Teacher> getAllTeacherOfCourseById(@Param("id") int id);
    void addTeacher( @Param("teacher") Teacher teacher);

    List<Teacher> getTeacherListOfCourse(@Param("id") int id);

    List<Teacher> getTeacherListOfAcademy(@Param("academyName") String academyName);

    void addTeacherOfCourse(@Param("teacherId") int teacherId,@Param("courseId") int courseId);

    int getTeacherIdByUserName(@Param("teacherUserName") int teacherUserName);

    Teacher getTeacherById(@Param("id") int id);

    int getCountOfTeacher();

    List<Teacher> getAllTeacherOfAcademyById(@Param("academyId") Integer academyId);

    Integer getIdAutoIncrement();

    void updateTeacherInfo(@Param("teacher") Teacher teacher);

    void updatePassword(@Param("id") Integer id, @Param("newpassword") String newpassword);
}