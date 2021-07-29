package com.gem.bbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 软件工程10班 吕俊铭
 * @create 2021-06-26 21:15
 * Description:
 */
@Controller
public class IndexController {
    //访问首页
    @RequestMapping("/index")
    public String index(){
        //TODO 从数据库获取帖子的列表

        return "index";
    }
}
