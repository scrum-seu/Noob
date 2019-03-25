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

 Date: 25/03/2019 16:38:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for faceset_info
-- ----------------------------
DROP TABLE IF EXISTS `faceset_info`;
CREATE TABLE `faceset_info` (
  `faceset_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `faceset_token` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`faceset_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of faceset_info
-- ----------------------------
BEGIN;
INSERT INTO `faceset_info` VALUES ('ScrumFaceset', 'a95b184fd0011a44b3c18d553ff677f5');
COMMIT;

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of goods_category
-- ----------------------------
BEGIN;
INSERT INTO `goods_category` VALUES (1, '食品');
INSERT INTO `goods_category` VALUES (2, '日用品');
INSERT INTO `goods_category` VALUES (3, '服饰');
INSERT INTO `goods_category` VALUES (4, '玩具');
INSERT INTO `goods_category` VALUES (5, '保健品');
INSERT INTO `goods_category` VALUES (6, '书籍');
COMMIT;

-- ----------------------------
-- Table structure for goods_comment
-- ----------------------------
DROP TABLE IF EXISTS `goods_comment`;
CREATE TABLE `goods_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `gender` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for goods_info
-- ----------------------------
DROP TABLE IF EXISTS `goods_info`;
CREATE TABLE `goods_info` (
  `good_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `other2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_info
-- ----------------------------
BEGIN;
INSERT INTO `goods_info` VALUES (1, '斐素NFC鲜榨纯果汁礼盒礼袋', 179, '1', NULL);
INSERT INTO `goods_info` VALUES (2, '杨协成马蹄爽荸荠果汁果肉', 33, '1', NULL);
INSERT INTO `goods_info` VALUES (3, '星巴克星冰乐抹茶味咖啡', 73, '1', NULL);
INSERT INTO `goods_info` VALUES (4, '六个核桃核桃乳植物蛋白', 62, '1', NULL);
INSERT INTO `goods_info` VALUES (5, '屈臣氏整箱装苏打水汽水', 83, '1', NULL);
INSERT INTO `goods_info` VALUES (6, '硅泥藻地垫', 48, '2', NULL);
INSERT INTO `goods_info` VALUES (7, '创意家居用品厨房收纳架', 58, '2', NULL);
INSERT INTO `goods_info` VALUES (8, '懒人小百货新奇特时尚夜灯', 65, '2', NULL);
INSERT INTO `goods_info` VALUES (9, '创意usb加湿器', 59, '2', NULL);
INSERT INTO `goods_info` VALUES (10, '简约风格创意台灯', 56, '2', NULL);
INSERT INTO `goods_info` VALUES (11, '短袖男t恤潮牌白色纯棉上衣服装', 59, '3', NULL);
INSERT INTO `goods_info` VALUES (12, '新款外套男士春季韩版潮流夹克', 138, '3', NULL);
INSERT INTO `goods_info` VALUES (13, '丹顿公子正装西裤男士直筒修身商务休闲裤', 139, '3', NULL);
INSERT INTO `goods_info` VALUES (14, '幼儿跳舞裙女孩芭蕾舞裙 ', 50, '3', NULL);
INSERT INTO `goods_info` VALUES (15, '卫衣套装男春秋季三件套韩版潮流服装外套', 198, '3', NULL);
INSERT INTO `goods_info` VALUES (16, '幼儿童玩具数字积木拼图', 628, '4', NULL);
INSERT INTO `goods_info` VALUES (17, '幼儿童男女孩宝宝脚踏电子琴跳舞脚踩钢琴毯', 299, '4', NULL);
INSERT INTO `goods_info` VALUES (18, '迪士尼超轻儿童羽毛球拍3-12岁小学生幼儿园球拍', 38, '4', NULL);
INSERT INTO `goods_info` VALUES (19, 'babycare儿童篮球架室内家用可升降篮球框', 199, '4', NULL);
INSERT INTO `goods_info` VALUES (20, 'babycare婴幼儿手摇铃玩具', 109, '4', NULL);
INSERT INTO `goods_info` VALUES (21, '生长胶囊碳酸钙高钙片', 218, '5', NULL);
INSERT INTO `goods_info` VALUES (22, '康麦斯忆立清dha胶囊', 288, '5', NULL);
INSERT INTO `goods_info` VALUES (23, '魔尔减肥瘦身燃脂顽固正品非孝素茶叶', 396, '5', NULL);
INSERT INTO `goods_info` VALUES (24, '大豆异黄酮软胶囊', 199, '5', NULL);
INSERT INTO `goods_info` VALUES (25, '修正 破壁灵芝孢子粉60袋*4盒套餐 ', 594, '5', NULL);
INSERT INTO `goods_info` VALUES (26, '狼道强者的成功法则', 18, '6', NULL);
INSERT INTO `goods_info` VALUES (27, '墨菲定律', 18, '6', NULL);
INSERT INTO `goods_info` VALUES (28, '厚黑学 +人性的弱点卡耐基+墨菲定律+羊皮卷全集受益一生的4本', 50, '6', NULL);
INSERT INTO `goods_info` VALUES (29, '好习惯伴我成长全8册', 30, '6', NULL);
INSERT INTO `goods_info` VALUES (30, '程甲本红楼梦（全六册）', 130, '6', NULL);
INSERT INTO `goods_info` VALUES (31, '进口零食大礼包组合一箱', 109, '1', NULL);
INSERT INTO `goods_info` VALUES (32, '安乡杨矮子酱板鸭', 47, '1', NULL);
INSERT INTO `goods_info` VALUES (33, '安乡杨矮子酱板鸭', 58, '1', NULL);
INSERT INTO `goods_info` VALUES (34, '双鱼猪肉脯400克*2袋', 99, '1', NULL);
INSERT INTO `goods_info` VALUES (35, '襄遇二阳老襄阳手工锅巴', 30, '1', NULL);
INSERT INTO `goods_info` VALUES (36, '无夹心正宗法式马卡龙', 40, '1', NULL);
INSERT INTO `goods_info` VALUES (37, '日本进口零食北海道白色恋人巧克力饼干', 50, '1', NULL);
INSERT INTO `goods_info` VALUES (38, '和风雨男士洗面奶', 79, '2', NULL);
INSERT INTO `goods_info` VALUES (39, '麦芙迪男士洗面奶美白控油祛痘去黑头护肤品套装', 79, '2', NULL);
INSERT INTO `goods_info` VALUES (40, '赫恩男士洗面奶套装', 69, '2', NULL);
INSERT INTO `goods_info` VALUES (41, '马丁古龙男士沐浴露', 39, '2', NULL);
INSERT INTO `goods_info` VALUES (42, '袋鼠妈妈 燕窝深润水滢沐浴乳', 58, '2', NULL);
INSERT INTO `goods_info` VALUES (43, 'TTOUCHME深蓝533香水沐浴露乳液', 78, '2', NULL);
INSERT INTO `goods_info` VALUES (44, '乔治卡罗尔男士沐浴露', 35, '2', NULL);
INSERT INTO `goods_info` VALUES (45, '女童风衣2019春装新款韩版童装', 159, '3', NULL);
INSERT INTO `goods_info` VALUES (46, '龙牙M65战地风衣', 699, '3', NULL);
INSERT INTO `goods_info` VALUES (47, '男装 BLOCKTECH风衣', 599, '3', NULL);
INSERT INTO `goods_info` VALUES (48, '浪莎秋衣秋裤男套装', 79, '3', NULL);
INSERT INTO `goods_info` VALUES (49, '七匹狼男士保暖内衣套装', 149, '3', NULL);
INSERT INTO `goods_info` VALUES (50, 'STW秋装女莫代尔打底秋衣', 79, '3', NULL);
INSERT INTO `goods_info` VALUES (51, '2件装加绒保暖背心', 89, '3', NULL);
INSERT INTO `goods_info` VALUES (52, '世纪龙 1:18 红旗CA72 红旗牌高级轿车 汽车模型', 1080, '4', NULL);
INSERT INTO `goods_info` VALUES (53, '解压神器减压玩具', 55, '4', NULL);
INSERT INTO `goods_info` VALUES (54, '兼容乐高积木成人版高难度拼装模型', 59, '4', NULL);
INSERT INTO `goods_info` VALUES (55, '磁流体瓶无聊打发时间神器', 9, '4', NULL);
INSERT INTO `goods_info` VALUES (56, '成真高级仿真发声发光合金车模', 47, '4', NULL);
INSERT INTO `goods_info` VALUES (57, '游戏机掌机怀旧款', 55, '4', NULL);
INSERT INTO `goods_info` VALUES (58, 'Sony/索尼 PlayStation4 Pro(1TB)', 2799, '4', NULL);
INSERT INTO `goods_info` VALUES (59, '碳酸钙糖成年高钙牛奶粉胶囊', 235, '5', NULL);
INSERT INTO `goods_info` VALUES (60, '红桃k增高长高长腿碳酸钙胶囊', 255, '5', NULL);
INSERT INTO `goods_info` VALUES (61, '麦金利无长高宽碳酸钙糖', 268, '5', NULL);
INSERT INTO `goods_info` VALUES (62, '养生堂牌天然维生素E软胶囊 250mg/粒*200粒', 148, '5', NULL);
INSERT INTO `goods_info` VALUES (63, '妙语天然维生素E软胶囊', 138, '5', NULL);
INSERT INTO `goods_info` VALUES (64, '汤臣倍健葡萄籽维生素C加E片', 168, '5', NULL);
INSERT INTO `goods_info` VALUES (65, '钙尔奇牌添佳片1.04g/片*198片维生素D成人中老年钙片', 153, '5', NULL);
INSERT INTO `goods_info` VALUES (66, '我们要自学', 27, '6', NULL);
INSERT INTO `goods_info` VALUES (67, 'Spring Cloud与Docker微服务架构实战', 55, '6', NULL);
INSERT INTO `goods_info` VALUES (68, '非天夜翔小说套装3册', 65, '6', NULL);
INSERT INTO `goods_info` VALUES (69, '设计师要懂心理学', 45, '6', NULL);
INSERT INTO `goods_info` VALUES (70, ' 搞砸了的设计', 33, '6', NULL);
INSERT INTO `goods_info` VALUES (71, '计算机体系结构(量化研究方法第5版)', 76, '6', NULL);
INSERT INTO `goods_info` VALUES (72, '数据挖掘与分析:概念与算法', 88, '6', NULL);
INSERT INTO `goods_info` VALUES (73, 'R语言实战 第2版', 74, '6', NULL);
INSERT INTO `goods_info` VALUES (74, '脑白金官方旗舰正品口服液10天', 138, '5', NULL);
COMMIT;

-- ----------------------------
-- Table structure for like_info
-- ----------------------------
DROP TABLE IF EXISTS `like_info`;
CREATE TABLE `like_info` (
  `like_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  PRIMARY KEY (`like_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for purchase_history
-- ----------------------------
DROP TABLE IF EXISTS `purchase_history`;
CREATE TABLE `purchase_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `good_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `total_price` decimal(10,0) DEFAULT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `action_id` int(11) DEFAULT '1',
  `other3` varchar(255) DEFAULT NULL,
  `other4` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=589 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_history
-- ----------------------------
BEGIN;
INSERT INTO `purchase_history` VALUES (1, 3, 10, 1, 56, '2018-01-26 13:00:00', 2, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (2, 3, 73, 2, 148, '2018-01-26 13:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (3, 1, 74, 8, 1104, '2019-01-25 04:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (4, 1, 71, 2, 152, '2019-01-25 04:00:00', 6, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (5, 1, 36, 2, 80, '2019-01-25 04:00:00', 1, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (6, 3, 19, 2, 398, '2018-11-23 11:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (7, 3, 24, 8, 1592, '2018-11-23 11:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (8, 3, 66, 8, 216, '2018-11-23 11:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (9, 5, 36, 3, 120, '2019-03-22 16:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (10, 5, 46, 3, 2097, '2019-03-22 16:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (11, 5, 33, 5, 290, '2019-03-22 16:00:00', 1, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12, 5, 19, 9, 1791, '2019-03-22 16:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13, 7, 71, 2, 152, '2019-01-25 14:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (14, 7, 14, 4, 200, '2019-01-25 14:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (15, 7, 28, 8, 400, '2019-01-25 14:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16, 8, 1, 8, 1432, '2018-01-26 11:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (17, 8, 64, 4, 672, '2018-01-26 11:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18, 8, 43, 3, 234, '2018-01-26 11:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (19, 7, 27, 3, 54, '2018-04-27 16:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (20, 7, 33, 9, 522, '2018-04-27 16:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (21, 7, 14, 1, 50, '2018-04-27 16:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22, 7, 63, 2, 276, '2018-04-27 16:00:00', 5, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23, 1, 21, 3, 654, '2018-12-28 20:00:00', 5, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24, 1, 36, 4, 160, '2018-12-28 20:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25, 1, 71, 4, 304, '2018-12-28 20:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (26, 2, 52, 2, 2160, '2018-12-28 03:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (27, 2, 41, 8, 312, '2018-12-28 03:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (28, 2, 72, 1, 88, '2018-12-28 03:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (29, 6, 70, 6, 198, '2018-10-26 19:00:00', 6, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (30, 6, 48, 1, 79, '2018-10-26 19:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (31, 6, 55, 3, 27, '2018-10-26 19:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (32, 9, 37, 3, 150, '2018-07-27 13:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (33, 9, 23, 8, 3168, '2018-07-27 13:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (34, 9, 9, 1, 59, '2018-07-27 13:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (35, 10, 51, 7, 623, '2019-03-22 19:00:00', 3, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (36, 10, 10, 5, 280, '2019-03-22 19:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (37, 10, 66, 8, 216, '2019-03-22 19:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (38, 7, 12, 3, 414, '2019-02-22 00:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (39, 7, 44, 6, 210, '2019-02-22 00:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (40, 7, 56, 3, 141, '2019-02-22 00:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (41, 8, 18, 8, 304, '2019-02-22 23:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (42, 8, 23, 1, 396, '2019-02-22 23:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (43, 8, 64, 3, 504, '2019-02-22 23:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (44, 2, 50, 3, 237, '2018-05-25 23:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (45, 2, 23, 8, 3168, '2018-05-25 23:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (46, 5, 73, 1, 74, '2018-04-27 11:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (47, 5, 49, 9, 1341, '2018-04-27 11:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (48, 5, 40, 2, 138, '2018-04-27 11:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (49, 2, 7, 4, 232, '2018-07-27 22:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (50, 2, 58, 7, 19593, '2018-07-27 22:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (51, 2, 51, 2, 178, '2018-07-27 22:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (52, 6, 41, 9, 351, '2018-03-23 22:00:00', 2, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (53, 6, 69, 1, 45, '2018-03-23 22:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (54, 6, 48, 2, 158, '2018-03-23 22:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (55, 6, 69, 7, 315, '2018-03-23 22:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (56, 9, 18, 6, 228, '2019-01-25 10:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (57, 9, 16, 9, 5652, '2019-01-25 10:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (58, 1, 41, 1, 39, '2018-05-25 10:00:00', 2, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (59, 1, 15, 4, 792, '2018-05-25 10:00:00', 3, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (60, 1, 29, 6, 180, '2018-05-25 10:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (61, 5, 42, 8, 464, '2019-03-22 11:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (62, 5, 54, 3, 177, '2019-03-22 11:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (63, 5, 12, 3, 414, '2019-03-22 11:00:00', 3, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (64, 5, 71, 9, 684, '2018-07-27 19:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (65, 5, 33, 1, 58, '2018-07-27 19:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (66, 2, 11, 7, 413, '2018-05-25 07:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (67, 2, 44, 9, 315, '2018-05-25 07:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (68, 10, 8, 2, 130, '2018-01-26 06:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (69, 10, 10, 5, 280, '2018-01-26 06:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (70, 10, 38, 2, 158, '2018-01-26 06:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (71, 6, 53, 6, 330, '2018-02-23 14:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (72, 6, 73, 8, 592, '2018-02-23 14:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (73, 6, 6, 7, 336, '2018-02-23 14:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (74, 6, 69, 6, 270, '2018-02-23 14:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (75, 9, 59, 9, 2115, '2018-12-28 05:00:00', 5, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (76, 9, 37, 5, 250, '2018-12-28 05:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (77, 5, 48, 3, 237, '2018-09-28 01:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (78, 5, 71, 7, 532, '2018-09-28 01:00:00', 6, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (79, 5, 61, 6, 1608, '2018-09-28 01:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (80, 5, 68, 2, 130, '2018-09-28 01:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (81, 8, 15, 7, 1386, '2019-01-25 13:00:00', 3, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (82, 8, 20, 3, 327, '2019-01-25 13:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (83, 8, 64, 4, 672, '2019-01-25 13:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (84, 6, 63, 7, 966, '2018-09-28 04:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (85, 6, 13, 9, 1251, '2018-09-28 04:00:00', 3, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (86, 6, 41, 4, 156, '2018-09-28 04:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (87, 4, 40, 8, 552, '2018-06-22 01:00:00', 2, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (88, 4, 33, 7, 406, '2018-06-22 01:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (89, 4, 60, 5, 1275, '2018-06-22 01:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (90, 5, 45, 7, 1113, '2018-11-23 21:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (91, 5, 68, 6, 390, '2018-11-23 21:00:00', 6, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (92, 1, 68, 8, 520, '2018-02-23 12:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (93, 1, 36, 5, 200, '2018-02-23 12:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (94, 8, 43, 3, 234, '2018-09-28 06:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (95, 8, 1, 5, 895, '2018-09-28 06:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (96, 3, 30, 5, 650, '2018-09-28 10:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (97, 3, 66, 3, 81, '2018-09-28 10:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (98, 7, 19, 7, 1393, '2018-01-26 00:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (99, 7, 28, 6, 300, '2018-01-26 00:00:00', 6, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (100, 7, 63, 4, 552, '2018-01-26 00:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (101, 2, 4, 5, 310, '2018-08-24 16:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (102, 2, 65, 8, 1224, '2018-08-24 16:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (103, 7, 49, 6, 894, '2019-01-25 03:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (104, 7, 35, 1, 30, '2019-01-25 03:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (105, 4, 12, 4, 552, '2018-05-25 19:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (106, 4, 11, 3, 177, '2018-05-25 19:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (107, 1, 30, 7, 910, '2018-06-22 03:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (108, 1, 4, 1, 62, '2018-06-22 03:00:00', 1, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (109, 1, 15, 8, 1584, '2018-06-22 03:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (110, 1, 29, 9, 270, '2018-06-22 03:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (111, 7, 5, 4, 332, '2019-03-22 07:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (112, 7, 7, 7, 406, '2019-03-22 07:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (113, 7, 28, 6, 300, '2019-03-22 07:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (114, 4, 39, 9, 711, '2018-09-28 09:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (115, 4, 1, 3, 537, '2018-09-28 09:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (116, 4, 39, 5, 395, '2018-09-28 09:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (117, 4, 11, 4, 236, '2018-09-28 09:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (118, 2, 40, 5, 345, '2018-01-26 00:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (119, 2, 72, 7, 616, '2018-01-26 00:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (120, 2, 44, 6, 210, '2018-01-26 00:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (121, 3, 61, 7, 1876, '2018-07-27 15:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (122, 3, 26, 2, 36, '2018-07-27 15:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (123, 3, 3, 1, 73, '2018-07-27 15:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (124, 3, 10, 1, 56, '2018-07-27 15:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (125, 4, 47, 5, 2995, '2019-01-25 09:00:00', 3, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (126, 4, 71, 6, 456, '2019-01-25 09:00:00', 6, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (127, 4, 67, 1, 55, '2019-01-25 09:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (128, 3, 19, 3, 597, '2018-04-27 08:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (129, 3, 17, 5, 1495, '2018-04-27 08:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (130, 9, 45, 5, 795, '2018-10-26 11:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (131, 9, 43, 8, 624, '2018-10-26 11:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (132, 9, 2, 9, 297, '2018-10-26 11:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (133, 9, 72, 8, 704, '2018-10-26 11:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (134, 4, 2, 8, 264, '2019-01-25 22:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (135, 4, 7, 3, 174, '2019-01-25 22:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (136, 4, 18, 1, 38, '2019-01-25 22:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (137, 2, 16, 3, 1884, '2018-05-25 19:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (138, 2, 16, 9, 5652, '2018-05-25 19:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (139, 3, 43, 4, 312, '2018-01-26 08:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (140, 3, 44, 8, 280, '2018-01-26 08:00:00', 2, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (141, 3, 38, 6, 474, '2018-01-26 08:00:00', 2, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (142, 3, 31, 7, 763, '2018-01-26 08:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (143, 10, 25, 8, 4752, '2019-03-22 23:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (144, 10, 38, 4, 316, '2019-03-22 23:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (145, 9, 52, 2, 2160, '2018-12-28 07:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (146, 9, 8, 6, 390, '2018-12-28 07:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (147, 9, 72, 1, 88, '2018-12-28 07:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (148, 9, 9, 8, 472, '2018-12-28 07:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (149, 8, 55, 2, 18, '2018-03-23 11:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (150, 8, 8, 2, 130, '2018-03-23 11:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (151, 9, 62, 7, 1036, '2018-07-27 18:00:00', 5, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (152, 9, 19, 9, 1791, '2018-07-27 18:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (153, 9, 51, 8, 712, '2018-07-27 18:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (154, 9, 30, 6, 780, '2018-07-27 18:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (155, 3, 73, 1, 74, '2018-02-23 03:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (156, 3, 66, 8, 216, '2018-02-23 03:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (157, 2, 43, 8, 624, '2018-06-22 06:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (158, 2, 72, 2, 176, '2018-06-22 06:00:00', 6, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (159, 4, 17, 7, 2093, '2018-05-25 07:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (160, 4, 53, 1, 55, '2018-05-25 07:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (161, 2, 43, 7, 546, '2018-04-27 10:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (162, 2, 58, 8, 22392, '2018-04-27 10:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (163, 2, 65, 8, 1224, '2018-04-27 10:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (164, 5, 26, 7, 126, '2018-06-22 06:00:00', 6, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (165, 5, 26, 6, 108, '2018-06-22 06:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (166, 5, 12, 9, 1242, '2018-06-22 06:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (167, 10, 40, 2, 138, '2019-03-22 12:00:00', 2, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (168, 10, 58, 4, 11196, '2019-03-22 12:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (169, 10, 66, 1, 27, '2019-03-22 12:00:00', 6, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (170, 6, 28, 6, 300, '2018-11-23 07:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (171, 6, 47, 5, 2995, '2018-11-23 07:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (172, 6, 48, 9, 711, '2018-11-23 07:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (173, 6, 69, 2, 90, '2018-11-23 07:00:00', 6, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (174, 1, 31, 9, 981, '2018-08-24 17:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (175, 1, 44, 5, 175, '2018-08-24 17:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (176, 1, 43, 6, 468, '2018-08-24 17:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (177, 1, 66, 1, 27, '2018-12-28 23:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (178, 1, 1, 4, 716, '2018-12-28 23:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (179, 1, 57, 6, 330, '2018-12-28 23:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (180, 1, 71, 4, 304, '2018-12-28 23:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (181, 3, 48, 7, 553, '2018-09-28 12:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (182, 3, 15, 5, 990, '2018-09-28 12:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (183, 3, 45, 4, 636, '2018-09-28 12:00:00', 3, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (184, 3, 31, 3, 327, '2018-09-28 12:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (185, 7, 22, 4, 1152, '2018-08-24 16:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (186, 7, 28, 3, 150, '2018-08-24 16:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (187, 7, 21, 7, 1526, '2018-08-24 16:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (188, 8, 17, 7, 2093, '2019-03-22 09:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (189, 8, 25, 5, 2970, '2019-03-22 09:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (190, 8, 36, 6, 240, '2019-03-22 09:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (191, 8, 71, 5, 380, '2019-03-22 09:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (192, 7, 38, 7, 553, '2019-02-22 13:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (193, 7, 29, 3, 90, '2019-02-22 13:00:00', 6, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (194, 7, 42, 4, 232, '2019-02-22 13:00:00', 2, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (195, 9, 52, 8, 8640, '2018-02-23 14:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (196, 9, 46, 8, 5592, '2018-02-23 14:00:00', 3, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (197, 9, 51, 3, 267, '2018-02-23 14:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (198, 9, 37, 8, 400, '2018-02-23 14:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (199, 3, 34, 3, 297, '2018-05-25 10:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (200, 3, 59, 9, 2115, '2018-05-25 10:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (201, 8, 68, 7, 455, '2018-01-26 18:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (202, 8, 63, 5, 690, '2018-01-26 18:00:00', 5, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (203, 8, 43, 5, 390, '2018-01-26 18:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (204, 8, 71, 1, 76, '2018-04-27 21:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (205, 8, 57, 9, 495, '2018-04-27 21:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (206, 8, 46, 4, 2796, '2018-10-26 22:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (207, 8, 57, 2, 110, '2018-10-26 22:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (208, 6, 70, 3, 99, '2018-01-26 19:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (209, 6, 40, 2, 138, '2018-01-26 19:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (210, 6, 20, 1, 109, '2018-01-26 19:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (211, 3, 14, 3, 150, '2018-10-26 12:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (212, 3, 19, 7, 1393, '2018-10-26 12:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (213, 3, 45, 8, 1272, '2018-10-26 12:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (214, 2, 2, 9, 297, '2018-09-28 21:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (215, 2, 12, 7, 966, '2018-09-28 21:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (216, 2, 16, 2, 1256, '2018-09-28 21:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (217, 1, 12, 8, 1104, '2018-10-26 14:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (218, 1, 43, 5, 390, '2018-10-26 14:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (219, 2, 67, 1, 55, '2018-03-23 22:00:00', 6, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (220, 2, 37, 4, 200, '2018-03-23 22:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (221, 2, 9, 2, 118, '2018-03-23 22:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (222, 3, 10, 8, 448, '2018-06-22 17:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (223, 3, 3, 6, 438, '2018-06-22 17:00:00', 1, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (224, 5, 67, 4, 220, '2018-04-27 14:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (225, 5, 17, 8, 2392, '2018-04-27 14:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (226, 5, 19, 2, 398, '2018-04-27 14:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (227, 9, 22, 8, 2304, '2019-02-22 12:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (228, 9, 17, 5, 1495, '2019-02-22 12:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (229, 9, 2, 2, 66, '2019-02-22 12:00:00', 1, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (230, 5, 32, 4, 188, '2018-09-28 22:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (231, 5, 5, 6, 498, '2018-09-28 22:00:00', 1, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (232, 5, 54, 1, 59, '2018-09-28 22:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (233, 10, 28, 6, 300, '2019-02-22 12:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (234, 10, 31, 8, 872, '2019-02-22 12:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (235, 9, 56, 8, 376, '2018-11-23 00:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (236, 9, 47, 7, 4193, '2018-11-23 00:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (237, 9, 65, 5, 765, '2018-11-23 00:00:00', 5, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (238, 9, 73, 3, 222, '2018-06-22 07:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (239, 9, 65, 3, 459, '2018-06-22 07:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (240, 9, 30, 6, 780, '2018-06-22 07:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (241, 6, 63, 6, 828, '2018-04-27 20:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (242, 6, 59, 2, 470, '2018-04-27 20:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (243, 6, 55, 3, 27, '2018-04-27 20:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (244, 1, 33, 8, 464, '2018-12-28 09:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (245, 1, 15, 8, 1584, '2018-12-28 09:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (246, 1, 43, 9, 702, '2018-12-28 09:00:00', 2, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (247, 1, 36, 7, 280, '2018-12-28 09:00:00', 1, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (248, 8, 72, 1, 88, '2018-09-28 22:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (249, 8, 1, 3, 537, '2018-09-28 22:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (250, 8, 64, 4, 672, '2018-09-28 22:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (251, 8, 1, 2, 358, '2018-09-28 22:00:00', 1, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (252, 9, 7, 9, 522, '2018-02-23 08:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (253, 9, 58, 5, 13995, '2018-02-23 08:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (254, 3, 6, 6, 288, '2019-01-25 06:00:00', 2, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (255, 3, 23, 7, 2772, '2019-01-25 06:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (256, 3, 17, 8, 2392, '2019-01-25 06:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (257, 3, 38, 5, 395, '2019-01-25 06:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (258, 2, 13, 6, 834, '2018-04-27 00:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (259, 2, 7, 1, 58, '2018-04-27 00:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (260, 2, 9, 3, 177, '2018-04-27 00:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (261, 6, 66, 2, 54, '2018-04-27 08:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (262, 6, 48, 6, 474, '2018-04-27 08:00:00', 3, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (263, 6, 27, 2, 36, '2018-04-27 08:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (264, 1, 9, 8, 472, '2018-05-25 15:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (265, 1, 62, 3, 444, '2018-05-25 15:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (266, 1, 43, 6, 468, '2018-05-25 15:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (267, 1, 29, 1, 30, '2018-05-25 15:00:00', 6, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (268, 7, 29, 9, 270, '2018-10-26 13:00:00', 6, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (269, 7, 7, 8, 464, '2018-10-26 13:00:00', 2, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (270, 6, 71, 4, 304, '2018-12-28 12:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (271, 6, 22, 8, 2304, '2018-12-28 12:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (272, 6, 41, 9, 351, '2018-12-28 12:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (273, 4, 14, 4, 200, '2018-02-23 12:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (274, 4, 4, 8, 496, '2018-02-23 12:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (275, 4, 74, 1, 138, '2018-02-23 12:00:00', 5, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (276, 2, 15, 3, 594, '2018-03-23 12:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (277, 2, 30, 8, 1040, '2018-03-23 12:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (278, 2, 9, 8, 472, '2018-03-23 12:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (279, 2, 58, 1, 2799, '2018-03-23 12:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (280, 7, 58, 6, 16794, '2018-03-23 08:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (281, 7, 14, 3, 150, '2018-03-23 08:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (282, 7, 35, 5, 150, '2018-03-23 08:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (283, 1, 16, 3, 1884, '2018-01-26 00:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (284, 1, 36, 8, 320, '2018-01-26 00:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (285, 6, 4, 6, 372, '2019-01-25 15:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (286, 6, 59, 9, 2115, '2019-01-25 15:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (287, 6, 55, 3, 27, '2019-01-25 15:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (288, 4, 63, 6, 828, '2018-04-27 18:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (289, 4, 32, 2, 94, '2018-04-27 18:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (290, 4, 4, 7, 434, '2018-04-27 18:00:00', 1, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (291, 4, 55, 4, 36, '2018-02-23 07:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (292, 4, 63, 7, 966, '2018-02-23 07:00:00', 5, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (293, 4, 53, 6, 330, '2018-02-23 07:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (294, 7, 7, 8, 464, '2018-12-28 13:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (295, 7, 62, 1, 148, '2018-12-28 13:00:00', 5, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (296, 7, 63, 8, 1104, '2018-12-28 13:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (297, 7, 14, 2, 100, '2018-12-28 13:00:00', 3, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (298, 5, 27, 9, 162, '2018-10-26 19:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (299, 5, 61, 9, 2412, '2018-10-26 19:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (300, 5, 12, 3, 414, '2018-10-26 19:00:00', 3, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (301, 7, 38, 7, 553, '2018-01-26 21:00:00', 2, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (302, 7, 5, 1, 83, '2018-01-26 21:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (303, 7, 35, 9, 270, '2018-01-26 21:00:00', 1, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (304, 7, 70, 8, 264, '2018-01-26 21:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (305, 7, 54, 6, 354, '2019-01-25 05:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (306, 7, 63, 1, 138, '2019-01-25 05:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (307, 7, 49, 6, 894, '2019-01-25 05:00:00', 3, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (308, 2, 57, 7, 385, '2018-07-27 16:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (309, 2, 11, 6, 354, '2018-07-27 16:00:00', 3, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (310, 2, 2, 9, 297, '2018-07-27 16:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (311, 2, 37, 1, 50, '2018-07-27 16:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (312, 6, 57, 9, 495, '2018-10-26 05:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (313, 6, 34, 3, 297, '2018-10-26 05:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (314, 6, 34, 4, 396, '2018-10-26 05:00:00', 1, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (315, 1, 27, 8, 144, '2018-04-27 18:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (316, 1, 71, 7, 532, '2018-04-27 18:00:00', 6, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (317, 9, 24, 8, 1592, '2018-04-27 08:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (318, 9, 58, 5, 13995, '2018-04-27 08:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (319, 9, 9, 7, 413, '2018-04-27 08:00:00', 2, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (320, 9, 44, 2, 70, '2018-04-27 08:00:00', 2, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (321, 5, 11, 8, 472, '2018-02-23 10:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (322, 5, 40, 2, 138, '2018-02-23 10:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (323, 5, 54, 9, 531, '2018-02-23 10:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (324, 1, 57, 3, 165, '2018-12-28 05:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (325, 1, 57, 2, 110, '2018-12-28 05:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (326, 1, 64, 4, 672, '2018-12-28 05:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (327, 7, 16, 6, 3768, '2018-05-25 03:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (328, 7, 43, 5, 390, '2018-05-25 03:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (329, 7, 56, 3, 141, '2018-05-25 03:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (330, 7, 7, 7, 406, '2018-05-25 03:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (331, 6, 31, 7, 763, '2018-10-26 04:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (332, 6, 41, 8, 312, '2018-10-26 04:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (333, 7, 38, 8, 632, '2018-11-23 16:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (334, 7, 70, 5, 165, '2018-11-23 16:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (335, 7, 42, 9, 522, '2018-11-23 16:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (336, 6, 46, 6, 4194, '2018-08-24 12:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (337, 6, 56, 5, 235, '2018-08-24 12:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (338, 6, 20, 1, 109, '2018-08-24 12:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (339, 3, 29, 5, 150, '2018-06-22 12:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (340, 3, 64, 5, 840, '2018-06-22 12:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (341, 3, 24, 5, 995, '2018-06-22 12:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (342, 3, 17, 4, 1196, '2018-06-22 12:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (343, 8, 43, 5, 390, '2018-03-23 23:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (344, 8, 28, 2, 100, '2018-03-23 23:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (345, 8, 71, 1, 76, '2018-03-23 23:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (346, 8, 15, 5, 990, '2018-03-23 23:00:00', 3, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (347, 7, 51, 8, 712, '2018-09-28 13:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (348, 7, 7, 4, 232, '2018-09-28 13:00:00', 2, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (349, 7, 49, 7, 1043, '2018-09-28 13:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (350, 4, 59, 1, 235, '2018-10-26 11:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (351, 4, 32, 3, 141, '2018-10-26 11:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (352, 4, 53, 7, 385, '2018-10-26 11:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (353, 6, 43, 4, 312, '2018-07-27 23:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (354, 6, 13, 8, 1112, '2018-07-27 23:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (355, 6, 48, 8, 632, '2018-07-27 23:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (356, 8, 22, 1, 288, '2018-12-28 16:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (357, 8, 19, 7, 1393, '2018-12-28 16:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (358, 8, 71, 9, 684, '2018-12-28 16:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (359, 8, 15, 2, 396, '2018-12-28 16:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (360, 9, 59, 4, 940, '2018-11-23 23:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (361, 9, 44, 1, 35, '2018-11-23 23:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (362, 8, 23, 3, 1188, '2019-02-22 07:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (363, 8, 1, 7, 1253, '2019-02-22 07:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (364, 5, 61, 7, 1876, '2018-06-22 18:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (365, 5, 26, 1, 18, '2018-06-22 18:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (366, 6, 73, 7, 518, '2018-03-23 01:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (367, 6, 71, 1, 76, '2018-03-23 01:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (368, 6, 62, 6, 888, '2018-03-23 01:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (369, 6, 13, 5, 695, '2018-03-23 01:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (370, 6, 73, 9, 666, '2018-08-24 18:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (371, 6, 27, 2, 36, '2018-08-24 18:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (372, 5, 74, 5, 690, '2018-10-26 21:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (373, 5, 26, 8, 144, '2018-10-26 21:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (374, 7, 68, 8, 520, '2018-07-27 08:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (375, 7, 56, 2, 94, '2018-07-27 08:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (376, 7, 63, 2, 276, '2018-07-27 08:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (377, 3, 24, 7, 1393, '2018-02-23 23:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (378, 3, 57, 9, 495, '2018-02-23 23:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (379, 3, 3, 4, 292, '2018-02-23 23:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (380, 8, 9, 6, 354, '2018-12-28 05:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (381, 8, 58, 3, 8397, '2018-12-28 05:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (382, 8, 8, 6, 390, '2018-12-28 05:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (383, 6, 50, 5, 395, '2018-02-23 13:00:00', 3, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (384, 6, 6, 8, 384, '2018-02-23 13:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (385, 6, 62, 2, 296, '2018-02-23 13:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (386, 2, 34, 9, 891, '2018-10-26 03:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (387, 2, 67, 6, 330, '2018-10-26 03:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (388, 2, 37, 6, 300, '2018-10-26 03:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (389, 2, 51, 4, 356, '2018-10-26 03:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (390, 3, 9, 7, 413, '2018-01-26 13:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (391, 3, 24, 2, 398, '2018-01-26 13:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (392, 3, 31, 3, 327, '2018-01-26 13:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (393, 3, 52, 6, 6480, '2018-01-26 13:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (394, 9, 64, 8, 1344, '2018-12-28 09:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (395, 9, 16, 2, 1256, '2018-12-28 09:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (396, 10, 14, 4, 200, '2018-11-23 21:00:00', 3, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (397, 10, 31, 4, 436, '2018-11-23 21:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (398, 6, 57, 7, 385, '2019-03-22 18:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (399, 6, 20, 9, 981, '2019-03-22 18:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (400, 6, 13, 1, 139, '2019-03-22 18:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (401, 10, 31, 5, 545, '2018-08-24 21:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (402, 10, 31, 2, 218, '2018-08-24 21:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (403, 8, 60, 3, 765, '2018-03-23 12:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (404, 8, 69, 1, 45, '2018-03-23 12:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (405, 8, 43, 9, 702, '2018-03-23 12:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (406, 8, 29, 2, 60, '2018-03-23 12:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (407, 7, 42, 7, 406, '2018-12-28 10:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (408, 7, 63, 3, 414, '2018-12-28 10:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (409, 2, 55, 9, 81, '2018-12-28 18:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (410, 2, 37, 7, 350, '2018-12-28 18:00:00', 1, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (411, 2, 44, 4, 140, '2018-12-28 18:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (412, 2, 2, 1, 33, '2018-10-26 08:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (413, 2, 47, 1, 599, '2018-10-26 08:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (414, 2, 72, 8, 704, '2018-10-26 08:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (415, 2, 51, 5, 445, '2018-10-26 08:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (416, 1, 25, 2, 1188, '2019-01-25 00:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (417, 1, 43, 8, 624, '2019-01-25 00:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (418, 2, 20, 2, 218, '2018-04-27 04:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (419, 2, 44, 3, 105, '2018-04-27 04:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (420, 2, 23, 7, 2772, '2018-04-27 04:00:00', 5, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (421, 3, 62, 9, 1332, '2018-05-25 23:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (422, 3, 59, 2, 470, '2018-05-25 23:00:00', 5, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (423, 1, 39, 7, 553, '2018-01-26 10:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (424, 1, 8, 9, 585, '2018-01-26 10:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (425, 4, 36, 5, 200, '2018-01-26 13:00:00', 1, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (426, 4, 74, 9, 1242, '2018-01-26 13:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (427, 9, 28, 8, 400, '2019-02-22 20:00:00', 6, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (428, 9, 4, 4, 248, '2019-02-22 20:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (429, 9, 72, 2, 176, '2019-02-22 20:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (430, 9, 18, 4, 152, '2018-07-27 09:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (431, 9, 71, 3, 228, '2018-07-27 09:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (432, 9, 16, 3, 1884, '2018-07-27 09:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (433, 9, 51, 6, 534, '2018-07-27 09:00:00', 3, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (434, 3, 32, 2, 94, '2018-12-28 20:00:00', 1, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (435, 3, 38, 8, 632, '2018-12-28 20:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (436, 3, 45, 9, 1431, '2018-12-28 20:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (437, 4, 26, 5, 90, '2018-03-23 18:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (438, 4, 39, 8, 632, '2018-03-23 18:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (439, 1, 60, 5, 1275, '2018-03-23 01:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (440, 1, 34, 2, 198, '2018-03-23 01:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (441, 1, 22, 1, 288, '2018-03-23 01:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (442, 1, 71, 7, 532, '2018-03-23 01:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (443, 5, 47, 8, 4792, '2018-04-27 22:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (444, 5, 47, 6, 3594, '2018-04-27 22:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (445, 5, 26, 5, 90, '2018-04-27 22:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (446, 4, 39, 2, 158, '2018-01-26 14:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (447, 4, 10, 9, 504, '2018-01-26 14:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (448, 4, 46, 2, 1398, '2018-01-26 14:00:00', 3, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (449, 3, 71, 5, 380, '2018-09-28 09:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (450, 3, 23, 9, 3564, '2018-09-28 09:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (451, 3, 24, 3, 597, '2018-09-28 09:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (452, 3, 3, 8, 584, '2018-09-28 09:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (453, 7, 71, 3, 228, '2018-11-23 17:00:00', 6, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (454, 7, 21, 9, 1962, '2018-11-23 17:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (455, 10, 72, 7, 616, '2018-05-25 06:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (456, 10, 24, 2, 398, '2018-05-25 06:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (457, 10, 3, 4, 292, '2018-05-25 06:00:00', 1, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (458, 3, 55, 3, 27, '2018-02-23 00:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (459, 3, 3, 1, 73, '2018-02-23 00:00:00', 1, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (460, 10, 15, 3, 594, '2018-05-25 22:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (461, 10, 65, 5, 765, '2018-05-25 22:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (462, 10, 52, 9, 9720, '2018-05-25 22:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (463, 10, 31, 7, 763, '2018-05-25 22:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (464, 2, 69, 1, 45, '2018-10-26 21:00:00', 6, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (465, 2, 1, 9, 1611, '2018-10-26 21:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (466, 2, 23, 5, 1980, '2018-10-26 21:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (467, 2, 44, 1, 35, '2018-10-26 21:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (468, 6, 50, 8, 632, '2019-03-22 17:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (469, 6, 21, 3, 654, '2019-03-22 17:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (470, 6, 55, 9, 81, '2019-03-22 17:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (471, 6, 41, 1, 39, '2019-03-22 17:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (472, 6, 17, 2, 598, '2018-02-23 09:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (473, 6, 20, 2, 218, '2018-02-23 09:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (474, 8, 34, 8, 792, '2018-12-28 22:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (475, 8, 64, 6, 1008, '2018-12-28 22:00:00', 5, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (476, 2, 72, 8, 704, '2019-02-22 00:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (477, 2, 37, 6, 300, '2019-02-22 00:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (478, 3, 38, 4, 316, '2018-05-25 16:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (479, 3, 19, 8, 1592, '2018-05-25 16:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (480, 3, 17, 5, 1495, '2018-05-25 16:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (481, 3, 48, 3, 237, '2019-03-22 07:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (482, 3, 17, 6, 1794, '2019-03-22 07:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (483, 3, 24, 2, 398, '2019-03-22 07:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (484, 4, 55, 9, 81, '2018-08-24 20:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (485, 4, 60, 9, 2295, '2018-08-24 20:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (486, 8, 48, 1, 79, '2018-03-23 23:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (487, 8, 8, 7, 455, '2018-03-23 23:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (488, 3, 43, 9, 702, '2018-03-23 21:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (489, 3, 52, 2, 2160, '2018-03-23 21:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (490, 3, 3, 1, 73, '2018-03-23 21:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (491, 7, 4, 5, 310, '2018-09-28 23:00:00', 1, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (492, 7, 56, 1, 47, '2018-09-28 23:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (493, 9, 29, 7, 210, '2018-07-27 22:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (494, 9, 30, 2, 260, '2018-07-27 22:00:00', 6, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (495, 3, 34, 1, 99, '2018-04-27 06:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (496, 3, 69, 3, 135, '2018-04-27 06:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (497, 3, 59, 8, 1880, '2018-04-27 06:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (498, 3, 10, 5, 280, '2018-04-27 06:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (499, 9, 1, 2, 358, '2018-06-22 20:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (500, 9, 72, 9, 792, '2018-06-22 20:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (501, 2, 7, 7, 406, '2018-08-24 16:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (502, 2, 44, 6, 210, '2018-08-24 16:00:00', 2, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (503, 2, 30, 9, 1170, '2018-08-24 16:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (504, 4, 14, 2, 100, '2018-05-25 05:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (505, 4, 25, 1, 594, '2018-05-25 05:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (506, 8, 49, 2, 298, '2018-08-24 06:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (507, 8, 36, 5, 200, '2018-08-24 06:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (508, 8, 29, 5, 150, '2018-08-24 06:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (509, 4, 59, 9, 2115, '2018-11-23 05:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (510, 4, 32, 5, 235, '2018-11-23 05:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (511, 7, 72, 6, 528, '2018-01-26 16:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (512, 7, 34, 7, 693, '2018-01-26 16:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (513, 7, 7, 3, 174, '2018-01-26 16:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (514, 7, 35, 3, 90, '2018-01-26 16:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (515, 10, 67, 7, 385, '2018-04-27 23:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (516, 10, 11, 3, 177, '2018-04-27 23:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (517, 10, 31, 1, 109, '2018-04-27 23:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (518, 3, 65, 6, 918, '2018-05-25 11:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (519, 3, 17, 3, 897, '2018-05-25 11:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (520, 3, 73, 4, 296, '2018-05-25 11:00:00', 6, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (521, 1, 2, 3, 99, '2018-05-25 17:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (522, 1, 50, 7, 553, '2018-05-25 17:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (523, 1, 22, 8, 2304, '2018-05-25 17:00:00', 5, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (524, 8, 25, 8, 4752, '2018-04-27 00:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (525, 8, 38, 1, 79, '2018-04-27 00:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (526, 8, 8, 7, 455, '2018-04-27 00:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (527, 8, 15, 2, 396, '2018-04-27 00:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (528, 8, 55, 7, 63, '2018-12-28 06:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (529, 8, 64, 5, 840, '2018-12-28 06:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (530, 8, 15, 6, 1188, '2018-12-28 06:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (531, 1, 46, 6, 4194, '2018-01-26 03:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (532, 1, 22, 3, 864, '2018-01-26 03:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (533, 1, 44, 1, 35, '2018-09-28 18:00:00', 2, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (534, 1, 21, 2, 436, '2018-09-28 18:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (535, 1, 64, 9, 1512, '2018-09-28 18:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (536, 10, 68, 7, 455, '2018-01-26 04:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (537, 10, 45, 7, 1113, '2018-01-26 04:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (538, 3, 41, 8, 312, '2019-03-22 19:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (539, 3, 59, 2, 470, '2019-03-22 19:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (540, 1, 13, 8, 1112, '2018-06-22 15:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (541, 1, 71, 9, 684, '2018-06-22 15:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (542, 1, 8, 8, 520, '2018-06-22 15:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (543, 8, 44, 2, 70, '2018-09-28 12:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (544, 8, 63, 3, 414, '2018-09-28 12:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (545, 8, 43, 8, 624, '2018-09-28 12:00:00', 2, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (546, 6, 12, 2, 276, '2018-06-22 01:00:00', 3, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (547, 6, 1, 2, 358, '2018-06-22 01:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (548, 6, 34, 2, 198, '2018-06-22 01:00:00', 1, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (549, 6, 27, 1, 18, '2018-06-22 01:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (550, 8, 25, 7, 4158, '2018-01-26 18:00:00', 5, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (551, 8, 36, 7, 280, '2018-01-26 18:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (552, 8, 18, 2, 76, '2018-02-23 02:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (553, 8, 30, 7, 910, '2018-02-23 02:00:00', 6, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (554, 8, 64, 5, 840, '2018-02-23 02:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (555, 8, 22, 7, 2016, '2018-02-23 02:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (556, 10, 65, 9, 1377, '2018-07-27 16:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (557, 10, 73, 3, 222, '2018-07-27 16:00:00', 6, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (558, 7, 22, 1, 288, '2019-01-25 11:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (559, 7, 68, 3, 195, '2019-01-25 11:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (560, 7, 35, 2, 60, '2019-01-25 11:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (561, 9, 70, 9, 297, '2019-03-22 17:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (562, 9, 53, 1, 55, '2019-03-22 17:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (563, 9, 44, 9, 315, '2019-03-22 17:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (564, 9, 16, 8, 5024, '2019-03-22 17:00:00', 4, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (565, 7, 44, 5, 175, '2018-03-23 15:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (566, 7, 19, 1, 199, '2018-03-23 15:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (567, 7, 7, 4, 232, '2018-03-23 15:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (568, 7, 56, 2, 94, '2018-03-23 15:00:00', 4, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (569, 6, 53, 9, 495, '2018-04-27 00:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (570, 6, 62, 9, 1332, '2018-04-27 00:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (571, 9, 10, 6, 336, '2019-02-22 16:00:00', 2, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (572, 9, 58, 2, 5598, '2019-02-22 16:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (573, 5, 60, 3, 765, '2018-10-26 21:00:00', 5, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (574, 5, 26, 7, 126, '2018-10-26 21:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (575, 5, 68, 3, 195, '2018-10-26 21:00:00', 6, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (576, 5, 61, 5, 1340, '2018-10-26 21:00:00', 5, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (577, 5, 62, 9, 1332, '2018-02-23 13:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (578, 5, 60, 4, 1020, '2018-02-23 13:00:00', 5, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (579, 5, 54, 6, 354, '2018-02-23 13:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (580, 5, 68, 7, 455, '2018-02-23 13:00:00', 6, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (581, 2, 21, 7, 1526, '2018-12-28 13:00:00', 5, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (582, 2, 39, 6, 474, '2018-12-28 13:00:00', 2, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (583, 2, 51, 4, 356, '2018-12-28 13:00:00', 3, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (584, 2, 37, 9, 450, '2018-12-28 13:00:00', 1, 1, NULL, NULL);
INSERT INTO `purchase_history` VALUES (585, 3, 33, 6, 348, '2019-01-25 00:00:00', 1, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (586, 3, 55, 8, 72, '2019-01-25 00:00:00', 4, 2, NULL, NULL);
INSERT INTO `purchase_history` VALUES (587, 3, 38, 3, 237, '2019-01-25 00:00:00', 2, 3, NULL, NULL);
INSERT INTO `purchase_history` VALUES (588, 3, 45, 6, 954, '2019-01-25 00:00:00', 3, 3, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `biomarker` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `phone_num` varchar(255) DEFAULT NULL,
  `other1` varchar(255) DEFAULT NULL,
  `other2` varchar(255) DEFAULT NULL,
  `other3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
BEGIN;
INSERT INTO `user_info` VALUES (1, '5d35d2ad97c7f6b42c1b99f293e6258d', '槐晓', '女', '19', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES (2, 'b510358b398c13891cd1d9649de84dfa', '凡楷', '女', '21', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES (3, '7140b27be0e6b222bf02c441a5a6dbf4', '峰皓', '女', '34', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES (4, 'a842c777cfc6c683c47341877398143c', '杞骞', '女', '26', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES (5, '8af351627c5dfd7b4760a6e6e2a54c27', '凡勇', '男', '37', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES (6, '5f7129ac93bda3b05b114c440274327e', '柏坤', '女', '34', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES (7, 'cfb663ef6f0ebf6443de416f992dd4e0', '翰暄', '男', '19', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES (8, '8bc60f597dac7f6426bc877b8eabe25a', '辰日', '男', '21', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES (9, '2a1904c4c99dfaa37b0ea51aa975fcd9', '叶帅', '男', '23', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES (10, '1b8adcdc74c7bb890f534937845312a8', '李天三', '男', '28', '企业家', '18862107179', NULL, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
