package cn.wk.service;

import cn.wk.pojo.Classroom;
import cn.wk.pojo.Schedule;

import java.util.List;

public interface ClassroomService {
    List<Classroom> getAllClassroom();

    Classroom getClassroomByClassroom(String s);

    void addClassroom(String classroomName, Integer classroomNumber, String classroomInfo);

    List<Schedule> getClassroomCourseTable(Classroom classroom);
}
