package cn.wk.mapper;

import cn.wk.pojo.Student;
import cn.wk.pojo.Teachingclass;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeachingclassMapper {

    void addTeachingclass(@Param("t") Teachingclass t);

    List<Teachingclass> getTeachingclasses();
    Teachingclass getTeachingclassById(@Param("id") Integer id);

    Integer getSelectCourseByStudentAndCourse(@Param("studentId") Integer studentId, @Param("courseId") Integer courseId);

    void addSelectTeachingclass(@Param("studentId") Integer studentId,@Param("teachingclassId") Integer teachingclassId);

    void updateSelectTeachingclass(@Param("selectId") Integer selectId,@Param("teachingclassId") Integer teachingclassId);

    void updateCntOfTeachingclass(@Param("teachingclassId") Integer teachingclassId,@Param("increasement") Integer increasement);

    Integer getTeachingClassBySelectCourseId(@Param("selectId") Integer selectId);

    Integer getSelectCourseByStudentAndTeachingclass(@Param("studentId") Integer studentId,@Param("teachingclassId") Integer teahcingclassId);

    List<Teachingclass> getTeachingclassesOfTeacher(@Param("teacherId") Integer teacherId);

    List<Student> getStudentsOfTeachingclass(@Param("teachingclassId") Integer teachingclassId);
}