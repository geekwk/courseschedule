package cn.wk.mapper;

import cn.wk.pojo.Admin;
import cn.wk.pojo.User;

public interface AdminMapper {
    Admin loginCheck(User user);
}