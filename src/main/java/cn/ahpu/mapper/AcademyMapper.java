package cn.ahpu.mapper;

import cn.ahpu.pojo.Academy;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AcademyMapper {

    List<Academy> getAllAcademy();

    Academy getAcademyById(@Param("id") int id);

    int getAcademyIdByName(@Param("name") String name);

    void addAcademy(@Param("academyName") String academyName);
}