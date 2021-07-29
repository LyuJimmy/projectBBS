package com.gem.bbs.service.impl;

import com.gem.bbs.entity.Question;
import com.gem.bbs.entity.User;
import com.gem.bbs.mapper.AnswerMapper;
import com.gem.bbs.mapper.QuestionMapper;
import com.gem.bbs.service.AnswerService;
import com.gem.bbs.service.QuestionService;
import com.gem.bbs.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * @Author: jzhang
 * @WX: 15250420158
 * @Date: 2020/2/13 10:47
 * @Description:
 */
@Service
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    private QuestionMapper questionMapper;
    @Autowired
    private AnswerMapper answerMapper;

    @Override
    public Question selectOne(Integer id) {
        return questionMapper.selectOneByPrimaryKey(id);
    }

    @Override
    public void save(Question question) {
        question.setCreatetime(new Date());
        question.setUserId(UserUtils.getUser().getId());//记录当前登录用户信息
        questionMapper.insertQuestion(question);
    }

    @Override
    public Integer getTotalPage(Integer pageCount, String title) {
        if (title == null) title = "";
        Integer total = questionMapper.getTotal(title);
        return (total - 1) / pageCount + 1;
    }

    @Override
    public List<Question> findAll(Integer currentPage, Integer pageCount, String title) {
        return questionMapper.selectAll((currentPage - 1) * pageCount,pageCount,title);
    }

    @Override
    public List<Question> findList(Question question) {
        return questionMapper.selectList(question);
    }

    @Override
    public void update(Question question) {
        questionMapper.update(question);
    }

    @Override
    public void del(Integer id) {
        //同时删除所有的回复
        answerMapper.deleteByQuestionId(id);
        questionMapper.delete(id);
    }
}
