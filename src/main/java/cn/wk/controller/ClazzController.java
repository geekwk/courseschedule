package cn.wk.controller;

import cn.wk.pojo.Clazz;
import cn.wk.pojo.Result;
import cn.wk.service.ClazzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/class")
public class ClazzController {

    @Autowired
    private ClazzService clazzService;

    @RequestMapping("/allClassOfDepart")
    public Result allClazzOfDepart(Integer departId){
        List<Clazz>list = clazzService.getAllClazzOfDepart(departId);
        return Result.success("加载成功").add("classes",list);
    }

    @RequestMapping("addClass")
    public Result addClass(Integer departId,String className,Integer classLevel){
        clazzService.addClass(departId,className,classLevel);
        return Result.success("加载成功");
    }
}
