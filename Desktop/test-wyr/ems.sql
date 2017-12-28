/*
MySQL Data Transfer
Source Host: localhost
Source Database: ems
Target Host: localhost
Target Database: ems
Date: 2014/12/5 0:45:40
*/

create database ems;
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for anthorty_info
-- ----------------------------
CREATE TABLE `anthorty_info` (
  `anthorty_id` int(11) NOT NULL auto_increment,
  `anthorty_pid` int(11) default NULL,
  `anthorty_name` varchar(100) default NULL,
  `anthorty_desc` varchar(1000) default NULL,
  `anthorty_url` varchar(1000) default NULL,
  PRIMARY KEY  (`anthorty_id`),
  KEY `FK_Reference_2` (`anthorty_pid`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for attendance_info
-- ----------------------------
CREATE TABLE `attendance_info` (
  `attendance_id` int(11) NOT NULL auto_increment,
  `student_id` int(11) default NULL,
  `attendance_desc` varchar(100) default NULL,
  `attendance_state` varchar(10) default NULL,
  `attendance_time` datetime default NULL,
  `attendance_remark` varchar(2000) default NULL,
  PRIMARY KEY  (`attendance_id`),
  KEY `FK_Reference_22` (`student_id`),
  CONSTRAINT `FK_Reference_22` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for audition_info
-- ----------------------------
CREATE TABLE `audition_info` (
  `audition_id` int(11) NOT NULL auto_increment,
  `student_id` int(11) default NULL,
  `audition_time` datetime default NULL,
  `audition_addr` varchar(300) default NULL,
  `audition_course` varchar(100) default NULL,
  `audition_desc` varchar(2000) default NULL,
  PRIMARY KEY  (`audition_id`),
  KEY `FK_Reference_10` (`student_id`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for class_info
-- ----------------------------
CREATE TABLE `class_info` (
  `class_id` int(11) NOT NULL auto_increment,
  `discipline_id` int(11) default NULL,
  `syllabus_id` int(11) default NULL,
  `classroom_id` int(11) default NULL,
  `staff_id` int(11) default NULL,
  `class_name` varchar(100) default NULL,
  `class_number` int(11) default NULL,
  `class_start_time` datetime default NULL,
  `class_end_time` datetime default NULL,
  `class_isuesd` varchar(10) default NULL,
  `class_state` varchar(10) default NULL,
  `class_desc` varchar(1000) default NULL,
  PRIMARY KEY  (`class_id`),
  KEY `FK_Reference_17` (`discipline_id`),
  KEY `FK_Reference_18` (`syllabus_id`),
  KEY `FK_Reference_19` (`classroom_id`),
  KEY `FK_Reference_20` (`staff_id`),
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`discipline_id`) REFERENCES `discipline_info` (`discipline_id`),
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`syllabus_id`) REFERENCES `syllabus_info` (`syllabus_id`),
  CONSTRAINT `FK_Reference_19` FOREIGN KEY (`classroom_id`) REFERENCES `classroom_info` (`classroom_id`),
  CONSTRAINT `FK_Reference_20` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for class_transaction_info
-- ----------------------------
CREATE TABLE `class_transaction_info` (
  `class_transaction_id` int(11) NOT NULL auto_increment,
  `class_id` int(11) default NULL,
  `class_transaction_title` varchar(100) default NULL,
  `class_transaction_content` varchar(2000) default NULL,
  `class_transaction_person` varchar(100) default NULL,
  `class_transaction_time` datetime default NULL,
  `class_transaction_remark` varchar(2000) default NULL,
  PRIMARY KEY  (`class_transaction_id`),
  KEY `FK_Reference_21` (`class_id`),
  CONSTRAINT `FK_Reference_21` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for classroom_info
-- ----------------------------
CREATE TABLE `classroom_info` (
  `classroom_id` int(11) NOT NULL auto_increment,
  `classroom_name` varchar(100) default NULL,
  `classroom_max` int(11) default NULL,
  `classroom_info` varchar(1000) default NULL,
  `classroom_remark` varchar(1000) default NULL,
  `classroom_mark` varchar(10) default NULL,
  PRIMARY KEY  (`classroom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for communicate_info
-- ----------------------------
CREATE TABLE `communicate_info` (
  `communicate_id` int(11) NOT NULL auto_increment,
  `student_id` int(11) default NULL,
  `staff_id` int(11) default NULL,
  `communicate_time` datetime default NULL,
  `communicate_content` varchar(2000) default NULL,
  PRIMARY KEY  (`communicate_id`),
  KEY `FK_Reference_12` (`student_id`),
  KEY `FK_Reference_13` (`staff_id`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`),
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for data_dictionary
-- ----------------------------
CREATE TABLE `data_dictionary` (
  `data_id` int(11) NOT NULL auto_increment,
  `data_content` varchar(100) default NULL,
  `data_type` varchar(100) default NULL,
  `data_desc` varchar(1000) default NULL,
  PRIMARY KEY  (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for discipline_info
-- ----------------------------
CREATE TABLE `discipline_info` (
  `discipline_id` int(11) NOT NULL auto_increment,
  `discipline_name` varchar(100) default NULL,
  `discipline_tuition` int(11) default NULL,
  `discipline_bring` int(11) default NULL,
  `discipline_desc` varchar(2000) default NULL,
  `discipline_isuesd` varchar(10) default NULL,
  PRIMARY KEY  (`discipline_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for email_info
-- ----------------------------
CREATE TABLE `email_info` (
  `email_id` int(11) NOT NULL auto_increment,
  `staff_id` int(11) default NULL,
  `email_title` varchar(1000) default NULL,
  `email_content` varchar(2000) default NULL,
  `email_time` datetime default NULL,
  `email_man` varchar(100) default NULL,
  `email_addr` varchar(300) default NULL,
  `email_state` varchar(10) default NULL,
  PRIMARY KEY  (`email_id`),
  KEY `FK_Reference_7` (`staff_id`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for evaluation_info
-- ----------------------------
CREATE TABLE `evaluation_info` (
  `evaluation_id` int(11) NOT NULL auto_increment,
  `student_id` int(11) default NULL,
  `evaluation_title` varchar(100) default NULL,
  `evaluation_content` varchar(2000) default NULL,
  `evaluation_course` varchar(100) default NULL,
  `evaluation_teacher` varchar(100) default NULL,
  `evaluation_time` datetime default NULL,
  PRIMARY KEY  (`evaluation_id`),
  KEY `FK_Reference_11` (`student_id`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for market_active
-- ----------------------------
CREATE TABLE `market_active` (
  `active_id` int(11) NOT NULL auto_increment,
  `staff_id` int(11) default NULL,
  `active_name` varchar(300) default NULL,
  `active_state` int(11) default NULL,
  `active_start` datetime default NULL,
  `active_end` datetime default NULL,
  `active_type` int(11) default NULL,
  `active_coste_emtimate` double default NULL,
  `active_coste` double default NULL,
  `active_refect_estimate` int(11) default NULL,
  `active_student` varchar(300) default NULL,
  `active_content` varchar(2000) default NULL,
  PRIMARY KEY  (`active_id`),
  KEY `FK_Reference_5` (`staff_id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for messafe_info
-- ----------------------------
CREATE TABLE `messafe_info` (
  `messafe_id` int(11) NOT NULL auto_increment,
  `staff_id` int(11) default NULL,
  `messafe_content` varchar(1000) default NULL,
  `messafe_man` varchar(50) default NULL,
  `messafe_phone` varchar(50) default NULL,
  `messafe_time` datetime default NULL,
  `messafe_state` varchar(10) default NULL,
  PRIMARY KEY  (`messafe_id`),
  KEY `FK_Reference_6` (`staff_id`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role_anthority_info
-- ----------------------------
CREATE TABLE `role_anthority_info` (
  `role_anthority_id` int(11) NOT NULL auto_increment,
  `role_id` int(11) default NULL,
  `anthorty_id` int(11) default NULL,
  PRIMARY KEY  (`role_anthority_id`),
  KEY `FK_Reference_3` (`role_id`),
  KEY `FK_Reference_4` (`anthorty_id`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`role_id`) REFERENCES `role_info` (`role_id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`anthorty_id`) REFERENCES `anthorty_info` (`anthorty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=453 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role_info
-- ----------------------------
CREATE TABLE `role_info` (
  `role_id` int(11) NOT NULL auto_increment,
  `role_name` varchar(100) default NULL,
  `role_desc` varchar(1000) default NULL,
  `role_state` varchar(10) default NULL,
  PRIMARY KEY  (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for staff_info
-- ----------------------------
CREATE TABLE `staff_info` (
  `staff_id` int(11) NOT NULL auto_increment,
  `role_id` int(11) default NULL,
  `staff_name` varchar(100) default NULL,
  `staff_sex` varchar(10) default NULL,
  `staff_age` int(10) default NULL,
  `staff_native_place` varchar(10) default NULL,
  `staff_idcard` varchar(100) default NULL,
  `staff_brithday` datetime default NULL,
  `staff_office_phone` varchar(50) default NULL,
  `staff_mobile_phone` varchar(50) default NULL,
  `staff_eamil` varchar(100) default NULL,
  `staff_addr` varchar(200) default NULL,
  `staff_qq` varchar(30) default NULL,
  `staff_entry_time` datetime default NULL,
  `staff_eduction_level` varchar(20) default NULL,
  `staff_remark` varchar(2000) default NULL,
  `staff_state` varchar(10) default NULL COMMENT '1 ÓÐÐ§ Ô±¹¤\r\n            0 ÎÞÐ§\r\n            2 ½ÌÊ¦\r\n            ',
  `user_number` varchar(100) default NULL,
  `user_passowrd` varchar(100) default NULL,
  PRIMARY KEY  (`staff_id`),
  UNIQUE KEY `unq_user_number` (`user_number`),
  KEY `FK_Reference_1` (`role_id`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`role_id`) REFERENCES `role_info` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for staff_salary
-- ----------------------------
CREATE TABLE `staff_salary` (
  `staff_salary_id` int(11) NOT NULL auto_increment,
  `staff_id` int(11) default NULL,
  `sta_staff_id` int(11) default NULL,
  `total_salary` double default NULL,
  `deduct_salary` double default NULL,
  `real_salary` double default NULL,
  `is_uesd` varchar(10) default NULL,
  `staff_salary_time` datetime default NULL,
  `staff_remark` varchar(2000) default NULL,
  PRIMARY KEY  (`staff_salary_id`),
  KEY `FK_Reference_25` (`staff_id`),
  KEY `FK_Reference_26` (`sta_staff_id`),
  CONSTRAINT `FK_Reference_25` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`),
  CONSTRAINT `FK_Reference_26` FOREIGN KEY (`sta_staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for student_info
-- ----------------------------
CREATE TABLE `student_info` (
  `student_id` int(11) NOT NULL auto_increment,
  `staff_id` int(11) default NULL,
  `class_id` int(11) default NULL,
  `student_name` varchar(100) default NULL,
  `student_sex` varchar(10) default NULL,
  `student_age` int(11) default NULL,
  `student_tellphone` varchar(100) default NULL,
  `student_email` varchar(200) default NULL,
  `student_idcard` varchar(30) default NULL,
  `student_address` varchar(300) default NULL,
  `student_birthday` varchar(100) default NULL,
  `student_school` varchar(100) default NULL,
  `student_qq` varchar(100) default NULL,
  `student_parents_name` varchar(100) default NULL,
  `student_parents_phone` varchar(100) default NULL,
  `student_pro` varchar(100) default NULL,
  `student_pro_city` varchar(100) default NULL,
  `student_type` varchar(10) default NULL,
  `student_ispay` varchar(10) default NULL,
  `student_sate` int(10) default NULL,
  `student_mark` varchar(10) default NULL,
  `student_desc` varchar(2000) default NULL,
  `student_number` varchar(100) default NULL,
  `student_password` varchar(100) default NULL,
  PRIMARY KEY  (`student_id`),
  UNIQUE KEY `FK_stu_number` (`student_number`),
  KEY `FK_Reference_16` (`class_id`),
  KEY `FK_Reference_8` (`staff_id`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for student_payment
-- ----------------------------
CREATE TABLE `student_payment` (
  `payment_id` int(11) NOT NULL auto_increment,
  `student_id` int(11) default NULL,
  `staff_id` int(11) default NULL,
  `payment_situation` varchar(1000) default NULL,
  `payment_method` int(11) default NULL,
  `payment_time` datetime default NULL,
  `discount_amount` double default NULL,
  `should_amount` double default NULL,
  `real_amount` double default NULL,
  `debt_amount` double default NULL,
  `payment_remark` varchar(2000) default NULL,
  PRIMARY KEY  (`payment_id`),
  KEY `FK_Reference_23` (`student_id`),
  KEY `FK_Reference_24` (`staff_id`),
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`),
  CONSTRAINT `FK_Reference_24` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for student_write_grade
-- ----------------------------
CREATE TABLE `student_write_grade` (
  `write_grade_id` int(11) NOT NULL auto_increment,
  `student_id` int(11) default NULL,
  `staff_id` int(11) default NULL,
  `write_grade_subject` varchar(1000) default NULL,
  `write_grade` varchar(50) default NULL,
  `write_grade_time` datetime default NULL,
  `write_grade_note` varchar(2000) default NULL,
  PRIMARY KEY  (`write_grade_id`),
  KEY `FK_Reference_14` (`student_id`),
  KEY `FK_Reference_15` (`staff_id`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for syllabus_info
-- ----------------------------
CREATE TABLE `syllabus_info` (
  `syllabus_id` int(11) NOT NULL auto_increment,
  `syllabus_yi` varchar(50) default NULL,
  `syllabus_er` varchar(50) default NULL,
  `syllabus_san` varchar(50) default NULL,
  `syllabus_si` varchar(50) default NULL,
  `syllabus_wu` varchar(50) default NULL,
  `syllabus_liu` varchar(50) default NULL,
  `syllabus_qi` varchar(50) default NULL,
  `is_uesd` varchar(50) default NULL,
  `syllabus_name` varchar(100) default NULL,
  PRIMARY KEY  (`syllabus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for template_info
-- ----------------------------
CREATE TABLE `template_info` (
  `template_id` int(11) NOT NULL auto_increment,
  `template_title` varchar(200) default NULL,
  `template_content` varchar(2000) default NULL,
  `template_type` varchar(20) default NULL,
  PRIMARY KEY  (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for track_record_info
-- ----------------------------
CREATE TABLE `track_record_info` (
  `track_record_id` int(11) NOT NULL auto_increment,
  `student_id` int(11) default NULL,
  `track_record_title` varchar(200) default NULL,
  `track_record_content` varchar(2000) default NULL,
  `track_record_time` datetime default NULL,
  `enrollment` int(11) default NULL,
  `next_record_time` datetime default NULL,
  PRIMARY KEY  (`track_record_id`),
  KEY `FK_Reference_9` (`student_id`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `anthorty_info` VALUES ('1', '-1', 'æ ¹ç®å½', '', '');
INSERT INTO `anthorty_info` VALUES ('2', '1', 'ç³»ç»ç®¡ç', 'ç®¡çixinxi', null);
INSERT INTO `anthorty_info` VALUES ('9', '1', 'è¥éç®¡ç', '', '');
INSERT INTO `anthorty_info` VALUES ('11', '2', 'åå·¥ç®¡ç', 'system/list.do', 'system/list.do');
INSERT INTO `anthorty_info` VALUES ('12', '2', 'è§è²ç®¡ç', 'roleinfo/list.do', 'roleinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('13', '2', 'è§è²åæ´', 'roleinfo/staffinforolelist.do', 'roleinfo/staffinforolelist.do');
INSERT INTO `anthorty_info` VALUES ('14', '2', 'æéç®¡ç', 'anthorty/list.do', 'anthorty/list.do');
INSERT INTO `anthorty_info` VALUES ('15', '2', 'æéåæ´', 'anthotychange/list.do', 'anthotychange/list.do');
INSERT INTO `anthorty_info` VALUES ('16', '2', 'æ°æ®å­å¸', 'datadictionary/list.do', 'datadictionary/list.do');
INSERT INTO `anthorty_info` VALUES ('17', '9', 'æ¨¡æ¿ç®¡ç', 'template/list.do', 'template/list.do');
INSERT INTO `anthorty_info` VALUES ('18', '9', 'ç­ä¿¡ç®¡ç', 'messafeinfo/list.do', 'messafeinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('19', '9', 'é®ä»¶ç®¡ç', 'email/list.do', 'email/list.do');
INSERT INTO `anthorty_info` VALUES ('20', '9', 'è¥éæ´»å¨', 'marketactive/list.do', 'marketactive/list.do');
INSERT INTO `anthorty_info` VALUES ('21', '1', 'æçç®¡ç', '', '');
INSERT INTO `anthorty_info` VALUES ('22', '21', 'å­¦åæ± ', 'studentpool/list.do', 'studentpool/list.do');
INSERT INTO `anthorty_info` VALUES ('23', '21', 'æççº¿ç´¢', 'recruitstudent/list.do', 'recruitstudent/list.do');
INSERT INTO `anthorty_info` VALUES ('24', '21', 'è·è¸ªè®°å½', 'trackrecordinfo/list.do', 'trackrecordinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('25', '21', 'è¯å¬è®°å½', 'auditioninfo/list.do', 'auditioninfo/list.do');
INSERT INTO `anthorty_info` VALUES ('26', '1', 'ç­çº§ç®¡ç', '', '');
INSERT INTO `anthorty_info` VALUES ('27', '26', 'å­¦ç§ä¿¡æ¯', 'disciplineinfo/list.do', 'disciplineinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('28', '26', 'æå®¤ç®¡ç', 'classroominfo/list.do', 'classroominfo/list.do');
INSERT INTO `anthorty_info` VALUES ('29', '26', 'è¯¾ç¨è¡¨', 'syllabusinfo/list.do', 'syllabusinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('30', '26', 'æå¸ç®¡ç', 'teacher/list.do', 'teacher/list.do');
INSERT INTO `anthorty_info` VALUES ('31', '26', 'ç­çº§ç®¡ç', 'classinfo/list.do', 'classinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('32', '1', 'å­¦åç®¡ç', '', '');
INSERT INTO `anthorty_info` VALUES ('33', '32', 'å­¦åè¯ä»·', 'evaluationinfo/list.do', 'evaluationinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('34', '32', 'å­¦åæ²é', 'communicateinfo/list.do', 'communicateinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('35', '32', 'å­¦åæç»©', 'studentwritegrade/list.do', 'studentwritegrade/list.do');
INSERT INTO `anthorty_info` VALUES ('36', '32', 'å­¦åç®¡ç', 'student/list.do', 'student/list.do');
INSERT INTO `anthorty_info` VALUES ('37', '1', 'æå¡ç®¡ç', '', '');
INSERT INTO `anthorty_info` VALUES ('38', '37', 'ç­çº§äºå¡', 'classtransactioninfo/list.do', 'classtransactioninfo/list.do');
INSERT INTO `anthorty_info` VALUES ('39', '37', 'å­¦åèå¤', 'attendanceinfo/list.do', 'attendanceinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('40', '1', 'è´¢å¡ç®¡ç', '', '');
INSERT INTO `anthorty_info` VALUES ('41', '40', 'å­¦åç¼´è´¹', 'studentpayment/list.do', 'studentpayment/list.do');
INSERT INTO `anthorty_info` VALUES ('42', '40', 'åå·¥èªæ°´åæ¾', 'staffsalary/list.do', 'staffsalary/list.do');
INSERT INTO `attendance_info` VALUES ('1', '1', 'å µè½¦äº1', 'è¿å°+æ©é', '2014-12-02 00:00:00', 'ä¸æ¬¡æ³¨æ1');
INSERT INTO `attendance_info` VALUES ('2', '2', 'a\'a', 'æ©é', '2014-12-02 00:00:00', 'å');
INSERT INTO `audition_info` VALUES ('1', '1', '2014-11-25 00:00:00', 'ä¸æµ·åé¨å¹è®­å®¤ä¸', 'javaSEåºç¡', 'å®å¨å¬ä¸æ11111111111');
INSERT INTO `audition_info` VALUES ('2', '1', '2014-11-25 00:00:00', 'å¹è®­å®¤ä¸', 'PHP', 'å¬æäº');
INSERT INTO `audition_info` VALUES ('3', '2', '2014-11-25 00:00:00', 'å¤§åå¯ºåº', 'JSP', 'å®å¨ä¸æ³å¬');
INSERT INTO `class_info` VALUES ('1', '1', '1', '1', '17', 'javaä¸ç­', '20', '2014-10-31 00:00:00', '2014-11-29 00:00:00', null, '1', '1111111111');
INSERT INTO `class_info` VALUES ('2', '2', '2', '2', '15', 'C++', '20', '2014-11-07 00:00:00', '2014-11-28 00:00:00', null, '1', 'www');
INSERT INTO `class_info` VALUES ('3', '1', '1', '1', '17', '', null, null, null, null, '0', '');
INSERT INTO `class_info` VALUES ('4', '1', '1', '1', '17', '', null, null, null, null, '0', '');
INSERT INTO `class_info` VALUES ('5', '1', '1', '1', '17', '11', null, null, null, null, '1', '11');
INSERT INTO `class_info` VALUES ('6', '1', '1', '1', '17', '', null, null, null, null, '0', '');
INSERT INTO `class_info` VALUES ('7', '2', '2', '2', '15', 'C++äºç­', null, '2014-11-12 00:00:00', '2014-11-28 00:00:00', null, '1', '11111111');
INSERT INTO `class_transaction_info` VALUES ('1', '2', 'å£è¯è1', 'å£è¯è1', 'å¼ ä¸1', '2014-12-26 00:00:00', 'å£è¯è1');
INSERT INTO `class_transaction_info` VALUES ('3', '1', 'å¹³å®å¤', 'å¹³å®å¤', 'å¹³å®å¤', '2014-12-31 00:00:00', 'å¹³å®å¤');
INSERT INTO `classroom_info` VALUES ('1', 'å¹è®­ä¸', '28', 'çµèãæå½±ä»ª', 'å¹è®­ä¸', '1');
INSERT INTO `classroom_info` VALUES ('2', 'å¹è®­äº', '45', 'çµèãæå½±ä»ª', 'å¹è®­ä¸', '1');
INSERT INTO `classroom_info` VALUES ('3', 'å¤§å¹è®­', '111', 'çµèãæå½±ä»ª', 'aåç®', '1');
INSERT INTO `classroom_info` VALUES ('4', '', null, '', '', '0');
INSERT INTO `communicate_info` VALUES ('1', '1', '15', '2014-11-20 00:00:00', 'é¿ä¸å¤§èæ');
INSERT INTO `communicate_info` VALUES ('2', '3', '15', '2014-11-20 00:00:00', 'åå®æå®çsss');
INSERT INTO `communicate_info` VALUES ('3', '1', '15', '2014-11-20 00:00:00', 'asdaæ¯d');
INSERT INTO `data_dictionary` VALUES ('5', 'è®¡åä¸­', 'active_state', 'è¥éæ´»å¨ç¶æ');
INSERT INTO `data_dictionary` VALUES ('6', 'æ¿æ´»', 'active_state', '');
INSERT INTO `data_dictionary` VALUES ('7', 'å®æ', 'active_state', '');
INSERT INTO `data_dictionary` VALUES ('8', 'åæ¶', 'active_state', '');
INSERT INTO `data_dictionary` VALUES ('9', 'ç½ç»å¹¿å', 'active_type', 'è¥éæ´»å¨ç±»å');
INSERT INTO `data_dictionary` VALUES ('10', 'çµè¯è¥é', 'active_type', '');
INSERT INTO `data_dictionary` VALUES ('11', 'é®ä»¶è¥é', 'active_type', '');
INSERT INTO `data_dictionary` VALUES ('12', 'å¾®ä¿¡è¥é', 'active_type', '');
INSERT INTO `data_dictionary` VALUES ('13', 'éå¸¸å¥½', 'active_refect_estimate', 'é¢æååº');
INSERT INTO `data_dictionary` VALUES ('14', 'å¥½', 'active_refect_estimate', '');
INSERT INTO `data_dictionary` VALUES ('15', 'ä¸è¬', 'active_refect_estimate', '');
INSERT INTO `data_dictionary` VALUES ('16', 'å·®', 'active_refect_estimate', '');
INSERT INTO `data_dictionary` VALUES ('17', 'æåéå¸¸å¼º', 'student_sate', 'å­¦çæåç¶æ');
INSERT INTO `data_dictionary` VALUES ('18', 'æåå¼º', 'student_sate', '');
INSERT INTO `data_dictionary` VALUES ('19', 'æåä¸­', 'student_sate', '');
INSERT INTO `data_dictionary` VALUES ('20', 'æåä½', 'student_sate', '');
INSERT INTO `data_dictionary` VALUES ('21', 'å®å¨æ²¡å´è¶£', 'student_sate', '');
INSERT INTO `data_dictionary` VALUES ('22', 'ç°é', 'payment_method', 'ç¼´è´¹æ¹å¼');
INSERT INTO `data_dictionary` VALUES ('23', 'ä¿¡ç¨å¡', 'payment_method', 'payment_method');
INSERT INTO `data_dictionary` VALUES ('24', 'é¶è¡å¡', 'payment_method', 'ç¼´è´¹æ¹å¼');
INSERT INTO `discipline_info` VALUES ('1', 'javaåºç¡è¯¾ç¨', '10200', '120', 'é¢åå¯¹è±¡', '1');
INSERT INTO `discipline_info` VALUES ('2', 'C++è¯¾ç¨', '10200', '11', '11', '1');
INSERT INTO `discipline_info` VALUES ('3', '.Netåºç¡è¯¾ç¨', '1580', '30', 'å­¦ä¹ åºç¡  å­¦ä¹ æ¡æ¶ åºç¡', '1');
INSERT INTO `discipline_info` VALUES ('4', '11', '11', '111', '111', '0');
INSERT INTO `email_info` VALUES ('3', '15', 'å½åºèéç¤¼', 'å½åºèå½åºèå½åºèå½åºè', '2014-11-22 17:07:46', 'å¼ ä¸', 'beifeng1003@163.com', null);
INSERT INTO `email_info` VALUES ('4', '15', 'ä»å¤©æä¸å»åç«é', 'ä»å¤©æä¸å»åç«éä»å¤©æä¸å»åç«éä»å¤©æä¸å»åç«éä»å¤©æä¸å»åç«éä»å¤©æä¸å»åç«éä»å¤©æä¸å»åç«éä»å¤©æä¸å»åç«éä»å¤©æä¸å»åç«éä»å¤©æä¸å»åç«é', '2014-11-22 17:08:42', 'çéº»å­', 'beifeng1003@163.com', null);
INSERT INTO `email_info` VALUES ('6', '15', 'æå¤©å»ç¬å±±', 'æå¤©å»ç¬å±±æå¤©å»ç¬å±±æå¤©å»ç¬å±±æå¤©å»ç¬å±±æå¤©å»ç¬å±±', '2014-11-22 17:28:58', 'å¼ ä¸', 'beifeng1003@163.com', null);
INSERT INTO `evaluation_info` VALUES ('1', '1', 'ä¸è¯¾åå®¹', 'å¾å¥½', 'javaåºç¡', 'ç½é¾é©¬', '2014-11-30 01:36:13');
INSERT INTO `evaluation_info` VALUES ('2', null, 'ååå', 'å¾ä¸åå¦', 'java', 'çèå¸', '2014-11-30 00:00:00');
INSERT INTO `evaluation_info` VALUES ('3', null, 'ååå', 'äºå®ä¸', 'java', 'çèå¸', '2014-11-07 00:00:00');
INSERT INTO `evaluation_info` VALUES ('4', '3', 'ååå1', '3333333333', 'java1', 'çèå¸1', '2014-12-01 00:00:00');
INSERT INTO `evaluation_info` VALUES ('6', '1', 'ååå', '', 'java', 'çèå¸', '2014-12-04 00:00:00');
INSERT INTO `evaluation_info` VALUES ('7', '1', 'é¡¹ç®å®æå­¦ä¹ è¯ä»·', 'å¾å¥½å¾ä¸é', 'java', 'å¼ ä¸', '2014-12-04 22:28:01');
INSERT INTO `evaluation_info` VALUES ('8', '1', '11', '111', '11', '11', '2014-12-04 22:28:13');
INSERT INTO `market_active` VALUES ('1', '15', 'æçä¿¡æ¯', '6', '2014-10-31 00:00:00', '2014-11-27 00:00:00', '11', '200', '150', '13', '150ä¸ª', '123131');
INSERT INTO `market_active` VALUES ('3', '15', 'å¾å¥½ççæ´»å¨', '5', '2014-11-18 00:00:00', '2014-11-26 00:00:00', '9', '11', '11', '14', '11', '11');
INSERT INTO `messafe_info` VALUES ('1', '13', 'çæ¥å¿«ä¹', 'æå', '111111111', '2014-11-20 15:29:01', null);
INSERT INTO `messafe_info` VALUES ('15', '13', 'ç¥æ¨çæ¥å¿«ä¹222222222222', 'çäº', '2222222', '2014-11-20 16:07:40', null);
INSERT INTO `messafe_info` VALUES ('16', '15', 'æ¥èè¦éç¤¼', 'å¼ å°ä¸', '123443309', '2014-11-20 16:12:24', null);
INSERT INTO `messafe_info` VALUES ('17', '15', 'ç¥æ¨çæ¥å¿«ä¹', '45', '1521111111', '2014-11-20 16:13:04', null);
INSERT INTO `messafe_info` VALUES ('18', '15', 'ç¥æ¨çæ¥å¿«ä¹', '12321', '1234433094', '2014-11-20 16:13:34', null);
INSERT INTO `messafe_info` VALUES ('20', null, 'ç¥æ¨çæ¥å¿«ä¹', '123', '213213123', null, null);
INSERT INTO `messafe_info` VALUES ('21', '15', 'æ¥èè¦éç¤¼11111111111111111', '1111111111', '11111111', '2014-11-20 16:22:46', null);
INSERT INTO `role_anthority_info` VALUES ('12', '2', '9');
INSERT INTO `role_anthority_info` VALUES ('419', '1', '2');
INSERT INTO `role_anthority_info` VALUES ('420', '1', '11');
INSERT INTO `role_anthority_info` VALUES ('421', '1', '12');
INSERT INTO `role_anthority_info` VALUES ('422', '1', '13');
INSERT INTO `role_anthority_info` VALUES ('423', '1', '14');
INSERT INTO `role_anthority_info` VALUES ('424', '1', '15');
INSERT INTO `role_anthority_info` VALUES ('425', '1', '16');
INSERT INTO `role_anthority_info` VALUES ('426', '1', '9');
INSERT INTO `role_anthority_info` VALUES ('427', '1', '17');
INSERT INTO `role_anthority_info` VALUES ('428', '1', '18');
INSERT INTO `role_anthority_info` VALUES ('429', '1', '19');
INSERT INTO `role_anthority_info` VALUES ('430', '1', '20');
INSERT INTO `role_anthority_info` VALUES ('431', '1', '21');
INSERT INTO `role_anthority_info` VALUES ('432', '1', '22');
INSERT INTO `role_anthority_info` VALUES ('433', '1', '23');
INSERT INTO `role_anthority_info` VALUES ('434', '1', '24');
INSERT INTO `role_anthority_info` VALUES ('435', '1', '25');
INSERT INTO `role_anthority_info` VALUES ('436', '1', '26');
INSERT INTO `role_anthority_info` VALUES ('437', '1', '27');
INSERT INTO `role_anthority_info` VALUES ('438', '1', '28');
INSERT INTO `role_anthority_info` VALUES ('439', '1', '29');
INSERT INTO `role_anthority_info` VALUES ('440', '1', '30');
INSERT INTO `role_anthority_info` VALUES ('441', '1', '31');
INSERT INTO `role_anthority_info` VALUES ('442', '1', '32');
INSERT INTO `role_anthority_info` VALUES ('443', '1', '33');
INSERT INTO `role_anthority_info` VALUES ('444', '1', '34');
INSERT INTO `role_anthority_info` VALUES ('445', '1', '35');
INSERT INTO `role_anthority_info` VALUES ('446', '1', '36');
INSERT INTO `role_anthority_info` VALUES ('447', '1', '37');
INSERT INTO `role_anthority_info` VALUES ('448', '1', '38');
INSERT INTO `role_anthority_info` VALUES ('449', '1', '39');
INSERT INTO `role_anthority_info` VALUES ('450', '1', '40');
INSERT INTO `role_anthority_info` VALUES ('451', '1', '41');
INSERT INTO `role_anthority_info` VALUES ('452', '1', '42');
INSERT INTO `role_info` VALUES ('1', 'è¶çº§ç®¡çå', 'å¤©å¤©ç®¡å­¦ç', '1');
INSERT INTO `role_info` VALUES ('2', 'æçäººå', 'æ¾äººå¹è®­ ', '1');
INSERT INTO `role_info` VALUES ('3', 'ç½å¤§ç®¡', 'å¤©å¤©ä¿®çµèï¼å¤©å¤©æ¥ç½çº¿', '1');
INSERT INTO `role_info` VALUES ('4', 'javaèå¸', 'ä¸javaSE è¯¾ç¨', '1');
INSERT INTO `staff_info` VALUES ('13', '1', 'æç©º', 'ä¿å¯', null, '', '', null, '', '', '', '', '', null, 'ä¿å¯', '', '1', 'admin2', '');
INSERT INTO `staff_info` VALUES ('14', '1', 'åå§123', 'å¥³', '25', 'å¤§å', '5001420198820203xxxxx', '2014-11-08 00:00:00', '123-12313213111', '2234567890', 'xxxxx123@qq.com', 'é¿å®å¯ºåº123', '123123', '2014-11-18 00:00:00', 'ç¡å£«', 'å¿µç»ç å¿µç»ç å¿µç»ç ', '1', 'admin1', '1231');
INSERT INTO `staff_info` VALUES ('15', '1', 'ç½é¾é©¬', 'ç·', '400', '', '', '2014-11-06 00:00:00', '', '', '', '', '', '2014-11-01 00:00:00', 'ä¿å¯', '    ', '2', 'admin', '123');
INSERT INTO `staff_info` VALUES ('16', null, 'ç®¡çå', 'ä¿å¯', null, '', '', null, '', '', '', '', '', null, 'ä¿å¯', '', '1', 'admin1001', '123');
INSERT INTO `staff_info` VALUES ('17', null, 'å¼ ä¸', 'ä¿å¯', '123', 'å¤§å', '5001420198820203432', '2014-11-29 00:00:00', '123-12313213111', '1234567890', '1321313', '12', '21313', '2014-11-29 00:00:00', 'åå£«', ' ', '2', 'admin123', '123123');
INSERT INTO `staff_salary` VALUES ('1', '13', '15', '100', '200', '800', '0', null, 'è¨è¾¾');
INSERT INTO `staff_salary` VALUES ('2', '17', '15', '1000', '200', '800', '1', '2014-12-02 21:21:35', 'æ°´æ°´æ°´æ°´æ°´æ°´æ°´');
INSERT INTO `staff_salary` VALUES ('3', '13', '15', '1000', '200', '800', '1', '2014-12-02 21:21:59', '111');
INSERT INTO `student_info` VALUES ('1', '15', null, 'æ±å«æ', 'ç·', '1500', '3213131231231', '11231313@qq.com', '324234242234242x', 'é«èåºx', '', 'ç¤¾ä¼å¤§å­¦x', '10001', 'ä¸ç¥éx', '123445611', 'ä¸æµ·x', 'ä¸æµ·x', null, '1', '17', '2', 'è¨è¾¾çx', 'admin', '123456');
INSERT INTO `student_info` VALUES ('2', '15', '1', '123456', 'ç·', '3500', '1231313', '1231313@qq.com', '5020310230213xxxx', 'ä¸æµ·', '2014-11-05', 'ç¤¾ä¼å¤§å­¦', '12111', 'å¤©å°', '11111', 'è±æå±±', 'æ°´å¸æ´', null, null, '18', '2', '1111111111111111111', '1231313@qq.com', null);
INSERT INTO `student_info` VALUES ('3', null, null, '111111', 'ä¿å¯', null, '', '', '', '', '', '', '', '', '', '', '', null, null, '17', '-1', '', null, null);
INSERT INTO `student_info` VALUES ('4', '15', null, '111', 'ä¿å¯', null, '', '', '', '', '', '', '', '', '', '', '', null, null, null, '-1', '', null, null);
INSERT INTO `student_info` VALUES ('5', '15', null, 'å¼ ä¸', 'ä¿å¯', null, '13423333333', '', '', '', '', '', '31231313', '', '', 'å¹¿å·', '', null, null, '17', '1', '', null, null);
INSERT INTO `student_info` VALUES ('6', null, null, '111', 'ä¿å¯', null, '', '', '', '', '', '', '', '', '', 'éåº', '', null, null, '20', '0', '', null, null);
INSERT INTO `student_info` VALUES ('7', '15', null, '13213', 'ä¿å¯', null, '13422222222', '', '', '', '', '', '13422222222', '', '', 'éåº', '', null, null, '19', '1', '', null, null);
INSERT INTO `student_info` VALUES ('8', '15', null, '21321', 'ä¿å¯', null, '', '', '', '', '', '', '', '', '', 'ä¸æµ·', '', null, null, '19', '1', '', null, null);
INSERT INTO `student_info` VALUES ('9', '15', null, '231313', 'ä¿å¯', null, '', '', '', '', '', '', '', '', '', 'åäº¬', '', null, null, '21', '1', '', null, null);
INSERT INTO `student_payment` VALUES ('1', '1', '15', 'ä»å¤©ç¼´è´¹', null, '2014-12-02 00:00:00', '200', '1000', '600', '200', 'é¿è¿ªä»¨');
INSERT INTO `student_payment` VALUES ('3', '1', '15', 'javaåºç¡è´¹ç¨', '22', '2014-12-04 00:00:00', '200', '1000', '600', '200', 'é¿æ¯é¡¿æ');
INSERT INTO `student_payment` VALUES ('4', '1', '15', 'javaåºç¡è´¹ç¨', '22', '2014-12-04 00:00:00', '200', '1000', '600', '200', 'é¿æ¯é¡¿æ');
INSERT INTO `student_write_grade` VALUES ('1', '1', '15', 'java', '60', '2014-11-18 00:00:00', 'aaaaaaaaaaaa');
INSERT INTO `student_write_grade` VALUES ('2', '1', '15', 'C++', '80', '2014-11-30 00:00:00', 'cccccccccccc');
INSERT INTO `student_write_grade` VALUES ('3', '3', '15', 'java', '79', '2014-11-30 00:00:00', '');
INSERT INTO `syllabus_info` VALUES ('1', 'ä¸åä¸è¯¾', 'ä¸ä¸ä¸è¯¾', 'ä¸ä¸ä¸è¯¾', 'ä¸ä¸ä¸è¯¾', 'ä¸ä¸ä¸è¯¾', 'ä¸ä¸è¯¾', 'ä¸ä¸è¯¾', '1', 'javaè¯¾ç¨');
INSERT INTO `syllabus_info` VALUES ('2', 'ä¸åä¸è¯¾', 'ä¸ä¸ä¸è¯¾', '', '', '', '', '', '1', 'C++è¯¾ç¨');
INSERT INTO `syllabus_info` VALUES ('3', '', '', '', '', '', '', '', '0', '');
INSERT INTO `template_info` VALUES ('1', 'çæ¥æé', 'ç¥æ¨çæ¥å¿«ä¹', 'ç­ä¿¡');
INSERT INTO `template_info` VALUES ('3', 'æ¥è', 'æ¥èè¦éç¤¼', 'ç­ä¿¡');
INSERT INTO `template_info` VALUES ('4', 'å½åºèéç¤¼', 'å½åºèå½åºèå½åºèå½åºè', 'é®ä»¶');
INSERT INTO `track_record_info` VALUES ('1', '1', 'çªå«ææ¥åjavaç¨åºå', 'javaä¼ä¸çº§å¼åäººå', '2014-11-25 00:00:00', '19', '2014-11-30 00:00:00');
INSERT INTO `track_record_info` VALUES ('2', '2', 'PHPå­¦ä¹ ', 'ssada1111111', '2014-11-24 00:00:00', '17', '2014-11-26 00:00:00');
INSERT INTO `track_record_info` VALUES ('5', '1', 'javaé¡¹ç®å­¦ä¹ ', 'javaé¡¹ç®å­¦ä¹ javaé¡¹ç®å­¦ä¹ javaé¡¹ç®å­¦ä¹ javaé¡¹ç®å­¦ä¹ ', '2014-11-26 00:00:00', '18', '2014-11-28 00:00:00');
INSERT INTO `track_record_info` VALUES ('6', '5', 'javaé¡¹ç®å­¦ä¹ ', 'javaé¡¹ç®å­¦ä¹ javaé¡¹ç®å­¦ä¹ ', '2014-12-03 00:00:00', '17', '2014-12-04 00:00:00');
INSERT INTO `track_record_info` VALUES ('7', '7', 'javaé¡¹ç®å­¦ä¹ ', 'javaé¡¹ç®å­¦ä¹ ', '2014-12-16 00:00:00', '18', '2014-12-04 00:00:00');
INSERT INTO `track_record_info` VALUES ('8', '8', '', 'javaé¡¹ç®å­¦ä¹ ', null, null, '2014-12-04 00:00:00');
INSERT INTO `track_record_info` VALUES ('9', '9', '', 'javaé¡¹ç®å­¦ä¹ javaé¡¹ç®å­¦ä¹ ', null, null, '2014-12-04 00:00:00');
