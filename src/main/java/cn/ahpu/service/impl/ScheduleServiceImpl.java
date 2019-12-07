package cn.ahpu.service.impl;

import cn.ahpu.mapper.ScheduleMapper;
import cn.ahpu.mapper.TeachingclassMapper;
import cn.ahpu.pojo.Classroom;
import cn.ahpu.pojo.Schedule;
import cn.ahpu.service.ScheduleService;
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
