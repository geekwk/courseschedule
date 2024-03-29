package cn.wk.service;

import cn.wk.pojo.Schedule;
import cn.wk.pojo.Teachingclass;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface TeachingclassService {
    void addTeachingclasses(ArrayList<Teachingclass> teachingclasses);

    List<Teachingclass> getTeachingclasses();

    ArrayList<HashMap<String, String>> getTeachingClassesOfCourse(Integer studentId,Integer courseId);

    boolean addSelectTeachingclass(Integer studentId, Integer teachingclassId);

    List<Schedule> getCourseTableOfStudent(Integer studentId);

    List<Schedule> getCourseTableOfTeacher(Integer teacherId);

    List<Schedule> getCourseTableOfStudentWithTerm(Integer studentId, Integer term);
}
