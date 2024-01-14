package cn.wk.service.impl;

import cn.wk.mapper.ScheduleMapper;
import cn.wk.mapper.StudentMapper;
import cn.wk.mapper.TeachingclassMapper;
import cn.wk.pojo.Schedule;
import cn.wk.pojo.Student;
import cn.wk.pojo.Teachingclass;
import cn.wk.service.TeachingclassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service("teachingclassService")
public class TeachingclassServiceImpl implements TeachingclassService {

    @Autowired
    private TeachingclassMapper teachingclassMapper;
    @Autowired
    private ScheduleMapper scheduleMapper;
    @Autowired
    private StudentMapper studentMapper;


    @Override
    public void addTeachingclasses(ArrayList<Teachingclass> teachingclasses) {
        for (Teachingclass t:teachingclasses){
            teachingclassMapper.addTeachingclass(t);
        }
    }

    @Override
    public List<Teachingclass> getTeachingclasses() {
        return teachingclassMapper.getTeachingclasses();
    }


    /**
     * 获得所有课程的所有教学班
     * @param studentId
     * @param courseId
     * @return
     */
    @Override
    public ArrayList<HashMap<String, String>> getTeachingClassesOfCourse(Integer studentId,Integer courseId) {
        List<Schedule> schedules = scheduleMapper.getScheduleOfCourseByCourseId(courseId);
        ArrayList<HashMap<String, String>> hashMaps = new ArrayList<>();

        for(int i = 0;i<schedules.size();i+=2){
            HashMap<String, String> map = new HashMap<>();
            Schedule schedule = schedules.get(i);
            Schedule scheduleNext = schedules.get(i+1);
            Teachingclass teachingclass = schedule.getTeachingclass();
            String info = "星期"+schedule.getDay() + "第"+(2*schedule.getTime() -1)+","+(2*schedule.getTime())+"节课  "+schedule.getClassroom().getClassroom();
            info = info+"<br/>"+"星期"+scheduleNext.getDay() + "第"+(2*scheduleNext.getTime() -1)+","+(2*scheduleNext.getTime())+"节课  "+scheduleNext.getClassroom().getClassroom();

            Integer selectCourseId = teachingclassMapper.getSelectCourseByStudentAndTeachingclass(studentId,schedule.getTeachingclass().getId());

            map.put("teachingclassId",""+teachingclass.getId());
            map.put("courseName",teachingclass.getCourse().getName());
            map.put("teacherName",teachingclass.getTeacher().getName());
            map.put("info",info);
            map.put("number",teachingclass.getCnt()+"/"+teachingclass.getNumber());
            if(selectCourseId == null){
                map.put("checked","");
            }else {
                map.put("checked","checked");
            }
            hashMaps.add(map);
        }
        return hashMaps;
    }

    /**
     * 选课
     * @param studentId
     * @param teachingclassId
     * @return
     */
    @Override
    public boolean addSelectTeachingclass(Integer studentId, Integer teachingclassId) {
        Teachingclass teachingclass = teachingclassMapper.getTeachingclassById(teachingclassId);
        Integer selectId = teachingclassMapper.getSelectCourseByStudentAndCourse(studentId,teachingclass.getCourse().getId());
        if(teachingclass.getCnt() == teachingclass.getNumber()){
            return false;
        }
        if(selectId == null){
            teachingclassMapper.addSelectTeachingclass(studentId,teachingclassId);
            teachingclassMapper.updateCntOfTeachingclass(teachingclassId,1);
        }else {
            Integer old = teachingclassMapper.getTeachingClassBySelectCourseId(selectId);
            teachingclassMapper.updateCntOfTeachingclass(old,-1);
            teachingclassMapper.updateSelectTeachingclass(selectId,teachingclassId);
            teachingclassMapper.updateCntOfTeachingclass(teachingclassId,1);
        }
        return true;
    }

    @Override
    public List<Schedule> getCourseTableOfStudent(Integer studentId) {
        return scheduleMapper.getScheduleOfStudentOfCurrent(studentId);
    }

    @Override
    public List<Schedule> getCourseTableOfTeacher(Integer teacherId) {
        return scheduleMapper.getScheduleOfTeacherOfCurrent(teacherId);
    }

    @Override
    public List<Schedule> getCourseTableOfStudentWithTerm(Integer studentId, Integer term) {
        Student student = studentMapper.getStudentById(studentId);
        term--;
        int year = student.getClazz().getLevel()+ term/2;
        term = term%2 + 1;
        return scheduleMapper.getScheduleOfStudentWithYearAndTerm(studentId,year,term);
    }
}
