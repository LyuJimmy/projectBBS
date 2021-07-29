package com.gem.bbs.entity;

import lombok.Data;

/**
 * @Author: jzhang
 * @WX: 15250420158
 * @Date: 2020/2/12 14:38
 * @Description: 收藏实体类
 */
@Data
public class Collect {
    private Integer id;
    private Integer questionId;
    private Integer userId;
}
