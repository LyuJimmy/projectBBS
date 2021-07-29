package com.gem.bbs.mapper;

import com.gem.bbs.entity.Likes;
import org.apache.ibatis.annotations.Param;

/**
 * @author 蓝莲花
 * @version 1.0.0
 * @ClassName LikesMapper.java
 * @Description 点赞接口
 * @createTime 2020年03月23日 14:15:00
 */
public interface LikesMapper {
    /**
     * 插入
     */
    void insert(Likes likes);

    /**
     * 删除
     */
    void delete(@Param("userId") Integer userId,@Param("answerId") Integer answerId);

    /**
     * 根据userid和answerid查记录
     */
    Likes findOne(@Param("userId") Integer userId,@Param("answerId") Integer answerId);
}
