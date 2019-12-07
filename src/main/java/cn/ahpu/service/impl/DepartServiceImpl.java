package cn.ahpu.service.impl;

import cn.ahpu.mapper.DepartMapper;
import cn.ahpu.pojo.Depart;
import cn.ahpu.service.DepartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("deparService")
public class DepartServiceImpl implements DepartService {

    @Autowired
    private DepartMapper departMapper;

    @Override
    public List<Depart> getAllDepartByAcademy(int id) {
         return departMapper.getAllDepartByAcademy(id);
    }

    @Override
    public void addDepart(Depart depart) {
        departMapper.addDepart(depart);
    }
}
