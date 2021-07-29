package com.gem.bbs.entity;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author 软件工程10班 吕俊铭
 * @create 2021-06-26 20:40
 * Description:
 */
@Data
public class User {
    private Integer id;
    private String loginname;
    private String password;
    private String username;
    private String nickname;
    private String avatar;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createtime;
}
