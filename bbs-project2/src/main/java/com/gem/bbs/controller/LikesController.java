package com.gem.bbs.controller;

import com.gem.bbs.entity.Answer;
import com.gem.bbs.entity.Likes;
import com.gem.bbs.service.AnswerService;
import com.gem.bbs.service.LikesService;
import com.gem.bbs.vo.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author 蓝莲花
 * @version 1.0.0
 * @ClassName LikesController.java
 * @Description 点赞控制器
 * @createTime 2020年03月23日 14:25:00
 */
@Controller
@RequestMapping("/likes")
public class LikesController {
    @Autowired
    private LikesService likesService;
    @Autowired
    private AnswerService answerService;

    @RequestMapping("/up")
    public @ResponseBody ResponseResult up(Likes likes) {
        String flag =  likesService.save(likes);
        ResponseResult result = new ResponseResult();
        if (flag.equals("unLogin")) {
            result.setCode("101");
        } else {
            Answer answer = answerService.findOne(likes.getAnswerId());
            Answer updateAnswer = new Answer();
            updateAnswer.setId(likes.getAnswerId());
            if (flag.equals("success")){
                //根据回复表中点赞数量
                updateAnswer.setLikes(answer.getLikes() + 1);
                answerService.update(updateAnswer);
                result.setCode("102");
                result.setMessage(String.valueOf(answer.getLikes() + 1));
            } else {
                //取消点赞
                updateAnswer.setLikes(answer.getLikes() - 1);
                answerService.update(updateAnswer);
                result.setCode("103");
                result.setMessage(String.valueOf(answer.getLikes() - 1));
            }
        }
        return result;
    }
}
