package cn.wk.service.impl;

import cn.wk.mapper.*;
import cn.wk.pojo.CurrentYearAndTerm;
import cn.wk.pojo.DepartWithLevel;
import cn.wk.pojo.Plan;
import cn.wk.pojo.Student;
import cn.wk.service.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service("planService")
public class PlanServiceImpl implements PlanService {

    @Autowired
    private PlanMapper planMapper;
    @Autowired
    private CourseMapper courseMapper;
    @Autowired
    private CurrentYearAndTermMapper currentYearAndTermMapper;
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private TeachingclassMapper teachingclassMapper;

    @Override
    public List<Plan> getPlansByTerm(int departId, int level, int term) {
        return planMapper.getPlanByTerm(departId,level,term);
    }

    @Override
    public void addPlan(Plan plan) {
        plan.getCourse().setId(courseMapper.getIdByCourseName(plan.getCourse().getName()));
        planMapper.addPlan(plan);
    }

    @Override
    public List<Plan> getPlanByTerm(int departId, int year, int term) {
        return planMapper.getPlanByTerm(departId,year,term);
    }

    @Override
    public List<DepartWithLevel> getDepartWithLevelList() {
        return planMapper.getDepartWithLevelList();
    }

    @Override
    public List<DepartWithLevel> getDepartWithLevelListOfCourse(Integer id, int year, int term) {
        return planMapper.getDepartWithLevelListOfCourse(id,year,term);
    }

    @Override
    public HashMap<String, Object> getPlansOfStudent(Integer studentId) {
        CurrentYearAndTerm currentYearAndTerm = currentYearAndTermMapper.getCurrentYearAndTerm();
        Student student = studentMapper.getStudentById(studentId);
        List<Plan> plans = planMapper.getPlanByTerm(student.getClazz().getDepart().getId(), student.getClazz().getLevel(), 2 * (currentYearAndTerm.getYear() - student.getClazz().getLevel()) + currentYearAndTerm.getTerm());

        ArrayList<Boolean> selected = new ArrayList<>();
        for (Plan p:plans){
            Integer id = teachingclassMapper.getSelectCourseByStudentAndCourse(studentId,p.getCourse().getId());
            if(id==null)
                selected.add(false);
            else
                selected.add(true);
        }

        HashMap<String, Object> result = new HashMap<>();
        result.put("plans",plans);
        result.put("selected",selected);
        return result;
    }

    @Override
    public void deletePlanById(Integer planId) {
        planMapper.deletePlanById(planId);
    }
}
