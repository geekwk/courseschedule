package cn.ahpu.mapper;

import cn.ahpu.pojo.DepartWithLevel;
import cn.ahpu.pojo.Plan;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PlanMapper {

    List<Plan> getPlanByTerm(@Param("departId") int departId,@Param("level") int level,@Param("term") int term);

    void addPlan(@Param("plan") Plan plan);

    List<DepartWithLevel> getDepartWithLevelList();

    List<DepartWithLevel> getDepartWithLevelListOfCourse(@Param("id") Integer id,@Param("year") Integer year,@Param("term") Integer term);

    void deletePlanById(@Param("planId") Integer planId);
}