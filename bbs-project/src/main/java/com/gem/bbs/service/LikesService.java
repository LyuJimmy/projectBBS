package com.gem.bbs.service;

import com.gem.bbs.entity.Likes;

/**
 * @author 蓝莲花
 * @version 1.0.0
 * @ClassName LikesService.java
 * @Description TODO
 * @createTime 2020年03月23日 14:21:00
 */
public interface LikesService {
    /**
     * 点赞
     */
    String save(Likes likes);
}
