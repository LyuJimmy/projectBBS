package com.gem.bbs.service.impl;

import com.gem.bbs.entity.Permission;
import com.gem.bbs.entity.User;
import com.gem.bbs.mapper.UserMapper;
import com.gem.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Author: jzhang
 * @WX: 15250420158
 * @Date: 2020/2/13 08:52
 * @Description:
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public void register(User user) {
        userMapper.insertUser(user);
    }

    @Override
    public String login(String loginname, String password,HttpSession session) {
        //查询用户
        User user = userMapper.findUserByLoginname(loginname);
        if (user != null) {
            if (user.getPassword().equals(password)) {
                //用户登录成功，将【用户对象】存放到session
                session.setAttribute("user",user);
                return "101";//登录成功
            } else {
                return "102";//登录失败
            }
        } else {
            return "102";//登录失败
        }
    }

    @Override
    public User findUserByLoginName(String loginName) {
        return userMapper.findUserByLoginname(loginName);
    }

    @Override
    public List<Permission> findPermissionListByUserId(Integer userId) {
        return userMapper.findPermissionListByUserId(userId);
    }
}
