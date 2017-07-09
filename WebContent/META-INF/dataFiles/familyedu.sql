/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : familyedu

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-06-01 15:11:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for achievement
-- ----------------------------
DROP TABLE IF EXISTS `achievement`;
CREATE TABLE `achievement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `achievementImage` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ableArea` varchar(255) DEFAULT NULL,
  `createId` varchar(255) DEFAULT NULL,
  `freeTime` varchar(255) DEFAULT NULL,
  `homeArea` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `releaseDate` datetime DEFAULT NULL,
  `teachGrade` varchar(255) DEFAULT NULL,
  `teachMethod` varchar(255) DEFAULT NULL,
  `teachPeriod` varchar(255) DEFAULT NULL,
  `teachSubject` varchar(255) DEFAULT NULL,
  `teachType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for courseorder
-- ----------------------------
DROP TABLE IF EXISTS `courseorder`;
CREATE TABLE `courseorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `commentStatus` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `parentId` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `studentId` varchar(255) DEFAULT NULL,
  `teachDate` varchar(255) DEFAULT NULL,
  `teachSubject` varchar(255) DEFAULT NULL,
  `teacherId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for experience
-- ----------------------------
DROP TABLE IF EXISTS `experience`;
CREATE TABLE `experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `beginDate` varchar(255) DEFAULT NULL,
  `endDate` varchar(255) DEFAULT NULL,
  `studentName` varchar(255) DEFAULT NULL,
  `studentSchool` varchar(255) DEFAULT NULL,
  `teachExperience` text,
  `teachSubject` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createId` varchar(255) DEFAULT NULL,
  `stuAge` varchar(255) DEFAULT NULL,
  `stuGender` varchar(255) DEFAULT NULL,
  `stuGrade` varchar(255) DEFAULT NULL,
  `stuInfo` text,
  `stuName` varchar(255) DEFAULT NULL,
  `stuSchool` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activation_code` varchar(255) DEFAULT NULL,
  `activation_status` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `idImage` varchar(255) DEFAULT NULL,
  `imageStatuDate` datetime DEFAULT NULL,
  `imageStatus` varchar(255) DEFAULT NULL,
  `introduction` text,
  `major` varchar(255) DEFAULT NULL,
  `parentStatuDate` datetime DEFAULT NULL,
  `parentStatus` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phoneNum` varchar(255) DEFAULT NULL,
  `register_date` datetime DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `teachImage` varchar(255) DEFAULT NULL,
  `teachYear` varchar(255) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
