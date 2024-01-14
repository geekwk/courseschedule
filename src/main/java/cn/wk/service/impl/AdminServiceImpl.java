package cn.wk.service.impl;

import cn.wk.mapper.AdminMapper;
import cn.wk.pojo.Admin;
import cn.wk.pojo.User;
import cn.wk.service.AdminService;
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
