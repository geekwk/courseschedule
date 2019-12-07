package cn.ahpu.service.impl;

import cn.ahpu.mapper.AdminMapper;
import cn.ahpu.pojo.Admin;
import cn.ahpu.pojo.User;
import cn.ahpu.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin loginCheck(User user) {
        return adminMapper.loginCheck(user);
    }
}
