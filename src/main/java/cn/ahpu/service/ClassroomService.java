package cn.ahpu.service;

import cn.ahpu.pojo.Classroom;
import cn.ahpu.pojo.Schedule;

import java.util.List;

public interface ClassroomService {
    List<Classroom> getAllClassroom();

    Classroom getClassroomByClassroom(String s);

    void addClassroom(String classroomName, Integer classroomNumber, String classroomInfo);

    List<Schedule> getClassroomCourseTable(Classroom classroom);
}
