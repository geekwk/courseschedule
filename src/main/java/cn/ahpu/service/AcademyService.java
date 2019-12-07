package cn.ahpu.service;

import cn.ahpu.pojo.Academy;

import java.util.List;

public interface AcademyService {
    List<Academy> getAllAcademy();

    void addAcademy(String academyName);
}
