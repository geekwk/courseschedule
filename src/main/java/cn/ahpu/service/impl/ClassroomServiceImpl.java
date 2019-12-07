package cn.ahpu.service.impl;

import cn.ahpu.mapper.ClassroomMapper;
import cn.ahpu.mapper.ScheduleMapper;
import cn.ahpu.pojo.Classroom;
import cn.ahpu.pojo.Schedule;
import cn.ahpu.service.ClassroomService;
import cn.ahpu.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("classroomService")
public class ClassroomServiceImpl implements ClassroomService {

    @Autowired
    private ClassroomMapper classroomMapper;
    @Autowired
    private ScheduleService scheduleService;

    @Override
    public List<Classroom> getAllClassroom() {
        return classroomMapper.getAllClassroom();
    }

    @Override
    public Classroom getClassroomByClassroom(String s) {
        return classroomMapper.getClassroomByClassroom(s);
    }

    @Override
    public void addClassroom(String classroomName, Integer classroomNumber, String classroomInfo) {
        classroomMapper.addClassroom(classroomName,classroomNumber,classroomInfo);
    }

    @Override
    public List<Schedule> getClassroomCourseTable(Classroom classroom) {
        return  scheduleService.getClassroomCourseTable(classroom);
    }
}
