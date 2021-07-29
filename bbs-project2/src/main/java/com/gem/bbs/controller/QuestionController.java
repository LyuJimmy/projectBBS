package com.gem.bbs.controller;

import com.gem.bbs.entity.Answer;
import com.gem.bbs.entity.Question;
import com.gem.bbs.service.AnswerService;
import com.gem.bbs.service.QuestionService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author: jzhang
 * @WX: 15250420158
 * @Date: 2020/2/13 10:48
 * @Description: 问题控制器
 */
@Controller
@RequestMapping("/ques")
public class QuestionController {

    @Autowired
    private QuestionService questionService;
    @Autowired
    private AnswerService answerService;

    @RequestMapping("/form")
    @RequiresPermissions("ques:create")
    public String form() {
        return "questionForm";
    }

    @RequestMapping("/save")
    @RequiresPermissions("ques:create")
    public String save(Question question) {
        questionService.save(question);
        return "redirect:/index";
    }

    /**
     * 获取问题详情内容
     */
    @RequestMapping("/detail")
    public String detail(Integer id, Model model) {
        Question question = questionService.selectOne(id);
        //获取该问题的回复
        List<Answer> answerList = answerService.findListByQuestionId(id);
        model.addAttribute("question",question);
        model.addAttribute("answerList",answerList);
        return "questionDetail";
    }

    /**
     * 置顶
     */
    @ResponseBody
    @RequestMapping("/toTop")
    public String toTop(Question question) {
        questionService.update(question);
        return "success";
    }

    /**
     * 置顶
     */
    @ResponseBody
    @DeleteMapping("/del/{id}")
    public String del(@PathVariable("id") Integer id) {
        questionService.del(id);
        return "success";
    }
}
