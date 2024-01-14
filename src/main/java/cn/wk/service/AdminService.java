package cn.wk.service;

import cn.wk.pojo.Admin;
import cn.wk.pojo.User;

public interface AdminService {
    Admin loginCheck(User user);
}
