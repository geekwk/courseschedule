package cn.wk.service;

import cn.wk.pojo.Clazz;

import java.util.List;

public interface ClazzService {
    List<Clazz> getAllClazzOfDepart(Integer departId);

    void addClass(Integer departId, String className, Integer classLevel);
}
