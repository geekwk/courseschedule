package cn.ahpu.service;

import cn.ahpu.pojo.Depart;

import java.util.List;

public interface DepartService {
    List<Depart> getAllDepartByAcademy(int id);

    void addDepart(Depart depart);
}
