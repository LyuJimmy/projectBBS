package com.gem.bbs.mapper;

import com.gem.bbs.entity.Collect;
import org.apache.ibatis.annotations.Param;

/**
 * @author 蓝莲花
 * @version 1.0.0
 * @ClassName CollectionMapper.java
 * @Description 收藏接口
 * @createTime 2020年03月23日 14:15:00
 */
public interface CollectMapper {
    /**
     * 根据用户id，问题id查询记录
     */
    Collect selectOneByUserIdAndQuestionId(@Param("userId") Integer userId, @Param("questionId") Integer questionId);

    /**
     * 收藏
     */
    void insert(Collect collect);

    /**
     * 取消收藏
     */
    void delete(Collect collect);
}
