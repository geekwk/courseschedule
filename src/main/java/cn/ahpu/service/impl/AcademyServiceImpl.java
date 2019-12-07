package cn.ahpu.service.impl;

import cn.ahpu.mapper.AcademyMapper;
import cn.ahpu.pojo.Academy;
import cn.ahpu.service.AcademyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("academyService")
public class AcademyServiceImpl implements AcademyService {

    @Autowired
    private AcademyMapper academyMapper;

    @Override
    public List<Academy> getAllAcademy() {
        return academyMapper.getAllAcademy();
    }

    @Override
    public void addAcademy(String academyName) {
        academyMapper.addAcademy(academyName);
    }
}
