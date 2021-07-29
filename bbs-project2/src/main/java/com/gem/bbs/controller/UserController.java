package com.gem.bbs.controller;

import com.gem.bbs.entity.User;
import com.gem.bbs.service.UserService;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * @Author: jzhang
 * @WX: 15250420158
 * @Date: 2020/2/13 08:56
 * @Description: 用户控制器
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    public UserService userService;
    //去往登录界面
    @RequestMapping("/loginPage")
    public String loginPage(){
        return "login";
    }


    //去往注册界面
    @RequestMapping("/registerPage")
    public String registerPage(){

        return "register";
    }

    //登录请求

    @RequestMapping("/login")
    public String login(HttpServletRequest request) throws Exception {
        // shiro在认证过程中出现错误后将异常类路径通过request返回
        String exceptionClassName = (String) request
                .getAttribute("shiroLoginFailure");
        if(exceptionClassName!=null){
            if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
                throw new Exception("账号不存在");
            } else if (IncorrectCredentialsException.class.getName().equals(
                    exceptionClassName)) {
                throw new Exception("用户名/密码错误");
            } else{
                throw new Exception();//最终在异常处理器生成未知错误
            }
        }
        return "login";
    }

    //注册请求
    @ResponseBody
    @RequestMapping("/register")
    public String register(User user){
        user.setCreatetime(new Date());
        System.out.println(user+"============");
        userService.register(user);
        return "success";
    }

    //安全退出
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/index";
    }


}
