package com.gem.bbs.service.impl;

import com.gem.bbs.entity.ActiveUser;
import com.gem.bbs.entity.Likes;
import com.gem.bbs.mapper.LikesMapper;
import com.gem.bbs.service.LikesService;
import com.gem.bbs.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 蓝莲花
 * @version 1.0.0
 * @ClassName LikesServiceImpl.java
 * @Description TODO
 * @createTime 2020年03月23日 14:22:00
 */
@Service
public class LikesServiceImpl implements LikesService {
    @Autowired
    private LikesMapper likesMapper;

    @Override
    public String save(Likes likes) {
        ActiveUser user = UserUtils.getUser();
        if (user == null) {//未登录
            return "unLogin";
        } else{
            //判断当前用户是否已经对该回复点赞
            Likes sysLikes = likesMapper.findOne(user.getId(),likes.getAnswerId());
            if (sysLikes == null) {
                likes.setUserId(user.getId());
                likesMapper.insert(likes);
                return "success";
            } else {//取消点赞
                likesMapper.delete(user.getId(),likes.getAnswerId());
                return "cancel";
            }
        }
    }

}
