package cn.wk.service.impl;

import cn.wk.mapper.DepartMapper;
import cn.wk.pojo.Depart;
import cn.wk.service.DepartService;
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
