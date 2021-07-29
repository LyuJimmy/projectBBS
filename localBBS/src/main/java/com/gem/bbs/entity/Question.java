package com.gem.bbs.entity;

import lombok.Data;

import java.util.Date;

/**
 * @author 软件工程10班 吕俊铭
 * @create 2021-06-26 20:44
 * Description:
 */
@Data
public class Question {
    private Integer id;
    private String title;
    private String description;
    private Integer coin;
    private Integer userId;
    private Date createtime;
    private String isup;
}
