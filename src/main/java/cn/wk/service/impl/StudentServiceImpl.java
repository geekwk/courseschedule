package cn.wk.service.impl;

import cn.wk.mapper.StudentMapper;
import cn.wk.pojo.Student;
import cn.wk.pojo.User;
import cn.wk.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("studentService")
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper studentMapper;

    public Student loginCheck(User user){
        return studentMapper.loginCheck(user);
    }

    @Override
    public Integer getStudentNumberOfDepartAndLevel(Integer departId, Integer level) {
        return studentMapper.getStudentNumberOfDepartAndLevel(departId,level);
    }

    @Override
    public List<Student> getAllStudentOfClass(Integer clazzId) {
        return studentMapper.getAllStudentOfClass(clazzId);
    }

    @Override
    public Integer getIdAutoIncrement() {
        return studentMapper.getIdAutoIncrement();
    }

    @Override
    public void addStudent(Student student) {
        studentMapper.addStudent(student);
    }

    @Override
    public Student getStudentById(Integer id) {
        return studentMapper.getStudentById(id);
    }

    @Override
    public void updatePassword(Integer id, String newpassword) {
        studentMapper.updatePassword(id,newpassword);
    }

}
