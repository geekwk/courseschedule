package cn.wk.service;

import cn.wk.pojo.Student;
import cn.wk.pojo.User;

import java.util.List;

public interface StudentService {
    Student loginCheck(User user);

    Integer getStudentNumberOfDepartAndLevel(Integer departId, Integer level);

    List<Student> getAllStudentOfClass(Integer clazzId);

    Integer getIdAutoIncrement();

    void addStudent(Student student);

    Student getStudentById(Integer id);

    void updatePassword(Integer id, String newpassword);
}
