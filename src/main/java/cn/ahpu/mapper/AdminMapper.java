package cn.ahpu.mapper;

import cn.ahpu.pojo.Admin;
import cn.ahpu.pojo.User;

public interface AdminMapper {
    Admin loginCheck(User user);
}