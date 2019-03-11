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

 Date: 11/03/2019 14:18:44
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
INSERT INTO `faceset_info` VALUES ('ScrumFaceset', '68e72c734e103509a0928584bcdccdc2');
COMMIT;

-- ----------------------------
-- Table structure for goods_info
-- ----------------------------
DROP TABLE IF EXISTS `goods_info`;
CREATE TABLE `goods_info` (
  `good_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `other1` varchar(255) DEFAULT NULL,
  `other2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2318 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_info
-- ----------------------------
BEGIN;
INSERT INTO `goods_info` VALUES (2015, '土斯番茄味棒形饼干128g', 9, NULL, NULL);
INSERT INTO `goods_info` VALUES (2049, '夏威夷果160g', 36, NULL, NULL);
INSERT INTO `goods_info` VALUES (2050, '酥脆薄饼薄脆海苔咸饼干', 15, NULL, NULL);
INSERT INTO `goods_info` VALUES (2051, '手撕面包1000g/盒', 28, NULL, NULL);
INSERT INTO `goods_info` VALUES (2052, '雀巢威化巧克力640g', 29, NULL, NULL);
INSERT INTO `goods_info` VALUES (2053, '梳打饼干奶盐味400g', 10, NULL, NULL);
INSERT INTO `goods_info` VALUES (2054, '手撕面包1050g整箱装', 33, NULL, NULL);
INSERT INTO `goods_info` VALUES (2055, '开心果100g1袋装', 40, NULL, NULL);
INSERT INTO `goods_info` VALUES (2056, '缤纷蔬果面包1000g', 86, NULL, NULL);
INSERT INTO `goods_info` VALUES (2057, '肉类豆干500g/袋', 22, NULL, NULL);
INSERT INTO `goods_info` VALUES (2058, '麦酥园', 68, NULL, NULL);
INSERT INTO `goods_info` VALUES (2059, '手撕面包1000g/箱', 28, NULL, NULL);
INSERT INTO `goods_info` VALUES (2060, '奥利奥饼干礼盒1250g', 155, NULL, NULL);
INSERT INTO `goods_info` VALUES (2061, '华美华夫饼1200g', 30, NULL, NULL);
INSERT INTO `goods_info` VALUES (2062, '牛轧奶芙160g/袋(蔓越莓味)', 18, NULL, NULL);
INSERT INTO `goods_info` VALUES (2063, '鸡蛋沙琪玛', 16, NULL, NULL);
INSERT INTO `goods_info` VALUES (2064, 'Dove巧克力', 30, NULL, NULL);
INSERT INTO `goods_info` VALUES (2065, '蔓越莓曲奇100g/袋', 9, NULL, NULL);
INSERT INTO `goods_info` VALUES (2066, '乐事（Lay\'s）薯片', 60, NULL, NULL);
INSERT INTO `goods_info` VALUES (2067, '卫龙', 15, NULL, NULL);
INSERT INTO `goods_info` VALUES (2068, '周黑鸭卤鸭脖麻辣微甜', 24, NULL, NULL);
INSERT INTO `goods_info` VALUES (2069, '黄金肉松饼456g', 33, NULL, NULL);
INSERT INTO `goods_info` VALUES (2070, '源氏网红', 7, NULL, NULL);
INSERT INTO `goods_info` VALUES (2071, '鲜品屋坚果干果礼盒', 70, NULL, NULL);
INSERT INTO `goods_info` VALUES (2072, '坚果大礼包1358gMJ', 199, NULL, NULL);
INSERT INTO `goods_info` VALUES (2073, '多力多滋（Doritos）零食', 6, NULL, NULL);
INSERT INTO `goods_info` VALUES (2074, '旺旺雪饼仙贝', 24, NULL, NULL);
INSERT INTO `goods_info` VALUES (2075, '手撕面包网红', 40, NULL, NULL);
INSERT INTO `goods_info` VALUES (2076, '元朗蝴蝶酥', 18, NULL, NULL);
INSERT INTO `goods_info` VALUES (2077, '礼盒每日坚果', 168, NULL, NULL);
INSERT INTO `goods_info` VALUES (2078, '进口烘烤原味腰果1.1kg', 158, NULL, NULL);
INSERT INTO `goods_info` VALUES (2079, '华夫饼168g饼干', 22, NULL, NULL);
INSERT INTO `goods_info` VALUES (2080, '小米锅巴五香味', 8, NULL, NULL);
INSERT INTO `goods_info` VALUES (2081, '夏威夷果120g坚果零食', 24, NULL, NULL);
INSERT INTO `goods_info` VALUES (2082, '坚果礼盒750g/盒30袋', 139, NULL, NULL);
INSERT INTO `goods_info` VALUES (2083, '特产牛肉干', 17, NULL, NULL);
INSERT INTO `goods_info` VALUES (2084, '榛子开心果30袋装750g/盒', 148, NULL, NULL);
INSERT INTO `goods_info` VALUES (2085, '虎皮蛋158g', 22, NULL, NULL);
INSERT INTO `goods_info` VALUES (2086, '闲趣原味饼干礼盒装900g', 26, NULL, NULL);
INSERT INTO `goods_info` VALUES (2087, '手剥东北红松子218g/袋', 33, NULL, NULL);
INSERT INTO `goods_info` VALUES (2088, '兆辉烤馍片馒头片整箱1kg', 28, NULL, NULL);
INSERT INTO `goods_info` VALUES (2089, '椰丝球210g糕点甜点小包装', 28, NULL, NULL);
INSERT INTO `goods_info` VALUES (2090, '饼干蛋糕网红儿童零食早餐', 10, NULL, NULL);
INSERT INTO `goods_info` VALUES (2093, '粒上皇甘栗仁100g*3袋', 30, NULL, NULL);
INSERT INTO `goods_info` VALUES (2094, '雀巢威化花生口味夹心饼干', 29, NULL, NULL);
INSERT INTO `goods_info` VALUES (2095, '坚果炒货', 38, NULL, NULL);
INSERT INTO `goods_info` VALUES (2096, '坚果炒货开心果100g/袋', 40, NULL, NULL);
INSERT INTO `goods_info` VALUES (2097, '咸蛋黄酥220g', 29, NULL, NULL);
INSERT INTO `goods_info` VALUES (2098, '白葡萄干100g蜜饯果干', 9, NULL, NULL);
INSERT INTO `goods_info` VALUES (2099, '抹茶味夹心麻薯210g/袋', 16, NULL, NULL);
INSERT INTO `goods_info` VALUES (2100, '卤鸭脖200g卤鸭腿220g', 64, NULL, NULL);
INSERT INTO `goods_info` VALUES (2101, '蔓越莓干100g', 12, NULL, NULL);
INSERT INTO `goods_info` VALUES (2102, '奥利奥Oreo早餐', 19, NULL, NULL);
INSERT INTO `goods_info` VALUES (2103, '乐事薯片经典原味75克', 8, NULL, NULL);
INSERT INTO `goods_info` VALUES (2104, '卤香鹌鹑蛋128g', 34, NULL, NULL);
INSERT INTO `goods_info` VALUES (2105, '粮悦', 10, NULL, NULL);
INSERT INTO `goods_info` VALUES (2106, '多味花生205g', 15, NULL, NULL);
INSERT INTO `goods_info` VALUES (2107, '喜之郎美好时光原味海苔4.5g', 5, NULL, NULL);
INSERT INTO `goods_info` VALUES (2108, '雀巢果汁软糖橡皮糖', 14, NULL, NULL);
INSERT INTO `goods_info` VALUES (2109, '红糖小麻花160g传统糕点', 9, NULL, NULL);
INSERT INTO `goods_info` VALUES (2110, '盐津铺子小新王子', 95, NULL, NULL);
INSERT INTO `goods_info` VALUES (2111, '乐事（Lay\'s）', 17, NULL, NULL);
INSERT INTO `goods_info` VALUES (2112, '刺猬阿甘口袋零食点心760g*1箱', 28, NULL, NULL);
INSERT INTO `goods_info` VALUES (2113, '乐事（Lay\'s）薯片', 72, NULL, NULL);
INSERT INTO `goods_info` VALUES (2114, '礼盒含进口', 158, NULL, NULL);
INSERT INTO `goods_info` VALUES (2115, '脆藕150g香辣藕片150g', 25, NULL, NULL);
INSERT INTO `goods_info` VALUES (2116, '友臣肉松饼', 13, NULL, NULL);
INSERT INTO `goods_info` VALUES (2117, '盐焗味兰花豆蚕豆210g/袋', 10, NULL, NULL);
INSERT INTO `goods_info` VALUES (2118, '奶盐口味苏打饼干咸味零食600g', 15, NULL, NULL);
INSERT INTO `goods_info` VALUES (2119, '高端零食奶香味巴旦木坚果炒货', 20, NULL, NULL);
INSERT INTO `goods_info` VALUES (2120, '卫龙', 11, NULL, NULL);
INSERT INTO `goods_info` VALUES (2121, '蟹黄味瓜子仁218g', 16, NULL, NULL);
INSERT INTO `goods_info` VALUES (2122, '鸡汤小饼180g', 22, NULL, NULL);
INSERT INTO `goods_info` VALUES (2123, '爆浆软心曲奇饼160g', 26, NULL, NULL);
INSERT INTO `goods_info` VALUES (2124, '脉动青柠口味维生素', 15, NULL, NULL);
INSERT INTO `goods_info` VALUES (2125, '东方树叶茉莉花茶500ml*15瓶茶', 64, NULL, NULL);
INSERT INTO `goods_info` VALUES (2126, '屈臣氏盐味苏打汽水330ml*24罐', 92, NULL, NULL);
INSERT INTO `goods_info` VALUES (2127, '魔爪超越白魔爪无糖运动', 149, NULL, NULL);
INSERT INTO `goods_info` VALUES (2128, '统一绿茶250ml*24盒/箱茶', 29, NULL, NULL);
INSERT INTO `goods_info` VALUES (2129, '脉动水蜜桃口味维生素', 34, NULL, NULL);
INSERT INTO `goods_info` VALUES (2130, '七喜7UP柠檬味汽水碳酸', 43, NULL, NULL);
INSERT INTO `goods_info` VALUES (2131, '脉动椰子菠萝口味维生素', 53, NULL, NULL);
INSERT INTO `goods_info` VALUES (2132, '银鹭花生牛奶口味复合蛋白质', 41, NULL, NULL);
INSERT INTO `goods_info` VALUES (2133, '依能GUO山楂+陈皮山楂果汁', 60, NULL, NULL);
INSERT INTO `goods_info` VALUES (2134, '豆本豆原味豆奶植物蛋白', 16, NULL, NULL);
INSERT INTO `goods_info` VALUES (2135, '豆本豆原味豆奶植物蛋白', 43, NULL, NULL);
INSERT INTO `goods_info` VALUES (2136, '屈臣氏苏打汽水混合口味系列', 85, NULL, NULL);
INSERT INTO `goods_info` VALUES (2137, '可口可乐Coca-Cola汽水碳酸', 13, NULL, NULL);
INSERT INTO `goods_info` VALUES (2138, '维他奶原味豆奶植物蛋白', 17, NULL, NULL);
INSERT INTO `goods_info` VALUES (2139, '星巴克星倍醇黑醇摩卡味浓咖啡', 55, NULL, NULL);
INSERT INTO `goods_info` VALUES (2140, '东鹏东鹏特饮有奖版维生素功能', 104, NULL, NULL);
INSERT INTO `goods_info` VALUES (2141, '王老吉凉茶茶叶', 28, NULL, NULL);
INSERT INTO `goods_info` VALUES (2142, '开卫野山楂果汁', 62, NULL, NULL);
INSERT INTO `goods_info` VALUES (2143, '维他奶维他柠檬茶', 119, NULL, NULL);
INSERT INTO `goods_info` VALUES (2144, '果倍爽桃苹果复合味果汁', 20, NULL, NULL);
INSERT INTO `goods_info` VALUES (2145, '雪碧Sprite柠檬味汽水碳酸', 35, NULL, NULL);
INSERT INTO `goods_info` VALUES (2146, '屈臣氏汤力汽水', 89, NULL, NULL);
INSERT INTO `goods_info` VALUES (2147, '伊藤园浓味乌龙茶茶叶', 71, NULL, NULL);
INSERT INTO `goods_info` VALUES (2148, '可口可乐健怡汽水碳酸', 62, NULL, NULL);
INSERT INTO `goods_info` VALUES (2149, '雪碧Sprite柠檬味汽水碳酸', 48, NULL, NULL);
INSERT INTO `goods_info` VALUES (2150, '盼盼酸梅汤果汁', 25, NULL, NULL);
INSERT INTO `goods_info` VALUES (2151, '马来西亚进口特丽娜芒果果肉', 26, NULL, NULL);
INSERT INTO `goods_info` VALUES (2152, '维他奶维他菊花茶', 40, NULL, NULL);
INSERT INTO `goods_info` VALUES (2153, '摩奇经典桃汁果味', 65, NULL, NULL);
INSERT INTO `goods_info` VALUES (2154, '天地壹号苹果醋', 60, NULL, NULL);
INSERT INTO `goods_info` VALUES (2155, '名仁苏打水汽水330ml*24罐', 56, NULL, NULL);
INSERT INTO `goods_info` VALUES (2156, '海南正宗椰汁245ml*24盒/箱', 98, NULL, NULL);
INSERT INTO `goods_info` VALUES (2157, '欢乐家生榨椰子汁果肉果汁', 88, NULL, NULL);
INSERT INTO `goods_info` VALUES (2158, '百事可乐京东罐碳酸', 50, NULL, NULL);
INSERT INTO `goods_info` VALUES (2159, '浓缩天然植物功能饮品维生素', 60, NULL, NULL);
INSERT INTO `goods_info` VALUES (2160, '依能加锌无糖无汽弱碱苏打水', 43, NULL, NULL);
INSERT INTO `goods_info` VALUES (2161, '娃哈哈爽歪歪含乳', 55, NULL, NULL);
INSERT INTO `goods_info` VALUES (2162, '星巴克星倍醇黑醇摩卡味浓咖啡', 105, NULL, NULL);
INSERT INTO `goods_info` VALUES (2163, '康师傅茉莉蜜茶茶', 30, NULL, NULL);
INSERT INTO `goods_info` VALUES (2164, '杏仁露便携装240ml*20罐', 80, NULL, NULL);
INSERT INTO `goods_info` VALUES (2165, '唯他可可天然椰子水进口NFC果汁', 98, NULL, NULL);
INSERT INTO `goods_info` VALUES (2166, '银鹭花生牛奶口味复合蛋白', 46, NULL, NULL);
INSERT INTO `goods_info` VALUES (2167, '优珍苹果醋果汁', 62, NULL, NULL);
INSERT INTO `goods_info` VALUES (2168, '怡泉零糖零卡苏打水', 50, NULL, NULL);
INSERT INTO `goods_info` VALUES (2169, '雀巢香滑口味即饮雀巢咖啡', 53, NULL, NULL);
INSERT INTO `goods_info` VALUES (2170, '冰峰果汁', 86, NULL, NULL);
INSERT INTO `goods_info` VALUES (2171, '斐素NFC鲜榨纯果汁礼盒礼袋', 179, NULL, NULL);
INSERT INTO `goods_info` VALUES (2172, '杨协成马蹄爽荸荠果汁果肉', 33, NULL, NULL);
INSERT INTO `goods_info` VALUES (2173, '星巴克星冰乐抹茶味咖啡', 73, NULL, NULL);
INSERT INTO `goods_info` VALUES (2174, '六个核桃核桃乳植物蛋白', 62, NULL, NULL);
INSERT INTO `goods_info` VALUES (2175, '六个核桃核桃乳植物蛋白', 76, NULL, NULL);
INSERT INTO `goods_info` VALUES (2176, '屈臣氏整箱装苏打水汽水', 83, NULL, NULL);
INSERT INTO `goods_info` VALUES (2177, '王老吉凉茶茶叶', 22, NULL, NULL);
INSERT INTO `goods_info` VALUES (2178, '伊藤园大麦茶茶叶', 60, NULL, NULL);
INSERT INTO `goods_info` VALUES (2179, '天地精华年度水机计划矿泉水', 64, NULL, NULL);
INSERT INTO `goods_info` VALUES (2180, '雀巢丝滑摩卡口味即饮雀巢咖啡', 73, NULL, NULL);
INSERT INTO `goods_info` VALUES (2181, '三得利低糖乌龙茶', 50, NULL, NULL);
INSERT INTO `goods_info` VALUES (2182, '泰国进口哇米诺原味豆奶', 108, NULL, NULL);
INSERT INTO `goods_info` VALUES (2183, '唯怡坚果饮品花生植物蛋白', 118, NULL, NULL);
INSERT INTO `goods_info` VALUES (2184, '王老吉凉茶', 11, NULL, NULL);
INSERT INTO `goods_info` VALUES (2185, '依能加锌无糖无汽弱碱苏打水', 39, NULL, NULL);
INSERT INTO `goods_info` VALUES (2186, '5100冰滴冷萃拿铁咖啡', 40, NULL, NULL);
INSERT INTO `goods_info` VALUES (2187, '果姿金果乐苹果醋果汁', 70, NULL, NULL);
INSERT INTO `goods_info` VALUES (2188, '雪碧Sprite雪碧纤维', 46, NULL, NULL);
INSERT INTO `goods_info` VALUES (2189, '元气森林醇香无糖膳食燃茶', 82, NULL, NULL);
INSERT INTO `goods_info` VALUES (2190, '果倍爽白葡萄味果汁', 24, NULL, NULL);
INSERT INTO `goods_info` VALUES (2191, '屈臣氏干姜味汽水', 94, NULL, NULL);
INSERT INTO `goods_info` VALUES (2192, '成有王记冷冻冷藏', 105, NULL, NULL);
INSERT INTO `goods_info` VALUES (2193, '依能蜜柠水添加蜂蜜果味', 33, NULL, NULL);
INSERT INTO `goods_info` VALUES (2194, '东鹏特饮有奖版维生素功能', 70, NULL, NULL);
INSERT INTO `goods_info` VALUES (2195, '可口可乐Coca-Cola汽水碳酸', 68, NULL, NULL);
INSERT INTO `goods_info` VALUES (2196, '马来西亚进口COWA椰子汁', 58, NULL, NULL);
INSERT INTO `goods_info` VALUES (2197, '泰国进口乐可芬椰汁', 49, NULL, NULL);
INSERT INTO `goods_info` VALUES (2198, '汇源100%果汁果汁', 79, NULL, NULL);
INSERT INTO `goods_info` VALUES (2199, '统一冰红茶（柠檬味红茶', 37, NULL, NULL);
INSERT INTO `goods_info` VALUES (2200, '可口可乐Coca-Cola汽水碳酸', 66, NULL, NULL);
INSERT INTO `goods_info` VALUES (2201, '王老吉凉茶茶叶', 49, NULL, NULL);
INSERT INTO `goods_info` VALUES (2202, '天地壹号苹果醋', 30, NULL, NULL);
INSERT INTO `goods_info` VALUES (2203, '康师傅', 30, NULL, NULL);
INSERT INTO `goods_info` VALUES (2204, '雀巢香滑口味即饮雀巢咖啡', 26, NULL, NULL);
INSERT INTO `goods_info` VALUES (2205, '蜂蜜味天然椰子水进口NFC果汁', 115, NULL, NULL);
INSERT INTO `goods_info` VALUES (2206, '农夫山泉水溶C100桔味复合果汁', 60, NULL, NULL);
INSERT INTO `goods_info` VALUES (2207, '天然植物功能饮品维生素', 119, NULL, NULL);
INSERT INTO `goods_info` VALUES (2208, '屈臣氏蜂蜜玫瑰花风味', 42, NULL, NULL);
INSERT INTO `goods_info` VALUES (2209, '美年达Mirinda橙味汽水碳酸', 43, NULL, NULL);
INSERT INTO `goods_info` VALUES (2210, '福仁缘枇杷原浆', 58, NULL, NULL);
INSERT INTO `goods_info` VALUES (2211, '椰娃1.25L*6大瓶新鲜生榨椰子汁', 66, NULL, NULL);
INSERT INTO `goods_info` VALUES (2212, '康师傅绿茶蜂蜜茉莉味', 39, NULL, NULL);
INSERT INTO `goods_info` VALUES (2213, '天地壹号陈醋', 53, NULL, NULL);
INSERT INTO `goods_info` VALUES (2214, '屈臣氏苏打汽水500ml*15瓶整箱装', 83, NULL, NULL);
INSERT INTO `goods_info` VALUES (2215, '农夫山泉乌龙茶500ml*15瓶茶', 64, NULL, NULL);
INSERT INTO `goods_info` VALUES (2216, '康师傅', 30, NULL, NULL);
INSERT INTO `goods_info` VALUES (2217, '魔爪monster能量型维生素运动', 25, NULL, NULL);
INSERT INTO `goods_info` VALUES (2218, '农夫山泉NFC果味', 149, NULL, NULL);
INSERT INTO `goods_info` VALUES (2219, '优珍蓝苏打苏打水', 50, NULL, NULL);
INSERT INTO `goods_info` VALUES (2220, '华旗未加蔗糖山楂果茶果肉果汁', 43, NULL, NULL);
INSERT INTO `goods_info` VALUES (2221, '本一零添加鲜榨NFC玉米果汁', 87, NULL, NULL);
INSERT INTO `goods_info` VALUES (2222, '奥地利原装进口红牛含气维生素功能', 46, NULL, NULL);
INSERT INTO `goods_info` VALUES (2223, '脉动青柠口味维生素', 72, NULL, NULL);
INSERT INTO `goods_info` VALUES (2224, '冠芳山楂树下山楂汁果汁', 68, NULL, NULL);
INSERT INTO `goods_info` VALUES (2225, '依能西柚味无糖无汽弱碱苏打水', 26, NULL, NULL);
INSERT INTO `goods_info` VALUES (2226, '依能经典味无糖无汽弱碱苏打水', 30, NULL, NULL);
INSERT INTO `goods_info` VALUES (2227, '阳光味道桑椹汁500mLx6盒家庭装', 88, NULL, NULL);
INSERT INTO `goods_info` VALUES (2228, '依能西柚味无糖无汽弱碱苏打水', 39, NULL, NULL);
INSERT INTO `goods_info` VALUES (2229, '统一鲜橙多450ml*15瓶整箱装橙汁', 40, NULL, NULL);
INSERT INTO `goods_info` VALUES (2230, '星巴克星倍醇经典浓郁咖啡味咖啡', 109, NULL, NULL);
INSERT INTO `goods_info` VALUES (2231, '维维经典系列原味豆奶', 96, NULL, NULL);
INSERT INTO `goods_info` VALUES (2232, '成有王记冷冻冷藏', 18, NULL, NULL);
INSERT INTO `goods_info` VALUES (2233, '百事可乐Pepsi碳酸', 36, NULL, NULL);
INSERT INTO `goods_info` VALUES (2234, '韩国进口啵乐乐混合口味', 63, NULL, NULL);
INSERT INTO `goods_info` VALUES (2235, '唯他可可天然椰子水进口NFC果汁', 49, NULL, NULL);
INSERT INTO `goods_info` VALUES (2236, '三得利黑乌龙', 128, NULL, NULL);
INSERT INTO `goods_info` VALUES (2237, '天地壹号苹果醋苹果汁醋', 49, NULL, NULL);
INSERT INTO `goods_info` VALUES (2238, '奥地利原装进口红牛含气维生素功能', 298, NULL, NULL);
INSERT INTO `goods_info` VALUES (2239, '欢乐家生榨椰子汁果肉果汁', 50, NULL, NULL);
INSERT INTO `goods_info` VALUES (2240, '雀巢丝滑榛果口味即饮雀巢咖啡', 73, NULL, NULL);
INSERT INTO `goods_info` VALUES (2241, '怡泉Schweppes+C柠檬味汽水碳酸', 50, NULL, NULL);
INSERT INTO `goods_info` VALUES (2242, '娃哈哈AD钙奶含乳', 36, NULL, NULL);
INSERT INTO `goods_info` VALUES (2243, '唯怡坚果饮品无防腐剂植物蛋白', 32, NULL, NULL);
INSERT INTO `goods_info` VALUES (2244, '农夫山泉尖叫运动', 96, NULL, NULL);
INSERT INTO `goods_info` VALUES (2245, '雪碧汽水碳酸', 13, NULL, NULL);
INSERT INTO `goods_info` VALUES (2246, '味全乳酸菌', 70, NULL, NULL);
INSERT INTO `goods_info` VALUES (2247, '天地精华天然矿泉水350ml*20瓶', 30, NULL, NULL);
INSERT INTO `goods_info` VALUES (2248, '维他柠檬茶柠檬味茶', 17, NULL, NULL);
INSERT INTO `goods_info` VALUES (2249, '屈臣氏新奇士百香果汁碳酸', 45, NULL, NULL);
INSERT INTO `goods_info` VALUES (2250, '名仁6个柠檬375ml*24瓶', 60, NULL, NULL);
INSERT INTO `goods_info` VALUES (2251, '维他奶健康加法纤维+醇豆奶', 58, NULL, NULL);
INSERT INTO `goods_info` VALUES (2252, '伊藤园TEAS\'TEA蜜桃红茶果味茶', 76, NULL, NULL);
INSERT INTO `goods_info` VALUES (2253, '味全鲜橙果汁100%果汁300ml', 7, NULL, NULL);
INSERT INTO `goods_info` VALUES (2254, '塞浦路斯进口100%纯果汁1L*4瓶', 78, NULL, NULL);
INSERT INTO `goods_info` VALUES (2255, '三蜜韩国进口', 55, NULL, NULL);
INSERT INTO `goods_info` VALUES (2256, '马来西亚进口特丽娜猕猴桃果肉', 26, NULL, NULL);
INSERT INTO `goods_info` VALUES (2257, '界界乐乳酸菌', 53, NULL, NULL);
INSERT INTO `goods_info` VALUES (2258, '泰国进口乐可芬椰汁', 49, NULL, NULL);
INSERT INTO `goods_info` VALUES (2259, '雀巢丝滑焦糖口味即饮雀巢咖啡', 73, NULL, NULL);
INSERT INTO `goods_info` VALUES (2260, '维他奶健康加法钙+醇豆奶', 58, NULL, NULL);
INSERT INTO `goods_info` VALUES (2261, '伊利谷粒多燕麦牛奶200mL*12盒', 36, NULL, NULL);
INSERT INTO `goods_info` VALUES (2262, '燕之典燕窝', 69, NULL, NULL);
INSERT INTO `goods_info` VALUES (2263, '统一奶茶250ml*24盒/箱整箱', 45, NULL, NULL);
INSERT INTO `goods_info` VALUES (2264, '农夫山泉红茶500ml*15瓶茶', 75, NULL, NULL);
INSERT INTO `goods_info` VALUES (2265, '崂山可乐碳酸', 70, NULL, NULL);
INSERT INTO `goods_info` VALUES (2266, '伊藤园TEAS\'TEA柠檬红茶果味茶', 76, NULL, NULL);
INSERT INTO `goods_info` VALUES (2267, '阿华田燕麦麦芽乳', 52, NULL, NULL);
INSERT INTO `goods_info` VALUES (2268, '农夫山泉维他命水', 108, NULL, NULL);
INSERT INTO `goods_info` VALUES (2269, '顾公醒酒蜜醒酒解酒蜂蜜', 224, NULL, NULL);
INSERT INTO `goods_info` VALUES (2270, '汇源无糖乌龙茶茶', 56, NULL, NULL);
INSERT INTO `goods_info` VALUES (2271, '众果100%苹果汁果汁', 60, NULL, NULL);
INSERT INTO `goods_info` VALUES (2272, '伊藤园祁门红茶茶叶', 71, NULL, NULL);
INSERT INTO `goods_info` VALUES (2273, '名仁清新苏打水', 60, NULL, NULL);
INSERT INTO `goods_info` VALUES (2274, '雀巢冷萃拿铁风味即饮雀巢咖啡', 159, NULL, NULL);
INSERT INTO `goods_info` VALUES (2275, '无添加剂100%果汁1L×4瓶礼盒', 71, NULL, NULL);
INSERT INTO `goods_info` VALUES (2276, '依能西柚味无糖无汽弱碱苏打水', 43, NULL, NULL);
INSERT INTO `goods_info` VALUES (2277, '王老吉凉茶茶叶', 42, NULL, NULL);
INSERT INTO `goods_info` VALUES (2278, '统一冰红茶1升*8瓶', 33, NULL, NULL);
INSERT INTO `goods_info` VALUES (2279, '优珍苹果醋果汁', 62, NULL, NULL);
INSERT INTO `goods_info` VALUES (2280, '农夫山泉力量帝维他命水', 108, NULL, NULL);
INSERT INTO `goods_info` VALUES (2281, '众果100%水蜜桃汁果汁', 50, NULL, NULL);
INSERT INTO `goods_info` VALUES (2282, 'Perrier巴黎水含气柠檬味', 98, NULL, NULL);
INSERT INTO `goods_info` VALUES (2283, '大窑嘉宾碳酸', 44, NULL, NULL);
INSERT INTO `goods_info` VALUES (2284, '泰国原装进口可可优原味椰子', 158, NULL, NULL);
INSERT INTO `goods_info` VALUES (2285, '统一冷泡茶冰橘绿茶480ml*15瓶', 66, NULL, NULL);
INSERT INTO `goods_info` VALUES (2286, '农夫山泉NFC果汁饮料', 73, NULL, NULL);
INSERT INTO `goods_info` VALUES (2287, '顾公醒酒蜜缓解宿醉解酒蜂蜜', 116, NULL, NULL);
INSERT INTO `goods_info` VALUES (2288, '蓝色可乐450ml*12梅子口味瓶装', 85, NULL, NULL);
INSERT INTO `goods_info` VALUES (2289, '依能蜜桃水添加蜂蜜果味', 53, NULL, NULL);
INSERT INTO `goods_info` VALUES (2290, '维他柠檬味茶250ml*24支', 52, NULL, NULL);
INSERT INTO `goods_info` VALUES (2291, '舒达源克东天然苏打水1.5L*6瓶', 118, NULL, NULL);
INSERT INTO `goods_info` VALUES (2292, '伊藤园含膳食纤维乌龙茶茶叶', 80, NULL, NULL);
INSERT INTO `goods_info` VALUES (2293, '宏宝莱礼盒装445ml*15瓶花生露', 55, NULL, NULL);
INSERT INTO `goods_info` VALUES (2294, '椰子水量贩装350ml*24', 195, NULL, NULL);
INSERT INTO `goods_info` VALUES (2295, '韩国进口OKF牧羊人库拉索芦荟果汁', 59, NULL, NULL);
INSERT INTO `goods_info` VALUES (2296, '元気森林元气森林无糖乌龙茶', 84, NULL, NULL);
INSERT INTO `goods_info` VALUES (2297, '伤迪褥疮膏褥疮溃烂压疮旋清抗菌', 50, NULL, NULL);
INSERT INTO `goods_info` VALUES (2298, '美国润肤甘油护肤甘油100g', 39, NULL, NULL);
INSERT INTO `goods_info` VALUES (2299, '褥疮膏促进伤口愈合', 88, NULL, NULL);
INSERT INTO `goods_info` VALUES (2300, '纽西小精灵', 31, NULL, NULL);
INSERT INTO `goods_info` VALUES (2301, '凡士林润肤露200ml', 19, NULL, NULL);
INSERT INTO `goods_info` VALUES (2302, '屈臣氏保湿润肤露系列500ml', 69, NULL, NULL);
INSERT INTO `goods_info` VALUES (2303, '凡士林倍护特润修护润肤露400ML*2件', 90, NULL, NULL);
INSERT INTO `goods_info` VALUES (2304, '全身补水去角质润肤露320g/瓶', 70, NULL, NULL);
INSERT INTO `goods_info` VALUES (2305, '保湿去鸡皮肤死皮角质沐浴露单瓶装', 98, NULL, NULL);
INSERT INTO `goods_info` VALUES (2306, '军中军医皮霸乳膏15g', 15, NULL, NULL);
INSERT INTO `goods_info` VALUES (2307, '女士保湿水润牛奶身体乳500ml', 65, NULL, NULL);
INSERT INTO `goods_info` VALUES (2308, '持久浴后乳身体乳', 69, NULL, NULL);
INSERT INTO `goods_info` VALUES (2309, '男女补水保湿大润肤露乳液400ml', 86, NULL, NULL);
INSERT INTO `goods_info` VALUES (2310, '尊蓝魅动香调滋润', 55, NULL, NULL);
INSERT INTO `goods_info` VALUES (2311, '骨胶原马油浓润修护手部', 37, NULL, NULL);
INSERT INTO `goods_info` VALUES (2312, '郁美净浴后乳液220g', 20, NULL, NULL);
INSERT INTO `goods_info` VALUES (2313, '妮维雅深层修复身体乳400ml/瓶', 69, NULL, NULL);
INSERT INTO `goods_info` VALUES (2314, '去鸡皮痘痘背补水保湿润肤霜340gx1', 104, NULL, NULL);
INSERT INTO `goods_info` VALUES (2315, '妮维雅美体紧肤身体乳400ml', 79, NULL, NULL);
INSERT INTO `goods_info` VALUES (2316, '协和维E止痒露100ml', 17, NULL, NULL);
INSERT INTO `goods_info` VALUES (2317, '亮丽莱山羊奶', 40, NULL, NULL);
COMMIT;

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
  `other1` varchar(255) DEFAULT NULL,
  `other2` varchar(255) DEFAULT NULL,
  `other3` varchar(255) DEFAULT NULL,
  `other4` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29742 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_history
-- ----------------------------
BEGIN;
INSERT INTO `purchase_history` VALUES (10617, 4, 2289, 7, 371, '2018-04-27 10:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (10618, 4, 2233, 1, 36, '2018-04-27 10:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (10619, 4, 2190, 3, 72, '2018-04-27 10:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (10620, 4, 2155, 2, 112, '2018-04-27 10:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (10621, 4, 2090, 4, 40, '2018-04-27 10:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (10622, 4, 2133, 5, 300, '2018-04-27 10:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (10623, 4, 2136, 1, 85, '2018-04-27 10:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (10624, 4, 2244, 3, 288, '2018-04-27 10:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (10625, 4, 2304, 7, 490, '2018-04-27 10:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (10626, 4, 2107, 4, 20, '2018-04-27 10:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (10627, 4, 2086, 3, 78, '2018-04-27 10:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (10628, 4, 2203, 8, 240, '2018-04-27 10:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (10629, 4, 2234, 9, 567, '2018-04-27 10:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (10630, 4, 2315, 9, 711, '2018-04-27 10:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (11268, 5, 2120, 9, 99, '2018-12-28 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (11269, 5, 2187, 3, 210, '2018-12-28 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (11270, 5, 2126, 1, 92, '2018-12-28 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (11271, 5, 2234, 2, 126, '2018-12-28 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (11272, 5, 2132, 3, 123, '2018-12-28 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (11273, 5, 2073, 6, 36, '2018-12-28 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (11274, 5, 2202, 4, 120, '2018-12-28 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (11278, 3, 2202, 5, 150, '2017-03-24 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (11279, 3, 2090, 8, 80, '2017-03-24 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (11280, 3, 2229, 4, 160, '2017-03-24 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (11281, 3, 2155, 5, 280, '2017-03-24 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (11282, 3, 2130, 1, 43, '2017-03-24 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (11283, 3, 2241, 5, 250, '2017-03-24 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (11284, 3, 2015, 1, 9, '2017-03-24 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (11285, 3, 2293, 4, 220, '2017-03-24 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (11286, 3, 2118, 7, 105, '2017-03-24 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (11287, 3, 2212, 2, 78, '2017-03-24 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (11288, 3, 2187, 7, 490, '2017-03-24 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12021, 6, 2230, 6, 654, '2018-07-27 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12022, 6, 2188, 3, 138, '2018-07-27 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12023, 6, 2243, 1, 32, '2018-07-27 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12024, 6, 2107, 5, 25, '2018-07-27 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12025, 6, 2062, 8, 144, '2018-07-27 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12026, 6, 2152, 2, 80, '2018-07-27 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12027, 6, 2316, 9, 153, '2018-07-27 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12028, 6, 2093, 6, 180, '2018-07-27 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12029, 6, 2258, 8, 392, '2018-07-27 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12030, 6, 2087, 6, 198, '2018-07-27 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12031, 6, 2305, 9, 882, '2018-07-27 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12032, 6, 2125, 6, 384, '2018-07-27 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12033, 6, 2280, 2, 216, '2018-07-27 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12034, 6, 2066, 1, 60, '2018-07-27 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12035, 6, 2229, 6, 240, '2018-07-27 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12036, 6, 2251, 2, 116, '2018-07-27 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12037, 6, 2063, 5, 80, '2018-07-27 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12038, 6, 2161, 6, 330, '2018-07-27 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12123, 8, 2273, 1, 60, '2017-01-27 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12124, 8, 2082, 4, 556, '2017-01-27 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12125, 8, 2059, 1, 28, '2017-01-27 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12126, 8, 2219, 1, 50, '2017-01-27 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12127, 8, 2149, 9, 432, '2017-01-27 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12128, 8, 2078, 7, 1106, '2017-01-27 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12129, 8, 2087, 1, 33, '2017-01-27 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12130, 8, 2248, 8, 136, '2017-01-27 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12131, 8, 2199, 9, 333, '2017-01-27 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12132, 8, 2117, 3, 30, '2017-01-27 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12333, 10, 2236, 3, 384, '2017-02-24 13:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12334, 10, 2116, 3, 39, '2017-02-24 13:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12335, 10, 2184, 6, 66, '2017-02-24 13:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (12336, 10, 2111, 6, 102, '2017-02-24 13:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13351, 3, 2273, 4, 240, '2017-10-27 11:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13352, 3, 2118, 3, 45, '2017-10-27 11:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13353, 3, 2250, 4, 240, '2017-10-27 11:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13354, 3, 2189, 2, 164, '2017-10-27 11:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13355, 3, 2241, 6, 300, '2017-10-27 11:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13356, 3, 2205, 2, 230, '2017-10-27 11:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13357, 3, 2165, 2, 196, '2017-10-27 11:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13358, 3, 2105, 2, 20, '2017-10-27 11:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13359, 3, 2075, 9, 360, '2017-10-27 11:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13360, 3, 2219, 5, 250, '2017-10-27 11:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13361, 3, 2291, 8, 944, '2017-10-27 11:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13362, 3, 2156, 5, 490, '2017-10-27 11:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13363, 3, 2316, 9, 153, '2017-10-27 11:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13364, 3, 2159, 2, 120, '2017-10-27 11:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13365, 3, 2192, 4, 420, '2017-10-27 11:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13366, 3, 2204, 9, 234, '2017-10-27 11:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13367, 3, 2210, 1, 58, '2017-10-27 11:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13368, 3, 2310, 5, 275, '2017-10-27 11:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13369, 3, 2191, 1, 94, '2017-10-27 11:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13511, 10, 2055, 9, 360, '2018-04-27 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13512, 10, 2067, 8, 120, '2018-04-27 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13513, 10, 2152, 8, 320, '2018-04-27 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13514, 10, 2140, 7, 728, '2018-04-27 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13515, 10, 2170, 4, 344, '2018-04-27 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13592, 4, 2283, 5, 220, '2017-03-24 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13593, 4, 2137, 7, 91, '2017-03-24 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13594, 4, 2191, 9, 846, '2017-03-24 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13595, 4, 2303, 4, 360, '2017-03-24 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13596, 4, 2122, 5, 110, '2017-03-24 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (13597, 4, 2124, 4, 60, '2017-03-24 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (14566, 3, 2266, 2, 152, '2017-10-27 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (14567, 3, 2143, 2, 238, '2017-10-27 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (14568, 3, 2165, 1, 98, '2017-10-27 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (14569, 3, 2234, 9, 567, '2017-10-27 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (14570, 3, 2196, 6, 348, '2017-10-27 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (14571, 3, 2293, 8, 440, '2017-10-27 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (14572, 3, 2141, 4, 112, '2017-10-27 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (14573, 3, 2203, 1, 30, '2017-10-27 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (14574, 3, 2125, 6, 384, '2017-10-27 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (14575, 3, 2209, 7, 301, '2017-10-27 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (14576, 3, 2286, 7, 511, '2017-10-27 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (14577, 3, 2308, 4, 276, '2017-10-27 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (14578, 3, 2250, 6, 360, '2017-10-27 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (14579, 3, 2104, 9, 306, '2017-10-27 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (15562, 3, 2063, 7, 112, '2017-03-24 12:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (15563, 3, 2309, 7, 602, '2017-03-24 12:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (15564, 3, 2238, 9, 2682, '2017-03-24 12:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (15565, 3, 2107, 8, 40, '2017-03-24 12:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (15566, 3, 2140, 9, 936, '2017-03-24 12:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (15567, 3, 2213, 9, 477, '2017-03-24 12:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (15568, 3, 2282, 7, 686, '2017-03-24 12:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (15569, 3, 2196, 5, 290, '2017-03-24 12:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (15948, 5, 2279, 1, 62, '2018-03-23 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (15949, 5, 2267, 5, 260, '2018-03-23 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (15950, 5, 2287, 7, 812, '2018-03-23 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (15951, 5, 2135, 3, 129, '2018-03-23 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (15952, 5, 2316, 1, 17, '2018-03-23 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (15953, 5, 2250, 2, 120, '2018-03-23 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16464, 6, 2095, 3, 114, '2017-08-25 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16465, 6, 2181, 1, 50, '2017-08-25 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16466, 6, 2115, 3, 75, '2017-08-25 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16467, 6, 2186, 9, 360, '2017-08-25 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16468, 6, 2206, 3, 180, '2017-08-25 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16469, 6, 2190, 9, 216, '2017-08-25 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16470, 6, 2248, 4, 68, '2017-08-25 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16471, 6, 2137, 6, 78, '2017-08-25 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16472, 6, 2280, 3, 324, '2017-08-25 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16473, 6, 2195, 8, 544, '2017-08-25 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16474, 6, 2139, 5, 275, '2017-08-25 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16475, 6, 2226, 8, 240, '2017-08-25 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16476, 6, 2073, 7, 42, '2017-08-25 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16477, 6, 2290, 6, 312, '2017-08-25 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16478, 6, 2112, 9, 252, '2017-08-25 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16479, 6, 2102, 7, 133, '2017-08-25 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16480, 6, 2133, 5, 300, '2017-08-25 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16481, 6, 2054, 8, 264, '2017-08-25 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16952, 2, 2060, 3, 465, '2019-02-22 16:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16953, 2, 2211, 6, 396, '2019-02-22 16:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16954, 2, 2255, 2, 110, '2019-02-22 16:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16955, 2, 2171, 6, 1074, '2019-02-22 16:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16956, 2, 2015, 3, 27, '2019-02-22 16:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16957, 2, 2201, 8, 392, '2019-02-22 16:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16958, 2, 2077, 9, 1512, '2019-02-22 16:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (16959, 2, 2096, 4, 160, '2019-02-22 16:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (17875, 7, 2124, 5, 75, '2017-11-24 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (17876, 7, 2206, 6, 360, '2017-11-24 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (17877, 7, 2070, 1, 7, '2017-11-24 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (17878, 7, 2060, 8, 1240, '2017-11-24 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (17879, 7, 2310, 5, 275, '2017-11-24 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (17880, 7, 2214, 9, 747, '2017-11-24 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (17881, 7, 2291, 9, 1062, '2017-11-24 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (17882, 7, 2240, 4, 292, '2017-11-24 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (17883, 7, 2172, 6, 198, '2017-11-24 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (17884, 7, 2288, 2, 170, '2017-11-24 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (17885, 7, 2317, 5, 200, '2017-11-24 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (17886, 7, 2064, 5, 150, '2017-11-24 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (17887, 7, 2085, 3, 66, '2017-11-24 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (17888, 7, 2293, 5, 275, '2017-11-24 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (17889, 7, 2181, 9, 450, '2017-11-24 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18153, 5, 2182, 2, 216, '2018-03-23 05:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18154, 5, 2272, 6, 426, '2018-03-23 05:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18225, 2, 2216, 5, 150, '2019-03-22 16:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18226, 2, 2054, 8, 264, '2019-03-22 16:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18227, 2, 2160, 9, 387, '2019-03-22 16:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18228, 2, 2102, 4, 76, '2019-03-22 16:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18229, 2, 2270, 3, 168, '2019-03-22 16:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18230, 2, 2314, 2, 208, '2019-03-22 16:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18231, 2, 2148, 3, 186, '2019-03-22 16:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18232, 2, 2138, 5, 85, '2019-03-22 16:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18233, 2, 2306, 8, 120, '2019-03-22 16:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18234, 2, 2289, 4, 212, '2019-03-22 16:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18235, 2, 2173, 7, 511, '2019-03-22 16:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18236, 2, 2117, 1, 10, '2019-03-22 16:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18237, 2, 2278, 7, 231, '2019-03-22 16:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18238, 2, 2298, 3, 117, '2019-03-22 16:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18269, 2, 2092, 3, 99, '2018-08-24 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18270, 2, 2221, 8, 696, '2018-08-24 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18271, 2, 2237, 2, 98, '2018-08-24 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18272, 2, 2053, 3, 30, '2018-08-24 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18273, 2, 2098, 8, 72, '2018-08-24 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18274, 2, 2284, 7, 1106, '2018-08-24 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18275, 2, 2292, 8, 640, '2018-08-24 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18276, 2, 2203, 2, 60, '2018-08-24 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18277, 2, 2315, 3, 237, '2018-08-24 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18278, 2, 2135, 2, 86, '2018-08-24 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18279, 2, 2165, 6, 588, '2018-08-24 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18280, 2, 2279, 3, 186, '2018-08-24 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18281, 2, 2225, 9, 234, '2018-08-24 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18282, 2, 2081, 6, 144, '2018-08-24 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (18283, 2, 2240, 4, 292, '2018-08-24 21:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (19090, 9, 2314, 5, 520, '2019-01-25 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (19091, 9, 2061, 9, 270, '2019-01-25 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (19092, 9, 2212, 2, 78, '2019-01-25 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (19093, 9, 2090, 3, 30, '2019-01-25 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (19094, 9, 2142, 1, 62, '2019-01-25 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (19095, 9, 2285, 2, 132, '2019-01-25 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (19096, 9, 2217, 1, 25, '2019-01-25 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (19097, 9, 2055, 8, 320, '2019-01-25 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (19098, 9, 2277, 8, 336, '2019-01-25 01:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (20968, 5, 2218, 2, 298, '2019-01-25 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (20969, 5, 2150, 2, 50, '2019-01-25 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (20970, 5, 2292, 5, 400, '2019-01-25 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (20971, 5, 2083, 6, 102, '2019-01-25 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (20972, 5, 2165, 6, 588, '2019-01-25 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (20973, 5, 2071, 4, 280, '2019-01-25 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (20974, 5, 2065, 2, 18, '2019-01-25 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (20975, 5, 2213, 9, 477, '2019-01-25 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (20976, 5, 2197, 1, 49, '2019-01-25 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (20977, 5, 2062, 6, 108, '2019-01-25 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (20978, 5, 2053, 2, 20, '2019-01-25 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (20979, 5, 2314, 7, 728, '2019-01-25 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (20980, 5, 2159, 4, 240, '2019-01-25 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (20981, 5, 2087, 2, 66, '2019-01-25 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22062, 3, 2220, 3, 129, '2017-05-26 03:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22063, 3, 2098, 4, 36, '2017-05-26 03:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22064, 3, 2111, 6, 102, '2017-05-26 03:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22065, 3, 2171, 2, 358, '2017-05-26 03:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22066, 3, 2246, 2, 140, '2017-05-26 03:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22067, 3, 2287, 5, 580, '2017-05-26 03:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22068, 3, 2052, 6, 174, '2017-05-26 03:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22069, 3, 2059, 9, 252, '2017-05-26 03:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22070, 3, 2250, 9, 540, '2017-05-26 03:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22071, 3, 2212, 6, 234, '2017-05-26 03:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22072, 3, 2143, 9, 1071, '2017-05-26 03:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22073, 3, 2258, 4, 196, '2017-05-26 03:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22884, 3, 2084, 6, 888, '2017-10-27 07:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22885, 3, 2235, 7, 343, '2017-10-27 07:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22886, 3, 2081, 3, 72, '2017-10-27 07:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22887, 3, 2052, 4, 116, '2017-10-27 07:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22888, 3, 2278, 7, 231, '2017-10-27 07:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22889, 3, 2057, 9, 198, '2017-10-27 07:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22890, 3, 2124, 3, 45, '2017-10-27 07:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22891, 3, 2102, 2, 38, '2017-10-27 07:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22892, 3, 2153, 2, 130, '2017-10-27 07:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22893, 3, 2127, 2, 298, '2017-10-27 07:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22894, 3, 2091, 1, 22, '2017-10-27 07:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22895, 3, 2054, 4, 132, '2017-10-27 07:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22896, 3, 2279, 8, 496, '2017-10-27 07:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22897, 3, 2134, 9, 144, '2017-10-27 07:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (22898, 3, 2160, 6, 258, '2017-10-27 07:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23108, 2, 2085, 7, 154, '2017-09-22 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23109, 2, 2061, 2, 60, '2017-09-22 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23110, 2, 2169, 9, 477, '2017-09-22 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23111, 2, 2175, 9, 684, '2017-09-22 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23112, 2, 2245, 7, 91, '2017-09-22 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23113, 2, 2290, 2, 104, '2017-09-22 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23114, 2, 2062, 1, 18, '2017-09-22 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23115, 2, 2220, 7, 301, '2017-09-22 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23116, 2, 2074, 3, 72, '2017-09-22 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23117, 2, 2213, 5, 265, '2017-09-22 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23118, 2, 2125, 2, 128, '2017-09-22 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23119, 2, 2228, 9, 351, '2017-09-22 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23120, 2, 2166, 2, 92, '2017-09-22 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23121, 2, 2194, 3, 210, '2017-09-22 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23122, 2, 2258, 1, 49, '2017-09-22 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23123, 2, 2151, 8, 208, '2017-09-22 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23124, 2, 2143, 8, 952, '2017-09-22 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23125, 2, 2168, 5, 250, '2017-09-22 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23126, 2, 2304, 4, 280, '2017-09-22 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23146, 9, 2137, 3, 39, '2017-01-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23147, 9, 2078, 8, 1264, '2017-01-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23148, 9, 2131, 5, 265, '2017-01-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23149, 9, 2162, 6, 630, '2017-01-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23150, 9, 2273, 1, 60, '2017-01-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23151, 9, 2180, 6, 438, '2017-01-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23152, 9, 2069, 8, 264, '2017-01-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23153, 9, 2058, 6, 408, '2017-01-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23154, 9, 2299, 9, 792, '2017-01-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23155, 9, 2253, 1, 7, '2017-01-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23156, 9, 2054, 1, 33, '2017-01-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23157, 9, 2197, 8, 392, '2017-01-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23158, 9, 2095, 2, 76, '2017-01-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23159, 9, 2284, 7, 1106, '2017-01-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23815, 7, 2089, 4, 112, '2018-09-28 13:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23816, 7, 2212, 4, 156, '2018-09-28 13:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23817, 7, 2220, 2, 86, '2018-09-28 13:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23818, 7, 2168, 4, 200, '2018-09-28 13:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23819, 7, 2248, 1, 17, '2018-09-28 13:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23820, 7, 2093, 7, 210, '2018-09-28 13:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23821, 7, 2175, 4, 304, '2018-09-28 13:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23822, 7, 2054, 4, 132, '2018-09-28 13:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23823, 7, 2219, 8, 400, '2018-09-28 13:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23824, 7, 2229, 6, 240, '2018-09-28 13:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23825, 7, 2263, 9, 405, '2018-09-28 13:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23826, 7, 2125, 6, 384, '2018-09-28 13:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23827, 7, 2177, 8, 176, '2018-09-28 13:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23828, 7, 2071, 3, 210, '2018-09-28 13:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23829, 7, 2313, 4, 276, '2018-09-28 13:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23830, 7, 2218, 5, 745, '2018-09-28 13:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23831, 7, 2292, 4, 320, '2018-09-28 13:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23832, 7, 2069, 6, 198, '2018-09-28 13:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23833, 7, 2158, 9, 450, '2018-09-28 13:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23989, 6, 2142, 4, 248, '2017-06-23 09:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23990, 6, 2267, 2, 104, '2017-06-23 09:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23991, 6, 2276, 7, 301, '2017-06-23 09:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23992, 6, 2312, 4, 80, '2017-06-23 09:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23993, 6, 2171, 3, 537, '2017-06-23 09:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23994, 6, 2096, 2, 80, '2017-06-23 09:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23995, 6, 2308, 5, 345, '2017-06-23 09:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23996, 6, 2128, 5, 145, '2017-06-23 09:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (23997, 6, 2135, 6, 258, '2017-06-23 09:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24410, 5, 2312, 1, 20, '2018-11-23 02:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24411, 5, 2237, 5, 245, '2018-11-23 02:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24412, 5, 2231, 7, 672, '2018-11-23 02:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24413, 5, 2266, 2, 152, '2018-11-23 02:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24414, 5, 2083, 2, 34, '2018-11-23 02:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24621, 2, 2264, 2, 150, '2018-03-23 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24622, 2, 2112, 6, 168, '2018-03-23 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24623, 2, 2258, 5, 245, '2018-03-23 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24624, 2, 2141, 4, 112, '2018-03-23 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24625, 2, 2285, 8, 528, '2018-03-23 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24626, 2, 2291, 5, 590, '2018-03-23 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24627, 2, 2120, 6, 66, '2018-03-23 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24628, 2, 2015, 2, 18, '2018-03-23 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24629, 2, 2232, 6, 108, '2018-03-23 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24630, 2, 2284, 1, 158, '2018-03-23 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24631, 2, 2294, 8, 1560, '2018-03-23 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24671, 1, 2108, 2, 28, '2019-01-25 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24672, 1, 2270, 6, 336, '2019-01-25 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24673, 1, 2192, 7, 735, '2019-01-25 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24674, 1, 2094, 1, 29, '2019-01-25 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24675, 1, 2142, 1, 62, '2019-01-25 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24676, 1, 2312, 2, 40, '2019-01-25 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24677, 1, 2316, 8, 136, '2019-01-25 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24678, 1, 2114, 5, 790, '2019-01-25 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24679, 1, 2287, 7, 812, '2019-01-25 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24680, 1, 2074, 4, 96, '2019-01-25 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24681, 1, 2251, 1, 58, '2019-01-25 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24682, 1, 2152, 4, 160, '2019-01-25 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24683, 1, 2190, 2, 48, '2019-01-25 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24684, 1, 2206, 8, 480, '2019-01-25 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24762, 8, 2092, 4, 132, '2017-05-26 05:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (24763, 8, 2311, 5, 185, '2017-05-26 05:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25002, 4, 2216, 5, 150, '2018-06-22 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25003, 4, 2250, 1, 60, '2018-06-22 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25004, 4, 2310, 7, 385, '2018-06-22 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25005, 4, 2315, 3, 237, '2018-06-22 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25006, 4, 2131, 5, 265, '2018-06-22 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25007, 4, 2151, 6, 156, '2018-06-22 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25008, 4, 2161, 2, 110, '2018-06-22 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25009, 4, 2200, 3, 198, '2018-06-22 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25010, 4, 2139, 4, 220, '2018-06-22 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25011, 4, 2142, 2, 124, '2018-06-22 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25012, 4, 2196, 9, 522, '2018-06-22 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25048, 3, 2307, 8, 520, '2018-02-23 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25049, 3, 2272, 2, 142, '2018-02-23 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25050, 3, 2197, 9, 441, '2018-02-23 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25051, 3, 2259, 6, 438, '2018-02-23 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25052, 3, 2166, 2, 92, '2018-02-23 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25053, 3, 2066, 7, 420, '2018-02-23 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25054, 3, 2130, 2, 86, '2018-02-23 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25055, 3, 2219, 4, 200, '2018-02-23 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25056, 3, 2210, 8, 464, '2018-02-23 17:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25552, 3, 2145, 1, 35, '2017-04-28 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25553, 3, 2279, 1, 62, '2017-04-28 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25554, 3, 2308, 1, 69, '2017-04-28 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25555, 3, 2282, 9, 882, '2017-04-28 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25556, 3, 2113, 4, 288, '2017-04-28 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25557, 3, 2313, 5, 345, '2017-04-28 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25558, 3, 2306, 3, 45, '2017-04-28 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25559, 3, 2124, 8, 120, '2017-04-28 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25560, 3, 2191, 5, 470, '2017-04-28 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25561, 3, 2206, 7, 420, '2017-04-28 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25562, 3, 2283, 8, 352, '2017-04-28 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25563, 3, 2100, 9, 576, '2017-04-28 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25564, 3, 2265, 4, 280, '2017-04-28 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25565, 3, 2175, 2, 152, '2017-04-28 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25646, 2, 2175, 3, 228, '2018-12-28 20:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25647, 2, 2223, 1, 72, '2018-12-28 20:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25648, 2, 2187, 2, 140, '2018-12-28 20:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25649, 2, 2165, 6, 588, '2018-12-28 20:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25650, 2, 2305, 9, 882, '2018-12-28 20:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (25651, 2, 2176, 7, 581, '2018-12-28 20:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (26429, 1, 2101, 9, 108, '2018-05-25 09:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (26430, 1, 2229, 1, 40, '2018-05-25 09:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (26431, 1, 2094, 1, 29, '2018-05-25 09:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (26432, 1, 2053, 6, 60, '2018-05-25 09:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (26433, 1, 2147, 3, 213, '2018-05-25 09:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (26434, 1, 2253, 8, 56, '2018-05-25 09:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (26435, 1, 2316, 7, 119, '2018-05-25 09:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (27097, 2, 2183, 8, 944, '2017-03-24 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (27098, 2, 2180, 5, 365, '2017-03-24 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (27099, 2, 2311, 9, 333, '2017-03-24 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (27100, 2, 2085, 1, 22, '2017-03-24 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (27101, 2, 2109, 3, 27, '2017-03-24 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (27102, 2, 2294, 7, 1365, '2017-03-24 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (27103, 2, 2259, 8, 584, '2017-03-24 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (27104, 2, 2226, 1, 30, '2017-03-24 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (27105, 2, 2096, 1, 40, '2017-03-24 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (27106, 2, 2143, 9, 1071, '2017-03-24 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (27107, 2, 2177, 8, 176, '2017-03-24 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (27108, 2, 2121, 2, 32, '2017-03-24 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (27109, 2, 2260, 2, 116, '2017-03-24 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (27110, 2, 2055, 7, 280, '2017-03-24 23:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (27836, 5, 2169, 7, 371, '2017-12-22 12:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (27837, 5, 2229, 9, 360, '2017-12-22 12:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (28519, 9, 2237, 6, 294, '2018-05-25 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (28520, 9, 2274, 4, 636, '2018-05-25 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (28521, 9, 2278, 9, 297, '2018-05-25 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (28522, 9, 2148, 2, 124, '2018-05-25 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (28523, 9, 2218, 1, 149, '2018-05-25 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (28524, 9, 2140, 6, 624, '2018-05-25 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (28525, 9, 2153, 3, 195, '2018-05-25 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (28526, 9, 2314, 7, 728, '2018-05-25 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (28527, 9, 2163, 2, 60, '2018-05-25 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (28528, 9, 2291, 1, 118, '2018-05-25 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (28529, 9, 2251, 2, 116, '2018-05-25 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (28530, 9, 2306, 4, 60, '2018-05-25 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (28531, 9, 2211, 1, 66, '2018-05-25 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (28532, 9, 2303, 5, 450, '2018-05-25 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (28533, 9, 2285, 8, 528, '2018-05-25 14:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (28572, 3, 2289, 6, 318, '2018-10-26 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (28573, 3, 2288, 9, 765, '2018-10-26 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (28574, 3, 2287, 2, 232, '2018-10-26 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (28575, 3, 2204, 9, 234, '2018-10-26 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (28576, 3, 2119, 4, 80, '2018-10-26 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (28577, 3, 2053, 1, 10, '2018-10-26 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (28578, 3, 2127, 2, 298, '2018-10-26 19:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (29068, 5, 2302, 4, 276, '2017-09-22 15:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (29069, 5, 2143, 8, 952, '2017-09-22 15:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (29070, 5, 2052, 9, 261, '2017-09-22 15:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (29071, 5, 2179, 8, 512, '2017-09-22 15:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (29072, 5, 2278, 1, 33, '2017-09-22 15:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (29334, 7, 2278, 3, 99, '2018-06-22 02:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (29737, 2, 2077, 4, 672, '2018-10-26 09:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (29738, 2, 2116, 5, 65, '2018-10-26 09:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (29739, 2, 2203, 6, 180, '2018-10-26 09:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (29740, 2, 2209, 5, 215, '2018-10-26 09:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `purchase_history` VALUES (29741, 2, 2208, 9, 378, '2018-10-26 09:00:00', NULL, NULL, NULL, NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

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
INSERT INTO `user_info` VALUES (10, '1b8adcdc74c7bb890f534937845312a8', '锦诚', '男', '23', NULL, NULL, NULL, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
