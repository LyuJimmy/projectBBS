package com.gem.bbs.filter;

import com.gem.bbs.entity.ActiveUser;
import com.gem.bbs.entity.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Author: jzhang
 * @WX: 15250420158
 * @Date: 2020/1/17 08:42
 * @Description:
 */
public class GlobalInterceptor implements HandlerInterceptor {
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        //主体
//        Subject subject = SecurityUtils.getSubject();
//        //身份
//        ActiveUser user = (ActiveUser) subject.getPrincipal();
//
//        modelAndView.addObject("user", user);
        //获取应用路径
        modelAndView.addObject("contextPath",request.getContextPath());
    }
}
