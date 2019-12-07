package cn.ahpu.service;

import cn.ahpu.pojo.DepartWithLevel;
import cn.ahpu.pojo.Plan;

import java.util.HashMap;
import java.util.List;

public interface PlanService {
    List<Plan> getPlansByTerm(int departId, int level, int term);

    void addPlan(Plan plan);

    List<Plan> getPlanByTerm(int departId, int year, int term);

    List<DepartWithLevel> getDepartWithLevelList();

    List<DepartWithLevel> getDepartWithLevelListOfCourse(Integer id, int year, int term);

    HashMap<String, Object> getPlansOfStudent(Integer studentId);

    void deletePlanById(Integer planId);
}
