package cn.ahpu.controller;

import cn.ahpu.pojo.Academy;
import cn.ahpu.pojo.Depart;
import cn.ahpu.pojo.Result;
import cn.ahpu.service.DepartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/depart")
public class DepartController {

    @Autowired
    private DepartService departService;

    @RequestMapping("/allDepart")
    public Result allDepart(int id){
        List<Depart> list =  departService.getAllDepartByAcademy(id);
        return  Result.success("加载成功").add("departs",list);
    }

    @RequestMapping("/allDepartOfAcademy")
    public Result allDepartOfAcademy(Integer academyId){
        List<Depart> list = departService.getAllDepartByAcademy(academyId);
        return Result.success("加载成功").add("departs",list);
    }

    @RequestMapping("/addDepart")
    public Result addDepart(Integer academyId,String departName){
        Depart depart = new Depart();
        depart.setName(departName);
        depart.setAcademy(new Academy());
        depart.getAcademy().setId(academyId);
        departService.addDepart(depart);
        return Result.success("添加成功");
    }

}
