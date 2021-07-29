package com.gem.bbs.utils;

import com.gem.bbs.entity.ActiveUser;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

/**
 * @author 蓝莲花
 * @version 1.0.0
 * @ClassName UserUtils.java
 * @Description 获取用户
 * @createTime 2020年03月22日 17:12:00
 */
public class UserUtils {
    public static ActiveUser getUser() {
        //主体
        Subject subject = SecurityUtils.getSubject();
        //身份
        ActiveUser user = (ActiveUser) subject.getPrincipal();
        return user;
    }
}
