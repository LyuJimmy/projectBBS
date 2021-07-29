package com.gem.bbs.utils;

import com.gem.bbs.entity.ActiveUser;
import com.gem.bbs.entity.Collect;
import com.gem.bbs.entity.Likes;
import com.gem.bbs.entity.User;
import com.gem.bbs.mapper.CollectMapper;
import com.gem.bbs.mapper.LikesMapper;
import com.gem.bbs.mapper.UserMapper;
import com.gem.bbs.service.LikesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class SysUtils {
    @Autowired
    private LikesMapper likesMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CollectMapper collectMapper;

    public static SysUtils sysUtils;

    @PostConstruct
    public void init() {
        sysUtils = this;
    }

    /**
     * @param answerId
     * @return
     */
    public static Boolean isLikes(Integer answerId){
        boolean flag = false;
        ActiveUser user = UserUtils.getUser();
        if(user != null) {
            Likes likes = sysUtils.likesMapper.findOne(user.getId(),answerId);
            if (likes != null) {
                flag = true;
            }
        }
        return flag;
    }

    /**
     * 获取用户
     */
    public static User getUser(Integer userId) {
        return sysUtils.userMapper.selectOneByPrimaryKey(userId);
    }

    /**
     * 是否收藏
     */
    public static Boolean isCollect(Integer questionId){
        boolean flag = false;
        ActiveUser user = UserUtils.getUser();
        if(user != null) {
            Collect collect = sysUtils.collectMapper.selectOneByUserIdAndQuestionId(user.getId(), questionId);
            if (collect != null) {
                flag = true;
            }
        }
        return flag;
    }

}