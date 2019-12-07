package cn.ahpu.service.impl;

import cn.ahpu.mapper.TeacherMapper;
import cn.ahpu.mapper.TeachingclassMapper;
import cn.ahpu.pojo.Student;
import cn.ahpu.pojo.Teacher;
import cn.ahpu.pojo.Teachingclass;
import cn.ahpu.pojo.User;
import cn.ahpu.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("teacherService")
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherMapper teacherMapper;
    @Autowired
    private TeachingclassMapper teachingclassMapper;

    @Override
    public Teacher loginCheck(User user) {
        return teacherMapper.loginCheck(user);
    }

    @Override
    public List<ArrayList<String>> getTeacherListOfCourse(int id) {
        List<Teacher> list = teacherMapper.getTeacherListOfCourse(id);
        List<ArrayList<String>> teacherList = new ArrayList<ArrayList<String>>();
        for(int i = 0;i<list.size();i++){
            List<String> temp =  new ArrayList<String>();
            temp.add(0, ""+(i+1));
            temp.add(1, list.get(i).getUsername());
            temp.add(2, list.get(i).getName());
            temp.add(3, list.get(i).getAcademy().getName());
            temp.add(4, list.get(i).getPhone());
            temp.add(5, list.get(i).getAddress());

            teacherList.add(i, (ArrayList<String>) temp);
        }
        return teacherList;
    }

    @Override
    public List<String> getTeacherListOfAcademy(String academyName) {
        List<String> list = new ArrayList<>();
        List<Teacher> teacherList = teacherMapper.getTeacherListOfAcademy(academyName);
        for(int i = 0;i<teacherList.size();i++){
            String str =teacherList.get(i).getName()+"("+teacherList.get(i).getUsername()+")";
            list.add(str);
        }

        return list;
    }

    @Override
    public void addTeacherOfCourse(int teacherUserName, int courseId) {
        int teacherId = teacherMapper.getTeacherIdByUserName(teacherUserName);
        teacherMapper.addTeacherOfCourse(teacherId,courseId);
    }

    @Override
    public Teacher getTeacherById(int id) {
        return teacherMapper.getTeacherById(id);
    }

    @Override
    public int getCountOfTeacher() {
        return teacherMapper.getCountOfTeacher();
    }

    @Override
    public List<Teacher> getAllTeacherOfAcademy(Integer academyId) {
        return teacherMapper.getAllTeacherOfAcademyById(academyId);
    }

    @Override
    public List<Map<String, Object>> getStudentListOfAllTeachingclasses(Integer teacherId) {
        List<Map<String, Object>> maps = new ArrayList<>();
        List<Teachingclass> list =  teachingclassMapper.getTeachingclassesOfTeacher(teacherId);
        for(Teachingclass t:list){
            HashMap<String, Object> map = new HashMap<>();
            List<Student> listOfStudents = teachingclassMapper.getStudentsOfTeachingclass(t.getId());
            map.put("teachingclass",t);
            map.put("students",listOfStudents);
            maps.add(map);
        }
        return maps;
    }

    @Override
    public Integer getIdAutoIncrement() {
        return teacherMapper.getIdAutoIncrement();
    }

    @Override
    public void addTeacher(Teacher teacher) {
        teacherMapper.addTeacher(teacher);
    }

    @Override
    public void updateTeacherInfo(Teacher teacher) {
        teacherMapper.updateTeacherInfo(teacher);
    }

    @Override
    public void updatePassword(Integer id, String newpassword) {
        teacherMapper.updatePassword(id,newpassword);
    }
}
