/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : ScrumFaceDetect

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 26/03/2019 16:03:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for like_info
-- ----------------------------
DROP TABLE IF EXISTS `like_info`;
CREATE TABLE `like_info` (
  `like_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  PRIMARY KEY (`like_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of like_info
-- ----------------------------
BEGIN;
INSERT INTO `like_info` VALUES (1, 9, 27);
INSERT INTO `like_info` VALUES (2, 10, 27);
INSERT INTO `like_info` VALUES (3, 9, 33);
INSERT INTO `like_info` VALUES (4, 9, 22);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
