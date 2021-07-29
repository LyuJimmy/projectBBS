package com.gem.bbs.service.impl;

import com.gem.bbs.entity.ActiveUser;
import com.gem.bbs.entity.Collect;
import com.gem.bbs.mapper.CollectMapper;
import com.gem.bbs.service.CollectService;
import com.gem.bbs.utils.UserUtils;
import org.apache.ibatis.annotations.AutomapConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 蓝莲花
 * @version 1.0.0
 * @ClassName CollectServiceImpl.java
 * @Description TODO
 * @createTime 2020年03月24日 14:09:00
 */
@Service
public class CollectServiceImpl implements CollectService {
    @Autowired
    private CollectMapper collectMapper;

    @Override
    public String save(Collect collect) {
        ActiveUser user = UserUtils.getUser();
        if (user == null) {
            return "101";//未登录
        } else {
            Collect sysCollect = collectMapper.selectOneByUserIdAndQuestionId(user.getId(), collect.getQuestionId());
            collect.setUserId(user.getId());
            if (sysCollect == null) {
                collectMapper.insert(collect);
                return "102";//收藏成功
            } else {
                collectMapper.delete(collect);
                return "103";//取消收藏
            }
        }
    }
}
