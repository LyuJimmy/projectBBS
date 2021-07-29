/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50722
Source Host           : 10.40.5.1:3306
Source Database       : bbs

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2020-03-20 11:21:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `question_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_accept` char(1) DEFAULT '0' COMMENT '是否采纳',
  `likes` int(11) DEFAULT '0' COMMENT '点赞数',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES ('1', '不知道啊', '2', '1', '', null, null);
INSERT INTO `answer` VALUES ('2', 'ok', '2', '0', null, null, null);
INSERT INTO `answer` VALUES ('3', '很好', '2', '0', '0', '0', '2020-02-13 16:06:02');
INSERT INTO `answer` VALUES ('4', '未知', '4', '0', '0', '0', '2020-02-13 16:09:21');
INSERT INTO `answer` VALUES ('5', '123123', '4', '0', '0', '0', '2020-02-13 16:10:11');
INSERT INTO `answer` VALUES ('6', '可能在20号左右', '4', '0', '0', '0', '2020-02-13 16:11:44');
INSERT INTO `answer` VALUES ('7', '333', '2', '1', '0', '0', '2020-02-13 16:14:26');
INSERT INTO `answer` VALUES ('8', '', '2', '1', '0', '0', '2020-02-13 16:15:26');

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection
-- ----------------------------

-- ----------------------------
-- Table structure for likes
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of likes
-- ----------------------------

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `coin` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `is_up` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', '11', '111', '1', null, null, null);
INSERT INTO `question` VALUES ('2', 'Layui 首个版本千呼万唤，终于滚出来了', '<h2 class=\"fly-tip\" style=\"margin:0px;padding:0px;-webkit-tap-highlight-color:rgba(0, 0, 0, 0);font-size:0px;font-weight:400;position:relative;line-height:26px;font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif;\"><a href=\"file:///C:/Users/gem-inno/Desktop/bbs/jie/detail.html\" style=\"text-decoration-line:none;color:#009e94;outline:0px;display:inline-block;vertical-align:top;max-width:86%;margin-right:10px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;font-size:16px;\">Layui 首个版本千呼万唤，终于滚出来了</a><a href=\"file:///C:/Users/gem-inno/Desktop/bbs/jie/detail.html\" style=\"text-decoration-line:none;color:#009e94;outline:0px;display:inline-block;vertical-align:top;max-width:86%;margin-right:10px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;font-size:16px;\">Layui 首个版本千呼万唤，终于滚出来了</a></h2>\r\n', '10', null, null, null);
INSERT INTO `question` VALUES ('3', '疫情何时结束？', '疫情何时结束疫情何时结束', '1', '1', '2020-02-13 11:15:21', '0');
INSERT INTO `question` VALUES ('4', '武汉疫情何时结束？', '<div style=\"text-align:center;\"><span style=\"font-size:24px;\">武汉疫情</span></div>\r\n武汉疫情何时结束？武汉疫情何时结束？<br />\r\n<span style=\"background-color:#fe2419;\">武汉疫情何时结束？武汉疫情何时结束？武汉疫情何时结束？<br />\r\n<br />\r\n<br />\r\n</span>', '3', '1', '2020-02-13 11:21:10', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(50) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'jack', '749e66ea9cce8fdb30dd478360ce18f2', 'bbs', '朱小明', '明明', null, '2020-02-12 14:31:33');
