package com.gem.bbs.entity;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @Author: jzhang
 * @WX: 15250420158
 * @Date: 2020/2/12 14:38
 * @Description: user实体类
 */
@Data
public class User {
    private Integer id;
    private String loginname;
    private String password;
    private String salt;
    private String username;
    private String nickname;
    private String avatar;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createtime;
}
