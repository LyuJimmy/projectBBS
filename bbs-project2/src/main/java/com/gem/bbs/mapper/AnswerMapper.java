package com.gem.bbs.mapper;

import com.gem.bbs.entity.Answer;

import java.util.List;

/**
 * @Author: jzhang
 * @WX: 15250420158
 * @Date: 2020/2/13 15:25
 * @Description: 回复接口
 */
public interface AnswerMapper {
    /**
     * 根据问题主键获取回复记录
     */
    List<Answer> selectListByQuestionId(Integer id);

    /**
     * 保存回复
     */
    void insertAnswer(Answer answer);

    /**
     * 根据问题id删除所有回复
     */
    void deleteByQuestionId(Integer id);

    /**
     * 更新问题
     */
    void update(Answer answer);

    /**
     * 根据主键查询
     */
    Answer selectOneByPrimaryKey(Integer id);
}
