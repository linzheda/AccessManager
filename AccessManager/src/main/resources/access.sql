/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50027
Source Host           : localhost:3306
Source Database       : access

Target Server Type    : MYSQL
Target Server Version : 50027
File Encoding         : 65001

Date: 2017-04-14 19:27:01
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `auth_function`
-- ----------------------------
DROP TABLE IF EXISTS `auth_function`;
CREATE TABLE `auth_function` (
  `fid` bigint(20) NOT NULL auto_increment,
  `fname` varchar(64) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `url` varchar(64) default NULL,
  `serial_num` bigint(20) NOT NULL,
  `accordion` bigint(20) NOT NULL,
  `status` varchar(10) NOT NULL default '是',
  PRIMARY KEY  (`fid`),
  UNIQUE KEY `fname` (`fname`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_function
-- ----------------------------
INSERT INTO auth_function VALUES ('1', '菜 单 项', '-1', ' ', '1', '1', '是');
INSERT INTO auth_function VALUES ('2', '学生信息', '1', ' ', '1', '2', '是');
INSERT INTO auth_function VALUES ('3', '缴费管理', '1', ' ', '2', '2', '是');
INSERT INTO auth_function VALUES ('4', '费用统计', '1', ' ', '3', '2', '是');
INSERT INTO auth_function VALUES ('5', '权限管理', '1', ' ', '4', '2', '是');
INSERT INTO auth_function VALUES ('6', '短信管理', '1', ' ', '5', '2', '是');
INSERT INTO auth_function VALUES ('7', '班级管理', '1', ' ', '6', '2', '是');
INSERT INTO auth_function VALUES ('8', '学费管理', '1', ' ', '7', '2', '是');
INSERT INTO auth_function VALUES ('9', '信息录入', '2', 'back/toRegisterForm.action', '1', '3', '是');
INSERT INTO auth_function VALUES ('10', '批量录入', '2', 'back/toBatchRegisterForm.action', '2', '3', '是');
INSERT INTO auth_function VALUES ('11', '查询与修改', '2', 'back/toModifyForm.action', '3', '3', '是');
INSERT INTO auth_function VALUES ('12', '合同金额设定', '3', 'back/toPreparePayment.action', '1', '3', '是');
INSERT INTO auth_function VALUES ('13', '缴纳学费', '3', 'back/toDoPaymentForm.action', '2', '3', '是');
INSERT INTO auth_function VALUES ('14', '缴费记录', '3', 'back/toPaymentRecords.action', '3', '3', '是');
INSERT INTO auth_function VALUES ('15', '缴费审核', '3', 'back/toIdentifyPayment.action', '4', '3', '是');
INSERT INTO auth_function VALUES ('16', '费用图表', '4', 'back/toChart.action', '1', '3', '是');
INSERT INTO auth_function VALUES ('17', '费用报表', '4', 'back/toReport.action', '2', '3', '是');
INSERT INTO auth_function VALUES ('18', 'excel报表', '4', 'back/toExcelReport.action', '3', '3', '是');
INSERT INTO auth_function VALUES ('19', '用户管理', '5', 'front/userGrid.do', '1', '3', '是');
INSERT INTO auth_function VALUES ('20', '角色管理', '5', 'list/roleGrid.do', '2', '3', '是');
INSERT INTO auth_function VALUES ('21', '菜单管理', '5', 'function/functionGrid.do', '3', '3', '是');
INSERT INTO auth_function VALUES ('22', '用户授权', '5', 'front/userGrant.do', '4', '3', '是');
INSERT INTO auth_function VALUES ('23', '定时任务管理', '6', 'back/toMessageManager.action', '1', '3', '是');
INSERT INTO auth_function VALUES ('24', '在线发送短信', '6', 'back/toSendMessageOnline.action', '2', '3', '是');
INSERT INTO auth_function VALUES ('25', '未毕业班级', '7', 'back/toCurrClassManagement.action', '1', '3', '是');
INSERT INTO auth_function VALUES ('26', '以毕业班级', '7', 'back/toOverClassManagement.action', '2', '3', '是');
INSERT INTO auth_function VALUES ('27', '版本和费用', '8', 'back/toOverClassManagement.action', '2', '3', '是');

-- ----------------------------
-- Table structure for `auth_role`
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role` (
  `rid` bigint(20) NOT NULL auto_increment,
  `rname` varchar(255) NOT NULL,
  `addTime` date NOT NULL,
  `updateTime` date default NULL,
  PRIMARY KEY  (`rid`),
  UNIQUE KEY `rname` (`rname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_role
-- ----------------------------
INSERT INTO auth_role VALUES ('1', 'admin', '2017-04-12', null);
INSERT INTO auth_role VALUES ('20', 'test', '2017-04-14', null);
INSERT INTO auth_role VALUES ('21', 'test1', '2017-04-14', null);

-- ----------------------------
-- Table structure for `auth_role_function`
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_function`;
CREATE TABLE `auth_role_function` (
  `id` bigint(20) NOT NULL auto_increment,
  `role_id` bigint(20) NOT NULL,
  `function_id` bigint(20) NOT NULL,
  `status` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `function_id` (`function_id`),
  KEY `auth_role_function_ibfk_1` (`role_id`),
  CONSTRAINT `auth_role_function_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`rid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_role_function_ibfk_2` FOREIGN KEY (`function_id`) REFERENCES `auth_function` (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_role_function
-- ----------------------------
INSERT INTO auth_role_function VALUES ('2', '1', '2', '1');
INSERT INTO auth_role_function VALUES ('3', '1', '3', '1');
INSERT INTO auth_role_function VALUES ('4', '1', '4', '1');
INSERT INTO auth_role_function VALUES ('5', '1', '5', '1');
INSERT INTO auth_role_function VALUES ('6', '1', '6', '1');
INSERT INTO auth_role_function VALUES ('7', '1', '7', '1');
INSERT INTO auth_role_function VALUES ('8', '1', '8', '1');
INSERT INTO auth_role_function VALUES ('9', '1', '9', '1');
INSERT INTO auth_role_function VALUES ('10', '1', '10', '1');
INSERT INTO auth_role_function VALUES ('11', '1', '11', '1');
INSERT INTO auth_role_function VALUES ('12', '1', '12', '1');
INSERT INTO auth_role_function VALUES ('13', '1', '13', '1');
INSERT INTO auth_role_function VALUES ('14', '1', '14', '1');
INSERT INTO auth_role_function VALUES ('15', '1', '15', '1');
INSERT INTO auth_role_function VALUES ('16', '1', '16', '1');
INSERT INTO auth_role_function VALUES ('17', '1', '17', '1');
INSERT INTO auth_role_function VALUES ('18', '1', '18', '1');
INSERT INTO auth_role_function VALUES ('19', '1', '19', '1');
INSERT INTO auth_role_function VALUES ('20', '1', '20', '1');
INSERT INTO auth_role_function VALUES ('21', '1', '21', '1');
INSERT INTO auth_role_function VALUES ('22', '1', '22', '1');
INSERT INTO auth_role_function VALUES ('23', '1', '23', '1');
INSERT INTO auth_role_function VALUES ('24', '1', '24', '1');
INSERT INTO auth_role_function VALUES ('25', '1', '25', '1');
INSERT INTO auth_role_function VALUES ('26', '1', '26', '1');
INSERT INTO auth_role_function VALUES ('27', '1', '27', '1');
INSERT INTO auth_role_function VALUES ('214', '20', '2', '1');
INSERT INTO auth_role_function VALUES ('215', '20', '9', '1');
INSERT INTO auth_role_function VALUES ('216', '20', '10', '1');
INSERT INTO auth_role_function VALUES ('217', '20', '11', '1');
INSERT INTO auth_role_function VALUES ('218', '20', '3', '1');
INSERT INTO auth_role_function VALUES ('219', '20', '12', '1');
INSERT INTO auth_role_function VALUES ('220', '20', '13', '1');
INSERT INTO auth_role_function VALUES ('221', '20', '14', '1');
INSERT INTO auth_role_function VALUES ('222', '20', '15', '1');
INSERT INTO auth_role_function VALUES ('223', '21', '2', '1');
INSERT INTO auth_role_function VALUES ('224', '21', '9', '1');
INSERT INTO auth_role_function VALUES ('225', '21', '10', '1');
INSERT INTO auth_role_function VALUES ('226', '21', '11', '1');
INSERT INTO auth_role_function VALUES ('227', '21', '3', '1');
INSERT INTO auth_role_function VALUES ('228', '21', '12', '1');
INSERT INTO auth_role_function VALUES ('229', '21', '13', '1');
INSERT INTO auth_role_function VALUES ('230', '21', '14', '1');
INSERT INTO auth_role_function VALUES ('231', '21', '15', '1');
INSERT INTO auth_role_function VALUES ('232', '21', '4', '1');
INSERT INTO auth_role_function VALUES ('233', '21', '16', '1');
INSERT INTO auth_role_function VALUES ('234', '21', '17', '1');
INSERT INTO auth_role_function VALUES ('235', '21', '18', '1');

-- ----------------------------
-- Table structure for `auth_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_role`;
CREATE TABLE `auth_user_role` (
  `id` bigint(20) NOT NULL auto_increment,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`)
  
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_role
-- ----------------------------
INSERT INTO auth_user_role VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for `systemuser`
-- ----------------------------
DROP TABLE IF EXISTS `systemuser`;
CREATE TABLE `systemuser` (
  `id` int(10) NOT NULL auto_increment,
  `userName` varchar(20) NOT NULL,
  `password` varchar(64) NOT NULL default 'accpteacher',
  `authorities` varchar(20) NOT NULL,
  `remark` varchar(255) default NULL,
  `registerTime` date default NULL,
  `updateTime` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systemuser
-- ----------------------------
INSERT INTO systemuser VALUES ('1', 'admin', 'a', '1', '教员', '2017-04-07', null);
INSERT INTO systemuser VALUES ('2', '周海军', '2F34C1F0F40C06B0314EEFA9924E5532', '1', '教员', null, null);
INSERT INTO systemuser VALUES ('3', '刘源', '25D55AD283AA400AF464C76D713C07AD', '1', '教员', null, null);
INSERT INTO systemuser VALUES ('6', '姜平', '3DBE00A167653A1AAEE01D93E77E730E', '1', '教员', null, null);
INSERT INTO systemuser VALUES ('8', 'sys', '3DBE00A167653A1AAEE01D93E77E730E', '2', '管理员', null, null);
INSERT INTO systemuser VALUES ('12', '黄初云', '3DBE00A167653A1AAEE01D93E77E730E', '1', '教员', null, null);
INSERT INTO systemuser VALUES ('13', '杨婷', 'D7A46BEFE1BC5A07C15DBB426B951517', '1', '教员', null, null);
INSERT INTO systemuser VALUES ('14', 'wyf', '3DBE00A167653A1AAEE01D93E77E730E', '1', '教员', null, null);
INSERT INTO systemuser VALUES ('15', 'gf', '3DBE00A167653A1AAEE01D93E77E730E', '1', '教员', null, null);
INSERT INTO systemuser VALUES ('16', 'navy', '2F34C1F0F40C06B0314EEFA9924E5532', '2', '管理员', null, null);
INSERT INTO systemuser VALUES ('18', 'yc', '0CC175B9C0F1B6A831C399E269772661', '1', '教员', null, null);
INSERT INTO systemuser VALUES ('19', '吴晓', '25D55AD283AA400AF464C76D713C07AD', '1', '教员', null, null);
INSERT INTO systemuser VALUES ('20', 'fpc', '2F34C1F0F40C06B0314EEFA9924E5532', '1', '教员', null, null);
INSERT INTO systemuser VALUES ('21', 'lydia', 'D7A46BEFE1BC5A07C15DBB426B951517', '1', '教员', null, null);
INSERT INTO systemuser VALUES ('23', '张三', '0CC175B9C0F1B6A831C399E269772661', '1', '教员', null, null);
INSERT INTO systemuser VALUES ('24', '罗路', '46181E122AB05A316186C7EDB75BA1A3', '1', '教员', null, null);
INSERT INTO systemuser VALUES ('25', '张影', '3DBE00A167653A1AAEE01D93E77E730E', '2', '管理员', null, null);
INSERT INTO systemuser VALUES ('27', 'test', 'a', '1', null, '2017-04-14', null);

alter table auth_user_role add constraint 外键名 foreign key(需加外键表的字段名) referencnes 关联表名(关联字段名);

