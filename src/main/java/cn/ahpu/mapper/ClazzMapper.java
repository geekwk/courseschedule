package cn.ahpu.mapper;

import cn.ahpu.pojo.Clazz;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClazzMapper {

    Clazz getClazzById(@Param("id") Integer id);

    List<Clazz> getAllClazzOfDepart(@Param("departId") Integer departId);

    void addClass(@Param("departId") Integer departId, @Param("className") String className, @Param("classLevel") Integer classLevel);
}