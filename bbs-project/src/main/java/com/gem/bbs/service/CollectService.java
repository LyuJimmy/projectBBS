package com.gem.bbs.service;

import com.gem.bbs.entity.Collect;

/**
 * @author 蓝莲花
 * @version 1.0.0
 * @ClassName CollectService.java
 * @Description TODO
 * @createTime 2020年03月24日 14:09:00
 */
public interface CollectService {
    /**
     * 收藏操作
     */
    String save(Collect collect);
}
