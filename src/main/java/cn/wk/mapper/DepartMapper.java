package cn.wk.mapper;


import cn.wk.pojo.Depart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepartMapper {

    List<Depart> getAllDepartByAcademy(@Param("id") int id);
    Depart getDepartById(@Param("id") int id);

    void addDepart(@Param("depart") Depart depart);
}