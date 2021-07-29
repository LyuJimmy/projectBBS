package com.gem.bbs.controller;

import com.gem.bbs.entity.Question;
import com.gem.bbs.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @Author: jzhang
 * @WX: 15250420158
 * @Date: 2020/2/12 15:47
 * @Description:
 */
@Controller
public class IndexController {
    @Autowired
    private QuestionService questionService;

    //访问首页
    @RequestMapping("/index")
    public String index(String title, String page, Model model) {
        //当前页
        int currentPage = 1;
        int pageCount = 20;
        //获取用户提交数据
        if (title == null) {
            title = "";
        }
        if(page != null) {
            currentPage = Integer.valueOf(page);
        }

        List<Question> list = questionService.findAll(currentPage,pageCount,title);
        int totalPage = questionService.getTotalPage(pageCount,title);

        //将数据包装到request对象中
        model.addAttribute("questionList", list);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("title", title);
        return "index";
    }
}
