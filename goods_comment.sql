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

 Date: 27/03/2019 11:42:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods_comment
-- ----------------------------
DROP TABLE IF EXISTS `goods_comment`;
CREATE TABLE `goods_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text CHARACTER SET utf8 NOT NULL,
  `gender` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of goods_comment
-- ----------------------------
BEGIN;
INSERT INTO `goods_comment` VALUES (1, 27, 9, '非常精彩的一本书', 1, '2019-03-26 11:02:04', 'ysssgdhr');
INSERT INTO `goods_comment` VALUES (2, 27, 10, '很好看！', 1, '2019-03-15 11:03:24', '仁者');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
