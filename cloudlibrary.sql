/*
Navicat MySQL Data Transfer

Source Server         : 1
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : cloudlibrary

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2025-04-11 20:00:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `book_id` int(32) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL,
  `book_isbn` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL,
  `book_press` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL,
  `book_author` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL,
  `book_pagination` int(32) DEFAULT NULL,
  `book_price` double(32,2) DEFAULT NULL,
  `book_uploadtime` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL,
  `book_status` varchar(1) CHARACTER SET utf8mb4 DEFAULT NULL,
  `book_borrower` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL,
  `book_borrowtime` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL,
  `book_returntime` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1047 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1001', '32432', '23432', '32432', '32423', '234', '432.00', '324', '0', '李白', '2025-04-10', '2025-04-11');
INSERT INTO `book` VALUES ('1002', '三体', '9787536692930', '重庆出版社', '刘慈欣', '302', '23.00', '2023-01-15', '0', '李白', '2025-04-10', '2025-04-12');
INSERT INTO `book` VALUES ('1003', '活着', '9787506365437', '作家出版社', '余华', '191', '20.00', '2023-02-10', '0', '', '', '');
INSERT INTO `book` VALUES ('1004', 'Python编程从入门到实践', '9787115428028', '人民邮电出版社', 'Eric Matthes', '459', '89.00', '2023-03-05', '0', null, null, null);
INSERT INTO `book` VALUES ('1005', '百年孤独', '9787544258974', '南海出版公司', '加西亚·马尔克斯', '360', '39.50', '2023-03-18', '0', null, null, null);
INSERT INTO `book` VALUES ('1006', '人类简史', '9787508647357', '中信出版社', '尤瓦尔·赫拉利', '428', '68.00', '2023-04-22', '0', '', '', '');
INSERT INTO `book` VALUES ('1007', '围城', '9787020090006', '人民文学出版社', '钱钟书', '359', '28.00', '2023-05-30', '0', null, null, null);
INSERT INTO `book` VALUES ('1008', '明朝那些事儿(1)', '9787208061640', '中国友谊出版公司', '当年明月', '298', '28.80', '2023-06-12', '0', '', '', '');
INSERT INTO `book` VALUES ('1009', '白夜行', '9787544258609', '南海出版公司', '东野圭吾', '538', '45.00', '2023-07-01', '0', null, null, null);
INSERT INTO `book` VALUES ('1010', '小王子', '9787020042494', '人民文学出版社', '圣埃克苏佩里', '96', '22.00', '2023-07-05', '1', '李白', '2025-04-11', '2025-04-19');
INSERT INTO `book` VALUES ('1011', 'JavaScript高级程序设计', '9787115275790', '人民邮电出版社', 'Nicholas C. Zakas', '748', '99.00', '2023-07-10', '0', null, null, null);
INSERT INTO `book` VALUES ('1012', '平凡的世界', '9787020049295', '人民文学出版社', '路遥', '1251', '108.00', '2023-07-15', '0', '', '', '');
INSERT INTO `book` VALUES ('1013', '时间简史', '9787535732309', '湖南科学技术出版社', '史蒂芬·霍金', '245', '38.00', '2023-07-20', '0', null, null, null);
INSERT INTO `book` VALUES ('1014', '天龙八部', '9787020024759', '生活·读书·新知三联书店', '金庸', '1978', '128.00', '2023-07-25', '0', null, null, null);
INSERT INTO `book` VALUES ('1015', '沉默的大多数', '9787508650647', '中信出版社', '王小波', '352', '42.00', '2023-08-01', '1', '李白', '2025-04-11', '2025-04-19');
INSERT INTO `book` VALUES ('1016', '数据结构与算法分析', '9787111633054', '机械工业出版社', 'Mark Allen Weiss', '588', '89.00', '2023-08-05', '0', null, null, null);
INSERT INTO `book` VALUES ('1017', '月亮与六便士', '9787544766500', '上海译文出版社', '毛姆', '304', '39.80', '2023-08-10', '0', null, null, null);
INSERT INTO `book` VALUES ('1018', '浪潮之巅', '9787121200308', '电子工业出版社', '吴军', '584', '65.00', '2023-08-15', '0', '', '', '');
INSERT INTO `book` VALUES ('1019', '追风筝的人', '9787208061644', '上海人民出版社', '卡勒德·胡赛尼', '362', '36.00', '2023-09-01', '0', null, null, null);
INSERT INTO `book` VALUES ('1020', '解忧杂货店', '9787544270878', '南海出版公司', '东野圭吾', '320', '39.50', '2023-09-02', '1', '张飞', '2025-04-11', '2025-05-16');
INSERT INTO `book` VALUES ('1021', '飘', '9787020052325', '人民文学出版社', '玛格丽特·米切尔', '1037', '78.00', '2023-09-03', '1', '李白', '2025-04-11', '2025-04-17');
INSERT INTO `book` VALUES ('1022', '1984', '9787020036356', '北京十月文艺出版社', '乔治·奥威尔', '328', '28.00', '2023-09-04', '0', null, null, null);
INSERT INTO `book` VALUES ('1023', '算法导论', '9787111187776', '机械工业出版社', 'Thomas H.Cormen', '780', '128.00', '2023-09-05', '0', null, null, null);
INSERT INTO `book` VALUES ('1024', '深入理解计算机系统', '9787111544937', '机械工业出版社', 'Randal E.Bryant', '737', '139.00', '2023-09-06', '0', '', '', '');
INSERT INTO `book` VALUES ('1025', 'Clean Code', '9787121178874', '人民邮电出版社', 'Robert C.Martin', '388', '59.00', '2023-09-07', '0', null, null, null);
INSERT INTO `book` VALUES ('1026', '万历十五年', '9787108009821', '生活·读书·新知三联书店', '黄仁宇', '320', '40.00', '2023-09-08', '0', null, null, null);
INSERT INTO `book` VALUES ('1027', '全球通史', '9787301150890', '北京大学出版社', '斯塔夫里阿诺斯', '862', '88.00', '2023-09-09', '0', null, null, null);
INSERT INTO `book` VALUES ('1028', '枪炮、病菌与钢铁', '9787108033406', '上海译文出版社', '贾雷德·戴蒙德', '493', '55.00', '2023-09-10', '0', null, null, null);
INSERT INTO `book` VALUES ('1029', '穷查理宝典', '9787208111282', '上海人民出版社', '彼得·考夫曼', '531', '88.00', '2023-09-11', '0', '', '', '');
INSERT INTO `book` VALUES ('1030', '经济学原理', '9787301255441', '北京大学出版社', '曼昆', '856', '99.00', '2023-09-12', '0', '', '', '');
INSERT INTO `book` VALUES ('1031', '非暴力沟通', '9787508095226', '华夏出版社', '马歇尔·卢森堡', '190', '35.00', '2023-09-13', '0', null, null, null);
INSERT INTO `book` VALUES ('1032', '自卑与超越', '9787111551287', '人民邮电出版社', '阿尔弗雷德·阿德勒', '248', '39.80', '2023-09-14', '0', '', '', '');
INSERT INTO `book` VALUES ('1033', '物种起源', '9787100080005', '商务印书馆', '达尔文', '628', '68.00', '2023-09-15', '0', null, null, null);
INSERT INTO `book` VALUES ('1034', '宇宙简史', '9787535732309', '湖南科学技术出版社', '斯蒂芬·霍金', '245', '45.00', '2023-09-16', '0', null, null, null);
INSERT INTO `book` VALUES ('1035', '设计中的设计', '9787532246627', '山东人民出版社', '原研哉', '240', '48.00', '2023-09-17', '0', null, null, null);
INSERT INTO `book` VALUES ('1036', '艺术的故事', '9787108027896', '生活·读书·新知三联书店', '贡布里希', '688', '280.00', '2023-09-18', '1', null, null, null);
INSERT INTO `book` VALUES ('1037', '史蒂夫·乔布斯传', '9787508630060', '中信出版社', '沃尔特·艾萨克森', '560', '68.00', '2023-09-19', '0', null, null, null);
INSERT INTO `book` VALUES ('1038', '你当像鸟飞往你的山', '9787544276986', '南海出版公司', '塔拉·韦斯特弗', '388', '59.00', '2023-09-20', '0', null, null, null);
INSERT INTO `book` VALUES ('1039', '测试', '11111', '1111', '1111', '111', '1111.00', '2025-04-10', '0', '', '', '');
INSERT INTO `book` VALUES ('1040', '测试2', '11111111', '1111', '111111', '111', '112.00', '2025-04-10', '0', '', '', '');
INSERT INTO `book` VALUES ('1041', '23', '123123', '213', '21312', '222', '22.00', '2025-04-10', '0', '', '', '');
INSERT INTO `book` VALUES ('1042', '测试4', '2222222', '22222', '22222', '2222', '2222.00', '2025-04-11', '3', null, null, null);
INSERT INTO `book` VALUES ('1043', '测试x', '123213213', '测试出版社', '测试作者', '333', '23.00', '2025-04-11', '0', '', '', '');
INSERT INTO `book` VALUES ('1044', '测试202', '123', '123', '123', '213', '213.00', '2025-04-11', '0', '', '', '');
INSERT INTO `book` VALUES ('1045', '测试123213', '123213', '12321', '12321', '222', '222.00', '2025-04-11', '0', '', '', '');
INSERT INTO `book` VALUES ('1046', '测试411', '34234324', '23423', '23432', '222', '222.00', '2025-04-11', '0', null, null, null);

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `record_id` int(32) NOT NULL AUTO_INCREMENT,
  `record_bookname` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL,
  `record_bookisbn` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL,
  `record_borrower` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL,
  `record_borrowtime` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL,
  `record_remandtime` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('1', '活着', '9787506365437', '李白', '2025-04-10', '2025-04-11');
INSERT INTO `record` VALUES ('2', '平凡的世界', '9787020049295', '张飞', '2025-04-11', '2025-04-11');
INSERT INTO `record` VALUES ('3', '浪潮之巅', '9787121200308', '张飞', '2025-04-11', '2025-04-11');
INSERT INTO `record` VALUES ('4', '深入理解计算机系统', '9787111544937', '李白', '2025-04-10', '2025-04-11');
INSERT INTO `record` VALUES ('5', '测试', '11111', '李白', '2025-04-10', '2025-04-11');
INSERT INTO `record` VALUES ('6', '穷查理宝典', '9787208111282', '李白', '2025-04-11', '2025-04-11');
INSERT INTO `record` VALUES ('7', '经济学原理', '9787301255441', '李白', '2025-04-11', '2025-04-11');
INSERT INTO `record` VALUES ('8', '自卑与超越', '9787111551287', '李白', '2025-04-11', '2025-04-11');
INSERT INTO `record` VALUES ('9', '测试2', '11111111', '李白', '2025-04-11', '2025-04-11');
INSERT INTO `record` VALUES ('10', '23', '123123', '李白', '2025-04-11', '2025-04-11');
INSERT INTO `record` VALUES ('11', '测试202', '123', '李白', '2025-04-11', '2025-04-11');
INSERT INTO `record` VALUES ('12', '', '', '李白', '2025-04-11', '2025-04-11');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(32) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) DEFAULT NULL,
  `user_password` varchar(32) DEFAULT NULL,
  `user_email` varchar(32) DEFAULT NULL,
  `user_role` varchar(32) DEFAULT NULL,
  `user_status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1001', '李白', '123', '123@qq.com', 'admin', '0');
INSERT INTO `user` VALUES ('1002', '张飞', '123', '1233@qq.com', 'normal', '0');
INSERT INTO `user` VALUES ('1003', null, null, null, null, null);
