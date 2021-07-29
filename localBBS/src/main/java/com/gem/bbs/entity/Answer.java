package com.gem.bbs.entity;

import lombok.Data;

/**
 * @author 软件工程10班 吕俊铭
 * @create 2021-06-26 20:46
 * Description:
 */
@Data
public class Answer {
    private Integer id;
    private String content;
    private Integer questionId;
    private Integer userId;
    private String isAccept;
    private int likes;

}
