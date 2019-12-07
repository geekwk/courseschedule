package cn.ahpu.service;

import cn.ahpu.pojo.Student;
import cn.ahpu.pojo.User;

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
