package cn.ahpu.service;

import cn.ahpu.pojo.Classroom;
import cn.ahpu.pojo.Schedule;

import java.util.List;

public interface ScheduleService {
    void addSchedule(Schedule schedule);

    void addScheduleList(List<Schedule> schedules);

    List<Schedule> getClassroomCourseTable(Classroom classroom);
}
