package com.gem.bbs.controller;

import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * @author 蓝莲花
 * @version 1.0.0
 * @ClassName NoPermissionController.java
 * @Description 授权失败跳转的控制器
 * @createTime 2020年03月22日 10:14:00
 */
@ControllerAdvice
public class NoPermissionController {
    @ExceptionHandler(UnauthorizedException.class)
    public String handlerUnauthorizedException() {
        return "refuse";
    }

    @ExceptionHandler(UnauthenticatedException.class)
    public String handlerUnauthenticatedException() {
        return "refuse";
    }
}
