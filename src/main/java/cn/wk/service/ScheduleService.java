package cn.wk.service;

import cn.wk.pojo.Classroom;
import cn.wk.pojo.Schedule;

import java.util.List;

public interface ScheduleService {
    void addSchedule(Schedule schedule);

    void addScheduleList(List<Schedule> schedules);

    List<Schedule> getClassroomCourseTable(Classroom classroom);
}
