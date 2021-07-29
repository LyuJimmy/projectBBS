package com.gem.bbs.controller;

import com.gem.bbs.entity.Collect;
import com.gem.bbs.service.CollectService;
import com.gem.bbs.vo.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author 蓝莲花
 * @version 1.0.0
 * @ClassName CollectController.java
 * @Description TODO
 * @createTime 2020年03月24日 14:10:00
 */
@Controller
@RequestMapping("/collect")
public class CollectController {
    @Autowired
    private CollectService collectService;

    /**
     * 收藏
     */
    @RequestMapping("save")
    public @ResponseBody ResponseResult save(Collect collect) {
        String flag = collectService.save(collect);
        ResponseResult result = new ResponseResult();
        result.setCode(flag);
        return result;
    }
}
