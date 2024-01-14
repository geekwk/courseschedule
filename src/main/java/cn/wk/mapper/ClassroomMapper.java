package cn.wk.mapper;

import cn.wk.pojo.Classroom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClassroomMapper {

    List<Classroom> getAllClassroom();

    Classroom getClassroomByClassroom(@Param("classroom") String s);
    Classroom getClassroomById(@Param("id") Integer id);

    void addClassroom(@Param("classroomName") String classroomName, @Param("classroomNumber") Integer classroomNumber, @Param("classroomInfo") String classroomInfo);
}