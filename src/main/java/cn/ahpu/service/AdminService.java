package cn.ahpu.service;

import cn.ahpu.pojo.Admin;
import cn.ahpu.pojo.User;

public interface AdminService {
    Admin loginCheck(User user);
}
