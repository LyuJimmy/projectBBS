package com.gem.bbs.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @author 蓝莲花
 * @version 1.0.0
 * @ClassName ActiveUser.java
 * @Description TODO
 * @createTime 2020年03月22日 09:33:00
 */
@Data
public class ActiveUser implements Serializable {
    private Integer id;
    private String loginname;
    private String password;
    private String username;

    private List<Permission> permissions;
}
