package com.gem.bbs.entity;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @Author: jzhang
 * @WX: 15250420158
 * @Date: 2020/2/12 14:41
 * @Description: 主题表
 */
@Data
public class Question {
    private Integer id;
    private String title;
    private String description;
    private Integer coin;
    private Integer userId;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createtime;
    private String isUp;
    private String isClosed;
}
