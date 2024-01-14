package cn.wk.service;

import cn.wk.pojo.Depart;

import java.util.List;

public interface DepartService {
    List<Depart> getAllDepartByAcademy(int id);

    void addDepart(Depart depart);
}
