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
    public UserMapper userMapper;

    @Override
    public void register(User user) {
        userMapper.insertUser(user);

    }

    @Override
    public String login(String loginname, String password ,HttpSession session) {
        //查询用户

        User user = userMapper.findUserByLoginname(loginname);
        System.out.println("账号："+loginname+"  密码："+password);
        if (user!=null){
            //校验
            if (user.getPassword().equals(password)){
                //登入成功
                session.setAttribute("user",user);
                return "101";
            }else {
                //登入失败
                return "102";
            }
        }else {
            //用户不存在
            return "102";
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
