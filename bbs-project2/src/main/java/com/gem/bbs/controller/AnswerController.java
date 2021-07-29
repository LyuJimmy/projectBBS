package com.gem.bbs.controller;

import com.gem.bbs.entity.Answer;
import com.gem.bbs.entity.Question;
import com.gem.bbs.service.AnswerService;
import com.gem.bbs.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @Author: jzhang
 * @WX: 15250420158
 * @Date: 2020/2/13 15:47
 * @Description: 回复控制器
 */
@Controller
@RequestMapping("/ans")
public class AnswerController {
    @Autowired
    private AnswerService answerService;
    @Autowired
    private QuestionService questionService;

    @RequestMapping("/save")
    public String save(Answer answer, HttpSession session) {
        answerService.save(answer,session);
        return "redirect:/ques/detail?id=" + answer.getQuestionId();
    }

    /**
     * 采纳回复
     */
    @ResponseBody
    @PostMapping("/acceptAnswer")
    public String acceptAnswer(Answer answer) {
        answer.setIsAccept("1");
        answerService.update(answer);
        //更新问题完结
        Question question = new Question();
        question.setId(answer.getQuestionId());
        question.setIsClosed("1");
        questionService.update(question);
        return "success";
    }
}
