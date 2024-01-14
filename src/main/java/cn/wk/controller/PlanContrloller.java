package cn.wk.controller;

import cn.wk.pojo.Course;
import cn.wk.pojo.Depart;
import cn.wk.pojo.Plan;
import cn.wk.pojo.Result;
import cn.wk.service.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/plan")
public class PlanContrloller {


    @Autowired
    private PlanService planService;

    @RequestMapping("/loadPlan")
    public Result loadPlan(int departId, int level, int term){
        List<Plan> list =  planService.getPlansByTerm(departId,level,term);
        return Result.success("加载成功!").add("plans",list);
    }

    @RequestMapping("/addPlan")
    public Result addPlan(Plan plan,int departId, String courseName){
        plan.setDepart(new Depart());
        plan.setCourse(new Course());
        plan.getDepart().setId(departId);
        plan.getCourse().setName(courseName);
        planService.addPlan(plan);
        return Result.success("加载成功!");
    }

    @RequestMapping("/getPlan")
    public Result getPlan(String id,String name,int credit, int term, String info){
        System.out.println(id+name+credit+term+info);
        return Result.success("success");
    }

    @RequestMapping("/plansOfStudent")
    public Result plansOfStudetn(Integer studentId){
        Map<String, Object> plans = planService.getPlansOfStudent(studentId);
        Result result = Result.success("加载成功");
        result.setData(plans);
        return result;
    }

    @RequestMapping("deletePlan")
    public Result deletePlan(Integer planId){
        try {
            planService.deletePlanById(planId);
            return Result.success("删除成功!");
        }catch (Exception e){
            return Result.fail("删除失败!");
        }
    }



}
