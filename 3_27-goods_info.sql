/*
Navicat MySQL Data Transfer

Source Server         : 111111
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : schema

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2019-03-27 19:28:16
*/

SET FOREIGN_KEY_CHECKS=0;

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
INSERT INTO `goods_info` VALUES ('1', '斐素NFC鲜榨纯果汁', '179', '1', null);
INSERT INTO `goods_info` VALUES ('2', '杨协荸荠果汁果肉', '33', '1', null);
INSERT INTO `goods_info` VALUES ('3', '星巴克抹茶味咖啡', '73', '1', null);
INSERT INTO `goods_info` VALUES ('4', '六个核桃核桃乳植物蛋白', '62', '1', null);
INSERT INTO `goods_info` VALUES ('5', '屈臣氏整箱苏打水汽水', '83', '1', null);
INSERT INTO `goods_info` VALUES ('6', '硅泥藻地垫', '48', '2', null);
INSERT INTO `goods_info` VALUES ('7', '创意家居用品收纳架', '58', '2', null);
INSERT INTO `goods_info` VALUES ('8', '懒人小百货时尚夜灯', '65', '2', null);
INSERT INTO `goods_info` VALUES ('9', '创意usb加湿器', '59', '2', null);
INSERT INTO `goods_info` VALUES ('10', '简约风格创意台灯', '56', '2', null);
INSERT INTO `goods_info` VALUES ('11', '白色纯棉上衣服装', '59', '3', null);
INSERT INTO `goods_info` VALUES ('12', '男士春季韩版潮流夹克', '138', '3', null);
INSERT INTO `goods_info` VALUES ('13', '丹顿公子正装西裤', '139', '3', null);
INSERT INTO `goods_info` VALUES ('14', '女孩芭蕾舞裙 ', '50', '3', null);
INSERT INTO `goods_info` VALUES ('15', '卫衣套装男春秋季三件套', '198', '3', null);
INSERT INTO `goods_info` VALUES ('16', '幼儿玩具数字积木拼图', '628', '4', null);
INSERT INTO `goods_info` VALUES ('17', '幼儿童脚踩钢琴毯', '299', '4', null);
INSERT INTO `goods_info` VALUES ('18', '迪士尼儿童羽毛球拍', '38', '4', null);
INSERT INTO `goods_info` VALUES ('19', 'babycare儿童篮球架', '199', '4', null);
INSERT INTO `goods_info` VALUES ('20', 'babycare婴幼儿手摇铃玩具', '109', '4', null);
INSERT INTO `goods_info` VALUES ('21', '生长胶囊碳酸钙高钙片', '218', '5', null);
INSERT INTO `goods_info` VALUES ('22', '康麦斯忆立清dha胶囊', '288', '5', null);
INSERT INTO `goods_info` VALUES ('23', '魔尔正品非孝素茶叶', '396', '5', null);
INSERT INTO `goods_info` VALUES ('24', '大豆异黄酮软胶囊', '199', '5', null);
INSERT INTO `goods_info` VALUES ('25', '修正 破壁灵芝孢子粉', '594', '5', null);
INSERT INTO `goods_info` VALUES ('26', '狼道强者的成功法则', '18', '6', null);
INSERT INTO `goods_info` VALUES ('27', '墨菲定律', '18', '6', null);
INSERT INTO `goods_info` VALUES ('28', '厚黑学等受益一生的4本', '50', '6', null);
INSERT INTO `goods_info` VALUES ('29', '好习惯伴我成长全8册', '30', '6', null);
INSERT INTO `goods_info` VALUES ('30', '程甲本红楼梦（全六册）', '130', '6', null);
INSERT INTO `goods_info` VALUES ('31', '进口零食大礼包组合一箱', '109', '1', null);
INSERT INTO `goods_info` VALUES ('32', '安乡杨矮子酱板鸭', '47', '1', null);
INSERT INTO `goods_info` VALUES ('33', '安乡杨矮子酱板鸭', '58', '1', null);
INSERT INTO `goods_info` VALUES ('34', '双鱼猪肉脯400克*2袋', '99', '1', null);
INSERT INTO `goods_info` VALUES ('35', '襄遇二阳老襄阳手工锅巴', '30', '1', null);
INSERT INTO `goods_info` VALUES ('36', '无夹心正宗法式马卡龙', '40', '1', null);
INSERT INTO `goods_info` VALUES ('37', '北海道白色恋人巧克力', '50', '1', null);
INSERT INTO `goods_info` VALUES ('38', '和风雨男士洗面奶', '79', '2', null);
INSERT INTO `goods_info` VALUES ('39', '麦芙迪男士洗面奶', '79', '2', null);
INSERT INTO `goods_info` VALUES ('40', '赫恩男士洗面奶套装', '69', '2', null);
INSERT INTO `goods_info` VALUES ('41', '马丁古龙男士沐浴露', '39', '2', null);
INSERT INTO `goods_info` VALUES ('42', '袋鼠妈妈燕窝水滢沐浴乳', '58', '2', null);
INSERT INTO `goods_info` VALUES ('43', '深蓝香水沐浴露乳液', '78', '2', null);
INSERT INTO `goods_info` VALUES ('44', '乔治卡罗尔男士沐浴露', '35', '2', null);
INSERT INTO `goods_info` VALUES ('45', '女童风衣2019春装新款', '159', '3', null);
INSERT INTO `goods_info` VALUES ('46', '龙牙M65战地风衣', '699', '3', null);
INSERT INTO `goods_info` VALUES ('47', '男装 BLOCKTECH风衣', '599', '3', null);
INSERT INTO `goods_info` VALUES ('48', '浪莎秋衣秋裤男套装', '79', '3', null);
INSERT INTO `goods_info` VALUES ('49', '七匹狼男士保暖内衣套装', '149', '3', null);
INSERT INTO `goods_info` VALUES ('50', '莫代尔打底秋衣', '79', '3', null);
INSERT INTO `goods_info` VALUES ('51', '2件装加绒保暖背心', '89', '3', null);
INSERT INTO `goods_info` VALUES ('52', '世纪龙1:18汽车模型', '1080', '4', null);
INSERT INTO `goods_info` VALUES ('53', '解压神器减压玩具', '55', '4', null);
INSERT INTO `goods_info` VALUES ('54', '兼容乐高积木成人版', '59', '4', null);
INSERT INTO `goods_info` VALUES ('55', '磁流体瓶', '9', '4', null);
INSERT INTO `goods_info` VALUES ('56', '成真高级仿真车模', '47', '4', null);
INSERT INTO `goods_info` VALUES ('57', '游戏机掌机怀旧款', '55', '4', null);
INSERT INTO `goods_info` VALUES ('58', '索尼PlayStation4Pro', '2799', '4', null);
INSERT INTO `goods_info` VALUES ('59', '成年高钙牛奶粉胶囊', '235', '5', null);
INSERT INTO `goods_info` VALUES ('60', '红桃k增高长碳酸钙胶囊', '255', '5', null);
INSERT INTO `goods_info` VALUES ('61', '麦金利无长高宽碳酸钙糖', '268', '5', null);
INSERT INTO `goods_info` VALUES ('62', '养生堂牌维生素E软胶囊', '148', '5', null);
INSERT INTO `goods_info` VALUES ('63', '妙语天然维生素E软胶囊', '138', '5', null);
INSERT INTO `goods_info` VALUES ('64', '汤臣倍健葡萄籽维生素', '168', '5', null);
INSERT INTO `goods_info` VALUES ('65', '钙尔奇牌添佳片1.04g/片', '153', '5', null);
INSERT INTO `goods_info` VALUES ('66', '我们要自学', '27', '6', null);
INSERT INTO `goods_info` VALUES ('67', '微服务架构实战', '55', '6', null);
INSERT INTO `goods_info` VALUES ('68', '非天夜翔小说套装3册', '65', '6', null);
INSERT INTO `goods_info` VALUES ('69', '设计师要懂心理学', '45', '6', null);
INSERT INTO `goods_info` VALUES ('70', ' 搞砸了的设计', '33', '6', null);
INSERT INTO `goods_info` VALUES ('71', '计算机体系结构', '76', '6', null);
INSERT INTO `goods_info` VALUES ('72', '数据挖掘与分析', '88', '6', null);
INSERT INTO `goods_info` VALUES ('73', 'R语言实战 第2版', '74', '6', null);
INSERT INTO `goods_info` VALUES ('74', '脑白金正品口服液10天', '138', '5', null);
