package cn.wk.service;

import cn.wk.pojo.Academy;

import java.util.List;

public interface AcademyService {
    List<Academy> getAllAcademy();

    void addAcademy(String academyName);
}
