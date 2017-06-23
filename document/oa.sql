/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-06-23 10:44:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_check
-- ----------------------------
DROP TABLE IF EXISTS `t_check`;
CREATE TABLE `t_check` (
  `checkid` varchar(32) NOT NULL COMMENT '巡查编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `checktime` datetime DEFAULT NULL COMMENT '巡查时间',
  `weekday` varchar(10) DEFAULT NULL COMMENT '周几',
  `gradeid` varchar(32) DEFAULT NULL COMMENT '班级编号',
  `roomid` varchar(32) DEFAULT NULL COMMENT '宿舍编号',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`checkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_check
-- ----------------------------

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `courseid` varchar(32) NOT NULL COMMENT '课程编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `totalhour` int(11) DEFAULT NULL COMMENT '总课时数',
  `term` int(11) DEFAULT NULL COMMENT '学期',
  `courseorder` int(11) DEFAULT NULL COMMENT '课程顺序',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES ('297e68eb5cd27781015cd290a4f70000', 'java', '11', '11', '1', '2', '1');

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `depid` varchar(32) NOT NULL COMMENT '部门编号',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `empid` varchar(32) DEFAULT NULL COMMENT '负责人编号',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认可用',
  PRIMARY KEY (`depid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES ('40288092594b14ac01594b1a673a0000', '财务部', '4028da32593fe63101594019bf4c0000', '我是管钱的', '1');
INSERT INTO `t_dept` VALUES ('402880925972a529015972dacc850000', '行政部', '402880925966fdfd01596706af750000', '我是有很大权限的', '1');
INSERT INTO `t_dept` VALUES ('4028809259a64a780159a6f3468a0003', '学术部', '4028dac159aca1a20159acb5f6840001', '我是教书的', '1');
INSERT INTO `t_dept` VALUES ('4028dac159aca1a20159acb9b54a0002', '招生部', '4028dac159aca1a20159acb5f6840001', '我是招生的', '1');
INSERT INTO `t_dept` VALUES ('4028dac159aca1a20159acbab7e70003', '后勤部', '4028da32593fe63101594019bf4c0000', '我是后勤的', '1');

-- ----------------------------
-- Table structure for t_duty
-- ----------------------------
DROP TABLE IF EXISTS `t_duty`;
CREATE TABLE `t_duty` (
  `dutyid` varchar(32) NOT NULL COMMENT '值班编号',
  `weekday` varchar(10) DEFAULT NULL COMMENT '周几',
  `empid1` varchar(32) DEFAULT NULL COMMENT '员工1',
  `add1` varchar(20) DEFAULT NULL COMMENT '地点1',
  `empid2` varchar(32) DEFAULT NULL,
  `add2` varchar(32) DEFAULT NULL,
  `empid3` varchar(32) DEFAULT NULL,
  `add3` varchar(20) DEFAULT NULL,
  `empid4` varchar(32) DEFAULT NULL,
  `add4` varchar(20) DEFAULT NULL,
  `empid5` varchar(32) DEFAULT NULL,
  `add5` varchar(20) DEFAULT NULL,
  `empid6` varchar(32) DEFAULT NULL,
  `add6` varchar(20) DEFAULT NULL,
  `empid7` varchar(32) DEFAULT NULL,
  `add7` varchar(20) DEFAULT NULL,
  `empid8` varchar(32) DEFAULT NULL,
  `add8` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`dutyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_duty
-- ----------------------------
INSERT INTO `t_duty` VALUES ('402881eb59acddc80159ace33eb10000', '星期一', '4028809259a64a780159a6ff599b0005', '二楼', '4028809259a64a780159a662bfce0000', '三楼', '4028da32593fe63101594019bf4c0000', '四楼', '4028809259a64a780159a66ce09e0001', '五楼', '4028dac159aca1a20159acc5d1eb0007', '六楼', '4028dac159aca1a20159acc16ed40005', '七楼', '4028dac159aca1a20159acb5f6840001', '八楼', '4028dac159aca1a20159acbe77da0004', '二楼');
INSERT INTO `t_duty` VALUES ('402881eb59acddc80159ace33eb10001', '星期二', '4028809259a64a780159a6ff599b0005', '十楼', '4028809259a64a780159a662bfce0000', '三楼', '4028da32593fe63101594019bf4c0000', '四楼', '4028809259a64a780159a66ce09e0001', '五楼', '4028dac159aca1a20159acc5d1eb0007', '六楼', '4028dac159aca1a20159acc16ed40005', '七楼', '4028dac159aca1a20159acb5f6840001', '八楼', '4028dac159aca1a20159acbe77da0004', '九楼');
INSERT INTO `t_duty` VALUES ('402881eb59acddc80159ace33eb10002', '星期三', '4028809259a64a780159a6ff599b0005', '二楼', '4028809259a64a780159a662bfce0000', '三楼', '4028da32593fe63101594019bf4c0000', '四楼', '4028809259a64a780159a66ce09e0001', '五楼', '4028dac159aca1a20159acc5d1eb0007', '六楼', '4028dac159aca1a20159acc16ed40005', '七楼', '4028dac159aca1a20159acb5f6840001', '八楼', '4028dac159aca1a20159acbe77da0004', '九楼');
INSERT INTO `t_duty` VALUES ('402881eb59acddc80159ace33eb10003', '星期四', '4028809259a64a780159a6ff599b0005', '二楼', '4028809259a64a780159a662bfce0000', '三楼', '4028da32593fe63101594019bf4c0000', '四楼', '4028809259a64a780159a66ce09e0001', '五楼', '4028dac159aca1a20159acc5d1eb0007', '六楼', '4028dac159aca1a20159acc16ed40005', '七楼', '4028dac159aca1a20159acb5f6840001', '八楼', '4028dac159aca1a20159acbe77da0004', '九楼');
INSERT INTO `t_duty` VALUES ('402881eb59acddc80159ace33eb10004', '星期五', '4028809259a64a780159a6ff599b0005', '二楼', '4028809259a64a780159a662bfce0000', '三楼', '4028da32593fe63101594019bf4c0000', '四楼', '4028809259a64a780159a66ce09e0001', '五楼', '4028dac159aca1a20159acc5d1eb0007', '六楼', '4028dac159aca1a20159acc16ed40005', '七楼', '4028dac159aca1a20159acb5f6840001', '八楼', '4028dac159aca1a20159acbe77da0004', '九楼');
INSERT INTO `t_duty` VALUES ('402881eb59acddc80159ace33eb10007', '星期日', '4028809259a64a780159a6ff599b0005', '二楼', '4028809259a64a780159a662bfce0000', '三楼', '4028da32593fe63101594019bf4c0000', '四楼', '4028809259a64a780159a66ce09e0001', '五楼', '4028dac159aca1a20159acc5d1eb0007', '六楼', '4028dac159aca1a20159acc16ed40005', '七楼', '4028dac159aca1a20159acb5f6840001', '八楼', '4028dac159aca1a20159acbe77da0004', '九楼');

-- ----------------------------
-- Table structure for t_edu
-- ----------------------------
DROP TABLE IF EXISTS `t_edu`;
CREATE TABLE `t_edu` (
  `eduid` varchar(32) NOT NULL COMMENT '教育经历编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号，来源于员工表',
  `school` varchar(50) DEFAULT NULL COMMENT '毕业学校',
  `startday` datetime DEFAULT NULL COMMENT '开始时间',
  `endday` datetime DEFAULT NULL COMMENT '结束时间',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`eduid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_edu
-- ----------------------------
INSERT INTO `t_edu` VALUES ('297e68eb5cd27781015cd2d500fc0005', '402880925966fdfd01596706af750000', '宏图', '2017-06-23 10:42:59', '2017-06-13 14:43:01', '1111');
INSERT INTO `t_edu` VALUES ('297ee7c1594d0d8b01594d1120bf0001', '4028da32593fe63101594019bf4c0000', 'r4fe', '2016-12-16 00:00:00', '2016-12-20 00:00:00', 'erer');
INSERT INTO `t_edu` VALUES ('4028da32596209fb0159620b218c0000', '4028da32593fe63101594019bf4c0000', 'weef', '2017-01-13 00:00:00', '2017-01-19 00:00:00', 'wewf');

-- ----------------------------
-- Table structure for t_emp
-- ----------------------------
DROP TABLE IF EXISTS `t_emp`;
CREATE TABLE `t_emp` (
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `depid` varchar(32) NOT NULL COMMENT '部门编号，来源于部门表',
  `roleid` varchar(32) NOT NULL COMMENT '角色编号',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `pwd` varchar(50) NOT NULL COMMENT '密码',
  `idcard` varchar(18) NOT NULL COMMENT '身份证号',
  `nation` varchar(10) DEFAULT NULL COMMENT '籍贯',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `fingerno` varchar(10) NOT NULL COMMENT '指纹编号',
  `birthday` datetime NOT NULL COMMENT '出生日期',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `qq` varchar(15) DEFAULT NULL COMMENT 'qq号',
  `wechat` varchar(50) DEFAULT NULL COMMENT '微信号',
  `address` varchar(255) DEFAULT NULL COMMENT '家庭地址',
  `married` varchar(4) DEFAULT NULL COMMENT '是否结婚',
  `contactname` varchar(20) DEFAULT NULL COMMENT '联系人姓名',
  `contactphone` varchar(11) DEFAULT NULL COMMENT '联系人手机号',
  `college` varchar(20) DEFAULT NULL COMMENT '毕业院校',
  `major` varchar(20) DEFAULT NULL COMMENT '专业',
  `eduback` varchar(5) DEFAULT NULL COMMENT '学历',
  `bankname` varchar(50) DEFAULT NULL COMMENT '开户行名称',
  `accountname` varchar(20) DEFAULT NULL COMMENT '银行卡姓名',
  `accountno` varchar(30) DEFAULT NULL COMMENT '银行账号',
  `alipay` varchar(100) DEFAULT NULL COMMENT '支付宝账号',
  `hireday` datetime NOT NULL COMMENT '入职时间',
  `resignday` datetime DEFAULT NULL COMMENT '离职时间',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态，默认可用',
  PRIMARY KEY (`empid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_emp
-- ----------------------------
INSERT INTO `t_emp` VALUES ('402880925966fdfd01596706af750000', '402880925972a529015972dacc850000', '40288092593a25c801593a478d080000', '王泽', '4QrcOUm6Wau+VuBX8g+IPg==', '304245254222343433', '汉族', 'boy', 'rergrerer', '2017-01-24 00:00:00', 'lb@qq.com', '15079762838', '861543705', 'errg5452', 'aaaaa', 'yes', 'erge', '15079762838', 'waeffwe', '教师', '高中', 'fwefew', 'wef', 'ewfew', 'wefew', '2017-01-23 00:00:00', '2017-01-24 00:00:00', '1');
INSERT INTO `t_emp` VALUES ('4028809259a64a780159a662bfce0000', '4028dac159aca1a20159acbab7e70003', 'd886cd061fdf402887bc872f135d617f', '老徐', '4QrcOUm6Wau+VuBX8g+IPg==', '360735199906152114', '江西赣州', 'girl', '007', '2017-01-17 22:08:44', 'zsls@qq.com', '14879792864', '765638492', 'uim78995', '江西赣州石城', 'yes', '老徐', '14879792864', '江西赣州石城中学', '计算机', '专科', '老徐', '老徐', '6782462255632233', '14879792864', '2017-01-17 00:00:00', null, '1');
INSERT INTO `t_emp` VALUES ('4028809259a64a780159a6ff599b0005', '4028dac159aca1a20159acbab7e70003', 'd886cd061fdf402887bc872f135d617f', '老徐', '4QrcOUm6Wau+VuBX8g+IPg==', '360735199906152114', '江西赣州', 'girl', '007', '2017-01-17 22:08:44', '12345@qq.com', '14879792234', '765638492', 'uim78995', '江西赣州石城', 'yes', '老小', '14879792864', '江西赣州石城中学', '计算机', '专科', '老徐', '老徐', '6782462255612233', '14879792864', '2017-01-17 00:00:00', '2017-06-23 09:25:15', '1');
INSERT INTO `t_emp` VALUES ('4028da32593fe63101594019bf4c0000', '4028dac159aca1a20159acbab7e70003', 'd886cd061fdf402887bc872f135d617f', '老徐', '4QrcOUm6Wau+VuBX8g+IPg==', '360735199906152114', '江西赣州', 'girl', '007', '2017-01-17 22:08:44', '123@qq.com', '14879792234', '765638492', 'uim78995', '江西赣州石城', 'yes', '老王', '14879792864', '江西赣州石城中学', '计算机', '专科', '老徐', '老徐', '6782462255612233', '14879792864', '2017-01-17 00:00:00', '2017-06-23 09:25:15', '1');
INSERT INTO `t_emp` VALUES ('4028dac159aca1a20159acc16ed40005', '4028dac159aca1a20159acbab7e70003', 'd886cd061fdf402887bc872f135d617f', '老徐', '4QrcOUm6Wau+VuBX8g+IPg==', '360735199906152114', '江西赣州', 'girl', '007', '2017-01-17 22:08:44', 'zsls11@qq.com', '14879792432', '765638492', 'uim78995', '江西赣州石城', 'yes', '老张', '14879792864', '江西赣州石城中学', '计算机', '专科', '老徐', '老徐', '6782462255612233', '14879792864', '2017-01-17 00:00:00', '2017-06-23 09:25:15', '1');

-- ----------------------------
-- Table structure for t_empappeal
-- ----------------------------
DROP TABLE IF EXISTS `t_empappeal`;
CREATE TABLE `t_empappeal` (
  `appealid` varchar(32) NOT NULL COMMENT '请假编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `appealday` datetime DEFAULT NULL COMMENT '提交时间',
  `des` varchar(255) DEFAULT NULL COMMENT '请假描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  `firstlevel` int(11) DEFAULT '0' COMMENT '直属上司审核，默认为不通过',
  `secondlevel` int(11) DEFAULT '0' COMMENT '老板审核，默认为不通过',
  `pass` int(11) DEFAULT '0' COMMENT '通过状态，默认为不通过',
  PRIMARY KEY (`appealid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_empappeal
-- ----------------------------

-- ----------------------------
-- Table structure for t_empchecking
-- ----------------------------
DROP TABLE IF EXISTS `t_empchecking`;
CREATE TABLE `t_empchecking` (
  `checkingid` varchar(32) NOT NULL COMMENT '考勤编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `checkingday` datetime DEFAULT NULL COMMENT '打卡日期',
  `time1` datetime DEFAULT NULL COMMENT '时间点1',
  `time2` datetime DEFAULT NULL,
  `time3` datetime DEFAULT NULL,
  `time4` datetime DEFAULT NULL,
  `time5` datetime DEFAULT NULL,
  `time6` datetime DEFAULT NULL,
  `time7` datetime DEFAULT NULL,
  `time8` datetime DEFAULT NULL,
  PRIMARY KEY (`checkingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_empchecking
-- ----------------------------
INSERT INTO `t_empchecking` VALUES ('402881ef59a0d5140159a1d6e4c10001', '4028da32593fe63101594019bf4c0000', '2017-01-01 20:53:11', '2017-01-15 08:53:18', '2017-01-16 20:53:21', '2017-01-17 20:53:26', '2017-01-19 20:53:29', '2017-01-15 20:53:33', '2017-01-15 20:54:02', '2017-01-15 20:54:05', '2017-01-15 20:54:07');

-- ----------------------------
-- Table structure for t_empcheckinginfo
-- ----------------------------
DROP TABLE IF EXISTS `t_empcheckinginfo`;
CREATE TABLE `t_empcheckinginfo` (
  `checkinginfoid` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `checkingtime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`checkinginfoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_empcheckinginfo
-- ----------------------------
INSERT INTO `t_empcheckinginfo` VALUES ('402881ef59a0d5140159a1d6e4c100', '早上上班', '08:00');
INSERT INTO `t_empcheckinginfo` VALUES ('402881ef59a0d5140159a1d6e4c1000', '早上下班', '12:00');
INSERT INTO `t_empcheckinginfo` VALUES ('402881ef59a0d5140159a1d6e4c10001', '中午上班', '14:00');
INSERT INTO `t_empcheckinginfo` VALUES ('402881ef59a0d5140159a1d6e4c1000a', '下午上班', '18:00');
INSERT INTO `t_empcheckinginfo` VALUES ('402881ef59a0d5140159a1d6e4c1000f', '中午下班', '16:00');
INSERT INTO `t_empcheckinginfo` VALUES ('402881ef59a0d5140159a1d6e4c1000s', '下午下班', '21:00');
INSERT INTO `t_empcheckinginfo` VALUES ('402881ef59a0d5140159a1d6e4c100d', '晚上下班', '23:00');
INSERT INTO `t_empcheckinginfo` VALUES ('40288sef59a0d5140159a1d6e4c1000f', '晚上上班', '22:00');

-- ----------------------------
-- Table structure for t_empfeedback
-- ----------------------------
DROP TABLE IF EXISTS `t_empfeedback`;
CREATE TABLE `t_empfeedback` (
  `feedbackid` varchar(32) NOT NULL COMMENT '反馈编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `feedbackday` datetime DEFAULT NULL COMMENT '反馈时间',
  `des` varchar(500) DEFAULT NULL COMMENT '反馈详情',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_empfeedback
-- ----------------------------
INSERT INTO `t_empfeedback` VALUES ('4028da325976e23e015976e60f620000', '4028da32593fe63101594019bf4c0000', '2017-01-07 00:00:00', '啦啦啦', '1');
INSERT INTO `t_empfeedback` VALUES ('4028dac159aca1a20159aca4be1d0000', '402880925966fdfd01596706af750000', '2017-01-17 21:36:31', '复合弓', '1');

-- ----------------------------
-- Table structure for t_empleave
-- ----------------------------
DROP TABLE IF EXISTS `t_empleave`;
CREATE TABLE `t_empleave` (
  `leaveid` varchar(32) NOT NULL COMMENT '请假编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `starttime` datetime DEFAULT NULL COMMENT '开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '结束时间',
  `leaveday` datetime DEFAULT NULL COMMENT '提交时间',
  `des` varchar(255) DEFAULT NULL COMMENT '请假描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  `firstlevel` int(11) DEFAULT '0' COMMENT '直属上司审核，默认为不通过',
  `secondlevel` int(11) DEFAULT '0' COMMENT '老板审核，默认为不通过',
  `pass` int(11) DEFAULT '0' COMMENT '通过状态，默认为不通过',
  PRIMARY KEY (`leaveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_empleave
-- ----------------------------
INSERT INTO `t_empleave` VALUES ('402880925997a787015997a9cc650000', '4028da32593fe63101594019bf4c0000', '2017-01-13 19:49:50', '2017-01-20 19:49:52', '2017-01-13 19:50:05', '我要回家', '1', '2', '2', '2');
INSERT INTO `t_empleave` VALUES ('402880925997a787015997b01f730001', '4028809259710fd1015971284cc40000', '2017-01-13 19:56:49', '2017-01-18 19:56:52', '2017-01-13 19:50:05', 'kkk', '1', '2', '2', '2');
INSERT INTO `t_empleave` VALUES ('402881eb59ad3bb40159ad4161370001', '4028809259a64a780159a662bfce0000', '2017-01-18 00:27:28', '2017-01-23 00:27:31', '2017-01-18 00:27:40', '我要回家', '1', '2', '2', '2');
INSERT INTO `t_empleave` VALUES ('402881eb59ad3bb40159ad42b4080002', '4028da32593fe63101594019bf4c0000', '2017-01-17 00:28:57', '2017-01-20 00:29:00', '2017-01-18 00:27:40', '日', '1', '2', '2', '2');
INSERT INTO `t_empleave` VALUES ('ff80808159af2db50159af4f802e0008', '4028809259a64a780159a662bfce0000', '2017-01-18 10:02:04', '2017-01-20 10:02:07', '2017-01-18 09:58:31', '我要请假回家', '1', '2', '2', '2');
INSERT INTO `t_empleave` VALUES ('ff80808159af2db50159af527a0d0009', '4028809259a64a780159a662bfce0000', '2017-01-18 10:05:15', '2017-01-22 10:05:18', '2017-01-18 09:58:31', '我要回家', '1', '2', '2', '2');

-- ----------------------------
-- Table structure for t_exp
-- ----------------------------
DROP TABLE IF EXISTS `t_exp`;
CREATE TABLE `t_exp` (
  `expid` varchar(32) NOT NULL COMMENT '工作经历编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号，来源于员工表',
  `company` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `startday` datetime DEFAULT NULL COMMENT '入职时间',
  `endday` datetime DEFAULT NULL COMMENT '离职时间',
  `jobtitle` varchar(50) DEFAULT NULL COMMENT '职位',
  `des` varchar(500) DEFAULT NULL COMMENT '工作描述',
  PRIMARY KEY (`expid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_exp
-- ----------------------------
INSERT INTO `t_exp` VALUES ('297e68eb5cd27781015cd2d49fcd0004', '402880925966fdfd01596706af750000', 'HONGTU', '2017-06-12 10:42:28', '2017-06-23 10:42:36', 'java开发工程师', '红红火火');
INSERT INTO `t_exp` VALUES ('297ee7c1594d0d8b01594d116b010002', '4028da32593fe63101594019bf4c0000', 'er', '2016-12-23 00:00:00', '2016-12-16 00:00:00', 'erg', 'ggr');
INSERT INTO `t_exp` VALUES ('402881e85964f6f4015964fc3cfc0000', '4028da32593fe63101594019bf4c0000', '啦啦啦', '2017-01-25 00:00:00', '2017-01-26 00:00:00', '额我发', '微风');
INSERT INTO `t_exp` VALUES ('4028da3259624e200159625225520000', '4028da32593fe63101594019bf4c0000', 'wef', '2017-01-26 00:00:00', '2017-01-19 00:00:00', 'weef', 'wfe');
INSERT INTO `t_exp` VALUES ('4028da3259624e2001596252b9940001', '4028da32593fe63101594019bf4c0000', 'wef', '2017-01-23 00:00:00', '2017-01-12 00:00:00', 'wef', 'wfe');

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `goodsid` varchar(32) NOT NULL COMMENT '物品编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `quantitycount` int(11) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT '总数',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `unitprice` double DEFAULT NULL COMMENT '单价',
  `buyday` datetime DEFAULT NULL COMMENT '购买时间',
  `goodstypeid` varchar(32) NOT NULL COMMENT '物品类型编号，来源于物品类型表',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态，默认可用',
  PRIMARY KEY (`goodsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('40288092598c729601598c8e6f2c0006', '羽毛球', '94', '94', '这是羽毛球.', '12', '2017-01-11 00:00:00', '4028da32595ea0b601595eda70eb0000', '1');
INSERT INTO `t_goods` VALUES ('402881eb59acddc80159ace0150a0000', '兵乓球', '40', '40', '这是兵乓球啊', '20', '2017-01-17 00:00:00', '4028da32595ea0b601595eda70eb0000', '1');
INSERT INTO `t_goods` VALUES ('402881ed5992f66c01599309141f0007', '篮球', '68', '68', '这是篮球', '12', '2017-01-12 00:00:00', '40288092598c729601598c8c4b980004', '1');

-- ----------------------------
-- Table structure for t_goodsapp
-- ----------------------------
DROP TABLE IF EXISTS `t_goodsapp`;
CREATE TABLE `t_goodsapp` (
  `goodsappid` varchar(32) NOT NULL COMMENT '物品申购编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `appday` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '申购时间',
  `goodsname` varchar(50) DEFAULT NULL COMMENT '申购的物品名称',
  `unitprice` double(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL COMMENT '申购物品的数量',
  `des` varchar(500) DEFAULT NULL COMMENT '申购原因',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认可用',
  `appstatus` int(11) DEFAULT NULL COMMENT '申购状态，成功则为1，失败则为0',
  PRIMARY KEY (`goodsappid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goodsapp
-- ----------------------------
INSERT INTO `t_goodsapp` VALUES ('402880925995a38c015995aa443b0001', '402880925966fdfd01596706af750000', '2017-01-13 10:25:33', '羽毛球', '20.00', '20', '搞事情', '1', '2');
INSERT INTO `t_goodsapp` VALUES ('402880925995d3c2015995d5894c0000', '402880925966fdfd01596706af750000', '2017-01-13 11:18:37', 'iiiii', '10.00', '10', '高冬冬', '1', '2');
INSERT INTO `t_goodsapp` VALUES ('402880925995d3c2015995d81a850001', '402880925966fdfd01596706af750000', '2017-01-13 11:18:37', '羽毛球', '12.00', '12', '额安抚', '1', '2');
INSERT INTO `t_goodsapp` VALUES ('402880925995d3c2015995d920ac0002', '402880925966fdfd01596706af750000', '2017-01-13 11:18:37', 'iiiii', '12.00', '12', '违反', '1', '2');
INSERT INTO `t_goodsapp` VALUES ('402880925995d3c2015995db4b650003', '402880925966fdfd01596706af750000', '2017-01-13 11:18:37', '羽毛球', '12.00', '12', '二分法', '1', '2');
INSERT INTO `t_goodsapp` VALUES ('402880925995eac3015995f1e1d40000', '402880925966fdfd01596706af750000', '2017-01-13 11:49:34', '羽毛球', '12.00', '12', '说得对', '1', '2');
INSERT INTO `t_goodsapp` VALUES ('402880925995eac30159966bd8f50001', '402880925966fdfd01596706af750000', '2017-01-13 11:49:34', '羽毛球', '20.00', '20', '不足', '1', '2');
INSERT INTO `t_goodsapp` VALUES ('40288092599671a80159969b517f0000', '402880925966fdfd01596706af750000', '2017-01-13 14:54:38', '羽毛球', '12.00', '12', 'jjkkkkk', '1', '2');
INSERT INTO `t_goodsapp` VALUES ('40288092599671a8015996a0d7700001', '402880925966fdfd01596706af750000', '2017-01-13 14:54:38', '羽毛球', '50.00', '50', '搞事情', '1', '2');
INSERT INTO `t_goodsapp` VALUES ('40288092599671a8015996ad89bc0002', '402880925966fdfd01596706af750000', '2017-01-13 14:54:38', '羽毛球', '20.00', '20', 'lalal', '1', '2');
INSERT INTO `t_goodsapp` VALUES ('402880925996b0e3015996b6f4240001', '402880925966fdfd01596706af750000', '2017-01-13 15:24:50', 'iiiii', '10.00', '10', '吃饭', '1', '2');
INSERT INTO `t_goodsapp` VALUES ('402880925996b0e3015996bf66000003', '402880925966fdfd01596706af750000', '2017-01-13 15:34:03', '安慰法', '12.00', '12', '违反', '0', '2');
INSERT INTO `t_goodsapp` VALUES ('4028809259ac59f30159ac5c3c050000', '402880925966fdfd01596706af750000', '2017-01-17 20:17:23', 'iiiii', '12.00', '12', 'ewf', '1', '2');
INSERT INTO `t_goodsapp` VALUES ('402881eb59ad247b0159ad2a3fda0001', '402880925966fdfd01596706af750000', '2017-01-18 00:02:24', '兵乓球', '20.00', '20', '我要兵乓球', '1', '2');
INSERT INTO `t_goodsapp` VALUES ('402881eb59ad3bb40159ad3da8600000', '402880925966fdfd01596706af750000', '2017-01-18 00:23:36', '羽毛球', '23.00', '12', '我要羽毛球打球', '1', '1');
INSERT INTO `t_goodsapp` VALUES ('ff80808159af2db50159af4c01590004', '402880925966fdfd01596706af750000', '2017-01-18 09:58:31', '篮球', '30.00', '30', '篮球不足', '1', '2');
INSERT INTO `t_goodsapp` VALUES ('ff80808159af2db50159af4ded6c0006', '402880925966fdfd01596706af750000', '2017-01-18 10:00:37', '文具', '50.00', '20', '么有这个物品', '1', '2');

-- ----------------------------
-- Table structure for t_goodstype
-- ----------------------------
DROP TABLE IF EXISTS `t_goodstype`;
CREATE TABLE `t_goodstype` (
  `goodstypeid` varchar(32) NOT NULL COMMENT '物品类型编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态，默认可用',
  PRIMARY KEY (`goodstypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goodstype
-- ----------------------------
INSERT INTO `t_goodstype` VALUES ('40288092598c729601598c8c4b980004', '生活类', '这是生活类型', '1');
INSERT INTO `t_goodstype` VALUES ('4028da32595ea0b601595eda70eb0000', '运动类', '这是运动器材', '1');
INSERT INTO `t_goodstype` VALUES ('ff80808159af2db50159af4239ea0001', '其他类', '这是无关紧要的。', '1');

-- ----------------------------
-- Table structure for t_goodsuse
-- ----------------------------
DROP TABLE IF EXISTS `t_goodsuse`;
CREATE TABLE `t_goodsuse` (
  `useid` varchar(32) NOT NULL COMMENT '领用编号',
  `goodsid` varchar(32) NOT NULL COMMENT '物品编号，来源于物品表',
  `empid` varchar(32) NOT NULL COMMENT '员工编号，来源于员工表',
  `quantity` int(11) DEFAULT NULL COMMENT '领用的物品数量',
  `useday` datetime DEFAULT NULL COMMENT '信用时间',
  `ereturnday` datetime DEFAULT NULL COMMENT '预估归还时间',
  `des` varchar(255) DEFAULT NULL,
  `usestatus` int(11) DEFAULT '1',
  `returnday` datetime DEFAULT NULL COMMENT '归还时间',
  PRIMARY KEY (`useid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goodsuse
-- ----------------------------
INSERT INTO `t_goodsuse` VALUES ('402881eb59ad247b0159ad28ba820000', '402881eb59acddc80159ace0150a0000', '402880925966fdfd01596706af750000', '20', '2017-01-18 00:00:45', '2017-01-23 00:00:00', '我要打球', '1', '2017-01-18 00:01:30');
INSERT INTO `t_goodsuse` VALUES ('402881ed5992f66c01599315f0410009', '40288092598c729601598c8e6f2c0006', '402880925966fdfd01596706af750000', '12', '2017-01-12 22:30:06', '2017-01-17 00:00:00', 'ef', '1', '2017-01-12 22:30:51');
INSERT INTO `t_goodsuse` VALUES ('ff80808159af2db50159af49ddc70003', '40288092598c729601598c8e6f2c0006', '402880925966fdfd01596706af750000', '20', '2017-01-18 09:56:11', '2017-01-19 00:00:00', '我要搞事情', '1', '2017-01-18 09:57:34');

-- ----------------------------
-- Table structure for t_grade
-- ----------------------------
DROP TABLE IF EXISTS `t_grade`;
CREATE TABLE `t_grade` (
  `gradeid` varchar(32) NOT NULL COMMENT '班级编号',
  `name` varchar(20) DEFAULT NULL COMMENT '班级名称',
  `empid1` varchar(32) NOT NULL COMMENT '班主任',
  `empid2` varchar(32) NOT NULL COMMENT '任课老师',
  `empid3` varchar(32) NOT NULL COMMENT '辅导老师',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  `quantity` int(11) NOT NULL COMMENT '班级最大人数',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_grade
-- ----------------------------
INSERT INTO `t_grade` VALUES ('4028daef59b0776b0159b07efe580004', '班级1', '4028dac159aca1a20159acc16ed40005', '4028dac159aca1a20159acc16ed40005', '4028dac159aca1a20159acc16ed40005', '1', '1', '1');

-- ----------------------------
-- Table structure for t_income
-- ----------------------------
DROP TABLE IF EXISTS `t_income`;
CREATE TABLE `t_income` (
  `incomeid` varchar(32) NOT NULL COMMENT '收入编号',
  `incometypeid` varchar(32) NOT NULL COMMENT '收入类型编号',
  `incomeday` datetime DEFAULT NULL COMMENT '收入时间',
  `des` varchar(255) DEFAULT NULL COMMENT '收入详情',
  `income` double DEFAULT NULL COMMENT '收入金额',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `stuid` varchar(32) DEFAULT NULL COMMENT '学生编号',
  PRIMARY KEY (`incomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_income
-- ----------------------------
INSERT INTO `t_income` VALUES ('4028809259ac82560159ac9788d8000e', '4028da32598ad6f601598af1f5f40001', '2017-01-24 21:21:00', '大概吧', '3443', '4028809259a64a780159a662bfce0000', '4028809259ac82560159ac969060000c');
INSERT INTO `t_income` VALUES ('4028daef59b0776b0159b07d410d0002', '69c0871254804ce0a0ab26f2b28125ed', null, null, '3333', '402880925966fdfd01596706af750000', '4028daef59b0776b0159b07d41040001');
INSERT INTO `t_income` VALUES ('ff80808159af2db50159af583e30000b', 'ab5747b1e6e647cdbdb91fec062ca571', '2017-01-18 09:58:31', '缴费', '300', '4028dac159aca1a20159acc16ed40005', 'ff80808159af2db50159af567a45000a');
INSERT INTO `t_income` VALUES ('ff80808159af2db50159af5932ad000d', '63897017560f440dbc8abdf050a3192f', '2017-01-18 09:58:31', '缴费', '400', '4028dac159aca1a20159acc16ed40005', 'ff80808159af2db50159af593292000c');
INSERT INTO `t_income` VALUES ('ff80808159af2db50159af5b273f000e', 'c9bbedcb5511478aa2064eda741c61e0', '2017-01-18 09:58:31', '缴费', '3000', '402880925966fdfd01596706af750000', 'ff80808159af2db50159af567a45000a');
INSERT INTO `t_income` VALUES ('ff80808159af2db50159af814ef10020', '4028da32598ad6f601598af1f5f40001', '2017-01-18 00:00:00', '梵蒂冈', '1233', '4028809259a64a780159a662bfce0000', '402881eb59ad07d10159ad0b050c0000');

-- ----------------------------
-- Table structure for t_incometype
-- ----------------------------
DROP TABLE IF EXISTS `t_incometype`;
CREATE TABLE `t_incometype` (
  `incometypeid` varchar(32) NOT NULL COMMENT '收入类别编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`incometypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_incometype
-- ----------------------------
INSERT INTO `t_incometype` VALUES ('4028809259ac82560159ac8675800002', '可供爬网', '打飞机', '0');
INSERT INTO `t_incometype` VALUES ('4028da32598ad6f601598af1f5f40001', 'qwe', 'qw', '0');
INSERT INTO `t_incometype` VALUES ('4028dae9597ddbd301597defbd5c0001', '意向转正式', '意向转正式', '1');
INSERT INTO `t_incometype` VALUES ('63897017560f440dbc8abdf050a3192f', '添加预定', '添加预定', '1');
INSERT INTO `t_incometype` VALUES ('69c0871254804ce0a0ab26f2b28125ed', '添加正式', '添加正式', '1');
INSERT INTO `t_incometype` VALUES ('ab5747b1e6e647cdbdb91fec062ca571', '预定转意向', '意向转预定', '1');
INSERT INTO `t_incometype` VALUES ('c9bbedcb5511478aa2064eda741c61e0', '预定转正式', '预定转正式', '1');
INSERT INTO `t_incometype` VALUES ('ff80808159af2db50159af78d7e0001d', '非得叫我', '地方搜房的', '0');

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `jobid` varchar(32) NOT NULL COMMENT '工作编号',
  `stuid` varchar(32) NOT NULL COMMENT '学生编号',
  `company` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `jobtitle` varchar(50) DEFAULT NULL COMMENT '职位',
  `salary` double DEFAULT NULL COMMENT '月薪',
  `welfare` varchar(255) DEFAULT NULL COMMENT '福利待遇',
  `address` varchar(255) DEFAULT NULL COMMENT '公司地址',
  `comphone` varchar(11) DEFAULT NULL COMMENT '公司联系方式',
  `hireday` datetime DEFAULT NULL COMMENT '入职时间',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用状态',
  PRIMARY KEY (`jobid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_job
-- ----------------------------
INSERT INTO `t_job` VALUES ('ff80808159af2db50159af6bb5d80014', 'ff80808159af2db50159af567a45000a', '公司', '员工', '6000', '五险一金', '赣州', '001-002', '2017-01-18 00:00:00', '1');

-- ----------------------------
-- Table structure for t_meetting
-- ----------------------------
DROP TABLE IF EXISTS `t_meetting`;
CREATE TABLE `t_meetting` (
  `meettingid` varchar(32) NOT NULL COMMENT '研讨会编号',
  `empid` varchar(32) NOT NULL COMMENT '主持人编号（员工编号）',
  `meettingday` datetime DEFAULT NULL COMMENT '研讨会时间',
  `createdday` datetime DEFAULT NULL COMMENT '添加时间',
  `des` varchar(500) DEFAULT NULL COMMENT '研讨会详情',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`meettingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_meetting
-- ----------------------------
INSERT INTO `t_meetting` VALUES ('ff80808159af2db50159af72b8900019', '4028809259a64a780159a6ff599b0005', '2017-01-18 00:00:00', '2017-01-18 00:00:00', '开会啊', '0');
INSERT INTO `t_meetting` VALUES ('ff80808159af2db50159af737358001a', '402880925966fdfd01596706af750000', '2017-01-18 00:00:00', '2017-01-18 00:00:00', '开会啊', '1');

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeid` varchar(50) NOT NULL COMMENT '公告编号',
  `name` varchar(50) DEFAULT NULL COMMENT '公告标题',
  `des` varchar(500) DEFAULT NULL COMMENT '公告详情',
  `typeid` varchar(32) NOT NULL COMMENT '公告类型',
  `noticeday` datetime DEFAULT NULL COMMENT '发布时间',
  `empid` varchar(32) NOT NULL COMMENT '发布人',
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`noticeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('402881eb59ad00270159ad021c7c0000', '放假了', '1月20号到2月5号放假', '402881eb59aced070159acef76680002', '2017-01-17 00:00:00', '4028809259a64a780159a6ff599b0005', '1');
INSERT INTO `t_notice` VALUES ('402881eb59ad20f20159ad22865b0000', '放假了', '一月二十号到二月五号放假', '402881eb59aced070159acef76680002', '2017-01-17 00:00:00', '402880925966fdfd01596706af750000', '1');
INSERT INTO `t_notice` VALUES ('ff80808159af2db50159af48729e0002', '放假了', '二月五号回来', '402881eb59aced070159acef76680002', '2017-01-18 00:00:00', '402880925966fdfd01596706af750000', '1');
INSERT INTO `t_notice` VALUES ('ff80808159af2db50159af8538620022', '可以回见了', 'Yui欧派', '402881eb59aced070159acef1f2f0001', '2017-01-12 00:00:00', '402880925966fdfd01596706af750000', '1');

-- ----------------------------
-- Table structure for t_noticetype
-- ----------------------------
DROP TABLE IF EXISTS `t_noticetype`;
CREATE TABLE `t_noticetype` (
  `noticetypeid` varchar(32) NOT NULL COMMENT '公告类型编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`noticetypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_noticetype
-- ----------------------------
INSERT INTO `t_noticetype` VALUES ('402881e95974268a0159742e2dec0003', '物品类型', '啦啦啦啦', '1');
INSERT INTO `t_noticetype` VALUES ('402881eb59acddc80159ace8f0c00003', '财务类型', '我是财务公共', '1');
INSERT INTO `t_noticetype` VALUES ('402881eb59aced070159aceee0c30000', '惩罚类型', '这是惩罚的', '1');
INSERT INTO `t_noticetype` VALUES ('402881eb59aced070159acef1f2f0001', '开关灵活', '放假了顺流逆流放假', '1');
INSERT INTO `t_noticetype` VALUES ('402881eb59aced070159acef76680002', '日常类型', '放假的', '1');
INSERT INTO `t_noticetype` VALUES ('ff80808159af2db50159af8392d20021', '奖励', 'kkfh', '1');

-- ----------------------------
-- Table structure for t_pay
-- ----------------------------
DROP TABLE IF EXISTS `t_pay`;
CREATE TABLE `t_pay` (
  `payid` varchar(32) NOT NULL COMMENT '支出编号',
  `paytypeid` varchar(32) NOT NULL COMMENT '支出类别编号',
  `payday` datetime DEFAULT NULL COMMENT '支出时间',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `pay` double DEFAULT NULL COMMENT '支出金额',
  `empid` varchar(32) DEFAULT NULL COMMENT '员工编号',
  `toname` varchar(50) DEFAULT NULL COMMENT '收款人姓名',
  `tophone` varchar(11) DEFAULT NULL COMMENT '收款人联系方式',
  PRIMARY KEY (`payid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pay
-- ----------------------------

-- ----------------------------
-- Table structure for t_paytype
-- ----------------------------
DROP TABLE IF EXISTS `t_paytype`;
CREATE TABLE `t_paytype` (
  `paytypeid` varchar(32) NOT NULL COMMENT '支出类别编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`paytypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_paytype
-- ----------------------------
INSERT INTO `t_paytype` VALUES ('402880925996b0e3015996b4706c0000', '物品就飞快的', '这是物品产生的支出', '1');
INSERT INTO `t_paytype` VALUES ('4028809259ac82560159ac85dc630001', 'f记得发我', 'sfgh', '0');
INSERT INTO `t_paytype` VALUES ('ff80808159af2db50159af7c0ff6001e', '打飞机', '我就是打飞机的', '1');

-- ----------------------------
-- Table structure for t_previllige
-- ----------------------------
DROP TABLE IF EXISTS `t_previllige`;
CREATE TABLE `t_previllige` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_previllige
-- ----------------------------
INSERT INTO `t_previllige` VALUES ('1', 'com.cs.action.DeptAction.add', '添加部门');
INSERT INTO `t_previllige` VALUES ('2', 'com.cs.action.DeptAction.queryAll', '分页查询');
INSERT INTO `t_previllige` VALUES ('3', 'com.cs.action.DeptAction.update', '修改部门');
INSERT INTO `t_previllige` VALUES ('4', 'com.cs.action.DeptAction.depDisable', '状态禁用');
INSERT INTO `t_previllige` VALUES ('5', 'com.cs.action.DeptAction.depActivate', '状态启用');
INSERT INTO `t_previllige` VALUES ('6', 'com.cs.action.RoleAction.add', '添加角色');
INSERT INTO `t_previllige` VALUES ('7', 'com.cs.action.RoleAction.queryAll', '分页查询角色');
INSERT INTO `t_previllige` VALUES ('8', 'com.cs.action.RoleAction.update	', '修改角色');
INSERT INTO `t_previllige` VALUES ('9', 'com.cs.action.RoleAction.roleDisable', '角色状态禁用');
INSERT INTO `t_previllige` VALUES ('10', 'com.cs.action.RoleAction.roleActivate', '角色状态启用');
INSERT INTO `t_previllige` VALUES ('11', 'com.cs.action.RoleAction.blurredAllQuery', '角色模糊查询');
INSERT INTO `t_previllige` VALUES ('12', 'com.cs.action.EmpAction.save', '添加员工');
INSERT INTO `t_previllige` VALUES ('13', 'com.cs.action.EmpAction.queryAll', '分页查询员工');
INSERT INTO `t_previllige` VALUES ('14', 'com.cs.action.EmpAction.update', '修改员工');
INSERT INTO `t_previllige` VALUES ('15', 'com.cs.action.EmpAction.empDisable', '员工状态禁用');
INSERT INTO `t_previllige` VALUES ('16', 'com.cs.action.EmpAction.empActivate', '员工状态启用');
INSERT INTO `t_previllige` VALUES ('17', 'com.cs.action.EmpAction.blurredAllQuery', '员工模糊查询');
INSERT INTO `t_previllige` VALUES ('18', 'com.cs.action.EmpAction.serachTime', '员工时间段查询');
INSERT INTO `t_previllige` VALUES ('19', 'com.cs.action.EduAction.save', '添加教育背景');
INSERT INTO `t_previllige` VALUES ('20', 'com.cs.action.EduAction.queryAll', '分页查询');
INSERT INTO `t_previllige` VALUES ('21', 'com.cs.action.EduAction.update', '修改教育背景');
INSERT INTO `t_previllige` VALUES ('22', 'com.cs.action.EduAction.deleteById', '删除员工教育背景');
INSERT INTO `t_previllige` VALUES ('23', 'com.cs.action.EduAction.blurredAllQuery', '教育背景模糊查询');
INSERT INTO `t_previllige` VALUES ('24', 'com.cs.action.ExpAction.save', '添加工作经历');
INSERT INTO `t_previllige` VALUES ('25', 'com.cs.action.ExpAction.queryAll', '工作经历分页查询');
INSERT INTO `t_previllige` VALUES ('26', 'com.cs.action.ExpAction.update', '修改工作经历');
INSERT INTO `t_previllige` VALUES ('27', 'com.cs.action.ExpAction.deleteById', '删除工作经历');
INSERT INTO `t_previllige` VALUES ('28', 'com.cs.action.ExpAction.blurredAllQuery', '工作经历模糊查询');
INSERT INTO `t_previllige` VALUES ('29', 'com.cs.action.ExpAction.searchTime', '工作经历时间段查询');
INSERT INTO `t_previllige` VALUES ('30', 'com.cs.action.ReportAction.save ', '添加工作日志');
INSERT INTO `t_previllige` VALUES ('31', 'com.cs.action.ReportAction.queryAll', '分页查询');
INSERT INTO `t_previllige` VALUES ('32', 'com.cs.action.ReportAction.update', '修改工作日志');
INSERT INTO `t_previllige` VALUES ('33', 'com.cs.action.ReportAction.reportDisable', '状态禁用');
INSERT INTO `t_previllige` VALUES ('34', 'com.cs.action.ReportAction.reportActivate', '状态启用');
INSERT INTO `t_previllige` VALUES ('35', 'com.cs.action.ReportAction.blurredAllQuery', '工作日志模糊查询');
INSERT INTO `t_previllige` VALUES ('36', 'com.cs.action.ReportAction.searchTime', '工作日志时间段查询');
INSERT INTO `t_previllige` VALUES ('38', 'com.cs.action.DutyAction.save', '添加值班');
INSERT INTO `t_previllige` VALUES ('39', 'com.cs.action.DutyAction.queryAll', '分页查询值班');
INSERT INTO `t_previllige` VALUES ('40', 'com.cs.action.DutyAction.update', '修改值班');
INSERT INTO `t_previllige` VALUES ('41', 'com.cs.action.DutyAction.deleteById', '删除值班');
INSERT INTO `t_previllige` VALUES ('42', 'com.cs.action.DutyAction.blurredAllQuery', '模糊查询');
INSERT INTO `t_previllige` VALUES ('43', 'com.cs.action.EmpFeedBackAction.save', '添加反馈');
INSERT INTO `t_previllige` VALUES ('44', 'com.cs.action.EmpFeedBackAction.queryAll', '分页查询反馈');
INSERT INTO `t_previllige` VALUES ('45', 'com.cs.action.EmpFeedBackAction.update', '修改反馈');
INSERT INTO `t_previllige` VALUES ('46', 'com.cs.action.EmpFeedBackAction.blurredAllQuery', '模糊查询反馈');
INSERT INTO `t_previllige` VALUES ('47', 'com.cs.action.EmpFeedBackAction.searchTime', '时间段查询反馈');
INSERT INTO `t_previllige` VALUES ('48', 'com.cs.action.EmpFeedBackAction.empFeedBackDisable', '反馈状态禁用');
INSERT INTO `t_previllige` VALUES ('49', 'com.cs.action.EmpFeedBackAction.empFeedBackActivate', '反馈状态启用');
INSERT INTO `t_previllige` VALUES ('50', 'com.cs.action.EmpLeaveAction.save', '添加请假');
INSERT INTO `t_previllige` VALUES ('51', 'com.cs.action.EmpLeaveAction.queryAll', '分页查询');
INSERT INTO `t_previllige` VALUES ('52', 'com.cs.action.EmpLeaveAction.update', '修改请假');
INSERT INTO `t_previllige` VALUES ('53', 'com.cs.action.EmpLeaveAction.blurredAllQuery', '请假模糊查询');
INSERT INTO `t_previllige` VALUES ('54', 'com.cs.action.EmpLeaveAction.searchTime', '请假时间段查询');
INSERT INTO `t_previllige` VALUES ('55', 'com.cs.action.EmpLeaveAction.empLeaveDisable', '状态禁用');
INSERT INTO `t_previllige` VALUES ('56', 'com.cs.action.EmpLeaveAction.empLeaveActivate', '状态启用');
INSERT INTO `t_previllige` VALUES ('57', 'com.cs.action.CheckAction.save', '添加巡查');
INSERT INTO `t_previllige` VALUES ('58', 'com.cs.action.CheckAction.queryAll', '分页查询');
INSERT INTO `t_previllige` VALUES ('59', 'com.cs.action.CheckAction.update', '修改巡查');
INSERT INTO `t_previllige` VALUES ('60', 'com.cs.action.CheckAction.deleteById', '删除巡查');
INSERT INTO `t_previllige` VALUES ('61', 'com.cs.action.CheckAction.blurredAllQuery', '模糊查询巡查');
INSERT INTO `t_previllige` VALUES ('62', 'com.cs.action.CheckAction.searchTime', '时间段查询巡查');
INSERT INTO `t_previllige` VALUES ('63', 'com.cs.action.GoodsTypeAction.save', '添加物品类型');
INSERT INTO `t_previllige` VALUES ('64', 'com.cs.action.GoodsTypeAction.queryAll', '分页查询物品类型');
INSERT INTO `t_previllige` VALUES ('65', 'com.cs.action.GoodsTypeAction.queryById', '查询单个物品类型详情');
INSERT INTO `t_previllige` VALUES ('66', 'com.cs.action.GoodsTypeAction.update', '修改物品类型');
INSERT INTO `t_previllige` VALUES ('67', 'com.cs.action.GoodsTypeAction.empDisable', '物品类型状态禁用');
INSERT INTO `t_previllige` VALUES ('68', 'com.cs.action.GoodsTypeAction.empActivate', '物品类型状态启用');
INSERT INTO `t_previllige` VALUES ('69', 'com.cs.action.GoodsAction.save', '添加物品');
INSERT INTO `t_previllige` VALUES ('70', 'com.cs.action.GoodsAction.queryAll', '分页查询');
INSERT INTO `t_previllige` VALUES ('71', 'com.cs.action.GoodsAction.queryById', '查询单个物品');
INSERT INTO `t_previllige` VALUES ('72', 'com.cs.action.GoodsAction.update', '修改物品');
INSERT INTO `t_previllige` VALUES ('73', 'com.cs.action.GoodsAction.blurredAllQuery', '模糊查询物品');
INSERT INTO `t_previllige` VALUES ('74', 'com.cs.action.GoodsAction.serachTime', '时间段查询物品');
INSERT INTO `t_previllige` VALUES ('75', 'com.cs.action.GoodsAction.empDisable', '物品状态禁用');
INSERT INTO `t_previllige` VALUES ('76', 'com.cs.action.GoodsAction.empActivate', '物品状态启用');
INSERT INTO `t_previllige` VALUES ('77', 'com.cs.action.GoodsAppAction.save', '添加物品申购');
INSERT INTO `t_previllige` VALUES ('78', 'com.cs.action.GoodsAppAction.queryAll', '分页查询');
INSERT INTO `t_previllige` VALUES ('79', 'com.cs.action.GoodsAppAction.update', '修改所有物品申购');
INSERT INTO `t_previllige` VALUES ('80', 'com.cs.action.GoodsAppAction.blurredAllQuery', '模糊查询物品申购');
INSERT INTO `t_previllige` VALUES ('81', 'com.cs.action.GoodsAppAction.serachTime', '时间段查询物品申购');
INSERT INTO `t_previllige` VALUES ('82', 'com.cs.action.GoodsAppAction.goodsAppDisable', '物品申购状态禁用');
INSERT INTO `t_previllige` VALUES ('83', 'com.cs.action.GoodsAppAction.goodsAppActivate', '物品申购状态启用');
INSERT INTO `t_previllige` VALUES ('84', 'com.cs.action.GoodsUseAction.save', '添加物品领用');
INSERT INTO `t_previllige` VALUES ('85', 'com.cs.action.GoodsUseAction.queryAll', '查询所有的物品领用');
INSERT INTO `t_previllige` VALUES ('86', 'com.cs.action.GoodsUseAction.update', '修改所有物品领用');
INSERT INTO `t_previllige` VALUES ('87', 'com.cs.action.GoodsUseAction.blurredAllQuery', '模糊查询物品领用');
INSERT INTO `t_previllige` VALUES ('88', 'com.cs.action.GoodsUseAction.serachTime', '时间段查询物品领用');
INSERT INTO `t_previllige` VALUES ('89', 'com.cs.action.EmpCheckingAction.save', '添加考勤');
INSERT INTO `t_previllige` VALUES ('90', 'com.cs.action.EmpCheckingAction.queryAll', '分页查询考勤');
INSERT INTO `t_previllige` VALUES ('92', 'com.cs.action.EmpCheckingAction.update', '修改考勤');
INSERT INTO `t_previllige` VALUES ('93', 'com.cs.action.EmpCheckingAction.deleteById', '删除考勤');
INSERT INTO `t_previllige` VALUES ('94', 'com.cs.action.EmpCheckingInfoAction.save', '添加考勤信息');
INSERT INTO `t_previllige` VALUES ('95', 'com.cs.action.EmpCheckingInfoAction.queryAll', '分页查询');
INSERT INTO `t_previllige` VALUES ('96', 'com.cs.action.EmpCheckingInfoAction.queryById', '查询单个考勤信息');
INSERT INTO `t_previllige` VALUES ('97', 'com.cs.action.EmpCheckingInfoAction.update', '修改考勤信息');
INSERT INTO `t_previllige` VALUES ('98', 'com.cs.action.EmpCheckingInfoAction.deleteById  ', '删除考勤信息');
INSERT INTO `t_previllige` VALUES ('99', 'com.cs.action.EmpAppealAction.save', '添加考勤申诉');
INSERT INTO `t_previllige` VALUES ('100', 'com.cs.action.EmpAppealAction.queryAll', '分页查询');
INSERT INTO `t_previllige` VALUES ('101', 'com.cs.action.EmpAppealAction.queryById', '查询单个考勤申诉');
INSERT INTO `t_previllige` VALUES ('102', 'com.cs.action.EmpAppealAction.update', '修改考勤申诉');
INSERT INTO `t_previllige` VALUES ('103', 'com.cs.action.EmpAppealAction.empAppealDisable', '状态禁用');
INSERT INTO `t_previllige` VALUES ('104', 'com.cs.action.EmpAppealAction.empAppealActivate', '状态启用');
INSERT INTO `t_previllige` VALUES ('105', 'com.cs.action.StuAction.save', '添加正式学生');
INSERT INTO `t_previllige` VALUES ('106', 'com.cs.action.StuAction.queryAll', '查询全部正式学生');
INSERT INTO `t_previllige` VALUES ('107', 'com.cs.action.StuAction.queryById', '查询单个正式学生');
INSERT INTO `t_previllige` VALUES ('108', 'com.cs.action.StuAction.update', '修改正式学生');
INSERT INTO `t_previllige` VALUES ('109', 'com.cs.action.StuAction.updateFreeze', '修改正式学生状态');
INSERT INTO `t_previllige` VALUES ('110', 'com.cs.action.StuAction.queryFreezeAll', '查询冻结正式学生');
INSERT INTO `t_previllige` VALUES ('111', 'com.cs.action.StuAction.blurredAllQuery', '正式学生页面模糊查询');
INSERT INTO `t_previllige` VALUES ('112', 'com.cs.action.StuAction.termIdQueryAll', '根据条件查询正式学生');
INSERT INTO `t_previllige` VALUES ('113', 'com.cs.action.RoomAction.save', '添加宿舍');
INSERT INTO `t_previllige` VALUES ('114', 'com.cs.action.RoomAction.queryAll', '查询全部宿舍');
INSERT INTO `t_previllige` VALUES ('115', 'com.cs.action.RoomAction.queryById', '查询单个宿舍');
INSERT INTO `t_previllige` VALUES ('116', 'com.cs.action.RoomAction.update', '修改宿舍');
INSERT INTO `t_previllige` VALUES ('117', 'com.cs.action.RoomAction.updateFreeze', '修改宿舍状态');
INSERT INTO `t_previllige` VALUES ('118', 'com.cs.action.RoomAction.queryFreezeAll', '查询冻结宿舍');
INSERT INTO `t_previllige` VALUES ('119', 'com.cs.action.RoomAction.blurredAllQuery', '宿舍页面模糊查询');
INSERT INTO `t_previllige` VALUES ('120', 'com.cs.action.RoomAction.addStuByIds', '宿舍添加学生');
INSERT INTO `t_previllige` VALUES ('121', 'com.cs.action.RoomAction.delStuByIds', '宿舍删除学生');
INSERT INTO `t_previllige` VALUES ('122', 'com.cs.action.GradeAction.save', '添加班级');
INSERT INTO `t_previllige` VALUES ('123', 'com.cs.action.GradeAction.queryAll', '查询全部班级');
INSERT INTO `t_previllige` VALUES ('124', 'com.cs.action.GradeAction.update', '修改班级');
INSERT INTO `t_previllige` VALUES ('125', 'com.cs.action.GradeAction.updateFreeze', '修改班级状态');
INSERT INTO `t_previllige` VALUES ('126', 'com.cs.action.GradeAction.queryFreezeAll', '查询冻结班级');
INSERT INTO `t_previllige` VALUES ('127', 'com.cs.action.GradeAction.blurredAllQuery', '班级页面模糊查询');
INSERT INTO `t_previllige` VALUES ('128', 'com.cs.action.GradeAction.addStuByIds', '班级添加学生');
INSERT INTO `t_previllige` VALUES ('129', 'com.cs.action.GradeAction.delStuByIds', '班级删除学生');
INSERT INTO `t_previllige` VALUES ('130', 'com.cs.action.ScoreAction.save', '添加成绩');
INSERT INTO `t_previllige` VALUES ('131', 'com.cs.action.ScoreAction.update', '修改成绩');
INSERT INTO `t_previllige` VALUES ('132', 'com.cs.action.ScoreAction.queryAll', '查询全部成绩');
INSERT INTO `t_previllige` VALUES ('133', 'com.cs.action.ScoreAction.stuScoreById', '根据学生ID查询成绩');
INSERT INTO `t_previllige` VALUES ('134', 'com.cs.action.ScoreAction.stuScore', '根据班级ID查询成绩');
INSERT INTO `t_previllige` VALUES ('135', 'com.cs.action.StuLeaveAction.save', '添加学生请假');
INSERT INTO `t_previllige` VALUES ('136', 'com.cs.action.StuLeaveAction.queryAll', '查询全部请假');
INSERT INTO `t_previllige` VALUES ('137', 'com.cs.action.StuLeaveAction.update', '修改请假');
INSERT INTO `t_previllige` VALUES ('138', 'com.cs.action.StuLeaveAction.updateFreeze', '修改请假状态');
INSERT INTO `t_previllige` VALUES ('139', 'com.cs.action.StuLeaveAction.queryFreezeAll', '查询冻结请假');
INSERT INTO `t_previllige` VALUES ('140', 'com.cs.action.StuLeaveAction.blurredAllQuery  ', '请假页面模糊查询');
INSERT INTO `t_previllige` VALUES ('141', 'com.cs.action.StuLeaveAction.serachTime', '根据请假时间段查询');
INSERT INTO `t_previllige` VALUES ('142', 'com.cs.action.StuFeedbackAction.save', '添加学生反馈');
INSERT INTO `t_previllige` VALUES ('143', 'com.cs.action.StuFeedbackAction.queryAll   ', '查询全部反馈');
INSERT INTO `t_previllige` VALUES ('144', 'com.cs.action.StuFeedbackAction.update', '修改反馈');
INSERT INTO `t_previllige` VALUES ('145', 'com.cs.action.StuFeedbackAction.updateFreeze', '修改反馈状态');
INSERT INTO `t_previllige` VALUES ('146', 'com.cs.action.StuFeedbackAction.queryFreezeAll', '查询冻结反馈');
INSERT INTO `t_previllige` VALUES ('147', 'com.cs.action.StuFeedbackAction.blurredAllQuery', '反馈页面模糊查询');
INSERT INTO `t_previllige` VALUES ('148', 'com.cs.action.JobAction.save', '添加学生就业');
INSERT INTO `t_previllige` VALUES ('149', 'com.cs.action.JobAction.queryAll ', ' 查询全部就业');
INSERT INTO `t_previllige` VALUES ('150', 'com.cs.action.JobAction.update', '修改就业');
INSERT INTO `t_previllige` VALUES ('151', 'com.cs.action.JobAction.updateFreeze', '修改就业状态');
INSERT INTO `t_previllige` VALUES ('152', 'com.cs.action.JobAction.queryFreezeAll', '查询冻结就业');
INSERT INTO `t_previllige` VALUES ('153', 'com.cs.action.JobAction.blurredAllQuery ', '就业页面模糊查询');
INSERT INTO `t_previllige` VALUES ('154', 'com.cs.action.TalkAction.save', '添加学生谈心');
INSERT INTO `t_previllige` VALUES ('155', 'com.cs.action.TalkAction.queryAll', '查询全部谈心');
INSERT INTO `t_previllige` VALUES ('156', 'com.cs.action.TalkAction.update', '修改谈心');
INSERT INTO `t_previllige` VALUES ('157', 'com.cs.action.TalkAction.updateFreeze', '修改谈心状态');
INSERT INTO `t_previllige` VALUES ('158', 'com.cs.action.TalkAction.queryFreezeAll', '查询冻结谈心');
INSERT INTO `t_previllige` VALUES ('159', 'com.cs.action.TalkAction.blurredAllQuery', '谈心页面模糊查询');
INSERT INTO `t_previllige` VALUES ('160', 'com.cs.action.StuCheckingAction.save', ' 添加学生考勤');
INSERT INTO `t_previllige` VALUES ('161', 'com.cs.action.StuCheckingAction.queryAll', '查询全部考勤');
INSERT INTO `t_previllige` VALUES ('162', 'com.cs.action.StuCheckingAction.update', '修改考勤');
INSERT INTO `t_previllige` VALUES ('163', 'com.cs.action.StuCheckingAction.updateFreeze', '修改考勤状态');
INSERT INTO `t_previllige` VALUES ('164', 'com.cs.action.StuCheckingAction.stuChecking', '按照班级查询学生考勤 ');
INSERT INTO `t_previllige` VALUES ('165', 'com.cs.action.CourseAction.courseQueryAll', '分页查询出所有的课程');
INSERT INTO `t_previllige` VALUES ('166', 'com.cs.action.CourseAction.addCourse', '  添加新的课程​');
INSERT INTO `t_previllige` VALUES ('167', 'com.cs.action.CourseAction.deleteCourse', '删除已有的课程信息');
INSERT INTO `t_previllige` VALUES ('168', 'com.cs.action.CourseAction.updateCourse', '更新课程信息');
INSERT INTO `t_previllige` VALUES ('169', 'com.cs.action.CourseAction.blurredAllQuery', ' 模糊查询');
INSERT INTO `t_previllige` VALUES ('170', 'com.cs.action.CourseAction.termSerach', '根据时间进行查询');
INSERT INTO `t_previllige` VALUES ('171', 'com.cs.action.MeettingAction.meettingQueryAll', '分页查询研讨会信息');
INSERT INTO `t_previllige` VALUES ('172', 'com.cs.action.MeettingAction.addMeetting', '添加研讨会');
INSERT INTO `t_previllige` VALUES ('173', 'com.cs.action.MeettingAction.updateMeetting', '更新研讨会信息');
INSERT INTO `t_previllige` VALUES ('174', 'com.cs.action.MeettingAction.deleteMeetting', '删除研讨会');
INSERT INTO `t_previllige` VALUES ('175', 'com.cs.action.MeettingAction.blurredAllQuery', '模糊查询');
INSERT INTO `t_previllige` VALUES ('176', 'com.cs.action.MeettingAction.serachTime', '根据时间段进行查询');
INSERT INTO `t_previllige` VALUES ('177', 'com.cs.action.ProgressAction.progressQueryAll', '分页查询所有课程进度');
INSERT INTO `t_previllige` VALUES ('178', 'com.cs.action.ProgressAction.addProgress', '添加新的课程进度');
INSERT INTO `t_previllige` VALUES ('179', 'com.cs.action.ProgressAction.updateProgress', '更新课程进度信息');
INSERT INTO `t_previllige` VALUES ('180', 'com.cs.action.ProgressAction.deleteProgress', '删除课程进度信息');
INSERT INTO `t_previllige` VALUES ('181', 'com.cs.action.ProgressAction.blurredAllQuery', '模糊查询​');
INSERT INTO `t_previllige` VALUES ('182', 'com.cs.action.StuIntentionAction.save', '添加意向学生');
INSERT INTO `t_previllige` VALUES ('183', 'com.cs.action.StuIntentionAction.queryAssign ', '分页查询所有意向学生');
INSERT INTO `t_previllige` VALUES ('184', 'com.cs.action.StuIntentionAction.queryById', '根据id查询意向学生');
INSERT INTO `t_previllige` VALUES ('185', 'com.cs.action.StuIntentionAction.update', '修改意向学生');
INSERT INTO `t_previllige` VALUES ('186', 'com.cs.action.StuIntentionAction.queryStu', '查询所有禁用意向学生');
INSERT INTO `t_previllige` VALUES ('187', 'com.cs.action.StuIntentionAction.queryStu1', '查询所有启用意向学生');
INSERT INTO `t_previllige` VALUES ('188', 'com.cs.action.StuIntentionAction.blurredAllQuery ', '模糊查询');
INSERT INTO `t_previllige` VALUES ('189', 'com.cs.action.StuIntentionAction.roleDisable', '禁用');
INSERT INTO `t_previllige` VALUES ('190', 'com.cs.action.StuIntentionAction.roleActivate', '启用');
INSERT INTO `t_previllige` VALUES ('191', 'com.cs.action.StuIntentionAction.changeIntention', '转为预定学生');
INSERT INTO `t_previllige` VALUES ('192', 'com.cs.action.StuIntentionAction.changePredetermine', '转为正式学生');
INSERT INTO `t_previllige` VALUES ('193', 'com.cs.action.StuPredetermineAction.save  ', '添加预定学生');
INSERT INTO `t_previllige` VALUES ('194', 'com.cs.action.StuPredetermineAction.queryAssign', '分页查询所有预定学生');
INSERT INTO `t_previllige` VALUES ('195', 'com.cs.action.StuPredetermineAction.queryById', '根据id查询预定学生');
INSERT INTO `t_previllige` VALUES ('196', 'com.cs.action.StuPredetermineAction.update', '修改预定学生');
INSERT INTO `t_previllige` VALUES ('197', 'com.cs.action.StuPredetermineAction.queryStu', '查询所有禁用预定学生');
INSERT INTO `t_previllige` VALUES ('198', 'com.cs.action.StuPredetermineAction.queryStu1', '查询所有启用预定学生');
INSERT INTO `t_previllige` VALUES ('199', 'com.cs.action.StuPredetermineAction.blurredAllQuery', '模糊查询');
INSERT INTO `t_previllige` VALUES ('200', 'com.cs.action.StuPredetermineAction.roleDisable', '禁用');
INSERT INTO `t_previllige` VALUES ('201', 'com.cs.action.StuPredetermineAction.roleActivate', '启用');
INSERT INTO `t_previllige` VALUES ('202', 'com.cs.action.StuPredetermineAction.changePredetermine', '转为正式学生');
INSERT INTO `t_previllige` VALUES ('203', 'com.cs.action.IncomeAction.save', '添加收入');
INSERT INTO `t_previllige` VALUES ('204', 'com.cs.action.IncomeAction.queryAll', '分页查询收入');
INSERT INTO `t_previllige` VALUES ('205', 'com.cs.action.IncomeAction.update', '更新收入');
INSERT INTO `t_previllige` VALUES ('206', 'com.cs.action.IncomeAction.blurredAllQuery', '模糊查询收入');
INSERT INTO `t_previllige` VALUES ('207', 'com.cs.action.PayAction.save', '添加支出');
INSERT INTO `t_previllige` VALUES ('208', 'com.cs.action.PayAction.queryAll', '分页查询支出');
INSERT INTO `t_previllige` VALUES ('209', 'com.cs.action.PayAction.update', '更新支出');
INSERT INTO `t_previllige` VALUES ('210', 'com.cs.action.PayAction.blurredAllQuery', '模糊查询支出');
INSERT INTO `t_previllige` VALUES ('211', 'com.cs.action.SalaryAction.save', '添加工资');
INSERT INTO `t_previllige` VALUES ('212', 'com.cs.action.SalaryAction.queryAll', '分页查询工资');
INSERT INTO `t_previllige` VALUES ('213', 'com.cs.action.SalaryAction.update', '更新工资');
INSERT INTO `t_previllige` VALUES ('214', 'com.cs.action.SalaryAction.blurredAllQuery', '模糊查询工资');
INSERT INTO `t_previllige` VALUES ('215', 'com.cs.action.SalaryInfoAction.save', '添加基本工资');
INSERT INTO `t_previllige` VALUES ('216', 'com.cs.action.SalaryInfoAction.queryAll', '分页查询基本工资');
INSERT INTO `t_previllige` VALUES ('217', 'com.cs.action.SalaryInfoAction.update', '更新基本工资');
INSERT INTO `t_previllige` VALUES ('218', 'com.cs.action.SalaryInfoAction.salaryInfoDisable', '禁用');
INSERT INTO `t_previllige` VALUES ('219', 'com.cs.action.SalaryInfoAction.SalaryInfoActivate', '启用');
INSERT INTO `t_previllige` VALUES ('220', 'com.cs.action.IncomeTypeAction.save', '添加收入');
INSERT INTO `t_previllige` VALUES ('221', 'com.cs.action.IncomeTypeAction.queryAll', '分页查询收入');
INSERT INTO `t_previllige` VALUES ('222', 'com.cs.action.IncomeTypeAction.update', '更新收入');
INSERT INTO `t_previllige` VALUES ('223', 'com.cs.action.IncomeTypeAction.incomeTypeDisable', '禁用');
INSERT INTO `t_previllige` VALUES ('224', 'com.cs.action.IncomeTypeAction.IncomeTypeActivate', '启用');
INSERT INTO `t_previllige` VALUES ('225', 'com.cs.action.PayTypeAction.save', '添加收入');
INSERT INTO `t_previllige` VALUES ('226', 'com.cs.action.PayTypeAction.queryAll', '分页查询收入');
INSERT INTO `t_previllige` VALUES ('227', 'com.cs.action.PayTypeAction.update', '更新收入');
INSERT INTO `t_previllige` VALUES ('228', 'com.cs.action.PayTypeAction.payTypeDisable', '禁用');
INSERT INTO `t_previllige` VALUES ('229', 'com.cs.action.PayTypeAction.PayTypeActivate', '启用');
INSERT INTO `t_previllige` VALUES ('230', 'com.cs.action.NoticeTypeAction.save', '添加公告类型');
INSERT INTO `t_previllige` VALUES ('231', 'com.cs.action.NoticeTypeAction.queryAll', ' 查询所有公告类型');
INSERT INTO `t_previllige` VALUES ('232', 'com.cs.action.NoticeTypeAction.update', '更新公告类型');
INSERT INTO `t_previllige` VALUES ('233', 'com.cs.action.NoticeTypeAction.noticeDisneyable', '禁用公告类型');
INSERT INTO `t_previllige` VALUES ('234', 'com.cs.action.NoticeTypeAction.noticeActivate', '启用公告类型');
INSERT INTO `t_previllige` VALUES ('235', 'com.cs.action.NoticeAction.save', '保存公告表');
INSERT INTO `t_previllige` VALUES ('236', 'com.cs.action.NoticeAction.queryAll', '查询所有公告表');
INSERT INTO `t_previllige` VALUES ('237', 'com.cs.action.NoticeAction.update ', '更新公告表');
INSERT INTO `t_previllige` VALUES ('238', 'com.cs.action.NoticeAction.noticeDisable', '禁用');
INSERT INTO `t_previllige` VALUES ('239', 'com.cs.action.NoticeAction.noticeActivate', '启用');
INSERT INTO `t_previllige` VALUES ('240', 'com.cs.action.NoticeAction.bulurredAllQuery', '模糊查询公告表');
INSERT INTO `t_previllige` VALUES ('241', 'com.cs.action.EmpAction.termIdQueryAll', '根据条件查询所有员工');
INSERT INTO `t_previllige` VALUES ('242', 'com.cs.action.EmpAction.queryRoleAll', '根据角色id去查找员工');
INSERT INTO `t_previllige` VALUES ('243', 'com.cs.action.EmpAction.queryDeptAll', '根据部门查看员工');
INSERT INTO `t_previllige` VALUES ('244', 'com.cs.action.GoodsAction.empGoods', '员工物品管理');
INSERT INTO `t_previllige` VALUES ('245', 'com.cs.action.GoodsAction.goodsPurchase', '员工申购');
INSERT INTO `t_previllige` VALUES ('246', 'com.cs.action.GoodsAction.empGoodsPage', '员工个人物品页面');
INSERT INTO `t_previllige` VALUES ('247', 'com.cs.action.GoodsAppAction.goodsAppDis', '状态未通过');
INSERT INTO `t_previllige` VALUES ('248', 'com.cs.action.GoodsAppAction.goodsAppAct', '状态通过');
INSERT INTO `t_previllige` VALUES ('249', 'com.cs.action.GoodsAppAction.giveBackPage', ' 员工物品申购页面');
INSERT INTO `t_previllige` VALUES ('250', 'com.cs.action.GoodsAppAction.saveGoodsApp', '员工添加物品申购1');
INSERT INTO `t_previllige` VALUES ('251', 'com.cs.action.GoodsAppAction.giveBack', '员工物品申购');
INSERT INTO `t_previllige` VALUES ('252', 'com.cs.action.GoodsUseAction.goodsApplyPage', '申领跳转页面');
INSERT INTO `t_previllige` VALUES ('253', 'com.cs.action.GoodsUseAction.goodsApply', '查询所有申领页面');
INSERT INTO `t_previllige` VALUES ('254', 'com.cs.action.GoodsUseAction.updateUseStatus', '修改申领状态');
INSERT INTO `t_previllige` VALUES ('255', 'com.cs.action.GoodsUseAction.goodsUseAct', '取消状态');
INSERT INTO `t_previllige` VALUES ('256', 'com.cs.action.GoodsUseAction.goodsUseDis', '通过状态');
INSERT INTO `t_previllige` VALUES ('257', 'com.cs.action.GoodsUseAction.okUse', '确定状态');
INSERT INTO `t_previllige` VALUES ('259', 'com.cs.action.ReportAction.queryFreeze', '查询所有禁用');
INSERT INTO `t_previllige` VALUES ('260', 'com.cs.action.ReprotAction.queryFreeze1', '查询所有启用');
INSERT INTO `t_previllige` VALUES ('261', 'com.cs.action.CourseAction.courseSkipPage', '跳转到课程管理页面');
INSERT INTO `t_previllige` VALUES ('262', 'com.cs.action.ProgressAction.progressSkipPage', '跳转到课程进度页面');
INSERT INTO `t_previllige` VALUES ('263', 'com.cs.action.MeettingAction.meettingSkipPage', '跳转到研讨会管理页面');
INSERT INTO `t_previllige` VALUES ('264', 'com.cs.action.IncomeAction.incomePage', '收入管理页面跳转');
INSERT INTO `t_previllige` VALUES ('265', 'com.cs.action.PayAction.payPage', '支出管理页面跳转');
INSERT INTO `t_previllige` VALUES ('266', 'com.cs.action.SalaryAction.salaryPage', '工资管理页面跳转');
INSERT INTO `t_previllige` VALUES ('267', 'com.cs.action.SalaryInfoAction.salaryInfoPage', '基本工资页面跳转');
INSERT INTO `t_previllige` VALUES ('268', 'com.cs.action.IncomeTypeAction.incomeTypePage', '收入类型页面跳转');
INSERT INTO `t_previllige` VALUES ('269', 'com.cs.action.PayTypeAction.payTypePage', '支出类型页面跳转');
INSERT INTO `t_previllige` VALUES ('270', 'com.cs.action.StuAction.loginPage', '学生登录页面');
INSERT INTO `t_previllige` VALUES ('271', 'com.cs.action.StuAction.skipPage', '正式学生登录页面');
INSERT INTO `t_previllige` VALUES ('272', 'com.cs.action.RoomAction.skipPage', '宿舍页面');
INSERT INTO `t_previllige` VALUES ('273', 'com.cs.action.GradeAction.skipPage', '班级页面');
INSERT INTO `t_previllige` VALUES ('274', 'com.cs.action.ScoreAction.skipPage', '成绩页面');
INSERT INTO `t_previllige` VALUES ('275', 'com.cs.action.StuLeaveAction.skipPage', '学生请假页面');
INSERT INTO `t_previllige` VALUES ('276', 'com.cs.action.StuFeedbackAction.skipPage', '学生反馈页面');
INSERT INTO `t_previllige` VALUES ('277', 'com.cs.action.JobAction.skipPage', '学生就业页面');
INSERT INTO `t_previllige` VALUES ('278', 'com.cs.action.TalkAction.skipPage', '学生谈心页面');
INSERT INTO `t_previllige` VALUES ('279', 'com.cs.action.StuCheckingAction.skipPage', '学生考勤页面');
INSERT INTO `t_previllige` VALUES ('280', 'com.cs.action.StuIntentionAction.skipPage', '意向学生页面跳转');
INSERT INTO `t_previllige` VALUES ('281', 'com.cs.action.StuPredetermineAction.skipPage ', '预定学生页面跳转');
INSERT INTO `t_previllige` VALUES ('282', 'com.cs.action.NoticeTypeAction.skipPage', '公告类型页面跳转');
INSERT INTO `t_previllige` VALUES ('283', 'com.cs.action.NoticeAction.skipPage', '公告栏页面跳转');
INSERT INTO `t_previllige` VALUES ('284', 'com.cs.action.DeptAction.skipPage', '跳转部门页面');
INSERT INTO `t_previllige` VALUES ('285', 'com.cs.action.RoleAction.skipPage', '跳转员工角色页面');
INSERT INTO `t_previllige` VALUES ('286', 'com.cs.action.EmpAction.skipPage', '跳转员工页面');
INSERT INTO `t_previllige` VALUES ('287', 'com.cs.action.EduAction.skipPage', '跳转员工教育背景页面');
INSERT INTO `t_previllige` VALUES ('288', 'com.cs.action.ExpAction.skipPage', '跳转员工工作经历页面');
INSERT INTO `t_previllige` VALUES ('289', 'com.cs.action.ReportAction.skipPage', '跳转员工工作日志页面');
INSERT INTO `t_previllige` VALUES ('290', 'com.cs.action.DutyAction.skipPage ', '跳转员工值班页面');
INSERT INTO `t_previllige` VALUES ('291', 'com.cs.action.EmpFeedBackAction.skipPage ', '跳转员工反馈页面');
INSERT INTO `t_previllige` VALUES ('292', 'com.cs.action.EmpLeaveAction.skipPage', '跳转员工请假页面');
INSERT INTO `t_previllige` VALUES ('293', 'com.cs.action.CheckAction.skipPage  ', '跳转员工巡查页面');
INSERT INTO `t_previllige` VALUES ('294', 'com.cs.action.GoodsTypeAction.skipPage', '跳转物品类型页面');
INSERT INTO `t_previllige` VALUES ('295', 'com.cs.action.GoodsAction.skipPage', '跳转物品页面');
INSERT INTO `t_previllige` VALUES ('296', 'com.cs.action.GoodsAppAction.skipPage', '跳转物品申购页面');
INSERT INTO `t_previllige` VALUES ('297', 'com.cs.action.GoodsUseAction.skipPage', '跳转物品领用页面');
INSERT INTO `t_previllige` VALUES ('299', 'com.cs.action.EmpCheckingAction.skipPage ', '跳转员工考勤页面');
INSERT INTO `t_previllige` VALUES ('300', 'com.cs.action.EmpCheckingInfoAction.skipPage', ' 跳转员工考勤信息页面');
INSERT INTO `t_previllige` VALUES ('301', 'com.cs.action.EmpAppealAction.skipPage ', '跳转员工考勤申诉页面');
INSERT INTO `t_previllige` VALUES ('302', 'com.cs.action.EmpLeaveAction.empLeavePage', '跳转请假个人页面');
INSERT INTO `t_previllige` VALUES ('303', 'com.cs.action.NoticeTypeAction.noticeDisable', '公告类型禁用');
INSERT INTO `t_previllige` VALUES ('304', 'com.cs.action.NoticeTypeAction.noticeActivate', '公告类型启用');
INSERT INTO `t_previllige` VALUES ('305', 'com.cs.action.CourseAction.courseDisable', '禁用课程状态');
INSERT INTO `t_previllige` VALUES ('306', 'com.cs.action.CourseAction.courseActivate', '启用课程状态');
INSERT INTO `t_previllige` VALUES ('307', 'com.cs.action.MeettingAction.meettingDisable', '禁用研讨会状态');
INSERT INTO `t_previllige` VALUES ('308', 'com.cs.action.MeettingAction.meettingActivate', '启用研讨会状态');
INSERT INTO `t_previllige` VALUES ('309', 'com.cs.action.ProgressAction.progressDisable', '禁用课程进度状态');
INSERT INTO `t_previllige` VALUES ('310', 'com.cs.action.ProgressAction.progressActivate', '启用课程进度状态');
INSERT INTO `t_previllige` VALUES ('311', 'com.cs.action.IncomeAction.incomebiaoge', '跳转到收入图表页面');
INSERT INTO `t_previllige` VALUES ('312', 'com.cs.action.PayAction.paybiaoge', '跳转到支出图表页面');

-- ----------------------------
-- Table structure for t_progress
-- ----------------------------
DROP TABLE IF EXISTS `t_progress`;
CREATE TABLE `t_progress` (
  `progressid` varchar(32) NOT NULL COMMENT '课程进度编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `gradeid` varchar(32) NOT NULL COMMENT '班级编号',
  `des` varchar(500) DEFAULT NULL COMMENT '进度详情',
  `progressday` datetime DEFAULT NULL COMMENT '添加进度的时间',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`progressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_progress
-- ----------------------------
INSERT INTO `t_progress` VALUES ('297e68eb5cd27781015cd2d1ffb10003', '402880925966fdfd01596706af750000', '4028daef59b0776b0159b07efe580004', '11111', '2017-06-23 00:00:00', '1');

-- ----------------------------
-- Table structure for t_report
-- ----------------------------
DROP TABLE IF EXISTS `t_report`;
CREATE TABLE `t_report` (
  `reportid` varchar(32) NOT NULL COMMENT '工作日志编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `reportday` datetime DEFAULT NULL COMMENT '日志时间',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`reportid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_report
-- ----------------------------
INSERT INTO `t_report` VALUES ('297e68eb5cd27781015cd2d538fe0006', '402880925966fdfd01596706af750000', '2017-06-23 10:43:28', '上班的第一天', '1');
INSERT INTO `t_report` VALUES ('4028809659767e360159767f43040000', '4028da32593fe63101594019bf4c0000', '2017-01-31 09:15:56', '我干了好事', '1');
INSERT INTO `t_report` VALUES ('402880965976829e01597685c0be0000', '4028da32593fe63101594019bf4c0000', '2017-01-07 09:28:00', '我不知道干了什么', '1');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `roleid` varchar(32) NOT NULL COMMENT '角色编号',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('2d0c04c5b87444c0af538396efee5b22', '学生', '学生', '1');
INSERT INTO `t_role` VALUES ('2e44d67971534136825564e6345a9a55', '辅导老师', '辅导老师', '1');
INSERT INTO `t_role` VALUES ('30efd5bfa76d43268e0a18745a33da00', '任课老师', '任课老师', '1');
INSERT INTO `t_role` VALUES ('40288092593a25c801593a478d080000', '老板', '老板', '1');
INSERT INTO `t_role` VALUES ('4028dac059767f9c01597683db780000', '财务部主任', '财务部主任', '1');
INSERT INTO `t_role` VALUES ('61f4a49ba4e74e569c5c5332a5bfa1bf', '后勤部主任', '后勤部主任', '1');
INSERT INTO `t_role` VALUES ('6e6ec112f67542a5bdc2efbcb742ffe7', '招生部主任', '招生部主任', '1');
INSERT INTO `t_role` VALUES ('795da931af554de9a7727e6da1fdc25d', '班主任', '班主任', '1');
INSERT INTO `t_role` VALUES ('d886cd061fdf402887bc872f135d617f', '招生老师', '招生老师', '1');
INSERT INTO `t_role` VALUES ('ee0264885f4f451d8be46dab9d0949e8', '教务部主任', '教务部主任', '1');
INSERT INTO `t_role` VALUES ('f5d46e6afcb84488800b55e9243cd979', '行政部主任', '行政部主任', '1');

-- ----------------------------
-- Table structure for t_role_pre
-- ----------------------------
DROP TABLE IF EXISTS `t_role_pre`;
CREATE TABLE `t_role_pre` (
  `id` varchar(36) NOT NULL,
  `roleid` varchar(32) NOT NULL,
  `preid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_roleid` (`roleid`),
  KEY `fk_preid` (`preid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_pre
-- ----------------------------
INSERT INTO `t_role_pre` VALUES ('102a2b96-d937-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '241');
INSERT INTO `t_role_pre` VALUES ('132b8af2-db1d-11e6-9ebd-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '142');
INSERT INTO `t_role_pre` VALUES ('2349e72d-dd18-11e6-a41a-f8a963dbc5fb', '6e6ec112f67542a5bdc2efbcb742ffe7', '292');
INSERT INTO `t_role_pre` VALUES ('3148d520-d708-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '261');
INSERT INTO `t_role_pre` VALUES ('67fecd68-dcb6-11e6-a41a-f8a963dbc5fb', '4028dac059767f9c01597683db780000', '241');
INSERT INTO `t_role_pre` VALUES ('71d8f710-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '283');
INSERT INTO `t_role_pre` VALUES ('71e4d838-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '284');
INSERT INTO `t_role_pre` VALUES ('71e93f93-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '292');
INSERT INTO `t_role_pre` VALUES ('71ec9227-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '290');
INSERT INTO `t_role_pre` VALUES ('71f2e73b-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '293');
INSERT INTO `t_role_pre` VALUES ('71f86493-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '299');
INSERT INTO `t_role_pre` VALUES ('71fd4c39-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '301');
INSERT INTO `t_role_pre` VALUES ('7203ee6a-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '289');
INSERT INTO `t_role_pre` VALUES ('72078203-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '280');
INSERT INTO `t_role_pre` VALUES ('720e5f51-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '281');
INSERT INTO `t_role_pre` VALUES ('7213c909-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '273');
INSERT INTO `t_role_pre` VALUES ('7219f164-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '272');
INSERT INTO `t_role_pre` VALUES ('721d1655-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '277');
INSERT INTO `t_role_pre` VALUES ('7222e102-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '278');
INSERT INTO `t_role_pre` VALUES ('7225ea78-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '271');
INSERT INTO `t_role_pre` VALUES ('722ccbc1-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '274');
INSERT INTO `t_role_pre` VALUES ('7233bab8-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '275');
INSERT INTO `t_role_pre` VALUES ('7239df33-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '279');
INSERT INTO `t_role_pre` VALUES ('723f3b84-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '261');
INSERT INTO `t_role_pre` VALUES ('72448a75-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '262');
INSERT INTO `t_role_pre` VALUES ('724b5060-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '263');
INSERT INTO `t_role_pre` VALUES ('724ed707-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '291');
INSERT INTO `t_role_pre` VALUES ('72524e71-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '266');
INSERT INTO `t_role_pre` VALUES ('725ac000-dbb7-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '267');
INSERT INTO `t_role_pre` VALUES ('755c7b60-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '261');
INSERT INTO `t_role_pre` VALUES ('755e45d5-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '262');
INSERT INTO `t_role_pre` VALUES ('7563d3d5-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '263');
INSERT INTO `t_role_pre` VALUES ('7568e482-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '264');
INSERT INTO `t_role_pre` VALUES ('756e8455-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '266');
INSERT INTO `t_role_pre` VALUES ('75729de3-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '267');
INSERT INTO `t_role_pre` VALUES ('75761f7e-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '272');
INSERT INTO `t_role_pre` VALUES ('7579e017-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '273');
INSERT INTO `t_role_pre` VALUES ('757f07ec-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '274');
INSERT INTO `t_role_pre` VALUES ('75823034-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '275');
INSERT INTO `t_role_pre` VALUES ('75865a03-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '277');
INSERT INTO `t_role_pre` VALUES ('758a54f3-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '278');
INSERT INTO `t_role_pre` VALUES ('758d2c0f-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '279');
INSERT INTO `t_role_pre` VALUES ('75907667-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '280');
INSERT INTO `t_role_pre` VALUES ('7593c575-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '281');
INSERT INTO `t_role_pre` VALUES ('7598a534-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '283');
INSERT INTO `t_role_pre` VALUES ('759c8127-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '284');
INSERT INTO `t_role_pre` VALUES ('759fc588-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '286');
INSERT INTO `t_role_pre` VALUES ('75a59881-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '287');
INSERT INTO `t_role_pre` VALUES ('75a9d22f-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '288');
INSERT INTO `t_role_pre` VALUES ('75ae784c-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '289');
INSERT INTO `t_role_pre` VALUES ('75b4d83b-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '290');
INSERT INTO `t_role_pre` VALUES ('75bb1b8c-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '291');
INSERT INTO `t_role_pre` VALUES ('75be114c-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '292');
INSERT INTO `t_role_pre` VALUES ('75c2f13a-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '293');
INSERT INTO `t_role_pre` VALUES ('75c7570f-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '295');
INSERT INTO `t_role_pre` VALUES ('75cadf07-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '296');
INSERT INTO `t_role_pre` VALUES ('75cf971e-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '297');
INSERT INTO `t_role_pre` VALUES ('75d6da64-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '299');
INSERT INTO `t_role_pre` VALUES ('75dc42d6-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '300');
INSERT INTO `t_role_pre` VALUES ('75e466d8-d730-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '301');
INSERT INTO `t_role_pre` VALUES ('7e409a9c-d730-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '283');
INSERT INTO `t_role_pre` VALUES ('7e5333d0-d730-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '279');
INSERT INTO `t_role_pre` VALUES ('7e55d929-d730-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '290');
INSERT INTO `t_role_pre` VALUES ('7e59fca8-d730-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '277');
INSERT INTO `t_role_pre` VALUES ('7e604768-d730-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '278');
INSERT INTO `t_role_pre` VALUES ('7e63eb4a-d730-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '276');
INSERT INTO `t_role_pre` VALUES ('7e6919eb-d730-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '271');
INSERT INTO `t_role_pre` VALUES ('7e6d57f1-d730-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '275');
INSERT INTO `t_role_pre` VALUES ('7e734e0c-d730-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '279');
INSERT INTO `t_role_pre` VALUES ('7e794c56-d730-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '261');
INSERT INTO `t_role_pre` VALUES ('7e7fe310-d730-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '262');
INSERT INTO `t_role_pre` VALUES ('83273017-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '283');
INSERT INTO `t_role_pre` VALUES ('8349c096-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '284');
INSERT INTO `t_role_pre` VALUES ('83524b12-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '292');
INSERT INTO `t_role_pre` VALUES ('8357a2c7-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '290');
INSERT INTO `t_role_pre` VALUES ('835b5684-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '293');
INSERT INTO `t_role_pre` VALUES ('8364cc46-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '299');
INSERT INTO `t_role_pre` VALUES ('836abd6c-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '301');
INSERT INTO `t_role_pre` VALUES ('836e2994-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '289');
INSERT INTO `t_role_pre` VALUES ('83730b32-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '280');
INSERT INTO `t_role_pre` VALUES ('83762c77-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '281');
INSERT INTO `t_role_pre` VALUES ('83797713-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '273');
INSERT INTO `t_role_pre` VALUES ('837e5682-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '272');
INSERT INTO `t_role_pre` VALUES ('8381fd66-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '277');
INSERT INTO `t_role_pre` VALUES ('83873343-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '278');
INSERT INTO `t_role_pre` VALUES ('838c05d9-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '271');
INSERT INTO `t_role_pre` VALUES ('838f34a9-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '274');
INSERT INTO `t_role_pre` VALUES ('83924ddc-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '275');
INSERT INTO `t_role_pre` VALUES ('8398564f-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '279');
INSERT INTO `t_role_pre` VALUES ('839bb21c-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '261');
INSERT INTO `t_role_pre` VALUES ('839ed633-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '262');
INSERT INTO `t_role_pre` VALUES ('83a3b62f-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '263');
INSERT INTO `t_role_pre` VALUES ('83a76520-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '291');
INSERT INTO `t_role_pre` VALUES ('83af9e97-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '266');
INSERT INTO `t_role_pre` VALUES ('83b396cd-dbb7-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '267');
INSERT INTO `t_role_pre` VALUES ('876b4dbc-dca5-11e6-9ebd-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '305');
INSERT INTO `t_role_pre` VALUES ('877c01fe-dca5-11e6-9ebd-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '306');
INSERT INTO `t_role_pre` VALUES ('877e5383-dca5-11e6-9ebd-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '307');
INSERT INTO `t_role_pre` VALUES ('8785be73-dca5-11e6-9ebd-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '308');
INSERT INTO `t_role_pre` VALUES ('878a9900-dca5-11e6-9ebd-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '309');
INSERT INTO `t_role_pre` VALUES ('878da55a-dca5-11e6-9ebd-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '310');
INSERT INTO `t_role_pre` VALUES ('8790dd7f-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '261');
INSERT INTO `t_role_pre` VALUES ('8794ab7d-dca5-11e6-9ebd-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '311');
INSERT INTO `t_role_pre` VALUES ('87980ac0-dca5-11e6-9ebd-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '312');
INSERT INTO `t_role_pre` VALUES ('87a6cc0e-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '262');
INSERT INTO `t_role_pre` VALUES ('87b042d4-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '263');
INSERT INTO `t_role_pre` VALUES ('87b2a8e5-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '264');
INSERT INTO `t_role_pre` VALUES ('87b583c8-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '265');
INSERT INTO `t_role_pre` VALUES ('87bb8d37-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '266');
INSERT INTO `t_role_pre` VALUES ('87bfde04-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '267');
INSERT INTO `t_role_pre` VALUES ('87c56135-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '268');
INSERT INTO `t_role_pre` VALUES ('87c8b34d-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '269');
INSERT INTO `t_role_pre` VALUES ('87cb8df8-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '270');
INSERT INTO `t_role_pre` VALUES ('87d018b8-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '271');
INSERT INTO `t_role_pre` VALUES ('87d40110-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '272');
INSERT INTO `t_role_pre` VALUES ('87d8ee5b-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '273');
INSERT INTO `t_role_pre` VALUES ('87df5f3f-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '274');
INSERT INTO `t_role_pre` VALUES ('87e2d237-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '276');
INSERT INTO `t_role_pre` VALUES ('87e79700-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '277');
INSERT INTO `t_role_pre` VALUES ('87eb6d78-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '278');
INSERT INTO `t_role_pre` VALUES ('87f22dbd-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '279');
INSERT INTO `t_role_pre` VALUES ('87f5c306-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '280');
INSERT INTO `t_role_pre` VALUES ('87f95a94-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '281');
INSERT INTO `t_role_pre` VALUES ('87fc4131-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '283');
INSERT INTO `t_role_pre` VALUES ('8801c419-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '284');
INSERT INTO `t_role_pre` VALUES ('880566dd-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '285');
INSERT INTO `t_role_pre` VALUES ('88082724-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '286');
INSERT INTO `t_role_pre` VALUES ('88102044-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '287');
INSERT INTO `t_role_pre` VALUES ('8817c287-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '288');
INSERT INTO `t_role_pre` VALUES ('881d0057-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '289');
INSERT INTO `t_role_pre` VALUES ('8821acfc-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '290');
INSERT INTO `t_role_pre` VALUES ('8827b016-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '291');
INSERT INTO `t_role_pre` VALUES ('882e3cb5-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '292');
INSERT INTO `t_role_pre` VALUES ('88330986-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '293');
INSERT INTO `t_role_pre` VALUES ('8839e062-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '294');
INSERT INTO `t_role_pre` VALUES ('883edd3b-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '295');
INSERT INTO `t_role_pre` VALUES ('884181c2-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '296');
INSERT INTO `t_role_pre` VALUES ('88444237-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '297');
INSERT INTO `t_role_pre` VALUES ('8847613a-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '299');
INSERT INTO `t_role_pre` VALUES ('884c10f2-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '300');
INSERT INTO `t_role_pre` VALUES ('884f4121-d730-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '301');
INSERT INTO `t_role_pre` VALUES ('8cc8e0a9-d983-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '112');
INSERT INTO `t_role_pre` VALUES ('8d8fac2e-dc51-11e6-9ebd-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '241');
INSERT INTO `t_role_pre` VALUES ('923f823e-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '284');
INSERT INTO `t_role_pre` VALUES ('9241b6ea-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '286');
INSERT INTO `t_role_pre` VALUES ('924915d6-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '295');
INSERT INTO `t_role_pre` VALUES ('924b89c9-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '296');
INSERT INTO `t_role_pre` VALUES ('9258d664-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '290');
INSERT INTO `t_role_pre` VALUES ('925bc6f2-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '293');
INSERT INTO `t_role_pre` VALUES ('925f2e0a-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '299');
INSERT INTO `t_role_pre` VALUES ('9264c435-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '301');
INSERT INTO `t_role_pre` VALUES ('9267e0dc-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '289');
INSERT INTO `t_role_pre` VALUES ('926af1b0-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '280');
INSERT INTO `t_role_pre` VALUES ('9270ce2b-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '281');
INSERT INTO `t_role_pre` VALUES ('92748885-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '272');
INSERT INTO `t_role_pre` VALUES ('927a41d6-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '273');
INSERT INTO `t_role_pre` VALUES ('927d99d8-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '277');
INSERT INTO `t_role_pre` VALUES ('9280b809-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '278');
INSERT INTO `t_role_pre` VALUES ('92841f0c-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '271');
INSERT INTO `t_role_pre` VALUES ('9287308b-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '276');
INSERT INTO `t_role_pre` VALUES ('928a2c39-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '274');
INSERT INTO `t_role_pre` VALUES ('9290ed36-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '279');
INSERT INTO `t_role_pre` VALUES ('92952cb9-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '261');
INSERT INTO `t_role_pre` VALUES ('92997cb0-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '262');
INSERT INTO `t_role_pre` VALUES ('929cdd73-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '263');
INSERT INTO `t_role_pre` VALUES ('92a1909c-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '43');
INSERT INTO `t_role_pre` VALUES ('92a48bfd-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '44');
INSERT INTO `t_role_pre` VALUES ('92a77486-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '45');
INSERT INTO `t_role_pre` VALUES ('92ad33c4-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '46');
INSERT INTO `t_role_pre` VALUES ('92b0791e-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '47');
INSERT INTO `t_role_pre` VALUES ('92b3cb5d-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '48');
INSERT INTO `t_role_pre` VALUES ('92b89c06-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '49');
INSERT INTO `t_role_pre` VALUES ('92bc8f64-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '266');
INSERT INTO `t_role_pre` VALUES ('92c1d36b-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '267');
INSERT INTO `t_role_pre` VALUES ('92c6919f-d730-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '283');
INSERT INTO `t_role_pre` VALUES ('9338a91e-dc8b-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '303');
INSERT INTO `t_role_pre` VALUES ('934e5970-dc8b-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '304');
INSERT INTO `t_role_pre` VALUES ('9c472cb0-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '261');
INSERT INTO `t_role_pre` VALUES ('9c49adf8-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '262');
INSERT INTO `t_role_pre` VALUES ('9c5be313-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '263');
INSERT INTO `t_role_pre` VALUES ('9c5ec2f5-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '272');
INSERT INTO `t_role_pre` VALUES ('9c616c1d-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '273');
INSERT INTO `t_role_pre` VALUES ('9c6676f9-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '274');
INSERT INTO `t_role_pre` VALUES ('9c6a79ff-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '275');
INSERT INTO `t_role_pre` VALUES ('9c6d66db-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '276');
INSERT INTO `t_role_pre` VALUES ('9c72caa0-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '277');
INSERT INTO `t_role_pre` VALUES ('9c76107e-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '278');
INSERT INTO `t_role_pre` VALUES ('9c793d84-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '279');
INSERT INTO `t_role_pre` VALUES ('9c7e5077-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '280');
INSERT INTO `t_role_pre` VALUES ('9c82531a-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '281');
INSERT INTO `t_role_pre` VALUES ('9c860f53-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '283');
INSERT INTO `t_role_pre` VALUES ('9c8a518f-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '284');
INSERT INTO `t_role_pre` VALUES ('9c8dc801-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '286');
INSERT INTO `t_role_pre` VALUES ('9c922e78-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '287');
INSERT INTO `t_role_pre` VALUES ('9c963906-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '288');
INSERT INTO `t_role_pre` VALUES ('9c9949fc-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '289');
INSERT INTO `t_role_pre` VALUES ('9c9e4572-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '290');
INSERT INTO `t_role_pre` VALUES ('9ca1fc8f-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '291');
INSERT INTO `t_role_pre` VALUES ('9caad314-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '293');
INSERT INTO `t_role_pre` VALUES ('9cae0667-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '294');
INSERT INTO `t_role_pre` VALUES ('9cb15b1b-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '295');
INSERT INTO `t_role_pre` VALUES ('9cb60ec0-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '296');
INSERT INTO `t_role_pre` VALUES ('9cb9a5ab-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '297');
INSERT INTO `t_role_pre` VALUES ('9cbd6e5b-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '298');
INSERT INTO `t_role_pre` VALUES ('9cc22d3a-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '299');
INSERT INTO `t_role_pre` VALUES ('9cc56885-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '300');
INSERT INTO `t_role_pre` VALUES ('9ccca648-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '301');
INSERT INTO `t_role_pre` VALUES ('9cd05e31-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '252');
INSERT INTO `t_role_pre` VALUES ('9cd5d39a-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '253');
INSERT INTO `t_role_pre` VALUES ('9cda037a-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '251');
INSERT INTO `t_role_pre` VALUES ('9cdd2a81-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '256');
INSERT INTO `t_role_pre` VALUES ('9ce1d3f1-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '159');
INSERT INTO `t_role_pre` VALUES ('9ce577fa-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '153');
INSERT INTO `t_role_pre` VALUES ('9ceaca41-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '147');
INSERT INTO `t_role_pre` VALUES ('9cef8f1b-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '140');
INSERT INTO `t_role_pre` VALUES ('9cf35a61-d730-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '111');
INSERT INTO `t_role_pre` VALUES ('a2c185da-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '261');
INSERT INTO `t_role_pre` VALUES ('a2c3641b-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '262');
INSERT INTO `t_role_pre` VALUES ('a2c5fea5-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '263');
INSERT INTO `t_role_pre` VALUES ('a2cbaeb0-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '272');
INSERT INTO `t_role_pre` VALUES ('a2cf1c03-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '273');
INSERT INTO `t_role_pre` VALUES ('a2d55ee5-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '274');
INSERT INTO `t_role_pre` VALUES ('a2d83966-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '275');
INSERT INTO `t_role_pre` VALUES ('a2de6a30-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '276');
INSERT INTO `t_role_pre` VALUES ('a2e0e8f6-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '277');
INSERT INTO `t_role_pre` VALUES ('a2e45b62-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '278');
INSERT INTO `t_role_pre` VALUES ('a2ea6c5e-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '279');
INSERT INTO `t_role_pre` VALUES ('a2ed796f-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '280');
INSERT INTO `t_role_pre` VALUES ('a2f14c36-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '281');
INSERT INTO `t_role_pre` VALUES ('a2f77757-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '282');
INSERT INTO `t_role_pre` VALUES ('a2fb0829-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '283');
INSERT INTO `t_role_pre` VALUES ('a301e2f2-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '284');
INSERT INTO `t_role_pre` VALUES ('a3053b0a-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '285');
INSERT INTO `t_role_pre` VALUES ('a30b6aa9-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '286');
INSERT INTO `t_role_pre` VALUES ('a31133b6-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '287');
INSERT INTO `t_role_pre` VALUES ('a3159e70-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '288');
INSERT INTO `t_role_pre` VALUES ('a319b96e-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '289');
INSERT INTO `t_role_pre` VALUES ('a319d7b9-dc8b-11e6-9ebd-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '303');
INSERT INTO `t_role_pre` VALUES ('a31ce26a-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '289');
INSERT INTO `t_role_pre` VALUES ('a321c17e-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '290');
INSERT INTO `t_role_pre` VALUES ('a325a226-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '291');
INSERT INTO `t_role_pre` VALUES ('a32ae401-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '292');
INSERT INTO `t_role_pre` VALUES ('a32ef4e7-dc8b-11e6-9ebd-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '304');
INSERT INTO `t_role_pre` VALUES ('a32f87f2-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '293');
INSERT INTO `t_role_pre` VALUES ('a3328981-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '295');
INSERT INTO `t_role_pre` VALUES ('a335c387-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '296');
INSERT INTO `t_role_pre` VALUES ('a338db30-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '297');
INSERT INTO `t_role_pre` VALUES ('a33e83e6-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '299');
INSERT INTO `t_role_pre` VALUES ('a341fdab-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '300');
INSERT INTO `t_role_pre` VALUES ('a344f496-d730-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '301');
INSERT INTO `t_role_pre` VALUES ('a74e272c-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '261');
INSERT INTO `t_role_pre` VALUES ('a75fc504-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '262');
INSERT INTO `t_role_pre` VALUES ('a7624275-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '263');
INSERT INTO `t_role_pre` VALUES ('a76923b5-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '264');
INSERT INTO `t_role_pre` VALUES ('a771fafb-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '265');
INSERT INTO `t_role_pre` VALUES ('a775ced0-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '266');
INSERT INTO `t_role_pre` VALUES ('a7796f6c-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '267');
INSERT INTO `t_role_pre` VALUES ('a77f3e7d-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '268');
INSERT INTO `t_role_pre` VALUES ('a783bad3-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '269');
INSERT INTO `t_role_pre` VALUES ('a787880e-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '270');
INSERT INTO `t_role_pre` VALUES ('a78a6678-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '271');
INSERT INTO `t_role_pre` VALUES ('a78f4e15-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '272');
INSERT INTO `t_role_pre` VALUES ('a7925f59-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '273');
INSERT INTO `t_role_pre` VALUES ('a799b49d-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '274');
INSERT INTO `t_role_pre` VALUES ('a79ecd94-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '275');
INSERT INTO `t_role_pre` VALUES ('a7a1eb7d-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '276');
INSERT INTO `t_role_pre` VALUES ('a7a47c4e-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '277');
INSERT INTO `t_role_pre` VALUES ('a7a731ac-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '278');
INSERT INTO `t_role_pre` VALUES ('a7ac4995-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '279');
INSERT INTO `t_role_pre` VALUES ('a7b17e69-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '280');
INSERT INTO `t_role_pre` VALUES ('a7b47619-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '281');
INSERT INTO `t_role_pre` VALUES ('a7b79981-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '282');
INSERT INTO `t_role_pre` VALUES ('a7bd3932-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '283');
INSERT INTO `t_role_pre` VALUES ('a7c2de3b-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '284');
INSERT INTO `t_role_pre` VALUES ('a7c916a0-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '285');
INSERT INTO `t_role_pre` VALUES ('a7cca05e-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '286');
INSERT INTO `t_role_pre` VALUES ('a7d1e49d-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '287');
INSERT INTO `t_role_pre` VALUES ('a7d692f7-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '288');
INSERT INTO `t_role_pre` VALUES ('a7dbbd96-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '289');
INSERT INTO `t_role_pre` VALUES ('a7e068ed-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '290');
INSERT INTO `t_role_pre` VALUES ('a7e491f0-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '291');
INSERT INTO `t_role_pre` VALUES ('a7eaf134-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '292');
INSERT INTO `t_role_pre` VALUES ('a7ee537d-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '293');
INSERT INTO `t_role_pre` VALUES ('a7f4a311-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '294');
INSERT INTO `t_role_pre` VALUES ('a7f83666-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '295');
INSERT INTO `t_role_pre` VALUES ('a7fafc30-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '296');
INSERT INTO `t_role_pre` VALUES ('a800fd70-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '297');
INSERT INTO `t_role_pre` VALUES ('a803e143-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '298');
INSERT INTO `t_role_pre` VALUES ('a806b9a9-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '299');
INSERT INTO `t_role_pre` VALUES ('a80c44ce-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '300');
INSERT INTO `t_role_pre` VALUES ('a81010af-dbc1-11e6-9ebd-507b9d765567', '40288092593a25c801593a478d080000', '301');
INSERT INTO `t_role_pre` VALUES ('ba11bf01-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '2');
INSERT INTO `t_role_pre` VALUES ('ba17c38f-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '39');
INSERT INTO `t_role_pre` VALUES ('ba1b1388-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '70');
INSERT INTO `t_role_pre` VALUES ('ba1df79b-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '77');
INSERT INTO `t_role_pre` VALUES ('ba229b62-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '79');
INSERT INTO `t_role_pre` VALUES ('ba262b16-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '78');
INSERT INTO `t_role_pre` VALUES ('ba291249-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '82');
INSERT INTO `t_role_pre` VALUES ('ba2f2e0b-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '83');
INSERT INTO `t_role_pre` VALUES ('ba353ae7-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '80');
INSERT INTO `t_role_pre` VALUES ('ba39300a-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '81');
INSERT INTO `t_role_pre` VALUES ('ba3f8e09-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '84');
INSERT INTO `t_role_pre` VALUES ('ba4390bd-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '85');
INSERT INTO `t_role_pre` VALUES ('ba47f106-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '86');
INSERT INTO `t_role_pre` VALUES ('ba4d421d-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '87');
INSERT INTO `t_role_pre` VALUES ('ba50e364-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '88');
INSERT INTO `t_role_pre` VALUES ('ba56c030-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '90');
INSERT INTO `t_role_pre` VALUES ('ba5a73b5-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '96');
INSERT INTO `t_role_pre` VALUES ('ba5d7bbc-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '99');
INSERT INTO `t_role_pre` VALUES ('ba62d2f9-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '100');
INSERT INTO `t_role_pre` VALUES ('ba6648c4-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '101');
INSERT INTO `t_role_pre` VALUES ('ba6917e4-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '102');
INSERT INTO `t_role_pre` VALUES ('ba6e984f-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '103');
INSERT INTO `t_role_pre` VALUES ('ba726e35-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '104');
INSERT INTO `t_role_pre` VALUES ('ba7533b2-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '105');
INSERT INTO `t_role_pre` VALUES ('ba7a5fd2-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '106');
INSERT INTO `t_role_pre` VALUES ('ba7dd9b0-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '107');
INSERT INTO `t_role_pre` VALUES ('ba830055-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '108');
INSERT INTO `t_role_pre` VALUES ('ba897572-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '109');
INSERT INTO `t_role_pre` VALUES ('ba8f301e-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '110');
INSERT INTO `t_role_pre` VALUES ('ba926f1e-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '111');
INSERT INTO `t_role_pre` VALUES ('ba958ac9-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '112');
INSERT INTO `t_role_pre` VALUES ('ba97b68d-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '113');
INSERT INTO `t_role_pre` VALUES ('ba9d9b3c-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '114');
INSERT INTO `t_role_pre` VALUES ('baa025b4-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '115');
INSERT INTO `t_role_pre` VALUES ('baa41665-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '116');
INSERT INTO `t_role_pre` VALUES ('baaa0247-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '117');
INSERT INTO `t_role_pre` VALUES ('baad31cf-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '118');
INSERT INTO `t_role_pre` VALUES ('baafb867-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '119');
INSERT INTO `t_role_pre` VALUES ('bab72132-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '120');
INSERT INTO `t_role_pre` VALUES ('babb3072-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '121');
INSERT INTO `t_role_pre` VALUES ('babe6758-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '122');
INSERT INTO `t_role_pre` VALUES ('bac2e51d-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '123');
INSERT INTO `t_role_pre` VALUES ('bac6bba6-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '124');
INSERT INTO `t_role_pre` VALUES ('bacd3787-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '125');
INSERT INTO `t_role_pre` VALUES ('bad32727-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '126');
INSERT INTO `t_role_pre` VALUES ('bad5ed69-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '127');
INSERT INTO `t_role_pre` VALUES ('badcb09f-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '128');
INSERT INTO `t_role_pre` VALUES ('bae077f8-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '129');
INSERT INTO `t_role_pre` VALUES ('bae6b96f-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '132');
INSERT INTO `t_role_pre` VALUES ('baea107d-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '133');
INSERT INTO `t_role_pre` VALUES ('baece7f4-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '134');
INSERT INTO `t_role_pre` VALUES ('baf28f17-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '136');
INSERT INTO `t_role_pre` VALUES ('baf93426-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '138');
INSERT INTO `t_role_pre` VALUES ('bafc872e-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '139');
INSERT INTO `t_role_pre` VALUES ('baff206b-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '140');
INSERT INTO `t_role_pre` VALUES ('bb04cf4f-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '141');
INSERT INTO `t_role_pre` VALUES ('bb08cc08-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '143');
INSERT INTO `t_role_pre` VALUES ('bb0f2d5e-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '147');
INSERT INTO `t_role_pre` VALUES ('bb119ee0-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '148');
INSERT INTO `t_role_pre` VALUES ('bb1798d7-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '149');
INSERT INTO `t_role_pre` VALUES ('bb1bb1e1-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '150');
INSERT INTO `t_role_pre` VALUES ('bb1e5a08-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '151');
INSERT INTO `t_role_pre` VALUES ('bb20c565-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '152');
INSERT INTO `t_role_pre` VALUES ('bb27d081-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '153');
INSERT INTO `t_role_pre` VALUES ('bb2a628f-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '154');
INSERT INTO `t_role_pre` VALUES ('bb2d4aad-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '155');
INSERT INTO `t_role_pre` VALUES ('bb359c0a-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '156');
INSERT INTO `t_role_pre` VALUES ('bb3833f8-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '157');
INSERT INTO `t_role_pre` VALUES ('bb47840d-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '158');
INSERT INTO `t_role_pre` VALUES ('bb4c69a5-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '159');
INSERT INTO `t_role_pre` VALUES ('bb52e94d-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '160');
INSERT INTO `t_role_pre` VALUES ('bb579a0a-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '161');
INSERT INTO `t_role_pre` VALUES ('bb5d0f59-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '162');
INSERT INTO `t_role_pre` VALUES ('bb6172ec-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '163');
INSERT INTO `t_role_pre` VALUES ('bb687d62-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '164');
INSERT INTO `t_role_pre` VALUES ('bb6d47b2-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '165');
INSERT INTO `t_role_pre` VALUES ('bb731f48-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '169');
INSERT INTO `t_role_pre` VALUES ('bb76c961-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '170');
INSERT INTO `t_role_pre` VALUES ('bb7bc8d1-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '171');
INSERT INTO `t_role_pre` VALUES ('bb7f1168-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '175');
INSERT INTO `t_role_pre` VALUES ('bb836a71-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '176');
INSERT INTO `t_role_pre` VALUES ('bb88831e-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '177');
INSERT INTO `t_role_pre` VALUES ('bb8c8057-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '181');
INSERT INTO `t_role_pre` VALUES ('bb8f2702-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '182');
INSERT INTO `t_role_pre` VALUES ('bb94d049-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '183');
INSERT INTO `t_role_pre` VALUES ('bb981ba6-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '184');
INSERT INTO `t_role_pre` VALUES ('bb9cd4f5-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '185');
INSERT INTO `t_role_pre` VALUES ('bba235a6-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '186');
INSERT INTO `t_role_pre` VALUES ('bba5d1b7-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '187');
INSERT INTO `t_role_pre` VALUES ('bba904f1-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '188');
INSERT INTO `t_role_pre` VALUES ('bbade136-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '189');
INSERT INTO `t_role_pre` VALUES ('bbb14d0d-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '190');
INSERT INTO `t_role_pre` VALUES ('bbb3e217-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '191');
INSERT INTO `t_role_pre` VALUES ('bbb9a5dd-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '192');
INSERT INTO `t_role_pre` VALUES ('bbbda370-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '193');
INSERT INTO `t_role_pre` VALUES ('bbc406dd-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '194');
INSERT INTO `t_role_pre` VALUES ('bbc78493-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '195');
INSERT INTO `t_role_pre` VALUES ('bbca5bd6-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '196');
INSERT INTO `t_role_pre` VALUES ('bbcf6946-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '197');
INSERT INTO `t_role_pre` VALUES ('bbd4d6cc-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '198');
INSERT INTO `t_role_pre` VALUES ('bbd79124-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '199');
INSERT INTO `t_role_pre` VALUES ('bbdd783f-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '200');
INSERT INTO `t_role_pre` VALUES ('bbe0f4bd-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '201');
INSERT INTO `t_role_pre` VALUES ('bbe35ba4-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '202');
INSERT INTO `t_role_pre` VALUES ('bbe8f369-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '212');
INSERT INTO `t_role_pre` VALUES ('bbec895d-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '236');
INSERT INTO `t_role_pre` VALUES ('bbf03be6-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '50');
INSERT INTO `t_role_pre` VALUES ('bbf2e0e0-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '51');
INSERT INTO `t_role_pre` VALUES ('bbf59f6e-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '52');
INSERT INTO `t_role_pre` VALUES ('bbfb6a1a-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '53');
INSERT INTO `t_role_pre` VALUES ('bbff22a2-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '54');
INSERT INTO `t_role_pre` VALUES ('bc01e005-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '55');
INSERT INTO `t_role_pre` VALUES ('bc07df59-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '56');
INSERT INTO `t_role_pre` VALUES ('bc0b5bb5-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '57');
INSERT INTO `t_role_pre` VALUES ('bc0fd376-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '58');
INSERT INTO `t_role_pre` VALUES ('bc15f713-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '59');
INSERT INTO `t_role_pre` VALUES ('bc19096c-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '60');
INSERT INTO `t_role_pre` VALUES ('bc1fb778-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '61');
INSERT INTO `t_role_pre` VALUES ('bc22fa54-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '62');
INSERT INTO `t_role_pre` VALUES ('bc25a300-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '39');
INSERT INTO `t_role_pre` VALUES ('bc2ab85e-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '30');
INSERT INTO `t_role_pre` VALUES ('bc3259c7-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '31');
INSERT INTO `t_role_pre` VALUES ('bc37c134-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '32');
INSERT INTO `t_role_pre` VALUES ('bc3adee9-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '33');
INSERT INTO `t_role_pre` VALUES ('bc4182b3-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '34');
INSERT INTO `t_role_pre` VALUES ('bc461f06-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '35');
INSERT INTO `t_role_pre` VALUES ('bc4b7f40-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '36');
INSERT INTO `t_role_pre` VALUES ('bc4eb01a-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '43');
INSERT INTO `t_role_pre` VALUES ('bc53e9ac-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '44');
INSERT INTO `t_role_pre` VALUES ('bc57a5b2-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '45');
INSERT INTO `t_role_pre` VALUES ('bc5d90b1-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '46');
INSERT INTO `t_role_pre` VALUES ('bc63a667-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '47');
INSERT INTO `t_role_pre` VALUES ('bc6bed1c-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '48');
INSERT INTO `t_role_pre` VALUES ('bc6ef57c-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '49');
INSERT INTO `t_role_pre` VALUES ('bc7581b0-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '240');
INSERT INTO `t_role_pre` VALUES ('bc78d68e-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '236');
INSERT INTO `t_role_pre` VALUES ('bc7b47a1-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '240');
INSERT INTO `t_role_pre` VALUES ('bc80dfab-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '2');
INSERT INTO `t_role_pre` VALUES ('bc84ca5e-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '70');
INSERT INTO `t_role_pre` VALUES ('bc8772e7-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '71');
INSERT INTO `t_role_pre` VALUES ('bc89b7a0-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '73');
INSERT INTO `t_role_pre` VALUES ('bc8cd868-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '74');
INSERT INTO `t_role_pre` VALUES ('bc920fc2-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '71');
INSERT INTO `t_role_pre` VALUES ('bc958d7c-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '73');
INSERT INTO `t_role_pre` VALUES ('bc99286f-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '74');
INSERT INTO `t_role_pre` VALUES ('bc9bf1d4-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '84');
INSERT INTO `t_role_pre` VALUES ('bca13e8f-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '85');
INSERT INTO `t_role_pre` VALUES ('bca590f2-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '86');
INSERT INTO `t_role_pre` VALUES ('bcaa0201-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '87');
INSERT INTO `t_role_pre` VALUES ('bcad8a24-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '88');
INSERT INTO `t_role_pre` VALUES ('bcaf3b64-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '77');
INSERT INTO `t_role_pre` VALUES ('bcb3c765-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '78');
INSERT INTO `t_role_pre` VALUES ('bcb4f036-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '79');
INSERT INTO `t_role_pre` VALUES ('bcb6debd-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '80');
INSERT INTO `t_role_pre` VALUES ('bcbc328d-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '81');
INSERT INTO `t_role_pre` VALUES ('bcbfd662-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '82');
INSERT INTO `t_role_pre` VALUES ('bcc14c26-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '83');
INSERT INTO `t_role_pre` VALUES ('bcc69918-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '50');
INSERT INTO `t_role_pre` VALUES ('bccb3d8a-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '51');
INSERT INTO `t_role_pre` VALUES ('bccd0cf1-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '52');
INSERT INTO `t_role_pre` VALUES ('bcd4ab17-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '53');
INSERT INTO `t_role_pre` VALUES ('bcd7cf44-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '54');
INSERT INTO `t_role_pre` VALUES ('bcded3a0-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '55');
INSERT INTO `t_role_pre` VALUES ('bce1d8e1-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '56');
INSERT INTO `t_role_pre` VALUES ('bce88769-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '39');
INSERT INTO `t_role_pre` VALUES ('bcec7476-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '42');
INSERT INTO `t_role_pre` VALUES ('bcf2b474-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '57');
INSERT INTO `t_role_pre` VALUES ('bcf518d1-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '58');
INSERT INTO `t_role_pre` VALUES ('bcf744c0-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '59');
INSERT INTO `t_role_pre` VALUES ('bcfdb378-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '60');
INSERT INTO `t_role_pre` VALUES ('bd00ab09-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '61');
INSERT INTO `t_role_pre` VALUES ('bd038e58-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '62');
INSERT INTO `t_role_pre` VALUES ('bd097fb9-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '90');
INSERT INTO `t_role_pre` VALUES ('bd0d6e61-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '95');
INSERT INTO `t_role_pre` VALUES ('bd0f12fb-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '96');
INSERT INTO `t_role_pre` VALUES ('bd14efe9-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '99');
INSERT INTO `t_role_pre` VALUES ('bd18ddf8-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '100');
INSERT INTO `t_role_pre` VALUES ('bd1b1916-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '101');
INSERT INTO `t_role_pre` VALUES ('bd2137bc-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '102');
INSERT INTO `t_role_pre` VALUES ('bd22ed87-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '103');
INSERT INTO `t_role_pre` VALUES ('bd24b414-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '104');
INSERT INTO `t_role_pre` VALUES ('bd26e36b-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '30');
INSERT INTO `t_role_pre` VALUES ('bd296f30-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '31');
INSERT INTO `t_role_pre` VALUES ('bd2e1337-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '32');
INSERT INTO `t_role_pre` VALUES ('bd31dc8d-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '33');
INSERT INTO `t_role_pre` VALUES ('bd32c0b2-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '34');
INSERT INTO `t_role_pre` VALUES ('bd34518d-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '35');
INSERT INTO `t_role_pre` VALUES ('bd395da2-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '36');
INSERT INTO `t_role_pre` VALUES ('bd3cd448-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '182');
INSERT INTO `t_role_pre` VALUES ('bd3e2927-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '183');
INSERT INTO `t_role_pre` VALUES ('bd3f285b-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '184');
INSERT INTO `t_role_pre` VALUES ('bd400920-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '185');
INSERT INTO `t_role_pre` VALUES ('bd418ebe-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '186');
INSERT INTO `t_role_pre` VALUES ('bd433e52-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '187');
INSERT INTO `t_role_pre` VALUES ('bd48805c-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '188');
INSERT INTO `t_role_pre` VALUES ('bd4c30db-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '189');
INSERT INTO `t_role_pre` VALUES ('bd4d2edc-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '190');
INSERT INTO `t_role_pre` VALUES ('bd4efa67-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '191');
INSERT INTO `t_role_pre` VALUES ('bd50381f-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '192');
INSERT INTO `t_role_pre` VALUES ('bd515f4d-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '193');
INSERT INTO `t_role_pre` VALUES ('bd5273d2-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '194');
INSERT INTO `t_role_pre` VALUES ('bd53fb7a-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '195');
INSERT INTO `t_role_pre` VALUES ('bd59d7f5-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '196');
INSERT INTO `t_role_pre` VALUES ('bd5ac63d-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '197');
INSERT INTO `t_role_pre` VALUES ('bd5b93f2-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '198');
INSERT INTO `t_role_pre` VALUES ('bd5e8983-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '199');
INSERT INTO `t_role_pre` VALUES ('bd5f8f48-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '200');
INSERT INTO `t_role_pre` VALUES ('bd6077eb-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '201');
INSERT INTO `t_role_pre` VALUES ('bd61bddf-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '202');
INSERT INTO `t_role_pre` VALUES ('bd637601-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '105');
INSERT INTO `t_role_pre` VALUES ('bd68e14e-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '106');
INSERT INTO `t_role_pre` VALUES ('bd6c5407-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '107');
INSERT INTO `t_role_pre` VALUES ('bd6d4f9b-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '108');
INSERT INTO `t_role_pre` VALUES ('bd744006-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '109');
INSERT INTO `t_role_pre` VALUES ('bd778190-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '110');
INSERT INTO `t_role_pre` VALUES ('bd7ab29e-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '111');
INSERT INTO `t_role_pre` VALUES ('bd823395-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '112');
INSERT INTO `t_role_pre` VALUES ('bd860911-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '114');
INSERT INTO `t_role_pre` VALUES ('bd8b77f1-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '115');
INSERT INTO `t_role_pre` VALUES ('bd8ed72b-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '119');
INSERT INTO `t_role_pre` VALUES ('bd956ff3-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '123');
INSERT INTO `t_role_pre` VALUES ('bd98eb0a-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '127');
INSERT INTO `t_role_pre` VALUES ('bd9ae07a-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '149');
INSERT INTO `t_role_pre` VALUES ('bda2d543-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '153');
INSERT INTO `t_role_pre` VALUES ('bdbc1447-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '155');
INSERT INTO `t_role_pre` VALUES ('bdbd0e4e-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '159');
INSERT INTO `t_role_pre` VALUES ('bdc0c6fc-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '143');
INSERT INTO `t_role_pre` VALUES ('bdc70eff-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '147');
INSERT INTO `t_role_pre` VALUES ('bdcb019d-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '105');
INSERT INTO `t_role_pre` VALUES ('bdce0f84-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '106');
INSERT INTO `t_role_pre` VALUES ('bdd20e47-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '111');
INSERT INTO `t_role_pre` VALUES ('bdd31c1a-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '102');
INSERT INTO `t_role_pre` VALUES ('bddb55a5-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '132');
INSERT INTO `t_role_pre` VALUES ('bddc4eda-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '133');
INSERT INTO `t_role_pre` VALUES ('bdddca69-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '134');
INSERT INTO `t_role_pre` VALUES ('bde07c9f-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '161');
INSERT INTO `t_role_pre` VALUES ('bde1d537-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '164');
INSERT INTO `t_role_pre` VALUES ('bde7b7ba-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '165');
INSERT INTO `t_role_pre` VALUES ('bdeaee57-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '169');
INSERT INTO `t_role_pre` VALUES ('bdec67b2-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '170');
INSERT INTO `t_role_pre` VALUES ('bdf18652-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '171');
INSERT INTO `t_role_pre` VALUES ('bdf56d7a-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '175');
INSERT INTO `t_role_pre` VALUES ('bdf657de-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '176');
INSERT INTO `t_role_pre` VALUES ('bdf80d0f-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '177');
INSERT INTO `t_role_pre` VALUES ('bdf9853e-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '181');
INSERT INTO `t_role_pre` VALUES ('be00306b-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '43');
INSERT INTO `t_role_pre` VALUES ('be04157c-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '44');
INSERT INTO `t_role_pre` VALUES ('be06e9f5-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '45');
INSERT INTO `t_role_pre` VALUES ('be0bea18-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '46');
INSERT INTO `t_role_pre` VALUES ('be11a47b-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '47');
INSERT INTO `t_role_pre` VALUES ('be1546ed-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '48');
INSERT INTO `t_role_pre` VALUES ('be19090c-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '49');
INSERT INTO `t_role_pre` VALUES ('be2fada8-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '216');
INSERT INTO `t_role_pre` VALUES ('be321700-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '218');
INSERT INTO `t_role_pre` VALUES ('be345940-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '219');
INSERT INTO `t_role_pre` VALUES ('be3923bf-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '216');
INSERT INTO `t_role_pre` VALUES ('be40eb36-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '218');
INSERT INTO `t_role_pre` VALUES ('be4421dc-d6f6-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '219');
INSERT INTO `t_role_pre` VALUES ('be4a9a73-d6f6-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '212');
INSERT INTO `t_role_pre` VALUES ('be4d4b68-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '1');
INSERT INTO `t_role_pre` VALUES ('be53b61d-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '2');
INSERT INTO `t_role_pre` VALUES ('be57773f-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '3');
INSERT INTO `t_role_pre` VALUES ('be5c4f13-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '4');
INSERT INTO `t_role_pre` VALUES ('be61b96d-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '5');
INSERT INTO `t_role_pre` VALUES ('be6515e9-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '6');
INSERT INTO `t_role_pre` VALUES ('be6c08de-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '7');
INSERT INTO `t_role_pre` VALUES ('be703975-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '8');
INSERT INTO `t_role_pre` VALUES ('be722d2e-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '9');
INSERT INTO `t_role_pre` VALUES ('be7750c8-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '10');
INSERT INTO `t_role_pre` VALUES ('be7b4a94-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '11');
INSERT INTO `t_role_pre` VALUES ('be7d12e6-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '12');
INSERT INTO `t_role_pre` VALUES ('be7ef40f-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '13');
INSERT INTO `t_role_pre` VALUES ('be803229-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '14');
INSERT INTO `t_role_pre` VALUES ('be81fd4a-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '15');
INSERT INTO `t_role_pre` VALUES ('be835a31-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '16');
INSERT INTO `t_role_pre` VALUES ('be84c490-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '17');
INSERT INTO `t_role_pre` VALUES ('be859905-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '18');
INSERT INTO `t_role_pre` VALUES ('be8783c9-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '19');
INSERT INTO `t_role_pre` VALUES ('be8cd5f6-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '20');
INSERT INTO `t_role_pre` VALUES ('be909c7a-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '21');
INSERT INTO `t_role_pre` VALUES ('be917dee-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '22');
INSERT INTO `t_role_pre` VALUES ('be92b43f-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '23');
INSERT INTO `t_role_pre` VALUES ('be939559-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '24');
INSERT INTO `t_role_pre` VALUES ('be954d66-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '25');
INSERT INTO `t_role_pre` VALUES ('be970fdf-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '26');
INSERT INTO `t_role_pre` VALUES ('be9d907b-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '27');
INSERT INTO `t_role_pre` VALUES ('bea1a7bb-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '28');
INSERT INTO `t_role_pre` VALUES ('bea62924-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '29');
INSERT INTO `t_role_pre` VALUES ('beaa06dc-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '30');
INSERT INTO `t_role_pre` VALUES ('beadb6bd-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '31');
INSERT INTO `t_role_pre` VALUES ('beb28f62-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '32');
INSERT INTO `t_role_pre` VALUES ('beb9584b-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '33');
INSERT INTO `t_role_pre` VALUES ('bebc09c4-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '34');
INSERT INTO `t_role_pre` VALUES ('bebfcca3-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '35');
INSERT INTO `t_role_pre` VALUES ('bec14d2d-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '36');
INSERT INTO `t_role_pre` VALUES ('bec2f438-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '37');
INSERT INTO `t_role_pre` VALUES ('bec8ebcb-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '38');
INSERT INTO `t_role_pre` VALUES ('becc5249-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '39');
INSERT INTO `t_role_pre` VALUES ('becdf1bb-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '40');
INSERT INTO `t_role_pre` VALUES ('becf9078-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '41');
INSERT INTO `t_role_pre` VALUES ('bed15521-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '42');
INSERT INTO `t_role_pre` VALUES ('bed2ddc9-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '43');
INSERT INTO `t_role_pre` VALUES ('bed43e2f-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '44');
INSERT INTO `t_role_pre` VALUES ('bed65e30-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '45');
INSERT INTO `t_role_pre` VALUES ('bedc58ec-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '46');
INSERT INTO `t_role_pre` VALUES ('bee01339-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '47');
INSERT INTO `t_role_pre` VALUES ('bee52451-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '48');
INSERT INTO `t_role_pre` VALUES ('bee94ce8-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '49');
INSERT INTO `t_role_pre` VALUES ('beec49d7-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '50');
INSERT INTO `t_role_pre` VALUES ('beedec9f-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '51');
INSERT INTO `t_role_pre` VALUES ('beeed7a6-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '52');
INSERT INTO `t_role_pre` VALUES ('bef00cf6-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '53');
INSERT INTO `t_role_pre` VALUES ('bef2138f-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '54');
INSERT INTO `t_role_pre` VALUES ('bef3225e-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '55');
INSERT INTO `t_role_pre` VALUES ('bef47d27-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '56');
INSERT INTO `t_role_pre` VALUES ('bef556fd-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '57');
INSERT INTO `t_role_pre` VALUES ('bef7393c-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '58');
INSERT INTO `t_role_pre` VALUES ('bef813f0-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '59');
INSERT INTO `t_role_pre` VALUES ('bef94bb9-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '60');
INSERT INTO `t_role_pre` VALUES ('befa36af-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '61');
INSERT INTO `t_role_pre` VALUES ('befb6ec1-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '62');
INSERT INTO `t_role_pre` VALUES ('befc50a8-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '63');
INSERT INTO `t_role_pre` VALUES ('befde8ab-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '64');
INSERT INTO `t_role_pre` VALUES ('bf030dca-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '65');
INSERT INTO `t_role_pre` VALUES ('bf0716f1-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '66');
INSERT INTO `t_role_pre` VALUES ('bf08030d-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '67');
INSERT INTO `t_role_pre` VALUES ('bf0952e9-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '68');
INSERT INTO `t_role_pre` VALUES ('bf0b200f-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '69');
INSERT INTO `t_role_pre` VALUES ('bf0c4a59-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '70');
INSERT INTO `t_role_pre` VALUES ('bf0d6ae1-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '71');
INSERT INTO `t_role_pre` VALUES ('bf0ea51f-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '72');
INSERT INTO `t_role_pre` VALUES ('bf13f4fa-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '73');
INSERT INTO `t_role_pre` VALUES ('bf19191d-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '74');
INSERT INTO `t_role_pre` VALUES ('bf1c184d-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '75');
INSERT INTO `t_role_pre` VALUES ('bf22cfcd-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '76');
INSERT INTO `t_role_pre` VALUES ('bf254d06-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '77');
INSERT INTO `t_role_pre` VALUES ('bf29f620-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '78');
INSERT INTO `t_role_pre` VALUES ('bf2d9627-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '79');
INSERT INTO `t_role_pre` VALUES ('bf30d5f4-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '80');
INSERT INTO `t_role_pre` VALUES ('bf31f965-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '81');
INSERT INTO `t_role_pre` VALUES ('bf38c97c-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '82');
INSERT INTO `t_role_pre` VALUES ('bf3d7f92-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '83');
INSERT INTO `t_role_pre` VALUES ('bf42d91d-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '84');
INSERT INTO `t_role_pre` VALUES ('bf468e30-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '85');
INSERT INTO `t_role_pre` VALUES ('bf4acd3b-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '86');
INSERT INTO `t_role_pre` VALUES ('bf501287-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '87');
INSERT INTO `t_role_pre` VALUES ('bf54709b-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '88');
INSERT INTO `t_role_pre` VALUES ('bf59790c-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '89');
INSERT INTO `t_role_pre` VALUES ('bf5d2332-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '90');
INSERT INTO `t_role_pre` VALUES ('bf622333-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '91');
INSERT INTO `t_role_pre` VALUES ('bf65cff0-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '92');
INSERT INTO `t_role_pre` VALUES ('bf68859f-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '93');
INSERT INTO `t_role_pre` VALUES ('bf69acf8-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '94');
INSERT INTO `t_role_pre` VALUES ('bf6a9bdf-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '95');
INSERT INTO `t_role_pre` VALUES ('bf6de4d4-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '96');
INSERT INTO `t_role_pre` VALUES ('bf6f05dd-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '97');
INSERT INTO `t_role_pre` VALUES ('bf70818a-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '98');
INSERT INTO `t_role_pre` VALUES ('bf715da1-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '99');
INSERT INTO `t_role_pre` VALUES ('bf723e95-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '100');
INSERT INTO `t_role_pre` VALUES ('bf73a952-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '101');
INSERT INTO `t_role_pre` VALUES ('bf75abc6-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '102');
INSERT INTO `t_role_pre` VALUES ('bf7b1337-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '103');
INSERT INTO `t_role_pre` VALUES ('bf7e9ebe-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '104');
INSERT INTO `t_role_pre` VALUES ('bf83a268-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '105');
INSERT INTO `t_role_pre` VALUES ('bf88e928-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '106');
INSERT INTO `t_role_pre` VALUES ('bf8c1b18-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '107');
INSERT INTO `t_role_pre` VALUES ('bf8e0493-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '108');
INSERT INTO `t_role_pre` VALUES ('bf93deb7-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '109');
INSERT INTO `t_role_pre` VALUES ('bf970c3a-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '110');
INSERT INTO `t_role_pre` VALUES ('bf9bad54-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '111');
INSERT INTO `t_role_pre` VALUES ('bfa116e0-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '112');
INSERT INTO `t_role_pre` VALUES ('bfa46a4a-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '113');
INSERT INTO `t_role_pre` VALUES ('bfa60fcc-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '114');
INSERT INTO `t_role_pre` VALUES ('bfa7b679-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '115');
INSERT INTO `t_role_pre` VALUES ('bfa943db-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '116');
INSERT INTO `t_role_pre` VALUES ('bfbcebfc-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '117');
INSERT INTO `t_role_pre` VALUES ('bfc04c88-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '118');
INSERT INTO `t_role_pre` VALUES ('bfc61a0b-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '119');
INSERT INTO `t_role_pre` VALUES ('bfc8e703-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '120');
INSERT INTO `t_role_pre` VALUES ('bfcb871d-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '121');
INSERT INTO `t_role_pre` VALUES ('bfd082b1-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '122');
INSERT INTO `t_role_pre` VALUES ('bfd42b89-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '123');
INSERT INTO `t_role_pre` VALUES ('bfd837dd-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '124');
INSERT INTO `t_role_pre` VALUES ('bfddd192-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '125');
INSERT INTO `t_role_pre` VALUES ('bfe14274-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '126');
INSERT INTO `t_role_pre` VALUES ('bfe366b4-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '127');
INSERT INTO `t_role_pre` VALUES ('bfe8d38f-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '128');
INSERT INTO `t_role_pre` VALUES ('bfed0842-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '129');
INSERT INTO `t_role_pre` VALUES ('bfede9ea-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '130');
INSERT INTO `t_role_pre` VALUES ('bfef9a2d-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '131');
INSERT INTO `t_role_pre` VALUES ('bff087e0-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '132');
INSERT INTO `t_role_pre` VALUES ('bff18364-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '133');
INSERT INTO `t_role_pre` VALUES ('bff27152-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '134');
INSERT INTO `t_role_pre` VALUES ('bff489d8-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '135');
INSERT INTO `t_role_pre` VALUES ('bffa1451-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '136');
INSERT INTO `t_role_pre` VALUES ('bffdc42e-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '137');
INSERT INTO `t_role_pre` VALUES ('bffea9b1-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '138');
INSERT INTO `t_role_pre` VALUES ('c0004e6e-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '139');
INSERT INTO `t_role_pre` VALUES ('c001e102-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '140');
INSERT INTO `t_role_pre` VALUES ('c0076203-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '141');
INSERT INTO `t_role_pre` VALUES ('c00ab7ff-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '142');
INSERT INTO `t_role_pre` VALUES ('c00e36a5-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '143');
INSERT INTO `t_role_pre` VALUES ('c00f1c87-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '144');
INSERT INTO `t_role_pre` VALUES ('c0106947-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '145');
INSERT INTO `t_role_pre` VALUES ('c012c568-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '146');
INSERT INTO `t_role_pre` VALUES ('c013add3-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '147');
INSERT INTO `t_role_pre` VALUES ('c015028b-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '148');
INSERT INTO `t_role_pre` VALUES ('c015f2d5-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '149');
INSERT INTO `t_role_pre` VALUES ('c017357e-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '150');
INSERT INTO `t_role_pre` VALUES ('c018134a-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '151');
INSERT INTO `t_role_pre` VALUES ('c0197251-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '152');
INSERT INTO `t_role_pre` VALUES ('c01cc6af-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '153');
INSERT INTO `t_role_pre` VALUES ('c022ec84-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '154');
INSERT INTO `t_role_pre` VALUES ('c025efa9-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '155');
INSERT INTO `t_role_pre` VALUES ('c02ac106-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '156');
INSERT INTO `t_role_pre` VALUES ('c02fe9db-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '157');
INSERT INTO `t_role_pre` VALUES ('c033d107-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '158');
INSERT INTO `t_role_pre` VALUES ('c034adec-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '159');
INSERT INTO `t_role_pre` VALUES ('c036cd71-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '160');
INSERT INTO `t_role_pre` VALUES ('c037c3dd-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '161');
INSERT INTO `t_role_pre` VALUES ('c03d9bbb-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '162');
INSERT INTO `t_role_pre` VALUES ('c040d404-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '163');
INSERT INTO `t_role_pre` VALUES ('c043ab43-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '164');
INSERT INTO `t_role_pre` VALUES ('c0457e70-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '165');
INSERT INTO `t_role_pre` VALUES ('c0469ab2-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '166');
INSERT INTO `t_role_pre` VALUES ('c0477376-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '167');
INSERT INTO `t_role_pre` VALUES ('c048825b-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '168');
INSERT INTO `t_role_pre` VALUES ('c04a4e51-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '169');
INSERT INTO `t_role_pre` VALUES ('c04bde0e-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '170');
INSERT INTO `t_role_pre` VALUES ('c051ca9f-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '171');
INSERT INTO `t_role_pre` VALUES ('c055b3c4-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '172');
INSERT INTO `t_role_pre` VALUES ('c0568aff-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '173');
INSERT INTO `t_role_pre` VALUES ('c057de47-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '174');
INSERT INTO `t_role_pre` VALUES ('c05a3e8d-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '175');
INSERT INTO `t_role_pre` VALUES ('c05f5ada-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '176');
INSERT INTO `t_role_pre` VALUES ('c062802d-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '177');
INSERT INTO `t_role_pre` VALUES ('c06912e0-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '178');
INSERT INTO `t_role_pre` VALUES ('c06ecc76-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '179');
INSERT INTO `t_role_pre` VALUES ('c072704f-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '180');
INSERT INTO `t_role_pre` VALUES ('c07715bd-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '181');
INSERT INTO `t_role_pre` VALUES ('c07adde8-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '182');
INSERT INTO `t_role_pre` VALUES ('c07f239d-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '183');
INSERT INTO `t_role_pre` VALUES ('c084ec21-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '184');
INSERT INTO `t_role_pre` VALUES ('c0885d66-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '185');
INSERT INTO `t_role_pre` VALUES ('c089f0ff-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '186');
INSERT INTO `t_role_pre` VALUES ('c08b86d9-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '187');
INSERT INTO `t_role_pre` VALUES ('c08cefa2-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '188');
INSERT INTO `t_role_pre` VALUES ('c08efe55-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '189');
INSERT INTO `t_role_pre` VALUES ('c093e0aa-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '190');
INSERT INTO `t_role_pre` VALUES ('c09745c5-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '191');
INSERT INTO `t_role_pre` VALUES ('c09be5f0-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '192');
INSERT INTO `t_role_pre` VALUES ('c0a1d9f0-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '193');
INSERT INTO `t_role_pre` VALUES ('c0a4f815-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '194');
INSERT INTO `t_role_pre` VALUES ('c0a69a10-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '195');
INSERT INTO `t_role_pre` VALUES ('c0a85954-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '196');
INSERT INTO `t_role_pre` VALUES ('c0a9fd54-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '197');
INSERT INTO `t_role_pre` VALUES ('c0abaf59-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '198');
INSERT INTO `t_role_pre` VALUES ('c0ad6d07-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '199');
INSERT INTO `t_role_pre` VALUES ('c0aed099-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '200');
INSERT INTO `t_role_pre` VALUES ('c0b06d33-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '201');
INSERT INTO `t_role_pre` VALUES ('c0b21d50-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '202');
INSERT INTO `t_role_pre` VALUES ('c0b7b56f-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '203');
INSERT INTO `t_role_pre` VALUES ('c0bb07ae-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '204');
INSERT INTO `t_role_pre` VALUES ('c0bc90ca-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '205');
INSERT INTO `t_role_pre` VALUES ('c0be4f92-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '206');
INSERT INTO `t_role_pre` VALUES ('c0bf9988-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '207');
INSERT INTO `t_role_pre` VALUES ('c0c1142c-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '208');
INSERT INTO `t_role_pre` VALUES ('c0c6ce0a-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '209');
INSERT INTO `t_role_pre` VALUES ('c0cb5c7f-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '210');
INSERT INTO `t_role_pre` VALUES ('c0cd02bd-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '211');
INSERT INTO `t_role_pre` VALUES ('c0ce4a8f-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '212');
INSERT INTO `t_role_pre` VALUES ('c0d0eece-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '213');
INSERT INTO `t_role_pre` VALUES ('c0d5c97d-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '214');
INSERT INTO `t_role_pre` VALUES ('c0dcf2c5-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '215');
INSERT INTO `t_role_pre` VALUES ('c0e21628-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '216');
INSERT INTO `t_role_pre` VALUES ('c0e4ce7f-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '217');
INSERT INTO `t_role_pre` VALUES ('c0e73ef8-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '218');
INSERT INTO `t_role_pre` VALUES ('c0eda350-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '219');
INSERT INTO `t_role_pre` VALUES ('c0f04500-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '220');
INSERT INTO `t_role_pre` VALUES ('c0f4cd65-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '221');
INSERT INTO `t_role_pre` VALUES ('c0fa7125-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '222');
INSERT INTO `t_role_pre` VALUES ('c0fe1e22-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '223');
INSERT INTO `t_role_pre` VALUES ('c100c768-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '224');
INSERT INTO `t_role_pre` VALUES ('c106b088-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '225');
INSERT INTO `t_role_pre` VALUES ('c109dc16-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '226');
INSERT INTO `t_role_pre` VALUES ('c10c46a6-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '227');
INSERT INTO `t_role_pre` VALUES ('c113f4eb-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '228');
INSERT INTO `t_role_pre` VALUES ('c117e5a6-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '229');
INSERT INTO `t_role_pre` VALUES ('c11e2ef6-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '230');
INSERT INTO `t_role_pre` VALUES ('c121c16c-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '231');
INSERT INTO `t_role_pre` VALUES ('c12871e8-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '232');
INSERT INTO `t_role_pre` VALUES ('c12bdc24-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '233');
INSERT INTO `t_role_pre` VALUES ('c1321176-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '234');
INSERT INTO `t_role_pre` VALUES ('c135beef-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '235');
INSERT INTO `t_role_pre` VALUES ('c14d7654-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '236');
INSERT INTO `t_role_pre` VALUES ('c152ffc8-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '237');
INSERT INTO `t_role_pre` VALUES ('c15a68c7-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '238');
INSERT INTO `t_role_pre` VALUES ('c1610763-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '239');
INSERT INTO `t_role_pre` VALUES ('c1650867-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '240');
INSERT INTO `t_role_pre` VALUES ('c16a4cf3-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '241');
INSERT INTO `t_role_pre` VALUES ('c16f689e-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '242');
INSERT INTO `t_role_pre` VALUES ('c172ffe3-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '243');
INSERT INTO `t_role_pre` VALUES ('c179417c-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '244');
INSERT INTO `t_role_pre` VALUES ('c17cd354-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '245');
INSERT INTO `t_role_pre` VALUES ('c17f2a7a-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '246');
INSERT INTO `t_role_pre` VALUES ('c185259c-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '247');
INSERT INTO `t_role_pre` VALUES ('c1887a18-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '248');
INSERT INTO `t_role_pre` VALUES ('c18b2aef-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '249');
INSERT INTO `t_role_pre` VALUES ('c190cab9-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '250');
INSERT INTO `t_role_pre` VALUES ('c1948687-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '251');
INSERT INTO `t_role_pre` VALUES ('c198b61a-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '252');
INSERT INTO `t_role_pre` VALUES ('c19e9fb6-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '253');
INSERT INTO `t_role_pre` VALUES ('c1a260bb-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '254');
INSERT INTO `t_role_pre` VALUES ('c1a8c7c3-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '255');
INSERT INTO `t_role_pre` VALUES ('c1ac1ab5-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '256');
INSERT INTO `t_role_pre` VALUES ('c1ae8c74-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '257');
INSERT INTO `t_role_pre` VALUES ('c1b493c8-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '258');
INSERT INTO `t_role_pre` VALUES ('c1b92f16-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '259');
INSERT INTO `t_role_pre` VALUES ('c1be89de-d6f6-11e6-a05b-507b9d765567', '40288092593a25c801593a478d080000', '260');
INSERT INTO `t_role_pre` VALUES ('c1c1d892-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '236');
INSERT INTO `t_role_pre` VALUES ('c1c482b2-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '2');
INSERT INTO `t_role_pre` VALUES ('c1c9fbc3-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '70');
INSERT INTO `t_role_pre` VALUES ('c1ce1b73-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '73');
INSERT INTO `t_role_pre` VALUES ('c1d46364-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '74');
INSERT INTO `t_role_pre` VALUES ('c1d81f55-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '84');
INSERT INTO `t_role_pre` VALUES ('c1def36b-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '245');
INSERT INTO `t_role_pre` VALUES ('c1e24ae8-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '254');
INSERT INTO `t_role_pre` VALUES ('c1e4eae0-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '253');
INSERT INTO `t_role_pre` VALUES ('c1e8754d-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '50');
INSERT INTO `t_role_pre` VALUES ('c1eb66d2-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '52');
INSERT INTO `t_role_pre` VALUES ('c1f0134d-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '53');
INSERT INTO `t_role_pre` VALUES ('c1f6892b-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '54');
INSERT INTO `t_role_pre` VALUES ('c1f9ec11-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '55');
INSERT INTO `t_role_pre` VALUES ('c200d27a-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '56');
INSERT INTO `t_role_pre` VALUES ('c2040fed-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '39');
INSERT INTO `t_role_pre` VALUES ('c207f6c3-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '42');
INSERT INTO `t_role_pre` VALUES ('c20e0db2-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '57');
INSERT INTO `t_role_pre` VALUES ('c211a480-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '58');
INSERT INTO `t_role_pre` VALUES ('c2179a78-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '59');
INSERT INTO `t_role_pre` VALUES ('c21c0845-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '61');
INSERT INTO `t_role_pre` VALUES ('c22216fb-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '62');
INSERT INTO `t_role_pre` VALUES ('c2256a66-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '90');
INSERT INTO `t_role_pre` VALUES ('c22c6ab3-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '99');
INSERT INTO `t_role_pre` VALUES ('c23068d8-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '100');
INSERT INTO `t_role_pre` VALUES ('c236d07e-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '101');
INSERT INTO `t_role_pre` VALUES ('c239bd23-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '102');
INSERT INTO `t_role_pre` VALUES ('c23d07e2-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '30');
INSERT INTO `t_role_pre` VALUES ('c240247d-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '31');
INSERT INTO `t_role_pre` VALUES ('c2443890-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '32');
INSERT INTO `t_role_pre` VALUES ('c247b7b2-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '33');
INSERT INTO `t_role_pre` VALUES ('c24ac71f-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '34');
INSERT INTO `t_role_pre` VALUES ('c250ac79-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '35');
INSERT INTO `t_role_pre` VALUES ('c2565504-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '36');
INSERT INTO `t_role_pre` VALUES ('c25b0674-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '182');
INSERT INTO `t_role_pre` VALUES ('c25dca41-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '183');
INSERT INTO `t_role_pre` VALUES ('c2639844-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '184');
INSERT INTO `t_role_pre` VALUES ('c267c5ef-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '185');
INSERT INTO `t_role_pre` VALUES ('c26e32cc-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '189');
INSERT INTO `t_role_pre` VALUES ('c2719c2a-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '190');
INSERT INTO `t_role_pre` VALUES ('c275f235-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '123');
INSERT INTO `t_role_pre` VALUES ('c27c089b-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '127');
INSERT INTO `t_role_pre` VALUES ('c27f58b6-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '114');
INSERT INTO `t_role_pre` VALUES ('c2857c4e-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '115');
INSERT INTO `t_role_pre` VALUES ('c2893d39-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '119');
INSERT INTO `t_role_pre` VALUES ('c294aa82-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '149');
INSERT INTO `t_role_pre` VALUES ('c29c7572-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '153');
INSERT INTO `t_role_pre` VALUES ('c29eed7d-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '155');
INSERT INTO `t_role_pre` VALUES ('c2a2a079-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '159');
INSERT INTO `t_role_pre` VALUES ('c2a57360-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '105');
INSERT INTO `t_role_pre` VALUES ('c2aaa3fe-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '106');
INSERT INTO `t_role_pre` VALUES ('c2ae7640-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '107');
INSERT INTO `t_role_pre` VALUES ('c2b2aaaa-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '112');
INSERT INTO `t_role_pre` VALUES ('c2b5b027-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '111');
INSERT INTO `t_role_pre` VALUES ('c2bbff61-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '130');
INSERT INTO `t_role_pre` VALUES ('c2c0c0bd-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '131');
INSERT INTO `t_role_pre` VALUES ('c2c35773-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '132');
INSERT INTO `t_role_pre` VALUES ('c2c5b8b1-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '133');
INSERT INTO `t_role_pre` VALUES ('c2c8548c-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '136');
INSERT INTO `t_role_pre` VALUES ('c2ceb9ba-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '140');
INSERT INTO `t_role_pre` VALUES ('c2d1dfb4-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '141');
INSERT INTO `t_role_pre` VALUES ('c2d49366-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '161');
INSERT INTO `t_role_pre` VALUES ('c2da56d7-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '164');
INSERT INTO `t_role_pre` VALUES ('c2dda72a-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '165');
INSERT INTO `t_role_pre` VALUES ('c2e0367e-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '169');
INSERT INTO `t_role_pre` VALUES ('c2e681ba-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '170');
INSERT INTO `t_role_pre` VALUES ('c2e9a86c-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '171');
INSERT INTO `t_role_pre` VALUES ('c2ee284c-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '176');
INSERT INTO `t_role_pre` VALUES ('c2f3c662-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '178');
INSERT INTO `t_role_pre` VALUES ('c2f6ec02-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '179');
INSERT INTO `t_role_pre` VALUES ('c2f96f18-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '181');
INSERT INTO `t_role_pre` VALUES ('c2ff8367-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '212');
INSERT INTO `t_role_pre` VALUES ('c3034af8-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '216');
INSERT INTO `t_role_pre` VALUES ('c3059362-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '218');
INSERT INTO `t_role_pre` VALUES ('c308a856-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '219');
INSERT INTO `t_role_pre` VALUES ('c30ea6e1-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '214');
INSERT INTO `t_role_pre` VALUES ('c31258c3-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '98');
INSERT INTO `t_role_pre` VALUES ('c31a758e-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '99');
INSERT INTO `t_role_pre` VALUES ('c321d059-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '100');
INSERT INTO `t_role_pre` VALUES ('c32673b5-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '101');
INSERT INTO `t_role_pre` VALUES ('c32912d7-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '102');
INSERT INTO `t_role_pre` VALUES ('c32ec04b-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '103');
INSERT INTO `t_role_pre` VALUES ('c3330ce6-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '104');
INSERT INTO `t_role_pre` VALUES ('c33a6b1a-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '105');
INSERT INTO `t_role_pre` VALUES ('c342f2e0-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '107');
INSERT INTO `t_role_pre` VALUES ('c346ce52-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '108');
INSERT INTO `t_role_pre` VALUES ('c351054e-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '110');
INSERT INTO `t_role_pre` VALUES ('c356fb1c-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '111');
INSERT INTO `t_role_pre` VALUES ('c35d8aac-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '112');
INSERT INTO `t_role_pre` VALUES ('c3612325-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '113');
INSERT INTO `t_role_pre` VALUES ('c363a9e7-d6f6-11e6-a05b-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '114');
INSERT INTO `t_role_pre` VALUES ('c369b3f4-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '236');
INSERT INTO `t_role_pre` VALUES ('c36d5f7d-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '240');
INSERT INTO `t_role_pre` VALUES ('c3700910-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '2');
INSERT INTO `t_role_pre` VALUES ('c3758a95-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '73');
INSERT INTO `t_role_pre` VALUES ('c3797d33-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '74');
INSERT INTO `t_role_pre` VALUES ('c3801b69-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '70');
INSERT INTO `t_role_pre` VALUES ('c387b692-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '71');
INSERT INTO `t_role_pre` VALUES ('c38c72c8-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '78');
INSERT INTO `t_role_pre` VALUES ('c38f7d6a-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '77');
INSERT INTO `t_role_pre` VALUES ('c3944340-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '84');
INSERT INTO `t_role_pre` VALUES ('c39985f5-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '85');
INSERT INTO `t_role_pre` VALUES ('c3a014bb-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '245');
INSERT INTO `t_role_pre` VALUES ('c3a39325-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '50');
INSERT INTO `t_role_pre` VALUES ('c3a669ac-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '51');
INSERT INTO `t_role_pre` VALUES ('c3aa0b51-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '52');
INSERT INTO `t_role_pre` VALUES ('c3adf2c6-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '53');
INSERT INTO `t_role_pre` VALUES ('c3b19d97-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '54');
INSERT INTO `t_role_pre` VALUES ('c3b53b1c-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '55');
INSERT INTO `t_role_pre` VALUES ('c3b7bbca-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '56');
INSERT INTO `t_role_pre` VALUES ('c3ba51e2-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '39');
INSERT INTO `t_role_pre` VALUES ('c3bfb79f-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '42');
INSERT INTO `t_role_pre` VALUES ('c3c238d2-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '57');
INSERT INTO `t_role_pre` VALUES ('c3c736d2-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '58');
INSERT INTO `t_role_pre` VALUES ('c3cd5e97-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '59');
INSERT INTO `t_role_pre` VALUES ('c3d124cd-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '61');
INSERT INTO `t_role_pre` VALUES ('c3d89b4b-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '62');
INSERT INTO `t_role_pre` VALUES ('c3db3bee-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '90');
INSERT INTO `t_role_pre` VALUES ('c3e16675-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '99');
INSERT INTO `t_role_pre` VALUES ('c3e55a0f-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '100');
INSERT INTO `t_role_pre` VALUES ('c3e9ca7b-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '101');
INSERT INTO `t_role_pre` VALUES ('c3ef32fe-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '102');
INSERT INTO `t_role_pre` VALUES ('c3f3614c-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '103');
INSERT INTO `t_role_pre` VALUES ('c3f920ad-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '104');
INSERT INTO `t_role_pre` VALUES ('c3fdf9bd-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '30');
INSERT INTO `t_role_pre` VALUES ('c4039265-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '31');
INSERT INTO `t_role_pre` VALUES ('c4073514-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '32');
INSERT INTO `t_role_pre` VALUES ('c40e098c-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '33');
INSERT INTO `t_role_pre` VALUES ('c4116ea7-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '34');
INSERT INTO `t_role_pre` VALUES ('c41526fb-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '35');
INSERT INTO `t_role_pre` VALUES ('c41b24c1-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '36');
INSERT INTO `t_role_pre` VALUES ('c41eb357-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '182');
INSERT INTO `t_role_pre` VALUES ('c420f919-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '183');
INSERT INTO `t_role_pre` VALUES ('c4271281-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '184');
INSERT INTO `t_role_pre` VALUES ('c42aa66f-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '188');
INSERT INTO `t_role_pre` VALUES ('c430ff44-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '189');
INSERT INTO `t_role_pre` VALUES ('c434f430-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '190');
INSERT INTO `t_role_pre` VALUES ('c438e027-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '193');
INSERT INTO `t_role_pre` VALUES ('c43ed39a-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '194');
INSERT INTO `t_role_pre` VALUES ('c442878b-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '195');
INSERT INTO `t_role_pre` VALUES ('c448de05-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '196');
INSERT INTO `t_role_pre` VALUES ('c44c4f9f-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '199');
INSERT INTO `t_role_pre` VALUES ('c44e9b07-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '200');
INSERT INTO `t_role_pre` VALUES ('c45a0589-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '201');
INSERT INTO `t_role_pre` VALUES ('c45e75ad-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '123');
INSERT INTO `t_role_pre` VALUES ('c462c53d-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '127');
INSERT INTO `t_role_pre` VALUES ('c4675388-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '114');
INSERT INTO `t_role_pre` VALUES ('c46a89ea-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '115');
INSERT INTO `t_role_pre` VALUES ('c46f9b8f-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '119');
INSERT INTO `t_role_pre` VALUES ('c474afbe-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '123');
INSERT INTO `t_role_pre` VALUES ('c4796bf5-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '127');
INSERT INTO `t_role_pre` VALUES ('c47f07b8-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '149');
INSERT INTO `t_role_pre` VALUES ('c482b9d2-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '153');
INSERT INTO `t_role_pre` VALUES ('c4855d5c-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '155');
INSERT INTO `t_role_pre` VALUES ('c48b399b-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '159');
INSERT INTO `t_role_pre` VALUES ('c48fb154-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '105');
INSERT INTO `t_role_pre` VALUES ('c494c0ab-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '106');
INSERT INTO `t_role_pre` VALUES ('c49813eb-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '107');
INSERT INTO `t_role_pre` VALUES ('c49af6c1-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '111');
INSERT INTO `t_role_pre` VALUES ('c4a0643b-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '112');
INSERT INTO `t_role_pre` VALUES ('c4a42b20-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '130');
INSERT INTO `t_role_pre` VALUES ('c4a718c6-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '131');
INSERT INTO `t_role_pre` VALUES ('c4acb8ae-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '132');
INSERT INTO `t_role_pre` VALUES ('c4b09af5-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '133');
INSERT INTO `t_role_pre` VALUES ('c4b6b71a-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '134');
INSERT INTO `t_role_pre` VALUES ('c4b9c8f3-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '164');
INSERT INTO `t_role_pre` VALUES ('c4bce757-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '161');
INSERT INTO `t_role_pre` VALUES ('c4c27bd6-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '43');
INSERT INTO `t_role_pre` VALUES ('c4c5b41b-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '44');
INSERT INTO `t_role_pre` VALUES ('c4c939f9-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '45');
INSERT INTO `t_role_pre` VALUES ('c4ce5e6d-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '46');
INSERT INTO `t_role_pre` VALUES ('c4d20488-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '47');
INSERT INTO `t_role_pre` VALUES ('c4d87c38-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '48');
INSERT INTO `t_role_pre` VALUES ('c4dbe294-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '49');
INSERT INTO `t_role_pre` VALUES ('c4df8a79-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '216');
INSERT INTO `t_role_pre` VALUES ('c4e612dd-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '218');
INSERT INTO `t_role_pre` VALUES ('c4e9ae18-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '219');
INSERT INTO `t_role_pre` VALUES ('c4f0124a-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '212');
INSERT INTO `t_role_pre` VALUES ('c4f35526-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '214');
INSERT INTO `t_role_pre` VALUES ('c4fa0e92-d6f6-11e6-a05b-507b9d765567', '2e44d67971534136825564e6345a9a55', '216');
INSERT INTO `t_role_pre` VALUES ('c4fda6c7-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '43');
INSERT INTO `t_role_pre` VALUES ('c5021688-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '43');
INSERT INTO `t_role_pre` VALUES ('c507f958-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '44');
INSERT INTO `t_role_pre` VALUES ('c50b362c-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '45');
INSERT INTO `t_role_pre` VALUES ('c5151ada-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '46');
INSERT INTO `t_role_pre` VALUES ('c51c9958-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '47');
INSERT INTO `t_role_pre` VALUES ('c51f492f-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '48');
INSERT INTO `t_role_pre` VALUES ('c521cfa0-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '49');
INSERT INTO `t_role_pre` VALUES ('c52426bd-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '50');
INSERT INTO `t_role_pre` VALUES ('c526dc42-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '51');
INSERT INTO `t_role_pre` VALUES ('c52cd2c3-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '52');
INSERT INTO `t_role_pre` VALUES ('c5304220-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '53');
INSERT INTO `t_role_pre` VALUES ('c5368cad-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '54');
INSERT INTO `t_role_pre` VALUES ('c5395b22-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '55');
INSERT INTO `t_role_pre` VALUES ('c542e42f-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '56');
INSERT INTO `t_role_pre` VALUES ('c5472e3c-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '57');
INSERT INTO `t_role_pre` VALUES ('c54bfff3-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '58');
INSERT INTO `t_role_pre` VALUES ('c55452cd-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '59');
INSERT INTO `t_role_pre` VALUES ('c558789a-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '60');
INSERT INTO `t_role_pre` VALUES ('c55dc461-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '61');
INSERT INTO `t_role_pre` VALUES ('c5619820-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '62');
INSERT INTO `t_role_pre` VALUES ('c5695f3c-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '70');
INSERT INTO `t_role_pre` VALUES ('c56d7cef-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '71');
INSERT INTO `t_role_pre` VALUES ('c575673a-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '73');
INSERT INTO `t_role_pre` VALUES ('c57a0280-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '74');
INSERT INTO `t_role_pre` VALUES ('c57f9d5c-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '77');
INSERT INTO `t_role_pre` VALUES ('c586d77b-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '78');
INSERT INTO `t_role_pre` VALUES ('c58b0aff-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '79');
INSERT INTO `t_role_pre` VALUES ('c5911461-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '80');
INSERT INTO `t_role_pre` VALUES ('c594a4eb-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '81');
INSERT INTO `t_role_pre` VALUES ('c59a8e72-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '82');
INSERT INTO `t_role_pre` VALUES ('c59ecce3-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '83');
INSERT INTO `t_role_pre` VALUES ('c5a4ca8b-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '84');
INSERT INTO `t_role_pre` VALUES ('c5a82266-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '85');
INSERT INTO `t_role_pre` VALUES ('c5aaad52-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '86');
INSERT INTO `t_role_pre` VALUES ('c5b1194c-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '87');
INSERT INTO `t_role_pre` VALUES ('c5b3f34c-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '88');
INSERT INTO `t_role_pre` VALUES ('c5b710a3-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '90');
INSERT INTO `t_role_pre` VALUES ('c5bc7d94-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '95');
INSERT INTO `t_role_pre` VALUES ('c5c01846-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '96');
INSERT INTO `t_role_pre` VALUES ('c5c44ef6-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '99');
INSERT INTO `t_role_pre` VALUES ('c5ca8101-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '100');
INSERT INTO `t_role_pre` VALUES ('c5cd83c0-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '101');
INSERT INTO `t_role_pre` VALUES ('c5d431b7-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '102');
INSERT INTO `t_role_pre` VALUES ('c5d7edb0-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '103');
INSERT INTO `t_role_pre` VALUES ('c5e0e634-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '104');
INSERT INTO `t_role_pre` VALUES ('c5e41c5a-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '105');
INSERT INTO `t_role_pre` VALUES ('c5ea9a49-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '106');
INSERT INTO `t_role_pre` VALUES ('c5ee0485-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '107');
INSERT INTO `t_role_pre` VALUES ('c5f5d4f0-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '110');
INSERT INTO `t_role_pre` VALUES ('c5f9a7d0-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '111');
INSERT INTO `t_role_pre` VALUES ('c5fe071d-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '112');
INSERT INTO `t_role_pre` VALUES ('c60350ec-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '114');
INSERT INTO `t_role_pre` VALUES ('c6070536-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '115');
INSERT INTO `t_role_pre` VALUES ('c61339ce-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '118');
INSERT INTO `t_role_pre` VALUES ('c616d08f-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '119');
INSERT INTO `t_role_pre` VALUES ('c61cc0fc-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '123');
INSERT INTO `t_role_pre` VALUES ('c6203284-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '126');
INSERT INTO `t_role_pre` VALUES ('c62321bc-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '127');
INSERT INTO `t_role_pre` VALUES ('c62b4ae8-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '132');
INSERT INTO `t_role_pre` VALUES ('c63401f4-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '133');
INSERT INTO `t_role_pre` VALUES ('c636bfdc-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '134');
INSERT INTO `t_role_pre` VALUES ('c63b6b1a-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '143');
INSERT INTO `t_role_pre` VALUES ('c641d4df-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '146');
INSERT INTO `t_role_pre` VALUES ('c64571e0-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '147');
INSERT INTO `t_role_pre` VALUES ('c64bd66b-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '149');
INSERT INTO `t_role_pre` VALUES ('c64fb13a-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '152');
INSERT INTO `t_role_pre` VALUES ('c6541597-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '153');
INSERT INTO `t_role_pre` VALUES ('c6597c90-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '155');
INSERT INTO `t_role_pre` VALUES ('c65d6126-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '158');
INSERT INTO `t_role_pre` VALUES ('c6663f38-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '159');
INSERT INTO `t_role_pre` VALUES ('c668ccee-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '161');
INSERT INTO `t_role_pre` VALUES ('c66b5962-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '164');
INSERT INTO `t_role_pre` VALUES ('c670e4e0-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '165');
INSERT INTO `t_role_pre` VALUES ('c6747df4-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '169');
INSERT INTO `t_role_pre` VALUES ('c6770ecd-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '170');
INSERT INTO `t_role_pre` VALUES ('c67cfa80-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '171');
INSERT INTO `t_role_pre` VALUES ('c6809ad3-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '175');
INSERT INTO `t_role_pre` VALUES ('c686d8aa-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '176');
INSERT INTO `t_role_pre` VALUES ('c68a7892-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '177');
INSERT INTO `t_role_pre` VALUES ('c68d6716-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '181');
INSERT INTO `t_role_pre` VALUES ('c692c73b-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '182');
INSERT INTO `t_role_pre` VALUES ('c69699ca-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '183');
INSERT INTO `t_role_pre` VALUES ('c698fd6f-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '184');
INSERT INTO `t_role_pre` VALUES ('c69c0ba3-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '185');
INSERT INTO `t_role_pre` VALUES ('c69ec1ce-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '189');
INSERT INTO `t_role_pre` VALUES ('c6a5f5c7-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '190');
INSERT INTO `t_role_pre` VALUES ('c6a98f81-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '193');
INSERT INTO `t_role_pre` VALUES ('c6b01826-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '194');
INSERT INTO `t_role_pre` VALUES ('c6b36f01-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '195');
INSERT INTO `t_role_pre` VALUES ('c6b9c917-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '196');
INSERT INTO `t_role_pre` VALUES ('c6bcfeb9-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '200');
INSERT INTO `t_role_pre` VALUES ('c6bfcc54-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '201');
INSERT INTO `t_role_pre` VALUES ('c6c669e7-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '203');
INSERT INTO `t_role_pre` VALUES ('c6c964fb-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '204');
INSERT INTO `t_role_pre` VALUES ('c6cf8c40-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '205');
INSERT INTO `t_role_pre` VALUES ('c6d30d6b-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '206');
INSERT INTO `t_role_pre` VALUES ('c6d7d364-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '207');
INSERT INTO `t_role_pre` VALUES ('c6db67bd-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '208');
INSERT INTO `t_role_pre` VALUES ('c6dfd362-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '209');
INSERT INTO `t_role_pre` VALUES ('c6e57a1f-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '210');
INSERT INTO `t_role_pre` VALUES ('c6e95b3f-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '211');
INSERT INTO `t_role_pre` VALUES ('c6f00652-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '212');
INSERT INTO `t_role_pre` VALUES ('c6f350b2-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '213');
INSERT INTO `t_role_pre` VALUES ('c6f7bbc6-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '214');
INSERT INTO `t_role_pre` VALUES ('c6fdac95-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '215');
INSERT INTO `t_role_pre` VALUES ('c7010b60-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '216');
INSERT INTO `t_role_pre` VALUES ('c707c9b1-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '217');
INSERT INTO `t_role_pre` VALUES ('c70b25f2-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '218');
INSERT INTO `t_role_pre` VALUES ('c714de34-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '219');
INSERT INTO `t_role_pre` VALUES ('c718e730-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '220');
INSERT INTO `t_role_pre` VALUES ('c71f34c7-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '221');
INSERT INTO `t_role_pre` VALUES ('c722eff3-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '222');
INSERT INTO `t_role_pre` VALUES ('c7295152-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '223');
INSERT INTO `t_role_pre` VALUES ('c72cb8d9-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '224');
INSERT INTO `t_role_pre` VALUES ('c7339d2f-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '225');
INSERT INTO `t_role_pre` VALUES ('c7376501-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '226');
INSERT INTO `t_role_pre` VALUES ('c73d6508-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '227');
INSERT INTO `t_role_pre` VALUES ('c74101a6-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '228');
INSERT INTO `t_role_pre` VALUES ('c743b156-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '229');
INSERT INTO `t_role_pre` VALUES ('c7494105-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '235');
INSERT INTO `t_role_pre` VALUES ('c74c9f58-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '236');
INSERT INTO `t_role_pre` VALUES ('c751129b-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '237');
INSERT INTO `t_role_pre` VALUES ('c756fd41-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '238');
INSERT INTO `t_role_pre` VALUES ('c75aa95f-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '239');
INSERT INTO `t_role_pre` VALUES ('c76184b5-d6f6-11e6-a05b-507b9d765567', '4028dac059767f9c01597683db780000', '240');
INSERT INTO `t_role_pre` VALUES ('c764c353-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '2');
INSERT INTO `t_role_pre` VALUES ('c769256a-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '12');
INSERT INTO `t_role_pre` VALUES ('c76eb307-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '13');
INSERT INTO `t_role_pre` VALUES ('c77257ee-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '14');
INSERT INTO `t_role_pre` VALUES ('c778aade-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '15');
INSERT INTO `t_role_pre` VALUES ('c77c34e4-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '16');
INSERT INTO `t_role_pre` VALUES ('c782a614-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '17');
INSERT INTO `t_role_pre` VALUES ('c7864c34-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '18');
INSERT INTO `t_role_pre` VALUES ('c78916b8-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '19');
INSERT INTO `t_role_pre` VALUES ('c78efc45-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '21');
INSERT INTO `t_role_pre` VALUES ('c7926c26-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '22');
INSERT INTO `t_role_pre` VALUES ('c795aed8-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '24');
INSERT INTO `t_role_pre` VALUES ('c79a0984-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '25');
INSERT INTO `t_role_pre` VALUES ('c79e0b11-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '26');
INSERT INTO `t_role_pre` VALUES ('c7a1937c-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '27');
INSERT INTO `t_role_pre` VALUES ('c7a458fd-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '30');
INSERT INTO `t_role_pre` VALUES ('c7a70053-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '32');
INSERT INTO `t_role_pre` VALUES ('c7ad38ea-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '33');
INSERT INTO `t_role_pre` VALUES ('c7b17dca-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '34');
INSERT INTO `t_role_pre` VALUES ('c7b7982d-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '39');
INSERT INTO `t_role_pre` VALUES ('c7bae0d1-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '43');
INSERT INTO `t_role_pre` VALUES ('c7bebf45-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '44');
INSERT INTO `t_role_pre` VALUES ('c7c80376-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '45');
INSERT INTO `t_role_pre` VALUES ('c7cbbdbb-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '46');
INSERT INTO `t_role_pre` VALUES ('c7d0799c-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '47');
INSERT INTO `t_role_pre` VALUES ('c7d4ee7a-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '48');
INSERT INTO `t_role_pre` VALUES ('c7db3b84-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '49');
INSERT INTO `t_role_pre` VALUES ('c7e09766-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '50');
INSERT INTO `t_role_pre` VALUES ('c7e62a1c-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '51');
INSERT INTO `t_role_pre` VALUES ('c7e9b9ba-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '52');
INSERT INTO `t_role_pre` VALUES ('c7f01bcd-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '53');
INSERT INTO `t_role_pre` VALUES ('c7f3df13-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '54');
INSERT INTO `t_role_pre` VALUES ('c7f81ecd-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '55');
INSERT INTO `t_role_pre` VALUES ('c7fd79fb-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '56');
INSERT INTO `t_role_pre` VALUES ('c800ece7-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '57');
INSERT INTO `t_role_pre` VALUES ('c80d1cda-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '58');
INSERT INTO `t_role_pre` VALUES ('c815acfa-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '59');
INSERT INTO `t_role_pre` VALUES ('c819f76a-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '60');
INSERT INTO `t_role_pre` VALUES ('c81f5462-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '61');
INSERT INTO `t_role_pre` VALUES ('c8232818-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '62');
INSERT INTO `t_role_pre` VALUES ('c83098d5-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '63');
INSERT INTO `t_role_pre` VALUES ('c8336943-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '64');
INSERT INTO `t_role_pre` VALUES ('c83bb0ac-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '65');
INSERT INTO `t_role_pre` VALUES ('c83fddac-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '67');
INSERT INTO `t_role_pre` VALUES ('c845f6e4-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '68');
INSERT INTO `t_role_pre` VALUES ('c848eb09-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '69');
INSERT INTO `t_role_pre` VALUES ('c84b602c-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '70');
INSERT INTO `t_role_pre` VALUES ('c84e3eeb-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '71');
INSERT INTO `t_role_pre` VALUES ('c8546be6-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '72');
INSERT INTO `t_role_pre` VALUES ('c857e2cc-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '73');
INSERT INTO `t_role_pre` VALUES ('c85ecd59-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '74');
INSERT INTO `t_role_pre` VALUES ('c861f30a-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '75');
INSERT INTO `t_role_pre` VALUES ('c866e680-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '76');
INSERT INTO `t_role_pre` VALUES ('c86a1852-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '77');
INSERT INTO `t_role_pre` VALUES ('c86f961d-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '78');
INSERT INTO `t_role_pre` VALUES ('c8763026-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '79');
INSERT INTO `t_role_pre` VALUES ('c87994e3-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '80');
INSERT INTO `t_role_pre` VALUES ('c87c22ba-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '81');
INSERT INTO `t_role_pre` VALUES ('c881eec1-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '82');
INSERT INTO `t_role_pre` VALUES ('c885abd4-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '83');
INSERT INTO `t_role_pre` VALUES ('c88859c3-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '84');
INSERT INTO `t_role_pre` VALUES ('c88af3ef-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '85');
INSERT INTO `t_role_pre` VALUES ('c891bc82-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '86');
INSERT INTO `t_role_pre` VALUES ('c894ef88-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '87');
INSERT INTO `t_role_pre` VALUES ('c89bf917-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '88');
INSERT INTO `t_role_pre` VALUES ('c89e965e-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '90');
INSERT INTO `t_role_pre` VALUES ('c8a2e14d-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '95');
INSERT INTO `t_role_pre` VALUES ('c8a8941e-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '99');
INSERT INTO `t_role_pre` VALUES ('c8aca5bd-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '100');
INSERT INTO `t_role_pre` VALUES ('c8b2b7b6-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '101');
INSERT INTO `t_role_pre` VALUES ('c8b6ff7d-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '102');
INSERT INTO `t_role_pre` VALUES ('c8bd2451-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '103');
INSERT INTO `t_role_pre` VALUES ('c8c20723-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '104');
INSERT INTO `t_role_pre` VALUES ('c8c8a886-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '105');
INSERT INTO `t_role_pre` VALUES ('c8cd0562-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '106');
INSERT INTO `t_role_pre` VALUES ('c8d76e04-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '107');
INSERT INTO `t_role_pre` VALUES ('c8df6b8e-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '132');
INSERT INTO `t_role_pre` VALUES ('c8e5f781-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '133');
INSERT INTO `t_role_pre` VALUES ('c8eb31cb-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '134');
INSERT INTO `t_role_pre` VALUES ('c8eda5c6-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '143');
INSERT INTO `t_role_pre` VALUES ('c8f04b46-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '147');
INSERT INTO `t_role_pre` VALUES ('c8f682c3-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '149');
INSERT INTO `t_role_pre` VALUES ('c8fbd3df-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '153');
INSERT INTO `t_role_pre` VALUES ('c90278d8-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '155');
INSERT INTO `t_role_pre` VALUES ('c905beff-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '159');
INSERT INTO `t_role_pre` VALUES ('c9088426-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '161');
INSERT INTO `t_role_pre` VALUES ('c9106664-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '169');
INSERT INTO `t_role_pre` VALUES ('c9134501-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '170');
INSERT INTO `t_role_pre` VALUES ('c915f70c-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '171');
INSERT INTO `t_role_pre` VALUES ('c91be56a-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '175');
INSERT INTO `t_role_pre` VALUES ('c91fc194-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '176');
INSERT INTO `t_role_pre` VALUES ('c9257c91-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '177');
INSERT INTO `t_role_pre` VALUES ('c929d5c0-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '181');
INSERT INTO `t_role_pre` VALUES ('c92e3057-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '182');
INSERT INTO `t_role_pre` VALUES ('c930adad-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '183');
INSERT INTO `t_role_pre` VALUES ('c93513e9-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '184');
INSERT INTO `t_role_pre` VALUES ('c937a598-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '185');
INSERT INTO `t_role_pre` VALUES ('c93d5377-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '186');
INSERT INTO `t_role_pre` VALUES ('c940d568-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '187');
INSERT INTO `t_role_pre` VALUES ('c943f028-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '188');
INSERT INTO `t_role_pre` VALUES ('c94996e1-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '189');
INSERT INTO `t_role_pre` VALUES ('c94eae8e-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '190');
INSERT INTO `t_role_pre` VALUES ('c950defb-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '193');
INSERT INTO `t_role_pre` VALUES ('c9533fd2-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '194');
INSERT INTO `t_role_pre` VALUES ('c95a2862-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '195');
INSERT INTO `t_role_pre` VALUES ('c95e434b-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '196');
INSERT INTO `t_role_pre` VALUES ('c9674504-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '197');
INSERT INTO `t_role_pre` VALUES ('c96ce8bb-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '198');
INSERT INTO `t_role_pre` VALUES ('c970360c-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '199');
INSERT INTO `t_role_pre` VALUES ('c97407df-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '200');
INSERT INTO `t_role_pre` VALUES ('c97a5956-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '201');
INSERT INTO `t_role_pre` VALUES ('c97dcd0b-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '212');
INSERT INTO `t_role_pre` VALUES ('c98496cd-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '214');
INSERT INTO `t_role_pre` VALUES ('c9958769-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '216');
INSERT INTO `t_role_pre` VALUES ('c999e76e-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '240');
INSERT INTO `t_role_pre` VALUES ('c99c8cad-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '241');
INSERT INTO `t_role_pre` VALUES ('c9a4fcd8-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '242');
INSERT INTO `t_role_pre` VALUES ('c9b00091-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '243');
INSERT INTO `t_role_pre` VALUES ('c9b80de9-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '244');
INSERT INTO `t_role_pre` VALUES ('c9bca45a-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '245');
INSERT INTO `t_role_pre` VALUES ('c9c02412-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '246');
INSERT INTO `t_role_pre` VALUES ('c9c315cb-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '247');
INSERT INTO `t_role_pre` VALUES ('c9d11196-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '248');
INSERT INTO `t_role_pre` VALUES ('c9d56c94-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '249');
INSERT INTO `t_role_pre` VALUES ('c9d9022e-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '250');
INSERT INTO `t_role_pre` VALUES ('c9dfbef1-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '251');
INSERT INTO `t_role_pre` VALUES ('c9e353dc-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '252');
INSERT INTO `t_role_pre` VALUES ('c9ed63ce-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '253');
INSERT INTO `t_role_pre` VALUES ('c9f174c6-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '254');
INSERT INTO `t_role_pre` VALUES ('c9f8b9f3-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '255');
INSERT INTO `t_role_pre` VALUES ('c9fd0d24-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '256');
INSERT INTO `t_role_pre` VALUES ('ca039e2b-d6f6-11e6-a05b-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '257');
INSERT INTO `t_role_pre` VALUES ('ca07e7a3-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '235');
INSERT INTO `t_role_pre` VALUES ('ca0b56bb-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '236');
INSERT INTO `t_role_pre` VALUES ('ca0fc4ff-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '237');
INSERT INTO `t_role_pre` VALUES ('ca15b452-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '238');
INSERT INTO `t_role_pre` VALUES ('ca1a4f7e-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '239');
INSERT INTO `t_role_pre` VALUES ('ca1fa12b-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '2');
INSERT INTO `t_role_pre` VALUES ('ca23818b-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '12');
INSERT INTO `t_role_pre` VALUES ('ca2f9397-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '13');
INSERT INTO `t_role_pre` VALUES ('ca375f83-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '14');
INSERT INTO `t_role_pre` VALUES ('ca3b6e1c-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '15');
INSERT INTO `t_role_pre` VALUES ('ca44b095-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '16');
INSERT INTO `t_role_pre` VALUES ('ca484c21-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '17');
INSERT INTO `t_role_pre` VALUES ('ca4d56ca-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '18');
INSERT INTO `t_role_pre` VALUES ('ca50fa4a-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '70');
INSERT INTO `t_role_pre` VALUES ('ca5749c5-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '84');
INSERT INTO `t_role_pre` VALUES ('ca5b726d-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '77');
INSERT INTO `t_role_pre` VALUES ('ca62020d-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '78');
INSERT INTO `t_role_pre` VALUES ('ca65db6d-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '79');
INSERT INTO `t_role_pre` VALUES ('ca698539-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '80');
INSERT INTO `t_role_pre` VALUES ('ca6f4107-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '81');
INSERT INTO `t_role_pre` VALUES ('ca727865-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '82');
INSERT INTO `t_role_pre` VALUES ('ca78d96e-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '83');
INSERT INTO `t_role_pre` VALUES ('ca7cb4be-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '50');
INSERT INTO `t_role_pre` VALUES ('ca80bc1b-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '51');
INSERT INTO `t_role_pre` VALUES ('ca86a186-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '52');
INSERT INTO `t_role_pre` VALUES ('ca8a92f4-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '53');
INSERT INTO `t_role_pre` VALUES ('ca91d81d-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '54');
INSERT INTO `t_role_pre` VALUES ('ca94874d-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '55');
INSERT INTO `t_role_pre` VALUES ('ca9b7569-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '56');
INSERT INTO `t_role_pre` VALUES ('ca9ff71b-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '39');
INSERT INTO `t_role_pre` VALUES ('caa5af41-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '42');
INSERT INTO `t_role_pre` VALUES ('caa950ff-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '57');
INSERT INTO `t_role_pre` VALUES ('caaf654a-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '58');
INSERT INTO `t_role_pre` VALUES ('cab377f6-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '61');
INSERT INTO `t_role_pre` VALUES ('cab653c0-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '90');
INSERT INTO `t_role_pre` VALUES ('cabceb2a-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '99');
INSERT INTO `t_role_pre` VALUES ('cac100b5-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '101');
INSERT INTO `t_role_pre` VALUES ('cac6e65c-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '102');
INSERT INTO `t_role_pre` VALUES ('cacab610-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '103');
INSERT INTO `t_role_pre` VALUES ('cacd6dd5-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '104');
INSERT INTO `t_role_pre` VALUES ('cacfae2a-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '30');
INSERT INTO `t_role_pre` VALUES ('cad2968c-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '31');
INSERT INTO `t_role_pre` VALUES ('cad59969-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '32');
INSERT INTO `t_role_pre` VALUES ('cadb68d8-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '33');
INSERT INTO `t_role_pre` VALUES ('cadf0543-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '34');
INSERT INTO `t_role_pre` VALUES ('cae8520a-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '35');
INSERT INTO `t_role_pre` VALUES ('caee58a6-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '36');
INSERT INTO `t_role_pre` VALUES ('caf2943b-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '182');
INSERT INTO `t_role_pre` VALUES ('caf68688-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '185');
INSERT INTO `t_role_pre` VALUES ('cafd870d-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '184');
INSERT INTO `t_role_pre` VALUES ('cb012b8d-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '189');
INSERT INTO `t_role_pre` VALUES ('cb056f0e-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '190');
INSERT INTO `t_role_pre` VALUES ('cb090d31-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '123');
INSERT INTO `t_role_pre` VALUES ('cb0d8448-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '114');
INSERT INTO `t_role_pre` VALUES ('cb134767-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '149');
INSERT INTO `t_role_pre` VALUES ('cb16cf79-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '155');
INSERT INTO `t_role_pre` VALUES ('cb1d557a-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '130');
INSERT INTO `t_role_pre` VALUES ('cb216439-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '131');
INSERT INTO `t_role_pre` VALUES ('cb2795e6-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '132');
INSERT INTO `t_role_pre` VALUES ('cb2b0f2b-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '133');
INSERT INTO `t_role_pre` VALUES ('cb2e2f3b-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '134');
INSERT INTO `t_role_pre` VALUES ('cb34d352-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '161');
INSERT INTO `t_role_pre` VALUES ('cb389eae-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '165');
INSERT INTO `t_role_pre` VALUES ('cb3fdb2c-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '166');
INSERT INTO `t_role_pre` VALUES ('cb43cbc4-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '168');
INSERT INTO `t_role_pre` VALUES ('cb4622c8-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '169');
INSERT INTO `t_role_pre` VALUES ('cb4bc5f6-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '170');
INSERT INTO `t_role_pre` VALUES ('cb51f08a-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '171');
INSERT INTO `t_role_pre` VALUES ('cb54b7d0-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '172');
INSERT INTO `t_role_pre` VALUES ('cb5b778d-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '173');
INSERT INTO `t_role_pre` VALUES ('cb5f16db-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '175');
INSERT INTO `t_role_pre` VALUES ('cb627678-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '176');
INSERT INTO `t_role_pre` VALUES ('cb65d31f-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '177');
INSERT INTO `t_role_pre` VALUES ('cb68b665-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '178');
INSERT INTO `t_role_pre` VALUES ('cb6fed8e-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '179');
INSERT INTO `t_role_pre` VALUES ('cb73b0a1-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '181');
INSERT INTO `t_role_pre` VALUES ('cb77335e-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '43');
INSERT INTO `t_role_pre` VALUES ('cb832140-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '44');
INSERT INTO `t_role_pre` VALUES ('cb878e6f-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '45');
INSERT INTO `t_role_pre` VALUES ('cb8b7b1a-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '46');
INSERT INTO `t_role_pre` VALUES ('cb8ea814-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '47');
INSERT INTO `t_role_pre` VALUES ('cb9756cf-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '48');
INSERT INTO `t_role_pre` VALUES ('cb99e1a4-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '49');
INSERT INTO `t_role_pre` VALUES ('cb9c82c3-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '204');
INSERT INTO `t_role_pre` VALUES ('cb9f30c7-d6f6-11e6-a05b-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '212');
INSERT INTO `t_role_pre` VALUES ('cba9c8e8-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '230');
INSERT INTO `t_role_pre` VALUES ('cbae3bc0-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '85');
INSERT INTO `t_role_pre` VALUES ('cbb2ebbc-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '84');
INSERT INTO `t_role_pre` VALUES ('cbb563c3-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '72');
INSERT INTO `t_role_pre` VALUES ('cbb84572-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '39');
INSERT INTO `t_role_pre` VALUES ('cbbab473-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '42');
INSERT INTO `t_role_pre` VALUES ('cbc2daaa-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '155');
INSERT INTO `t_role_pre` VALUES ('cbc6a890-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '142');
INSERT INTO `t_role_pre` VALUES ('cbcbc207-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '145');
INSERT INTO `t_role_pre` VALUES ('cbcea24b-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '143');
INSERT INTO `t_role_pre` VALUES ('cbd2b23a-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '144');
INSERT INTO `t_role_pre` VALUES ('cbdc704c-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '106');
INSERT INTO `t_role_pre` VALUES ('cbdf268d-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '132');
INSERT INTO `t_role_pre` VALUES ('cbe1bd50-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '135');
INSERT INTO `t_role_pre` VALUES ('cbe7f89d-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '137');
INSERT INTO `t_role_pre` VALUES ('cbeb4784-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '140');
INSERT INTO `t_role_pre` VALUES ('cbefe022-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '146');
INSERT INTO `t_role_pre` VALUES ('cbf55c86-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '161');
INSERT INTO `t_role_pre` VALUES ('cbf92e36-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '183');
INSERT INTO `t_role_pre` VALUES ('cbfd8330-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '240');
INSERT INTO `t_role_pre` VALUES ('cc0176ec-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '71');
INSERT INTO `t_role_pre` VALUES ('cc067280-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '86');
INSERT INTO `t_role_pre` VALUES ('cc098551-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '73');
INSERT INTO `t_role_pre` VALUES ('cc0d485b-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '74');
INSERT INTO `t_role_pre` VALUES ('cc13be2c-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '87');
INSERT INTO `t_role_pre` VALUES ('cc1614f0-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '88');
INSERT INTO `t_role_pre` VALUES ('cc1bcf9b-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '39');
INSERT INTO `t_role_pre` VALUES ('cc1f6908-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '152');
INSERT INTO `t_role_pre` VALUES ('cc24fdd4-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '153');
INSERT INTO `t_role_pre` VALUES ('cc29c876-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '149');
INSERT INTO `t_role_pre` VALUES ('cc2d284e-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '158');
INSERT INTO `t_role_pre` VALUES ('cc304800-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '159');
INSERT INTO `t_role_pre` VALUES ('cc3306df-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '39');
INSERT INTO `t_role_pre` VALUES ('cc3cb5e9-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '147');
INSERT INTO `t_role_pre` VALUES ('cc44517d-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '111');
INSERT INTO `t_role_pre` VALUES ('cc4a22d3-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '107');
INSERT INTO `t_role_pre` VALUES ('cc518beb-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '112');
INSERT INTO `t_role_pre` VALUES ('cc5b5b66-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '133');
INSERT INTO `t_role_pre` VALUES ('cc5f381d-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '134');
INSERT INTO `t_role_pre` VALUES ('cc637c11-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '135');
INSERT INTO `t_role_pre` VALUES ('cc66bd64-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '136');
INSERT INTO `t_role_pre` VALUES ('cc694243-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '137');
INSERT INTO `t_role_pre` VALUES ('cc6c392e-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '138');
INSERT INTO `t_role_pre` VALUES ('cc6f1075-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '164');
INSERT INTO `t_role_pre` VALUES ('cc71b43c-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '165');
INSERT INTO `t_role_pre` VALUES ('cc75f1b9-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '169');
INSERT INTO `t_role_pre` VALUES ('cc7a83a4-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '170');
INSERT INTO `t_role_pre` VALUES ('cc8187e7-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '177');
INSERT INTO `t_role_pre` VALUES ('cc854442-d6f6-11e6-a05b-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '181');
INSERT INTO `t_role_pre` VALUES ('cc8bfbd8-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '2');
INSERT INTO `t_role_pre` VALUES ('cc8ebd7d-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '12');
INSERT INTO `t_role_pre` VALUES ('cc9390e4-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '14');
INSERT INTO `t_role_pre` VALUES ('cc990a5c-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '17');
INSERT INTO `t_role_pre` VALUES ('cc9d1f23-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '18');
INSERT INTO `t_role_pre` VALUES ('cca1b1f4-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '15');
INSERT INTO `t_role_pre` VALUES ('cca5cf27-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '16');
INSERT INTO `t_role_pre` VALUES ('cca9f0c3-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '70');
INSERT INTO `t_role_pre` VALUES ('ccad8367-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '77');
INSERT INTO `t_role_pre` VALUES ('ccb1fe6f-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '78');
INSERT INTO `t_role_pre` VALUES ('ccb7558e-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '69');
INSERT INTO `t_role_pre` VALUES ('ccbb9eca-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '84');
INSERT INTO `t_role_pre` VALUES ('ccc1f260-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '85');
INSERT INTO `t_role_pre` VALUES ('ccc59eb7-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '79');
INSERT INTO `t_role_pre` VALUES ('cccbbdbb-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '80');
INSERT INTO `t_role_pre` VALUES ('cccff7be-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '81');
INSERT INTO `t_role_pre` VALUES ('ccd62866-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '82');
INSERT INTO `t_role_pre` VALUES ('ccd9f1d2-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '83');
INSERT INTO `t_role_pre` VALUES ('cce023cc-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '71');
INSERT INTO `t_role_pre` VALUES ('cce39928-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '73');
INSERT INTO `t_role_pre` VALUES ('cce7313f-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '74');
INSERT INTO `t_role_pre` VALUES ('cce9dec3-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '50');
INSERT INTO `t_role_pre` VALUES ('ccec80a7-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '51');
INSERT INTO `t_role_pre` VALUES ('cceed185-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '52');
INSERT INTO `t_role_pre` VALUES ('ccf209c1-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '53');
INSERT INTO `t_role_pre` VALUES ('ccf491af-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '54');
INSERT INTO `t_role_pre` VALUES ('ccfb35e4-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '55');
INSERT INTO `t_role_pre` VALUES ('ccff0486-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '56');
INSERT INTO `t_role_pre` VALUES ('cd01f212-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '39');
INSERT INTO `t_role_pre` VALUES ('cd04cbec-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '42');
INSERT INTO `t_role_pre` VALUES ('cd0a6acb-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '57');
INSERT INTO `t_role_pre` VALUES ('cd0e2d2e-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '58');
INSERT INTO `t_role_pre` VALUES ('cd108302-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '59');
INSERT INTO `t_role_pre` VALUES ('cd133fba-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '60');
INSERT INTO `t_role_pre` VALUES ('cd164038-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '61');
INSERT INTO `t_role_pre` VALUES ('cd1e422a-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '62');
INSERT INTO `t_role_pre` VALUES ('cd26e455-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '90');
INSERT INTO `t_role_pre` VALUES ('cd2b9b6b-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '95');
INSERT INTO `t_role_pre` VALUES ('cd30647a-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '96');
INSERT INTO `t_role_pre` VALUES ('cd33bfa1-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '99');
INSERT INTO `t_role_pre` VALUES ('cd36b891-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '100');
INSERT INTO `t_role_pre` VALUES ('cd37d633-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '261');
INSERT INTO `t_role_pre` VALUES ('cd3bdbb0-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '101');
INSERT INTO `t_role_pre` VALUES ('cd424833-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '102');
INSERT INTO `t_role_pre` VALUES ('cd45bdb1-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '103');
INSERT INTO `t_role_pre` VALUES ('cd48127c-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '104');
INSERT INTO `t_role_pre` VALUES ('cd4aae18-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '30');
INSERT INTO `t_role_pre` VALUES ('cd4d2fc2-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '31');
INSERT INTO `t_role_pre` VALUES ('cd4fa278-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '32');
INSERT INTO `t_role_pre` VALUES ('cd51fe54-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '33');
INSERT INTO `t_role_pre` VALUES ('cd54e740-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '34');
INSERT INTO `t_role_pre` VALUES ('cd572c42-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '35');
INSERT INTO `t_role_pre` VALUES ('cd582653-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '262');
INSERT INTO `t_role_pre` VALUES ('cd5a33e1-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '36');
INSERT INTO `t_role_pre` VALUES ('cd5d11f1-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '105');
INSERT INTO `t_role_pre` VALUES ('cd600146-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '106');
INSERT INTO `t_role_pre` VALUES ('cd6441fd-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '107');
INSERT INTO `t_role_pre` VALUES ('cd66ed6a-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '110');
INSERT INTO `t_role_pre` VALUES ('cd66fca8-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '263');
INSERT INTO `t_role_pre` VALUES ('cd693a39-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '111');
INSERT INTO `t_role_pre` VALUES ('cd6e210e-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '112');
INSERT INTO `t_role_pre` VALUES ('cd70b59a-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '266');
INSERT INTO `t_role_pre` VALUES ('cd71b491-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '114');
INSERT INTO `t_role_pre` VALUES ('cd7600e8-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '115');
INSERT INTO `t_role_pre` VALUES ('cd7a8e1a-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '267');
INSERT INTO `t_role_pre` VALUES ('cd7bb5a5-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '118');
INSERT INTO `t_role_pre` VALUES ('cd7ee7b3-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '119');
INSERT INTO `t_role_pre` VALUES ('cd7f1f55-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '270');
INSERT INTO `t_role_pre` VALUES ('cd82d545-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '123');
INSERT INTO `t_role_pre` VALUES ('cd84558c-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '271');
INSERT INTO `t_role_pre` VALUES ('cd872fcf-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '126');
INSERT INTO `t_role_pre` VALUES ('cd890f05-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '272');
INSERT INTO `t_role_pre` VALUES ('cd8e74c5-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '127');
INSERT INTO `t_role_pre` VALUES ('cd910497-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '273');
INSERT INTO `t_role_pre` VALUES ('cd91d260-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '132');
INSERT INTO `t_role_pre` VALUES ('cd94cb3d-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '274');
INSERT INTO `t_role_pre` VALUES ('cd959368-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '133');
INSERT INTO `t_role_pre` VALUES ('cd9933fe-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '275');
INSERT INTO `t_role_pre` VALUES ('cd9c01dc-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '134');
INSERT INTO `t_role_pre` VALUES ('cd9eec32-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '143');
INSERT INTO `t_role_pre` VALUES ('cd9fe26c-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '276');
INSERT INTO `t_role_pre` VALUES ('cda632fb-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '146');
INSERT INTO `t_role_pre` VALUES ('cda9195c-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '147');
INSERT INTO `t_role_pre` VALUES ('cdab253e-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '277');
INSERT INTO `t_role_pre` VALUES ('cdad7bc0-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '149');
INSERT INTO `t_role_pre` VALUES ('cdb33aeb-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '278');
INSERT INTO `t_role_pre` VALUES ('cdb370bc-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '152');
INSERT INTO `t_role_pre` VALUES ('cdb694cf-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '153');
INSERT INTO `t_role_pre` VALUES ('cdb96234-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '279');
INSERT INTO `t_role_pre` VALUES ('cdbc5a49-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '155');
INSERT INTO `t_role_pre` VALUES ('cdbe8f10-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '280');
INSERT INTO `t_role_pre` VALUES ('cdbf6998-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '158');
INSERT INTO `t_role_pre` VALUES ('cdc31a43-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '281');
INSERT INTO `t_role_pre` VALUES ('cdc4447e-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '159');
INSERT INTO `t_role_pre` VALUES ('cdc5d2ac-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '283');
INSERT INTO `t_role_pre` VALUES ('cdc78ea7-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '161');
INSERT INTO `t_role_pre` VALUES ('cdc917c1-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '284');
INSERT INTO `t_role_pre` VALUES ('cdcba9d9-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '164');
INSERT INTO `t_role_pre` VALUES ('cdce6943-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '286');
INSERT INTO `t_role_pre` VALUES ('cdcf883c-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '165');
INSERT INTO `t_role_pre` VALUES ('cdd29493-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '289');
INSERT INTO `t_role_pre` VALUES ('cdd3ba25-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '169');
INSERT INTO `t_role_pre` VALUES ('cdd704b0-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '170');
INSERT INTO `t_role_pre` VALUES ('cdd8724a-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '290');
INSERT INTO `t_role_pre` VALUES ('cdd9bf40-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '171');
INSERT INTO `t_role_pre` VALUES ('cddb90af-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '291');
INSERT INTO `t_role_pre` VALUES ('cddfa69f-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '175');
INSERT INTO `t_role_pre` VALUES ('cde2f6c3-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '176');
INSERT INTO `t_role_pre` VALUES ('cde5fea5-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '293');
INSERT INTO `t_role_pre` VALUES ('cde72802-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '177');
INSERT INTO `t_role_pre` VALUES ('cde9a5b4-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '295');
INSERT INTO `t_role_pre` VALUES ('cdeac356-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '181');
INSERT INTO `t_role_pre` VALUES ('cdec80d7-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '296');
INSERT INTO `t_role_pre` VALUES ('cdeecd60-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '182');
INSERT INTO `t_role_pre` VALUES ('cdf2815a-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '297');
INSERT INTO `t_role_pre` VALUES ('cdf648be-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '183');
INSERT INTO `t_role_pre` VALUES ('cdf8238c-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '299');
INSERT INTO `t_role_pre` VALUES ('cdfa042f-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '184');
INSERT INTO `t_role_pre` VALUES ('cdfcb1c6-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '300');
INSERT INTO `t_role_pre` VALUES ('cdfdccab-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '185');
INSERT INTO `t_role_pre` VALUES ('ce00bbe0-d70e-11e6-a05b-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '301');
INSERT INTO `t_role_pre` VALUES ('ce01d897-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '186');
INSERT INTO `t_role_pre` VALUES ('ce05916e-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '261');
INSERT INTO `t_role_pre` VALUES ('ce062d67-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '187');
INSERT INTO `t_role_pre` VALUES ('ce07f431-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '262');
INSERT INTO `t_role_pre` VALUES ('ce0ad38e-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '263');
INSERT INTO `t_role_pre` VALUES ('ce0c5807-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '188');
INSERT INTO `t_role_pre` VALUES ('ce1044b6-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '189');
INSERT INTO `t_role_pre` VALUES ('ce105df6-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '266');
INSERT INTO `t_role_pre` VALUES ('ce12efac-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '190');
INSERT INTO `t_role_pre` VALUES ('ce1396d9-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '267');
INSERT INTO `t_role_pre` VALUES ('ce170e30-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '191');
INSERT INTO `t_role_pre` VALUES ('ce171a4b-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '270');
INSERT INTO `t_role_pre` VALUES ('ce19bf2e-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '192');
INSERT INTO `t_role_pre` VALUES ('ce1c4608-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '271');
INSERT INTO `t_role_pre` VALUES ('ce1dc121-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '193');
INSERT INTO `t_role_pre` VALUES ('ce1f8c61-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '272');
INSERT INTO `t_role_pre` VALUES ('ce22c9fb-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '273');
INSERT INTO `t_role_pre` VALUES ('ce239eee-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '194');
INSERT INTO `t_role_pre` VALUES ('ce2642b9-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '195');
INSERT INTO `t_role_pre` VALUES ('ce283767-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '274');
INSERT INTO `t_role_pre` VALUES ('ce2b330c-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '275');
INSERT INTO `t_role_pre` VALUES ('ce2b9131-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '196');
INSERT INTO `t_role_pre` VALUES ('ce2f167d-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '197');
INSERT INTO `t_role_pre` VALUES ('ce30fa83-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '276');
INSERT INTO `t_role_pre` VALUES ('ce33bdc9-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '198');
INSERT INTO `t_role_pre` VALUES ('ce35bcdb-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '277');
INSERT INTO `t_role_pre` VALUES ('ce37210e-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '199');
INSERT INTO `t_role_pre` VALUES ('ce38ee83-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '278');
INSERT INTO `t_role_pre` VALUES ('ce3a9be1-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '200');
INSERT INTO `t_role_pre` VALUES ('ce3b1d33-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '279');
INSERT INTO `t_role_pre` VALUES ('ce3e0c49-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '280');
INSERT INTO `t_role_pre` VALUES ('ce3f14b8-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '201');
INSERT INTO `t_role_pre` VALUES ('ce42c947-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '202');
INSERT INTO `t_role_pre` VALUES ('ce42d201-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '281');
INSERT INTO `t_role_pre` VALUES ('ce46028e-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '283');
INSERT INTO `t_role_pre` VALUES ('ce467b7e-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '216');
INSERT INTO `t_role_pre` VALUES ('ce4a02ef-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '284');
INSERT INTO `t_role_pre` VALUES ('ce4b9ded-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '218');
INSERT INTO `t_role_pre` VALUES ('ce4f125e-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '219');
INSERT INTO `t_role_pre` VALUES ('ce4f78dc-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '286');
INSERT INTO `t_role_pre` VALUES ('ce53398e-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '212');
INSERT INTO `t_role_pre` VALUES ('ce53b655-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '289');
INSERT INTO `t_role_pre` VALUES ('ce58e11d-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '214');
INSERT INTO `t_role_pre` VALUES ('ce5b05b8-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '290');
INSERT INTO `t_role_pre` VALUES ('ce5eca74-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '235');
INSERT INTO `t_role_pre` VALUES ('ce5f7e1c-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '291');
INSERT INTO `t_role_pre` VALUES ('ce617bb2-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '236');
INSERT INTO `t_role_pre` VALUES ('ce64e9ec-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '237');
INSERT INTO `t_role_pre` VALUES ('ce68e4dd-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '293');
INSERT INTO `t_role_pre` VALUES ('ce69d95f-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '238');
INSERT INTO `t_role_pre` VALUES ('ce6d5c52-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '295');
INSERT INTO `t_role_pre` VALUES ('ce6d710b-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '239');
INSERT INTO `t_role_pre` VALUES ('ce708ff6-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '296');
INSERT INTO `t_role_pre` VALUES ('ce711127-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '240');
INSERT INTO `t_role_pre` VALUES ('ce73bd16-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '297');
INSERT INTO `t_role_pre` VALUES ('ce75ab2c-d6f6-11e6-a05b-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '13');
INSERT INTO `t_role_pre` VALUES ('ce797806-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '299');
INSERT INTO `t_role_pre` VALUES ('ce7a1ec0-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '2');
INSERT INTO `t_role_pre` VALUES ('ce7cd223-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '300');
INSERT INTO `t_role_pre` VALUES ('ce7e3157-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '6');
INSERT INTO `t_role_pre` VALUES ('ce7f8307-d70e-11e6-a05b-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '301');
INSERT INTO `t_role_pre` VALUES ('ce8236b7-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '7');
INSERT INTO `t_role_pre` VALUES ('ce884051-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '8');
INSERT INTO `t_role_pre` VALUES ('ce8c0bcf-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '9');
INSERT INTO `t_role_pre` VALUES ('ce8f84f6-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '10');
INSERT INTO `t_role_pre` VALUES ('ce958a4d-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '11');
INSERT INTO `t_role_pre` VALUES ('ce99a1ab-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '12');
INSERT INTO `t_role_pre` VALUES ('ce9e74cd-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '13');
INSERT INTO `t_role_pre` VALUES ('cea21885-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '14');
INSERT INTO `t_role_pre` VALUES ('cea922fa-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '15');
INSERT INTO `t_role_pre` VALUES ('ceb1d081-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '16');
INSERT INTO `t_role_pre` VALUES ('cebfd449-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '17');
INSERT INTO `t_role_pre` VALUES ('cec3c7a3-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '18');
INSERT INTO `t_role_pre` VALUES ('cec7dd88-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '19');
INSERT INTO `t_role_pre` VALUES ('cecc21a3-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '20');
INSERT INTO `t_role_pre` VALUES ('ced0c5d0-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '21');
INSERT INTO `t_role_pre` VALUES ('ced47933-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '22');
INSERT INTO `t_role_pre` VALUES ('cedae230-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '23');
INSERT INTO `t_role_pre` VALUES ('cee13be7-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '24');
INSERT INTO `t_role_pre` VALUES ('cee64320-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '25');
INSERT INTO `t_role_pre` VALUES ('ceeb0e4a-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '26');
INSERT INTO `t_role_pre` VALUES ('ceef3587-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '27');
INSERT INTO `t_role_pre` VALUES ('cef2a560-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '28');
INSERT INTO `t_role_pre` VALUES ('cef5fb3a-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '29');
INSERT INTO `t_role_pre` VALUES ('cef8fea4-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '30');
INSERT INTO `t_role_pre` VALUES ('cefe8fb7-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '31');
INSERT INTO `t_role_pre` VALUES ('cf02230b-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '32');
INSERT INTO `t_role_pre` VALUES ('cf087997-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '33');
INSERT INTO `t_role_pre` VALUES ('cf0c8aa0-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '34');
INSERT INTO `t_role_pre` VALUES ('cf12db30-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '35');
INSERT INTO `t_role_pre` VALUES ('cf1628e8-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '36');
INSERT INTO `t_role_pre` VALUES ('cf19ebdd-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '38');
INSERT INTO `t_role_pre` VALUES ('cf1de9fd-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '39');
INSERT INTO `t_role_pre` VALUES ('cf21e56c-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '40');
INSERT INTO `t_role_pre` VALUES ('cf2549ff-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '41');
INSERT INTO `t_role_pre` VALUES ('cf2ab87d-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '42');
INSERT INTO `t_role_pre` VALUES ('cf2e1ff3-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '43');
INSERT INTO `t_role_pre` VALUES ('cf32dccc-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '44');
INSERT INTO `t_role_pre` VALUES ('cf363262-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '45');
INSERT INTO `t_role_pre` VALUES ('cf38d665-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '46');
INSERT INTO `t_role_pre` VALUES ('cf3d370c-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '47');
INSERT INTO `t_role_pre` VALUES ('cf409f1c-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '48');
INSERT INTO `t_role_pre` VALUES ('cf4316c9-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '49');
INSERT INTO `t_role_pre` VALUES ('cf48dec4-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '50');
INSERT INTO `t_role_pre` VALUES ('cf4cb831-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '51');
INSERT INTO `t_role_pre` VALUES ('cf4fbe65-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '52');
INSERT INTO `t_role_pre` VALUES ('cf528f53-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '53');
INSERT INTO `t_role_pre` VALUES ('cf562406-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '54');
INSERT INTO `t_role_pre` VALUES ('cf599bd7-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '55');
INSERT INTO `t_role_pre` VALUES ('cf5ddf1c-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '56');
INSERT INTO `t_role_pre` VALUES ('cf6032bb-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '57');
INSERT INTO `t_role_pre` VALUES ('cf655d6f-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '58');
INSERT INTO `t_role_pre` VALUES ('cf68f29e-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '59');
INSERT INTO `t_role_pre` VALUES ('cf6d9284-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '60');
INSERT INTO `t_role_pre` VALUES ('cf7169b8-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '61');
INSERT INTO `t_role_pre` VALUES ('cf747cab-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '62');
INSERT INTO `t_role_pre` VALUES ('cf779f86-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '64');
INSERT INTO `t_role_pre` VALUES ('cf7b64c4-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '65');
INSERT INTO `t_role_pre` VALUES ('cf7f53a4-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '70');
INSERT INTO `t_role_pre` VALUES ('cf841dc5-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '71');
INSERT INTO `t_role_pre` VALUES ('cf87bda9-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '73');
INSERT INTO `t_role_pre` VALUES ('cf8b92e0-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '74');
INSERT INTO `t_role_pre` VALUES ('cf8f67a8-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '77');
INSERT INTO `t_role_pre` VALUES ('cf93014d-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '78');
INSERT INTO `t_role_pre` VALUES ('cf99528c-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '79');
INSERT INTO `t_role_pre` VALUES ('cf9d6378-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '80');
INSERT INTO `t_role_pre` VALUES ('cfa0ba4a-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '81');
INSERT INTO `t_role_pre` VALUES ('cfa4ee8a-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '82');
INSERT INTO `t_role_pre` VALUES ('cfa95adf-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '83');
INSERT INTO `t_role_pre` VALUES ('cfac9927-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '84');
INSERT INTO `t_role_pre` VALUES ('cfaf28da-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '85');
INSERT INTO `t_role_pre` VALUES ('cfb18856-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '86');
INSERT INTO `t_role_pre` VALUES ('cfb93478-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '87');
INSERT INTO `t_role_pre` VALUES ('cfbd95df-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '88');
INSERT INTO `t_role_pre` VALUES ('cfc097eb-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '89');
INSERT INTO `t_role_pre` VALUES ('cfc50f7d-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '90');
INSERT INTO `t_role_pre` VALUES ('cfc9b97a-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '92');
INSERT INTO `t_role_pre` VALUES ('cfcc8f5f-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '93');
INSERT INTO `t_role_pre` VALUES ('cfcf891c-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '94');
INSERT INTO `t_role_pre` VALUES ('cfd46f70-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '95');
INSERT INTO `t_role_pre` VALUES ('cfd8a28e-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '96');
INSERT INTO `t_role_pre` VALUES ('cfdbdadf-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '97');
INSERT INTO `t_role_pre` VALUES ('cfe1a619-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '98');
INSERT INTO `t_role_pre` VALUES ('cfe5fd20-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '99');
INSERT INTO `t_role_pre` VALUES ('cfe99e4e-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '100');
INSERT INTO `t_role_pre` VALUES ('cfedbeb1-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '101');
INSERT INTO `t_role_pre` VALUES ('cff1b98f-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '102');
INSERT INTO `t_role_pre` VALUES ('cff51cfb-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '103');
INSERT INTO `t_role_pre` VALUES ('cffb309e-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '104');
INSERT INTO `t_role_pre` VALUES ('cfff7341-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '105');
INSERT INTO `t_role_pre` VALUES ('d00333a3-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '106');
INSERT INTO `t_role_pre` VALUES ('d007ad50-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '107');
INSERT INTO `t_role_pre` VALUES ('d00b2342-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '108');
INSERT INTO `t_role_pre` VALUES ('d0108143-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '109');
INSERT INTO `t_role_pre` VALUES ('d013b9cc-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '110');
INSERT INTO `t_role_pre` VALUES ('d017dd90-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '111');
INSERT INTO `t_role_pre` VALUES ('d01c0522-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '112');
INSERT INTO `t_role_pre` VALUES ('d02000de-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '113');
INSERT INTO `t_role_pre` VALUES ('d0231d46-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '114');
INSERT INTO `t_role_pre` VALUES ('d02818c0-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '115');
INSERT INTO `t_role_pre` VALUES ('d02ba8d2-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '116');
INSERT INTO `t_role_pre` VALUES ('d030202d-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '117');
INSERT INTO `t_role_pre` VALUES ('d0338b4c-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '118');
INSERT INTO `t_role_pre` VALUES ('d03a021e-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '119');
INSERT INTO `t_role_pre` VALUES ('d03dbaa1-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '120');
INSERT INTO `t_role_pre` VALUES ('d0418e82-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '121');
INSERT INTO `t_role_pre` VALUES ('d043d534-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '122');
INSERT INTO `t_role_pre` VALUES ('d049379a-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '123');
INSERT INTO `t_role_pre` VALUES ('d04cc3dd-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '124');
INSERT INTO `t_role_pre` VALUES ('d0516e74-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '125');
INSERT INTO `t_role_pre` VALUES ('d055633e-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '126');
INSERT INTO `t_role_pre` VALUES ('d0594950-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '127');
INSERT INTO `t_role_pre` VALUES ('d05c7760-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '128');
INSERT INTO `t_role_pre` VALUES ('d0616f69-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '129');
INSERT INTO `t_role_pre` VALUES ('d064fa09-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '132');
INSERT INTO `t_role_pre` VALUES ('d069a92b-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '133');
INSERT INTO `t_role_pre` VALUES ('d06d443c-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '134');
INSERT INTO `t_role_pre` VALUES ('d070a6de-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '136');
INSERT INTO `t_role_pre` VALUES ('d07338da-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '143');
INSERT INTO `t_role_pre` VALUES ('d07891ba-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '148');
INSERT INTO `t_role_pre` VALUES ('d07c6787-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '149');
INSERT INTO `t_role_pre` VALUES ('d07fef1d-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '150');
INSERT INTO `t_role_pre` VALUES ('d0829650-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '151');
INSERT INTO `t_role_pre` VALUES ('d0865df6-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '152');
INSERT INTO `t_role_pre` VALUES ('d08be05e-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '153');
INSERT INTO `t_role_pre` VALUES ('d08e81d7-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '154');
INSERT INTO `t_role_pre` VALUES ('d0930147-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '155');
INSERT INTO `t_role_pre` VALUES ('d0954b51-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '156');
INSERT INTO `t_role_pre` VALUES ('d09a79e5-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '157');
INSERT INTO `t_role_pre` VALUES ('d09dfcd6-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '158');
INSERT INTO `t_role_pre` VALUES ('d0a40490-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '159');
INSERT INTO `t_role_pre` VALUES ('d0a95d41-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '160');
INSERT INTO `t_role_pre` VALUES ('d0abfc5b-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '161');
INSERT INTO `t_role_pre` VALUES ('d0ae7eec-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '162');
INSERT INTO `t_role_pre` VALUES ('d0b0f795-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '163');
INSERT INTO `t_role_pre` VALUES ('d0b5dfcc-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '164');
INSERT INTO `t_role_pre` VALUES ('d0b98e57-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '165');
INSERT INTO `t_role_pre` VALUES ('d0bc3635-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '165');
INSERT INTO `t_role_pre` VALUES ('d0bee53a-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '169');
INSERT INTO `t_role_pre` VALUES ('d0c351f1-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '170');
INSERT INTO `t_role_pre` VALUES ('d0c70bd8-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '171');
INSERT INTO `t_role_pre` VALUES ('d0c9efb3-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '172');
INSERT INTO `t_role_pre` VALUES ('d0cec065-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '173');
INSERT INTO `t_role_pre` VALUES ('d0d2d6dc-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '174');
INSERT INTO `t_role_pre` VALUES ('d0d5c880-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '175');
INSERT INTO `t_role_pre` VALUES ('d0dab2e7-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '176');
INSERT INTO `t_role_pre` VALUES ('d0dd6d10-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '177');
INSERT INTO `t_role_pre` VALUES ('d0e19d01-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '181');
INSERT INTO `t_role_pre` VALUES ('d0e52140-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '182');
INSERT INTO `t_role_pre` VALUES ('d0e8333b-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '183');
INSERT INTO `t_role_pre` VALUES ('d0edd553-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '184');
INSERT INTO `t_role_pre` VALUES ('d0f0b546-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '185');
INSERT INTO `t_role_pre` VALUES ('d0f6e8a7-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '186');
INSERT INTO `t_role_pre` VALUES ('d0fb1194-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '187');
INSERT INTO `t_role_pre` VALUES ('d0fec5d9-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '188');
INSERT INTO `t_role_pre` VALUES ('d10134b8-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '189');
INSERT INTO `t_role_pre` VALUES ('d10414a3-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '190');
INSERT INTO `t_role_pre` VALUES ('d1085957-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '191');
INSERT INTO `t_role_pre` VALUES ('d10c3e71-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '192');
INSERT INTO `t_role_pre` VALUES ('d10ef078-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '193');
INSERT INTO `t_role_pre` VALUES ('d114356e-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '194');
INSERT INTO `t_role_pre` VALUES ('d117809c-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '195');
INSERT INTO `t_role_pre` VALUES ('d11dfec3-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '196');
INSERT INTO `t_role_pre` VALUES ('d1224474-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '197');
INSERT INTO `t_role_pre` VALUES ('d1254e8c-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '198');
INSERT INTO `t_role_pre` VALUES ('d127cbf0-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '199');
INSERT INTO `t_role_pre` VALUES ('d12daa1a-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '200');
INSERT INTO `t_role_pre` VALUES ('d1313fe3-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '201');
INSERT INTO `t_role_pre` VALUES ('d133e4a6-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '202');
INSERT INTO `t_role_pre` VALUES ('d139cd02-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '230');
INSERT INTO `t_role_pre` VALUES ('d13d0c5c-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '231');
INSERT INTO `t_role_pre` VALUES ('d13fce41-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '232');
INSERT INTO `t_role_pre` VALUES ('d1455ffa-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '233');
INSERT INTO `t_role_pre` VALUES ('d1488beb-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '234');
INSERT INTO `t_role_pre` VALUES ('d14f17f4-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '235');
INSERT INTO `t_role_pre` VALUES ('d152f14b-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '236');
INSERT INTO `t_role_pre` VALUES ('d1558e7d-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '237');
INSERT INTO `t_role_pre` VALUES ('d157edf5-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '238');
INSERT INTO `t_role_pre` VALUES ('d15a591e-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '239');
INSERT INTO `t_role_pre` VALUES ('d1612b95-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '240');
INSERT INTO `t_role_pre` VALUES ('d1653a19-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '241');
INSERT INTO `t_role_pre` VALUES ('d168a9a0-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '242');
INSERT INTO `t_role_pre` VALUES ('d16b7bcf-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '243');
INSERT INTO `t_role_pre` VALUES ('d16f8b58-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '244');
INSERT INTO `t_role_pre` VALUES ('d1735f67-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '245');
INSERT INTO `t_role_pre` VALUES ('d1786405-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '246');
INSERT INTO `t_role_pre` VALUES ('d17b89cb-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '249');
INSERT INTO `t_role_pre` VALUES ('d17faed4-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '250');
INSERT INTO `t_role_pre` VALUES ('d1846514-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '251');
INSERT INTO `t_role_pre` VALUES ('d188a255-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '252');
INSERT INTO `t_role_pre` VALUES ('d18d23d8-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '253');
INSERT INTO `t_role_pre` VALUES ('d1915fa1-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '254');
INSERT INTO `t_role_pre` VALUES ('d195af42-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '259');
INSERT INTO `t_role_pre` VALUES ('d19bd0aa-d6f6-11e6-a05b-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '260');
INSERT INTO `t_role_pre` VALUES ('e29ed6f2-dc95-11e6-9ebd-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '287');
INSERT INTO `t_role_pre` VALUES ('edfa5ea7-dd17-11e6-a41a-f8a963dbc5fb', '4028dac159aca1a20159acc16ed40005', '292');
INSERT INTO `t_role_pre` VALUES ('f2ffe524-dc88-11e6-9ebd-507b9d765567', '2d0c04c5b87444c0af538396efee5b22', '302');
INSERT INTO `t_role_pre` VALUES ('f3165344-dc88-11e6-9ebd-507b9d765567', '2e44d67971534136825564e6345a9a55', '302');
INSERT INTO `t_role_pre` VALUES ('f32614d4-dc88-11e6-9ebd-507b9d765567', '30efd5bfa76d43268e0a18745a33da00', '302');
INSERT INTO `t_role_pre` VALUES ('f32a93df-dc88-11e6-9ebd-507b9d765567', 'f5d46e6afcb84488800b55e9243cd979', '302');
INSERT INTO `t_role_pre` VALUES ('f32eb2f5-dc88-11e6-9ebd-507b9d765567', '4028809359ab42ce0159ab4770a70000', '302');
INSERT INTO `t_role_pre` VALUES ('f3367e62-dc88-11e6-9ebd-507b9d765567', '4028dac059767f9c01597683db780000', '302');
INSERT INTO `t_role_pre` VALUES ('f33c564d-dc88-11e6-9ebd-507b9d765567', '61f4a49ba4e74e569c5c5332a5bfa1bf', '302');
INSERT INTO `t_role_pre` VALUES ('f3432d7f-dc88-11e6-9ebd-507b9d765567', '6e6ec112f67542a5bdc2efbcb742ffe7', '302');
INSERT INTO `t_role_pre` VALUES ('f347690c-dc88-11e6-9ebd-507b9d765567', '795da931af554de9a7727e6da1fdc25d', '302');
INSERT INTO `t_role_pre` VALUES ('f34cd843-dc88-11e6-9ebd-507b9d765567', 'd886cd061fdf402887bc872f135d617f', '302');
INSERT INTO `t_role_pre` VALUES ('f351aa54-dc88-11e6-9ebd-507b9d765567', 'ee0264885f4f451d8be46dab9d0949e8', '302');

-- ----------------------------
-- Table structure for t_room
-- ----------------------------
DROP TABLE IF EXISTS `t_room`;
CREATE TABLE `t_room` (
  `roomid` varchar(32) NOT NULL COMMENT '宿舍编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `stuid` varchar(32) DEFAULT NULL COMMENT '宿舍长编号',
  `quantity` int(11) NOT NULL COMMENT '宿舍最大人数',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_room
-- ----------------------------
INSERT INTO `t_room` VALUES ('402881e95974268a0159742974e30001', '俄方微风', 'ff80808159af2db50159af567a45000a', '1', '1');
INSERT INTO `t_room` VALUES ('4028daef59b0776b0159b07e1d520003', '宿舍1', '4028809259aee2d50159aeebcbc40000', '1', '1');

-- ----------------------------
-- Table structure for t_salary
-- ----------------------------
DROP TABLE IF EXISTS `t_salary`;
CREATE TABLE `t_salary` (
  `salaryid` varchar(32) NOT NULL COMMENT '工资发放编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `extrasalary` double DEFAULT NULL COMMENT '奖励',
  `subsalary` double DEFAULT NULL COMMENT '扣罚',
  `salaryday` datetime DEFAULT NULL COMMENT '发放时间',
  `totalsalary` double DEFAULT NULL COMMENT '总工资',
  PRIMARY KEY (`salaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_salary
-- ----------------------------

-- ----------------------------
-- Table structure for t_salaryinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_salaryinfo`;
CREATE TABLE `t_salaryinfo` (
  `salaryinfoid` varchar(32) NOT NULL COMMENT '工资情况编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `basicsalary` double NOT NULL COMMENT '基本工资',
  `jobsalary` double NOT NULL COMMENT '岗位工资',
  PRIMARY KEY (`salaryinfoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_salaryinfo
-- ----------------------------
INSERT INTO `t_salaryinfo` VALUES ('4028809259ac82560159ac85184e0000', '4028809259a64a780159a6ff599b0005', '2433', '4554');

-- ----------------------------
-- Table structure for t_score
-- ----------------------------
DROP TABLE IF EXISTS `t_score`;
CREATE TABLE `t_score` (
  `scoreid` varchar(32) NOT NULL COMMENT '成绩编号',
  `stuid` varchar(32) NOT NULL COMMENT '学生编号',
  `courseid` varchar(32) NOT NULL COMMENT '课程编号',
  `score` float DEFAULT NULL COMMENT '成绩',
  `testday` datetime DEFAULT NULL COMMENT '考试时间',
  PRIMARY KEY (`scoreid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_score
-- ----------------------------
INSERT INTO `t_score` VALUES ('297e68eb5cd27781015cd290e4860001', '4028809259ac82560159ac969060000c', '297e68eb5cd27781015cd290a4f70000', '111', '2017-06-23 00:00:00');
INSERT INTO `t_score` VALUES ('4028daef59b0776b0159b07f69110005', '4028daef59b0776b0159b07d41040001', 'ff80808159af2db50159af7227380018', '33', '2017-01-18 00:00:00');

-- ----------------------------
-- Table structure for t_stu
-- ----------------------------
DROP TABLE IF EXISTS `t_stu`;
CREATE TABLE `t_stu` (
  `stuid` varchar(32) NOT NULL COMMENT '学生编号',
  `stuno` varchar(20) DEFAULT NULL COMMENT '学号',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `pwd` varchar(50) DEFAULT NULL COMMENT '密码',
  `idcard` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `qq` varchar(20) DEFAULT NULL COMMENT 'qq号',
  `wechat` varchar(50) DEFAULT NULL COMMENT '微信号',
  `school` varchar(50) DEFAULT NULL COMMENT '毕业学校',
  `age` int(11) NOT NULL COMMENT '年龄',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `gender` varchar(5) NOT NULL COMMENT '性别',
  `address` varchar(255) DEFAULT NULL COMMENT '家庭地址',
  `nation` varchar(20) DEFAULT NULL COMMENT '籍贯',
  `residence` varchar(20) DEFAULT NULL COMMENT '户口性质',
  `gradeid` varchar(32) DEFAULT NULL COMMENT '班级编号',
  `roomid` varchar(32) DEFAULT NULL COMMENT '宿舍编号',
  `parentname` varchar(20) DEFAULT NULL COMMENT '家长姓名',
  `parentphone` varchar(11) DEFAULT NULL COMMENT '家长手机号',
  `startday` datetime DEFAULT NULL COMMENT '入学时间',
  `empid` varchar(32) DEFAULT '' COMMENT '招生老师',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  `stustatus` varchar(20) DEFAULT NULL COMMENT '学生状态，包括"意向","预定","正式"',
  `role` varchar(25) DEFAULT NULL COMMENT '班干部角色',
  PRIMARY KEY (`stuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stu
-- ----------------------------
INSERT INTO `t_stu` VALUES ('297e68eb5cd27781015cd2cef0bf0002', null, '小明', null, null, '16670102344', '12312313', null, '高洲啊', '14', null, 'woman', null, null, null, null, null, null, null, null, '4028809259a64a780159a662bfce0000', null, '1', 'intention', null);
INSERT INTO `t_stu` VALUES ('4028809259ac82560159ac969060000c', '1', '是是', '6khXbzC+FmmXFpnAmtBclA==', '360721199812014014', '15079762838', '', '', '', '0', null, '', '', '', '', '4028daef59b0776b0159b07efe580004', '4028daef59b0776b0159b07e1d520003', '', '', null, null, null, '1', 'official', 'monitor');
INSERT INTO `t_stu` VALUES ('4028809259aee2d50159aeebcbc40000', null, '王峰', '6khXbzC+FmmXFpnAmtBclA==', null, '15079762837', '861543705', null, '横江中学', '14', null, 'boy', null, null, null, null, null, null, null, null, null, null, '1', 'official', null);
INSERT INTO `t_stu` VALUES ('4028809259aee2d50159aef2be940003', null, '笑笑', '6khXbzC+FmmXFpnAmtBclA==', null, '13234547687', '1243465768', null, '北进青华', '18', null, 'boy', null, null, null, null, null, null, null, null, null, null, '1', 'predetermine', null);
INSERT INTO `t_stu` VALUES ('4028809259aee2d50159aef411ce0005', null, '小米', '6khXbzC+FmmXFpnAmtBclA==', null, '1324446677', '234545567', null, '赣州机会学院', '20', null, 'boy', null, null, null, null, null, null, null, null, null, null, '1', 'predetermine', null);
INSERT INTO `t_stu` VALUES ('402881eb59ad07d10159ad0b050c0000', '1', '温鑫', '6khXbzC+FmmXFpnAmtBclA==', '360721199812014014', '15570102342', '23343454', 'null', '赣州技师学院', '0', '2017-01-18 00:00:00', 'boy', '赣州技师', '江西', 'countryside', null, null, '张文明', '15570102341', '2017-01-18 00:00:00', null, null, '1', 'official', 'student');
INSERT INTO `t_stu` VALUES ('4028daef59b0776b0159b07d41040001', '1', '张章', '6khXbzC+FmmXFpnAmtBclA==', '360721199812014014', '15570102341', '8318045', 'wechat', '宏图', '0', '2017-01-18 00:00:00', 'boy', '赣州技师', '江西', 'countryside', null, null, '张', '15570102341', '2017-01-18 00:00:00', null, null, '1', 'official', 'student');
INSERT INTO `t_stu` VALUES ('ff80808159aefba60159aefe41500000', null, '名呢', '6khXbzC+FmmXFpnAmtBclA==', null, '123434454', '24356566', null, '江西理工', '20', null, 'boy', null, null, null, null, null, null, null, null, null, null, '1', 'predetermine', null);
INSERT INTO `t_stu` VALUES ('ff80808159af2db50159af567a45000a', '3', '温馨1', '6khXbzC+FmmXFpnAmtBclA==', '360721199812014014', '15879719188', '2514356781', 'wechat', '赣州技师学院', '0', '2017-01-18 00:00:00', 'boy', '公司', '江西', 'countryside', null, null, '张', '15570102341', '2017-01-18 00:00:00', null, null, '1', 'official', 'student');
INSERT INTO `t_stu` VALUES ('ff80808159af2db50159af593292000c', null, '小明1', '6khXbzC+FmmXFpnAmtBclA==', null, '14564484841', '1215165451', null, '北进青华', '20', null, 'boy', null, null, null, null, null, null, null, null, null, null, '0', 'predetermine', null);

-- ----------------------------
-- Table structure for t_stuchecking
-- ----------------------------
DROP TABLE IF EXISTS `t_stuchecking`;
CREATE TABLE `t_stuchecking` (
  `checkingid` varchar(32) NOT NULL COMMENT '学生考勤编号',
  `stuid` varchar(32) NOT NULL COMMENT '学生编号',
  `checkingday` datetime DEFAULT NULL COMMENT '考勤日期',
  `checking1` varchar(20) DEFAULT NULL COMMENT '上午',
  `checking2` varchar(20) DEFAULT NULL COMMENT '中午',
  `checking3` varchar(20) DEFAULT NULL COMMENT '下午',
  PRIMARY KEY (`checkingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stuchecking
-- ----------------------------
INSERT INTO `t_stuchecking` VALUES ('4028daef59b0776b0159b08e665c0006', '4028daef59b0776b0159b07d41040001', '2017-01-18 00:00:00', '1', '1', '1');
INSERT INTO `t_stuchecking` VALUES ('ff80808159af2db50159af6d87460016', 'ff80808159af2db50159af567a45000a', '2017-01-18 00:00:00', '1', '1', '1');

-- ----------------------------
-- Table structure for t_stufeedback
-- ----------------------------
DROP TABLE IF EXISTS `t_stufeedback`;
CREATE TABLE `t_stufeedback` (
  `feedbackid` varchar(32) NOT NULL COMMENT '反馈编号',
  `stuid` varchar(32) NOT NULL COMMENT '学生编号',
  `feedbackday` datetime DEFAULT NULL COMMENT '反馈时间',
  `des` varchar(500) DEFAULT NULL COMMENT '反馈详情',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认可用',
  PRIMARY KEY (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stufeedback
-- ----------------------------

-- ----------------------------
-- Table structure for t_stuleave
-- ----------------------------
DROP TABLE IF EXISTS `t_stuleave`;
CREATE TABLE `t_stuleave` (
  `leaveid` varchar(32) NOT NULL COMMENT '学生请假编号',
  `stuid` varchar(32) NOT NULL COMMENT '学生编号',
  `starttime` datetime DEFAULT NULL COMMENT '开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '结束时间',
  `leaveday` datetime DEFAULT NULL COMMENT '提交时间',
  `des` varchar(255) DEFAULT NULL COMMENT '请假说明',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  `firlevel` int(11) DEFAULT '0' COMMENT '任课老师审核，默认不通过',
  `secondlevel` int(11) DEFAULT '0' COMMENT '班主任审核，默认不通过',
  `pass` int(11) DEFAULT '0' COMMENT '通过状态，默认为不通过',
  PRIMARY KEY (`leaveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stuleave
-- ----------------------------
INSERT INTO `t_stuleave` VALUES ('ff80808159af2db50159af2f560d0000', '4028809259ac82560159ac969060000c', '2017-01-18 00:00:00', '2017-01-19 00:00:00', '2017-01-18 00:00:00', '我要回家', '1', '1', '1', '1');
INSERT INTO `t_stuleave` VALUES ('ff80808159af2db50159af6412c40012', '4028809259ac82560159ac969060000c', '2017-01-18 00:00:00', '2017-01-19 00:00:00', '2017-01-18 00:00:00', '有事回家', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for t_talk
-- ----------------------------
DROP TABLE IF EXISTS `t_talk`;
CREATE TABLE `t_talk` (
  `talkid` varchar(32) NOT NULL COMMENT '谈心编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `stuid` varchar(32) NOT NULL COMMENT '学生编号',
  `talkday` datetime DEFAULT NULL COMMENT '谈心时间',
  `des` varchar(500) DEFAULT NULL COMMENT '谈心详情',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用状态',
  PRIMARY KEY (`talkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_talk
-- ----------------------------
INSERT INTO `t_talk` VALUES ('ff80808159af2db50159af6cedc00015', '4028809259a64a780159a662bfce0000', 'ff80808159af2db50159af567a45000a', '2017-01-18 00:00:00', '贪心', '1');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '张文星', '11');
