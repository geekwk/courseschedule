package cn.wk.controller;


import cn.wk.pojo.Academy;
import cn.wk.pojo.Result;
import cn.wk.service.AcademyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/academy")
public class AcademyController {


    @Autowired
    private AcademyService academyService;

    @RequestMapping("/allAcademy")
    public Result loadAllAcademy(){
        List<Academy> list = academyService.getAllAcademy();
        return Result.success("加载成功").add("academyList",list);
    }

    @RequestMapping("/addAcademy")
    public Result addAcademy(String academyName){
        academyService.addAcademy(academyName);
        return Result.success("添加成功");
    }
}
