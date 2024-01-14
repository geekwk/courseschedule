package cn.wk.service.impl;

import cn.wk.mapper.ClassroomMapper;
import cn.wk.pojo.Classroom;
import cn.wk.pojo.Schedule;
import cn.wk.service.ClassroomService;
import cn.wk.service.ScheduleService;
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
