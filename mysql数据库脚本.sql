-- phpMyAdmin SQL Dump
-- version 3.0.1.1
-- http://www.phpmyadmin.net
--
-- �������汾: 5.1.29
-- PHP �汾: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a'); 

CREATE TABLE IF NOT EXISTS `t_userInfo` (
  `user_name` varchar(30)  NOT NULL COMMENT 'user_name',
  `password` varchar(30)  NOT NULL COMMENT '��¼����',
  `name` varchar(20)  NOT NULL COMMENT '����',
  `gender` varchar(4)  NOT NULL COMMENT '�Ա�',
  `birthDate` varchar(20)  NULL COMMENT '��������',
  `userPhoto` varchar(60)  NOT NULL COMMENT '�û���Ƭ',
  `telephone` varchar(20)  NOT NULL COMMENT '��ϵ�绰',
  `email` varchar(50)  NOT NULL COMMENT '����',
  `address` varchar(80)  NULL COMMENT '��ͥ��ַ',
  `regTime` varchar(20)  NULL COMMENT 'ע��ʱ��',
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_jiaofei` (
  `jiaofeiId` int(11) NOT NULL AUTO_INCREMENT COMMENT '�ɷ�id',
  `jiaofeiTypeObj` int(11) NOT NULL COMMENT '�ɷ�����',
  `jiaofeiName` varchar(20)  NOT NULL COMMENT '�ɷ�����',
  `jiaofeiMoney` float NOT NULL COMMENT '�ɷѽ��',
  `userObj` varchar(30)  NOT NULL COMMENT '�ɷ�ѧԱ',
  `jiaofeiTime` varchar(20)  NULL COMMENT '�ɷ�ʱ��',
  `jiaofeiMemo` varchar(800)  NULL COMMENT '�ɷѱ�ע',
  PRIMARY KEY (`jiaofeiId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_jiaofeiType` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `typeName` varchar(20)  NOT NULL COMMENT '��������',
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_coach` (
  `coachNo` varchar(30)  NOT NULL COMMENT 'coachNo',
  `name` varchar(20)  NOT NULL COMMENT '����',
  `gender` varchar(4)  NOT NULL COMMENT '�Ա�',
  `birthDate` varchar(20)  NULL COMMENT '��������',
  `coachPhoto` varchar(60)  NOT NULL COMMENT '������Ƭ',
  `workYears` varchar(20)  NOT NULL COMMENT '��������',
  `telephone` varchar(20)  NOT NULL COMMENT '��ϵ�绰',
  `address` varchar(80)  NULL COMMENT '��ͥ��ַ',
  `coachDesc` varchar(8000)  NOT NULL COMMENT '��������',
  PRIMARY KEY (`coachNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_exam` (
  `examId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `examName` varchar(20)  NOT NULL COMMENT '��������',
  `kemu` varchar(20)  NOT NULL COMMENT '���Կ�Ŀ',
  `userObj` varchar(30)  NOT NULL COMMENT '����ѧԱ',
  `examDate` varchar(20)  NULL COMMENT '��������',
  `startTime` varchar(20)  NOT NULL COMMENT '���Կ�ʼʱ��',
  `examPlace` varchar(20)  NOT NULL COMMENT '���Եص�',
  `coachObj` varchar(30)  NOT NULL COMMENT '����',
  `examMemo` varchar(800)  NULL COMMENT '���Ա�ע',
  PRIMARY KEY (`examId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_leaveword` (
  `leaveWordId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `leaveTitle` varchar(80)  NOT NULL COMMENT '���Ա���',
  `leaveContent` varchar(2000)  NOT NULL COMMENT '��������',
  `userObj` varchar(30)  NOT NULL COMMENT '������',
  `leaveTime` varchar(20)  NULL COMMENT '����ʱ��',
  `replyContent` varchar(1000)  NULL COMMENT '����ظ�',
  `replyTime` varchar(20)  NULL COMMENT '�ظ�ʱ��',
  PRIMARY KEY (`leaveWordId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_notice` (
  `noticeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `title` varchar(80)  NOT NULL COMMENT '����',
  `content` varchar(5000)  NOT NULL COMMENT '��������',
  `publishDate` varchar(20)  NULL COMMENT '����ʱ��',
  PRIMARY KEY (`noticeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

ALTER TABLE t_jiaofei ADD CONSTRAINT FOREIGN KEY (jiaofeiTypeObj) REFERENCES t_jiaofeiType(typeId);
ALTER TABLE t_jiaofei ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_exam ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_exam ADD CONSTRAINT FOREIGN KEY (coachObj) REFERENCES t_coach(coachNo);
ALTER TABLE t_leaveword ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);


