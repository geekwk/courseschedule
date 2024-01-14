package cn.wk.service;

import cn.wk.pojo.Teacher;
import cn.wk.pojo.User;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface TeacherService {
    Teacher loginCheck(User user);

    List<ArrayList<String>> getTeacherListOfCourse(int id);

    List<String> getTeacherListOfAcademy(String academyName);

    void addTeacherOfCourse(int teacherUserName, int courseId);

    Teacher getTeacherById(int id);

    int getCountOfTeacher();

    List<Teacher> getAllTeacherOfAcademy(Integer academyId);

    List<Map<String, Object>> getStudentListOfAllTeachingclasses(Integer id);

    Integer getIdAutoIncrement();

    void addTeacher(Teacher teacher);

    void updateTeacherInfo(Teacher teacher);

    void updatePassword(Integer id, String newpassword);
}
