package cn.wk.service.impl;

import cn.wk.mapper.ScheduleMapper;
import cn.wk.pojo.Classroom;
import cn.wk.pojo.Schedule;
import cn.wk.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("scheduleService")
public class ScheduleServiceImpl implements ScheduleService {
    @Autowired
    private ScheduleMapper scheduleMapper;

    @Override
    public void addSchedule(Schedule schedule) {
        scheduleMapper.addSchedule(schedule);
    }

    @Override
    public void addScheduleList(List<Schedule> schedules) {
        for (Schedule s:schedules){
            addSchedule(s);
        }
    }

    @Override
    public List<Schedule> getClassroomCourseTable(Classroom classroom) {
        return scheduleMapper.getScheduleOfClassroom(classroom);
    }
}
