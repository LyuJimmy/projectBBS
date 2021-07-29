package com.gem.bbs.service.impl;

import com.gem.bbs.entity.ActiveUser;
import com.gem.bbs.entity.Answer;
import com.gem.bbs.mapper.AnswerMapper;
import com.gem.bbs.service.AnswerService;
import com.gem.bbs.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * @Author: jzhang
 * @WX: 15250420158
 * @Date: 2020/2/13 15:29
 * @Description:
 */
@Service
public class AnswerServiceImpl implements AnswerService {
    @Autowired
    private AnswerMapper answerMapper;

    @Override
    public List<Answer> findListByQuestionId(Integer id) {
        return answerMapper.selectListByQuestionId(id);
    }

    @Override
    public void save(Answer answer,HttpSession session) {
        answer.setCreatetime(new Date());
        ActiveUser user = UserUtils.getUser();
        if (user == null) {
            answer.setUserId(0);//匿名
        } else {
            answer.setUserId(user.getId());
        }
        answerMapper.insertAnswer(answer);
    }

    @Override
    public void update(Answer answer) {
        answerMapper.update(answer);
    }

    @Override
    public Answer findOne(Integer id) {
        return answerMapper.selectOneByPrimaryKey(id);
    }
}
