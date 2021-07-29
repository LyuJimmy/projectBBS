package com.gem.bbs.service;

import com.gem.bbs.entity.Permission;
import com.gem.bbs.entity.User;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Author: jzhang
 * @WX: 15250420158
 * @Date: 2020/2/13 08:48
 * @Description:
 */
public interface UserService {
    /**
     * 注册用户
     */
    void register(User user);

    /**
     * 用户登录
     */
    String login(String loginname,String password,HttpSession session) ;

    /**
     * 根据登录名称查询用户
     */
    User findUserByLoginName(String loginName);

    /**
     * 根据用户id获取权限
     */
    List<Permission> findPermissionListByUserId(Integer userId);
}
