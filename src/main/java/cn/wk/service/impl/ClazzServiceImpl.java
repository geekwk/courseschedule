package cn.wk.service.impl;

import cn.wk.mapper.ClazzMapper;
import cn.wk.pojo.Clazz;
import cn.wk.service.ClazzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("clazzService")
public class ClazzServiceImpl implements ClazzService {
    @Autowired
    private ClazzMapper clazzMapper;
    @Override
    public List<Clazz> getAllClazzOfDepart(Integer departId) {
        return clazzMapper.getAllClazzOfDepart(departId);
    }

    @Override
    public void addClass(Integer departId, String className, Integer classLevel) {
        clazzMapper.addClass(departId,className,classLevel);
    }
}
