package cn.ahpu.mapper;

import cn.ahpu.pojo.Student;
import cn.ahpu.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentMapper {
    Student loginCheck(@Param("user") User user);

    void addStudent(@Param("student") Student student);

    Integer getStudentNumberOfDepartAndLevel(@Param("departId") int departId,@Param("level") int level);

    Student getStudentById(@Param("id") Integer studentId);

    List<Student> getAllStudentOfClass(@Param("clazzId") Integer clazzId);

    Integer getIdAutoIncrement();

    void updatePassword(@Param("id") Integer id, @Param("newpassword") String newpassword);
}