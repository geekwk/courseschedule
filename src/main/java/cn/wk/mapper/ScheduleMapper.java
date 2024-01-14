package cn.wk.mapper;

import cn.wk.pojo.Classroom;
import cn.wk.pojo.Schedule;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ScheduleMapper {

    void addSchedule(@Param("schedule") Schedule schedule);

    List<Schedule> getScheduleOfCourseByCourseId(@Param("courseId") Integer courseId);

    List<Schedule> getScheduleOfStudentOfCurrent(@Param("studentId") Integer studentId);

    List<Schedule> getScheduleOfTeacherOfCurrent(@Param("teacherId") Integer teacherId);

    List<Schedule> getScheduleOfStudentWithYearAndTerm(@Param("studentId") Integer studentId, @Param("year") int year, @Param("term") Integer term);

    List<Schedule> getScheduleOfClassroom(@Param("classroom") Classroom classroom);
}