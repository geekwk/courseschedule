package cn.ahpu.service;

import cn.ahpu.pojo.Clazz;

import java.util.List;

public interface ClazzService {
    List<Clazz> getAllClazzOfDepart(Integer departId);

    void addClass(Integer departId, String className, Integer classLevel);
}
