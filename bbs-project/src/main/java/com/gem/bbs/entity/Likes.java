package com.gem.bbs.entity;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @Author: jzhang
 * @WX: 15250420158
 * @Date: 2020/2/12 14:38
 * @Description: 点赞实体类
 */
@Data
public class Likes {
    private Integer id;
    private Integer answerId;
    private Integer userId;
}
