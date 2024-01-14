/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50637
Source Host           : localhost:3306
Source Database       : courseschedule

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2019-06-02 20:05:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for academy
-- ----------------------------
DROP TABLE IF EXISTS `academy`;
CREATE TABLE `academy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `academy_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of academy
-- ----------------------------
INSERT INTO `academy` VALUES ('4', '体育学院');
INSERT INTO `academy` VALUES ('8', '外国语学院');
INSERT INTO `academy` VALUES ('7', '数理学院');
INSERT INTO `academy` VALUES ('3', '生化学院');
INSERT INTO `academy` VALUES ('6', '纺织服装学院');
INSERT INTO `academy` VALUES ('5', '艺术学院');
INSERT INTO `academy` VALUES ('1', '计算机与信息学院');
INSERT INTO `academy` VALUES ('2', '马克思主义学院');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '100001', 'wang.kang', 'wangkang');
INSERT INTO `admin` VALUES ('2', '3', '3', 'Admin');

-- ----------------------------
-- Table structure for classroom
-- ----------------------------
DROP TABLE IF EXISTS `classroom`;
CREATE TABLE `classroom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classroom` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classroom
-- ----------------------------
INSERT INTO `classroom` VALUES ('1', '2#101', '', '90');
INSERT INTO `classroom` VALUES ('2', '2#102', '', '90');
INSERT INTO `classroom` VALUES ('3', '2#103', '', '90');
INSERT INTO `classroom` VALUES ('4', '2#104', '', '90');
INSERT INTO `classroom` VALUES ('5', '2#105', '', '90');
INSERT INTO `classroom` VALUES ('6', '2#106', '', '90');
INSERT INTO `classroom` VALUES ('7', '2#107', '', '90');
INSERT INTO `classroom` VALUES ('8', '2#108', '', '90');
INSERT INTO `classroom` VALUES ('9', '2#109', '', '90');
INSERT INTO `classroom` VALUES ('10', '2#110', '', '90');
INSERT INTO `classroom` VALUES ('11', '2#111', '', '90');
INSERT INTO `classroom` VALUES ('12', '2#112', '', '90');
INSERT INTO `classroom` VALUES ('13', '2#113', '', '90');
INSERT INTO `classroom` VALUES ('14', '2#201', '', '90');

-- ----------------------------
-- Table structure for clazz
-- ----------------------------
DROP TABLE IF EXISTS `clazz`;
CREATE TABLE `clazz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `level` int(255) DEFAULT NULL,
  `depart` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_foreignkey_depart` (`depart`),
  CONSTRAINT `class_foreignkey_depart` FOREIGN KEY (`depart`) REFERENCES `depart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clazz
-- ----------------------------
INSERT INTO `clazz` VALUES ('1', '软件151', '2015', '1');
INSERT INTO `clazz` VALUES ('2', '软件152', '2015', '1');
INSERT INTO `clazz` VALUES ('5', '计算机151', '2015', '3');
INSERT INTO `clazz` VALUES ('6', '物联网151', '2015', '2');
INSERT INTO `clazz` VALUES ('7', '信管151', '2015', '4');
INSERT INTO `clazz` VALUES ('8', '软件161', '2016', '1');
INSERT INTO `clazz` VALUES ('9', '计算机161', '2016', '3');
INSERT INTO `clazz` VALUES ('10', '物联网161', '2016', '2');
INSERT INTO `clazz` VALUES ('11', '信管161', '2016', '4');
INSERT INTO `clazz` VALUES ('12', '软件171', '2017', '1');
INSERT INTO `clazz` VALUES ('13', '计算机171', '2017', '3');
INSERT INTO `clazz` VALUES ('14', '物联网171', '2017', '2');
INSERT INTO `clazz` VALUES ('15', '信管171', '2017', '4');
INSERT INTO `clazz` VALUES ('16', '软件181', '2018', '1');
INSERT INTO `clazz` VALUES ('17', '计算机181', '2018', '3');
INSERT INTO `clazz` VALUES ('18', '物联网181', '2018', '2');
INSERT INTO `clazz` VALUES ('19', '信管181', '2018', '4');
INSERT INTO `clazz` VALUES ('20', '软件191', '2019', '1');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `credit` int(255) DEFAULT NULL,
  `period` int(255) DEFAULT NULL,
  `academy` int(11) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_name_unique` (`name`),
  KEY `course_foreignkey_academy` (`academy`),
  CONSTRAINT `course_foreignkey_academy` FOREIGN KEY (`academy`) REFERENCES `academy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '高级语言程序设计', '4', '64', '1', '计算机基础课');
INSERT INTO `course` VALUES ('2', '高等数学I', '6', '80', '7', ' ');
INSERT INTO `course` VALUES ('3', '高等数学II', '6', '80', '7', ' ');
INSERT INTO `course` VALUES ('4', '大学英语I', '4', '64', '8', ' ');
INSERT INTO `course` VALUES ('5', '大学英语II', '4', '64', '8', ' ');
INSERT INTO `course` VALUES ('6', '软件工程导论', '1', '48', '1', ' ');
INSERT INTO `course` VALUES ('7', '思想道德与法律修养', '3', '48', '2', ' ');
INSERT INTO `course` VALUES ('8', '军事理论与国防教育', '1', '48', '2', ' ');
INSERT INTO `course` VALUES ('9', '线性代数', '2', '64', '7', ' ');
INSERT INTO `course` VALUES ('10', '离散数学', '2', '64', '7', ' ');
INSERT INTO `course` VALUES ('11', 'Linux操作系统与程序设计', '2', '64', '1', '戴萌萌代言');
INSERT INTO `course` VALUES ('12', 'C#程序设计', '2', '64', '1', '戴萌萌代言');
INSERT INTO `course` VALUES ('13', 'Oracle数据库管理、开发与实践', '4', '64', '1', '');
INSERT INTO `course` VALUES ('14', '大学计算机基础', '2', '64', '1', '');
INSERT INTO `course` VALUES ('15', 'Java程序设计', '4', '64', '1', '');
INSERT INTO `course` VALUES ('16', '汇编语言程序设计', '4', '64', '1', '');
INSERT INTO `course` VALUES ('17', 'Data Structure', '4', '64', '1', '');
INSERT INTO `course` VALUES ('19', '软件需求分析', '4', '64', '1', '');
INSERT INTO `course` VALUES ('20', 'MATLAB语言及应用', '4', '64', '1', '');
INSERT INTO `course` VALUES ('21', '操作系统', '4', '64', '1', '');
INSERT INTO `course` VALUES ('22', '计算机组成原理', '4', '64', '1', '');
INSERT INTO `course` VALUES ('23', '软件测试', '3', '64', '1', '');
INSERT INTO `course` VALUES ('24', '云计算与大数据', '3', '64', '1', '');
INSERT INTO `course` VALUES ('25', '数字图像处理II', '2', '64', '1', '');
INSERT INTO `course` VALUES ('26', '人机交互', '3', '64', '1', '');
INSERT INTO `course` VALUES ('27', '软件项目管理', '3', '64', '1', '');
INSERT INTO `course` VALUES ('28', '概率论与数理统计', '2', '64', '7', '');
INSERT INTO `course` VALUES ('29', '大学体育I', '1', '64', '4', '');
INSERT INTO `course` VALUES ('30', '大学体育II', '1', '64', '4', '');
INSERT INTO `course` VALUES ('31', '大学体育III', '1', '64', '4', '');
INSERT INTO `course` VALUES ('32', '大学体育IV', '1', '64', '4', '');
INSERT INTO `course` VALUES ('33', '大学物理I', '3', '64', '7', '');
INSERT INTO `course` VALUES ('34', '大学物理II', '3', '64', '7', '');
INSERT INTO `course` VALUES ('35', '中国近代史纲要', '2', '80', '2', '');
INSERT INTO `course` VALUES ('36', '大学英语III', '4', '64', '8', '');
INSERT INTO `course` VALUES ('37', '大学英语iV', '4', '64', '8', '');
INSERT INTO `course` VALUES ('38', '物理实验I', '4', '64', '7', '');
INSERT INTO `course` VALUES ('39', '物理实验II', '4', '64', '7', '');
INSERT INTO `course` VALUES ('42', '毛泽东思想和中国特色社会主义理论体系概论', '3', '80', '2', '');
INSERT INTO `course` VALUES ('43', '软件工程专业导论', '1', '48', '1', '');
INSERT INTO `course` VALUES ('44', '计算机网络', '4', '64', '1', '');
INSERT INTO `course` VALUES ('45', '互联网软件开发(JavaEE)', '3', '80', '1', '');
INSERT INTO `course` VALUES ('46', '软件设计与体系结构', '3', '80', '1', '');
INSERT INTO `course` VALUES ('47', '智能终端软件开发', '3', '80', '1', '');
INSERT INTO `course` VALUES ('48', '数据挖掘', '3', '80', '1', '');
INSERT INTO `course` VALUES ('50', '信息安全概论', '3', '64', '1', '');
INSERT INTO `course` VALUES ('51', '计算机科学与技术专业导论', '1', '48', '1', '');
INSERT INTO `course` VALUES ('52', '模拟电子技术II', '4', '64', '1', '');
INSERT INTO `course` VALUES ('53', 'C++程序设计', '4', '64', '1', '');
INSERT INTO `course` VALUES ('54', '数学建模', '2', '64', '1', '');
INSERT INTO `course` VALUES ('59', 'Web程序设计', '2', '64', '1', '');
INSERT INTO `course` VALUES ('60', 'SoftWare Engineering', '2', '64', '1', '');
INSERT INTO `course` VALUES ('61', '编译原理', '2', '64', '1', '');
INSERT INTO `course` VALUES ('62', '微型计算机及接口I', '4', '64', '1', '');
INSERT INTO `course` VALUES ('63', '网络与信息安全', '4', '64', '1', '');
INSERT INTO `course` VALUES ('64', '马克思主义原理', '3', '80', '2', '');
INSERT INTO `course` VALUES ('65', '数字逻辑', '4', '64', '1', '');
INSERT INTO `course` VALUES ('66', '现代通信技术I', '3', '48', '1', '');
INSERT INTO `course` VALUES ('69', '数据库原理及应用I', '4', '64', '1', '');
INSERT INTO `course` VALUES ('70', '传感检测与RFID技术', '4', '64', '1', '');
INSERT INTO `course` VALUES ('71', '无线传感器网络原理与应用', '4', '64', '1', '');
INSERT INTO `course` VALUES ('72', '物联网安全', '2', '32', '1', '');
INSERT INTO `course` VALUES ('73', '物联网应用系统开发', '3', '48', '1', '');
INSERT INTO `course` VALUES ('74', '嵌入式系统及应用I', '4', '64', '1', '');
INSERT INTO `course` VALUES ('75', '微观经济学', '3', '48', '7', '');
INSERT INTO `course` VALUES ('76', '会计学', '3', '48', '7', '');
INSERT INTO `course` VALUES ('77', '运筹学II', '3', '48', '7', '');
INSERT INTO `course` VALUES ('78', '应用统计II', '3', '48', '7', '');
INSERT INTO `course` VALUES ('79', 'MS(管理信息系统)', '4', '64', '1', '');
INSERT INTO `course` VALUES ('80', 'ERP企业应用', '3', '48', '1', '');
INSERT INTO `course` VALUES ('81', '信息系统分析与设计', '3', '48', '1', '');
INSERT INTO `course` VALUES ('82', '信息管理学', '3', '48', '1', '');
INSERT INTO `course` VALUES ('83', '数据分析语言及应用', '4', '64', '1', '');
INSERT INTO `course` VALUES ('84', '系统工程', '3', '48', '1', '');
INSERT INTO `course` VALUES ('85', '数据可视化', '3', '48', '1', '');
INSERT INTO `course` VALUES ('86', '信息管理与信息系统专业前沿', '2', '32', '1', '');

-- ----------------------------
-- Table structure for course_teacher
-- ----------------------------
DROP TABLE IF EXISTS `course_teacher`;
CREATE TABLE `course_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course` int(11) DEFAULT NULL,
  `teacher` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`course`,`teacher`),
  KEY `to_teacher` (`teacher`),
  CONSTRAINT `to_course` FOREIGN KEY (`course`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `to_teacher` FOREIGN KEY (`teacher`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=496 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_teacher
-- ----------------------------
INSERT INTO `course_teacher` VALUES ('494', '1', '1');
INSERT INTO `course_teacher` VALUES ('277', '1', '110');
INSERT INTO `course_teacher` VALUES ('278', '1', '111');
INSERT INTO `course_teacher` VALUES ('495', '1', '120');
INSERT INTO `course_teacher` VALUES ('280', '2', '16');
INSERT INTO `course_teacher` VALUES ('279', '2', '40');
INSERT INTO `course_teacher` VALUES ('281', '2', '48');
INSERT INTO `course_teacher` VALUES ('284', '3', '32');
INSERT INTO `course_teacher` VALUES ('283', '3', '40');
INSERT INTO `course_teacher` VALUES ('282', '3', '56');
INSERT INTO `course_teacher` VALUES ('287', '4', '9');
INSERT INTO `course_teacher` VALUES ('285', '4', '33');
INSERT INTO `course_teacher` VALUES ('286', '4', '57');
INSERT INTO `course_teacher` VALUES ('289', '5', '25');
INSERT INTO `course_teacher` VALUES ('290', '5', '89');
INSERT INTO `course_teacher` VALUES ('288', '5', '97');
INSERT INTO `course_teacher` VALUES ('292', '6', '107');
INSERT INTO `course_teacher` VALUES ('291', '6', '110');
INSERT INTO `course_teacher` VALUES ('294', '7', '19');
INSERT INTO `course_teacher` VALUES ('293', '7', '75');
INSERT INTO `course_teacher` VALUES ('295', '8', '3');
INSERT INTO `course_teacher` VALUES ('296', '8', '11');
INSERT INTO `course_teacher` VALUES ('297', '8', '91');
INSERT INTO `course_teacher` VALUES ('298', '9', '32');
INSERT INTO `course_teacher` VALUES ('299', '9', '48');
INSERT INTO `course_teacher` VALUES ('300', '9', '96');
INSERT INTO `course_teacher` VALUES ('303', '10', '24');
INSERT INTO `course_teacher` VALUES ('301', '10', '64');
INSERT INTO `course_teacher` VALUES ('302', '10', '88');
INSERT INTO `course_teacher` VALUES ('304', '11', '34');
INSERT INTO `course_teacher` VALUES ('306', '11', '111');
INSERT INTO `course_teacher` VALUES ('305', '11', '117');
INSERT INTO `course_teacher` VALUES ('307', '12', '111');
INSERT INTO `course_teacher` VALUES ('308', '12', '112');
INSERT INTO `course_teacher` VALUES ('310', '13', '34');
INSERT INTO `course_teacher` VALUES ('309', '13', '98');
INSERT INTO `course_teacher` VALUES ('311', '13', '110');
INSERT INTO `course_teacher` VALUES ('312', '14', '103');
INSERT INTO `course_teacher` VALUES ('313', '14', '104');
INSERT INTO `course_teacher` VALUES ('314', '14', '114');
INSERT INTO `course_teacher` VALUES ('316', '15', '2');
INSERT INTO `course_teacher` VALUES ('315', '15', '26');
INSERT INTO `course_teacher` VALUES ('317', '15', '98');
INSERT INTO `course_teacher` VALUES ('318', '16', '50');
INSERT INTO `course_teacher` VALUES ('320', '16', '103');
INSERT INTO `course_teacher` VALUES ('319', '16', '114');
INSERT INTO `course_teacher` VALUES ('323', '17', '98');
INSERT INTO `course_teacher` VALUES ('321', '17', '103');
INSERT INTO `course_teacher` VALUES ('322', '17', '114');
INSERT INTO `course_teacher` VALUES ('325', '19', '74');
INSERT INTO `course_teacher` VALUES ('326', '19', '82');
INSERT INTO `course_teacher` VALUES ('324', '19', '105');
INSERT INTO `course_teacher` VALUES ('328', '20', '26');
INSERT INTO `course_teacher` VALUES ('327', '20', '90');
INSERT INTO `course_teacher` VALUES ('329', '20', '116');
INSERT INTO `course_teacher` VALUES ('331', '21', '1');
INSERT INTO `course_teacher` VALUES ('332', '21', '42');
INSERT INTO `course_teacher` VALUES ('330', '21', '105');
INSERT INTO `course_teacher` VALUES ('335', '22', '74');
INSERT INTO `course_teacher` VALUES ('333', '22', '98');
INSERT INTO `course_teacher` VALUES ('334', '22', '103');
INSERT INTO `course_teacher` VALUES ('336', '23', '26');
INSERT INTO `course_teacher` VALUES ('338', '23', '74');
INSERT INTO `course_teacher` VALUES ('337', '23', '90');
INSERT INTO `course_teacher` VALUES ('340', '24', '34');
INSERT INTO `course_teacher` VALUES ('339', '24', '42');
INSERT INTO `course_teacher` VALUES ('341', '24', '98');
INSERT INTO `course_teacher` VALUES ('342', '25', '58');
INSERT INTO `course_teacher` VALUES ('344', '25', '108');
INSERT INTO `course_teacher` VALUES ('343', '25', '111');
INSERT INTO `course_teacher` VALUES ('345', '26', '1');
INSERT INTO `course_teacher` VALUES ('346', '26', '34');
INSERT INTO `course_teacher` VALUES ('347', '26', '74');
INSERT INTO `course_teacher` VALUES ('350', '27', '106');
INSERT INTO `course_teacher` VALUES ('348', '27', '109');
INSERT INTO `course_teacher` VALUES ('349', '27', '115');
INSERT INTO `course_teacher` VALUES ('351', '28', '24');
INSERT INTO `course_teacher` VALUES ('352', '28', '56');
INSERT INTO `course_teacher` VALUES ('353', '28', '64');
INSERT INTO `course_teacher` VALUES ('356', '29', '29');
INSERT INTO `course_teacher` VALUES ('354', '29', '45');
INSERT INTO `course_teacher` VALUES ('355', '29', '77');
INSERT INTO `course_teacher` VALUES ('358', '30', '29');
INSERT INTO `course_teacher` VALUES ('357', '30', '85');
INSERT INTO `course_teacher` VALUES ('361', '31', '37');
INSERT INTO `course_teacher` VALUES ('359', '31', '61');
INSERT INTO `course_teacher` VALUES ('360', '31', '69');
INSERT INTO `course_teacher` VALUES ('362', '32', '5');
INSERT INTO `course_teacher` VALUES ('363', '32', '53');
INSERT INTO `course_teacher` VALUES ('364', '32', '77');
INSERT INTO `course_teacher` VALUES ('366', '33', '24');
INSERT INTO `course_teacher` VALUES ('365', '33', '48');
INSERT INTO `course_teacher` VALUES ('367', '34', '48');
INSERT INTO `course_teacher` VALUES ('368', '34', '56');
INSERT INTO `course_teacher` VALUES ('369', '34', '80');
INSERT INTO `course_teacher` VALUES ('372', '35', '59');
INSERT INTO `course_teacher` VALUES ('371', '35', '83');
INSERT INTO `course_teacher` VALUES ('370', '35', '91');
INSERT INTO `course_teacher` VALUES ('374', '36', '41');
INSERT INTO `course_teacher` VALUES ('373', '36', '49');
INSERT INTO `course_teacher` VALUES ('376', '37', '57');
INSERT INTO `course_teacher` VALUES ('375', '37', '73');
INSERT INTO `course_teacher` VALUES ('377', '37', '89');
INSERT INTO `course_teacher` VALUES ('380', '38', '40');
INSERT INTO `course_teacher` VALUES ('379', '38', '64');
INSERT INTO `course_teacher` VALUES ('378', '38', '88');
INSERT INTO `course_teacher` VALUES ('382', '39', '64');
INSERT INTO `course_teacher` VALUES ('383', '39', '80');
INSERT INTO `course_teacher` VALUES ('381', '39', '88');
INSERT INTO `course_teacher` VALUES ('384', '42', '3');
INSERT INTO `course_teacher` VALUES ('493', '42', '59');
INSERT INTO `course_teacher` VALUES ('492', '42', '99');
INSERT INTO `course_teacher` VALUES ('385', '43', '18');
INSERT INTO `course_teacher` VALUES ('386', '43', '112');
INSERT INTO `course_teacher` VALUES ('387', '43', '115');
INSERT INTO `course_teacher` VALUES ('389', '44', '50');
INSERT INTO `course_teacher` VALUES ('388', '44', '90');
INSERT INTO `course_teacher` VALUES ('390', '44', '109');
INSERT INTO `course_teacher` VALUES ('391', '45', '26');
INSERT INTO `course_teacher` VALUES ('392', '45', '110');
INSERT INTO `course_teacher` VALUES ('393', '45', '117');
INSERT INTO `course_teacher` VALUES ('396', '46', '34');
INSERT INTO `course_teacher` VALUES ('394', '46', '90');
INSERT INTO `course_teacher` VALUES ('395', '46', '108');
INSERT INTO `course_teacher` VALUES ('398', '47', '50');
INSERT INTO `course_teacher` VALUES ('397', '47', '107');
INSERT INTO `course_teacher` VALUES ('399', '47', '113');
INSERT INTO `course_teacher` VALUES ('400', '48', '18');
INSERT INTO `course_teacher` VALUES ('401', '48', '74');
INSERT INTO `course_teacher` VALUES ('402', '48', '109');
INSERT INTO `course_teacher` VALUES ('404', '50', '50');
INSERT INTO `course_teacher` VALUES ('403', '50', '109');
INSERT INTO `course_teacher` VALUES ('407', '51', '1');
INSERT INTO `course_teacher` VALUES ('405', '51', '113');
INSERT INTO `course_teacher` VALUES ('406', '51', '116');
INSERT INTO `course_teacher` VALUES ('408', '52', '1');
INSERT INTO `course_teacher` VALUES ('409', '52', '50');
INSERT INTO `course_teacher` VALUES ('410', '52', '103');
INSERT INTO `course_teacher` VALUES ('412', '53', '2');
INSERT INTO `course_teacher` VALUES ('413', '53', '90');
INSERT INTO `course_teacher` VALUES ('411', '53', '116');
INSERT INTO `course_teacher` VALUES ('415', '54', '104');
INSERT INTO `course_teacher` VALUES ('414', '54', '112');
INSERT INTO `course_teacher` VALUES ('416', '54', '114');
INSERT INTO `course_teacher` VALUES ('419', '59', '10');
INSERT INTO `course_teacher` VALUES ('417', '59', '113');
INSERT INTO `course_teacher` VALUES ('418', '59', '114');
INSERT INTO `course_teacher` VALUES ('421', '60', '109');
INSERT INTO `course_teacher` VALUES ('420', '60', '112');
INSERT INTO `course_teacher` VALUES ('422', '60', '117');
INSERT INTO `course_teacher` VALUES ('423', '61', '109');
INSERT INTO `course_teacher` VALUES ('424', '61', '114');
INSERT INTO `course_teacher` VALUES ('425', '61', '117');
INSERT INTO `course_teacher` VALUES ('427', '62', '2');
INSERT INTO `course_teacher` VALUES ('426', '62', '26');
INSERT INTO `course_teacher` VALUES ('428', '62', '108');
INSERT INTO `course_teacher` VALUES ('430', '63', '90');
INSERT INTO `course_teacher` VALUES ('431', '63', '113');
INSERT INTO `course_teacher` VALUES ('429', '63', '117');
INSERT INTO `course_teacher` VALUES ('432', '64', '11');
INSERT INTO `course_teacher` VALUES ('433', '64', '27');
INSERT INTO `course_teacher` VALUES ('434', '64', '91');
INSERT INTO `course_teacher` VALUES ('436', '65', '42');
INSERT INTO `course_teacher` VALUES ('435', '65', '108');
INSERT INTO `course_teacher` VALUES ('437', '65', '113');
INSERT INTO `course_teacher` VALUES ('438', '66', '1');
INSERT INTO `course_teacher` VALUES ('440', '66', '106');
INSERT INTO `course_teacher` VALUES ('439', '66', '112');
INSERT INTO `course_teacher` VALUES ('442', '69', '1');
INSERT INTO `course_teacher` VALUES ('441', '69', '109');
INSERT INTO `course_teacher` VALUES ('443', '69', '111');
INSERT INTO `course_teacher` VALUES ('445', '70', '26');
INSERT INTO `course_teacher` VALUES ('444', '70', '82');
INSERT INTO `course_teacher` VALUES ('446', '70', '110');
INSERT INTO `course_teacher` VALUES ('448', '71', '10');
INSERT INTO `course_teacher` VALUES ('447', '71', '74');
INSERT INTO `course_teacher` VALUES ('449', '72', '106');
INSERT INTO `course_teacher` VALUES ('451', '72', '110');
INSERT INTO `course_teacher` VALUES ('450', '72', '112');
INSERT INTO `course_teacher` VALUES ('453', '73', '74');
INSERT INTO `course_teacher` VALUES ('454', '73', '98');
INSERT INTO `course_teacher` VALUES ('452', '73', '109');
INSERT INTO `course_teacher` VALUES ('455', '74', '104');
INSERT INTO `course_teacher` VALUES ('457', '74', '105');
INSERT INTO `course_teacher` VALUES ('456', '74', '115');
INSERT INTO `course_teacher` VALUES ('459', '75', '32');
INSERT INTO `course_teacher` VALUES ('460', '75', '40');
INSERT INTO `course_teacher` VALUES ('458', '75', '80');
INSERT INTO `course_teacher` VALUES ('461', '76', '48');
INSERT INTO `course_teacher` VALUES ('462', '76', '56');
INSERT INTO `course_teacher` VALUES ('464', '77', '32');
INSERT INTO `course_teacher` VALUES ('463', '77', '80');
INSERT INTO `course_teacher` VALUES ('465', '78', '40');
INSERT INTO `course_teacher` VALUES ('467', '78', '56');
INSERT INTO `course_teacher` VALUES ('466', '78', '80');
INSERT INTO `course_teacher` VALUES ('468', '79', '66');
INSERT INTO `course_teacher` VALUES ('469', '79', '111');
INSERT INTO `course_teacher` VALUES ('470', '79', '113');
INSERT INTO `course_teacher` VALUES ('472', '80', '50');
INSERT INTO `course_teacher` VALUES ('471', '80', '90');
INSERT INTO `course_teacher` VALUES ('473', '80', '98');
INSERT INTO `course_teacher` VALUES ('476', '81', '10');
INSERT INTO `course_teacher` VALUES ('475', '81', '58');
INSERT INTO `course_teacher` VALUES ('474', '81', '107');
INSERT INTO `course_teacher` VALUES ('477', '82', '10');
INSERT INTO `course_teacher` VALUES ('478', '82', '105');
INSERT INTO `course_teacher` VALUES ('479', '82', '115');
INSERT INTO `course_teacher` VALUES ('482', '83', '34');
INSERT INTO `course_teacher` VALUES ('481', '83', '74');
INSERT INTO `course_teacher` VALUES ('480', '83', '115');
INSERT INTO `course_teacher` VALUES ('483', '84', '26');
INSERT INTO `course_teacher` VALUES ('484', '84', '106');
INSERT INTO `course_teacher` VALUES ('485', '84', '109');
INSERT INTO `course_teacher` VALUES ('487', '85', '34');
INSERT INTO `course_teacher` VALUES ('486', '85', '58');
INSERT INTO `course_teacher` VALUES ('488', '85', '111');
INSERT INTO `course_teacher` VALUES ('489', '86', '2');
INSERT INTO `course_teacher` VALUES ('490', '86', '98');
INSERT INTO `course_teacher` VALUES ('491', '86', '103');

-- ----------------------------
-- Table structure for current_year_term
-- ----------------------------
DROP TABLE IF EXISTS `current_year_term`;
CREATE TABLE `current_year_term` (
  `id` int(11) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `begintime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of current_year_term
-- ----------------------------
INSERT INTO `current_year_term` VALUES ('1', '2018', '1', '2019-05-03 15:22:12', '2019-06-30 15:23:20');

-- ----------------------------
-- Table structure for depart
-- ----------------------------
DROP TABLE IF EXISTS `depart`;
CREATE TABLE `depart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `academy` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department_foreignkey_academy` (`academy`),
  CONSTRAINT `department_foreignkey_academy` FOREIGN KEY (`academy`) REFERENCES `academy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of depart
-- ----------------------------
INSERT INTO `depart` VALUES ('1', '软件工程', '1');
INSERT INTO `depart` VALUES ('2', '物联网', '1');
INSERT INTO `depart` VALUES ('3', '计算机', '1');
INSERT INTO `depart` VALUES ('4', '信息管理与信息系统', '1');
INSERT INTO `depart` VALUES ('5', '大数据', '1');

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `depart` int(255) DEFAULT NULL,
  `course` int(255) DEFAULT NULL,
  `level` int(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plan_foreignkey_course` (`course`),
  KEY `plan_foreignkey_depart` (`depart`),
  CONSTRAINT `plan_foreignkey_course` FOREIGN KEY (`course`) REFERENCES `course` (`id`),
  CONSTRAINT `plan_foreignkey_depart` FOREIGN KEY (`depart`) REFERENCES `depart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1458 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES ('26', '1', '14', '2015', '公共课', '1');
INSERT INTO `plan` VALUES ('27', '1', '4', '2015', '公共课', '1');
INSERT INTO `plan` VALUES ('28', '1', '2', '2015', '公共课', '1');
INSERT INTO `plan` VALUES ('29', '1', '43', '2015', '公共', '1');
INSERT INTO `plan` VALUES ('30', '1', '7', '2015', '公共', '1');
INSERT INTO `plan` VALUES ('31', '1', '5', '2015', '公共', '2');
INSERT INTO `plan` VALUES ('32', '1', '33', '2015', '公共', '2');
INSERT INTO `plan` VALUES ('33', '1', '3', '2015', '公共', '2');
INSERT INTO `plan` VALUES ('34', '1', '38', '2015', '公共', '2');
INSERT INTO `plan` VALUES ('35', '1', '35', '2015', '公共', '2');
INSERT INTO `plan` VALUES ('36', '1', '1', '2015', '公共', '2');
INSERT INTO `plan` VALUES ('37', '1', '36', '2015', '公共', '3');
INSERT INTO `plan` VALUES ('38', '1', '34', '2015', '公共', '3');
INSERT INTO `plan` VALUES ('39', '1', '39', '2015', '公共', '3');
INSERT INTO `plan` VALUES ('40', '1', '15', '2015', '公共', '3');
INSERT INTO `plan` VALUES ('41', '1', '9', '2015', '公共', '3');
INSERT INTO `plan` VALUES ('42', '1', '6', '2015', '公共', '3');
INSERT INTO `plan` VALUES ('43', '1', '37', '2015', '公共', '4');
INSERT INTO `plan` VALUES ('44', '1', '42', '2015', '公共', '4');
INSERT INTO `plan` VALUES ('45', '1', '17', '2015', '公共', '4');
INSERT INTO `plan` VALUES ('46', '1', '10', '2015', '公共', '4');
INSERT INTO `plan` VALUES ('47', '1', '12', '2015', '公共', '4');
INSERT INTO `plan` VALUES ('48', '1', '19', '2015', '公共', '4');
INSERT INTO `plan` VALUES ('49', '1', '11', '2015', '公共', '5');
INSERT INTO `plan` VALUES ('50', '1', '20', '2015', '', '5');
INSERT INTO `plan` VALUES ('51', '1', '21', '2015', '', '5');
INSERT INTO `plan` VALUES ('52', '1', '22', '2015', '', '5');
INSERT INTO `plan` VALUES ('53', '1', '23', '2015', '专业', '5');
INSERT INTO `plan` VALUES ('58', '1', '22', '2015', '', '6');
INSERT INTO `plan` VALUES ('59', '1', '25', '2015', '', '6');
INSERT INTO `plan` VALUES ('60', '1', '13', '2015', '', '6');
INSERT INTO `plan` VALUES ('61', '1', '45', '2015', '', '6');
INSERT INTO `plan` VALUES ('62', '1', '26', '2015', '', '6');
INSERT INTO `plan` VALUES ('63', '1', '27', '2015', '', '6');
INSERT INTO `plan` VALUES ('64', '1', '46', '2015', '', '7');
INSERT INTO `plan` VALUES ('65', '1', '47', '2015', '', '7');
INSERT INTO `plan` VALUES ('66', '1', '48', '2015', '', '7');
INSERT INTO `plan` VALUES ('67', '1', '24', '2015', '', '7');
INSERT INTO `plan` VALUES ('68', '1', '50', '2015', '', '7');
INSERT INTO `plan` VALUES ('303', '4', '14', '2015', '', '1');
INSERT INTO `plan` VALUES ('304', '3', '14', '2015', '通识必修课', '1');
INSERT INTO `plan` VALUES ('305', '3', '51', '2015', '通识必修课', '1');
INSERT INTO `plan` VALUES ('306', '3', '2', '2015', '通识必修课', '1');
INSERT INTO `plan` VALUES ('307', '3', '4', '2015', '通识必修课', '1');
INSERT INTO `plan` VALUES ('308', '3', '8', '2015', '通识必修课', '1');
INSERT INTO `plan` VALUES ('309', '3', '7', '2015', '通识必修课', '1');
INSERT INTO `plan` VALUES ('312', '3', '1', '2015', '学科基础课', '2');
INSERT INTO `plan` VALUES ('313', '3', '3', '2015', '通识选修课', '2');
INSERT INTO `plan` VALUES ('314', '3', '33', '2015', '通识选修课', '2');
INSERT INTO `plan` VALUES ('315', '3', '38', '2015', '通识选修课', '2');
INSERT INTO `plan` VALUES ('316', '3', '9', '2015', '通识选修课', '2');
INSERT INTO `plan` VALUES ('317', '3', '5', '2015', '通识选修课', '2');
INSERT INTO `plan` VALUES ('318', '3', '35', '2015', '通识选修课', '2');
INSERT INTO `plan` VALUES ('319', '3', '52', '2015', '学科基础课', '3');
INSERT INTO `plan` VALUES ('320', '3', '53', '2015', '学科基础课', '3');
INSERT INTO `plan` VALUES ('322', '3', '28', '2015', '通识必修课', '3');
INSERT INTO `plan` VALUES ('323', '3', '10', '2015', '通识必修课', '3');
INSERT INTO `plan` VALUES ('324', '3', '54', '2015', '通识必修课', '3');
INSERT INTO `plan` VALUES ('325', '3', '36', '2015', '通识必修课', '3');
INSERT INTO `plan` VALUES ('326', '1', '64', '2015', '通识必修课', '3');
INSERT INTO `plan` VALUES ('327', '3', '64', '2015', '通识必修课', '3');
INSERT INTO `plan` VALUES ('328', '3', '16', '2015', '学科基础课', '4');
INSERT INTO `plan` VALUES ('329', '3', '17', '2015', '学科基础课', '4');
INSERT INTO `plan` VALUES ('330', '3', '42', '2015', '通识必修课', '4');
INSERT INTO `plan` VALUES ('332', '3', '65', '2015', '学科基础课', '4');
INSERT INTO `plan` VALUES ('333', '3', '22', '2015', '学科基础课', '5');
INSERT INTO `plan` VALUES ('334', '3', '21', '2015', '学科基础课', '5');
INSERT INTO `plan` VALUES ('335', '3', '44', '2015', '学科基础课', '5');
INSERT INTO `plan` VALUES ('336', '3', '15', '2015', '学科基础课', '5');
INSERT INTO `plan` VALUES ('337', '3', '59', '2015', '学科基础课', '5');
INSERT INTO `plan` VALUES ('338', '3', '60', '2015', '学科基础课', '6');
INSERT INTO `plan` VALUES ('339', '3', '63', '2015', '专业方向课', '6');
INSERT INTO `plan` VALUES ('340', '3', '62', '2015', '专业方向课', '6');
INSERT INTO `plan` VALUES ('341', '3', '61', '2015', '专业方向课', '6');
INSERT INTO `plan` VALUES ('566', '2', '14', '2015', '通识必修课', '1');
INSERT INTO `plan` VALUES ('567', '2', '2', '2015', '通识必修课', '1');
INSERT INTO `plan` VALUES ('568', '2', '4', '2015', '通识必修课', '1');
INSERT INTO `plan` VALUES ('569', '2', '7', '2015', '通识必修课', '1');
INSERT INTO `plan` VALUES ('570', '2', '1', '2015', '通识必修课', '2');
INSERT INTO `plan` VALUES ('571', '2', '3', '2015', '通识必修课', '2');
INSERT INTO `plan` VALUES ('572', '2', '33', '2015', '通识必修课', '2');
INSERT INTO `plan` VALUES ('573', '2', '38', '2015', '通识必修课', '2');
INSERT INTO `plan` VALUES ('574', '2', '9', '2015', '通识必修课', '2');
INSERT INTO `plan` VALUES ('575', '2', '5', '2015', '通识必修课', '2');
INSERT INTO `plan` VALUES ('576', '2', '64', '2015', '通识必修课', '2');
INSERT INTO `plan` VALUES ('577', '2', '52', '2015', '通识必修课', '3');
INSERT INTO `plan` VALUES ('578', '2', '15', '2015', '通识必修课', '3');
INSERT INTO `plan` VALUES ('579', '2', '34', '2015', '通识必修课', '3');
INSERT INTO `plan` VALUES ('581', '2', '28', '2015', '学科基础课', '3');
INSERT INTO `plan` VALUES ('582', '2', '10', '2015', '学科基础课', '3');
INSERT INTO `plan` VALUES ('583', '2', '36', '2015', '通识必修课', '3');
INSERT INTO `plan` VALUES ('585', '2', '35', '2015', '通识必修课', '3');
INSERT INTO `plan` VALUES ('586', '2', '65', '2015', '学科基础课', '4');
INSERT INTO `plan` VALUES ('587', '2', '17', '2015', '学科基础课', '4');
INSERT INTO `plan` VALUES ('588', '2', '16', '2015', '学科基础课', '4');
INSERT INTO `plan` VALUES ('589', '2', '37', '2015', '通识必修课', '4');
INSERT INTO `plan` VALUES ('590', '2', '42', '2015', '通识必修课', '4');
INSERT INTO `plan` VALUES ('591', '2', '66', '2015', '专业核心课', '4');
INSERT INTO `plan` VALUES ('592', '2', '22', '2015', '学科基础课', '5');
INSERT INTO `plan` VALUES ('593', '2', '21', '2015', '学科基础课', '5');
INSERT INTO `plan` VALUES ('594', '2', '69', '2015', '学科基础课', '5');
INSERT INTO `plan` VALUES ('595', '2', '44', '2015', '专业核心课', '5');
INSERT INTO `plan` VALUES ('596', '2', '70', '2015', '专业核心课', '5');
INSERT INTO `plan` VALUES ('597', '2', '42', '2015', '通识必修课', '5');
INSERT INTO `plan` VALUES ('598', '2', '6', '2015', '专业方向课', '6');
INSERT INTO `plan` VALUES ('599', '2', '59', '2015', '专业方向课', '6');
INSERT INTO `plan` VALUES ('600', '2', '71', '2015', '专业核心课', '6');
INSERT INTO `plan` VALUES ('601', '2', '24', '2015', '专业方向课', '6');
INSERT INTO `plan` VALUES ('602', '2', '62', '2015', '专业核心课', '6');
INSERT INTO `plan` VALUES ('603', '2', '47', '2015', '专业方向课', '7');
INSERT INTO `plan` VALUES ('604', '2', '72', '2015', '专业方向课', '7');
INSERT INTO `plan` VALUES ('605', '2', '73', '2015', '专业方向课', '7');
INSERT INTO `plan` VALUES ('606', '2', '74', '2015', '专业核心课', '7');
INSERT INTO `plan` VALUES ('607', '2', '48', '2015', '学科基础课', '7');
INSERT INTO `plan` VALUES ('608', '4', '2', '2015', '通识必修课', '1');
INSERT INTO `plan` VALUES ('609', '4', '4', '2015', '通识必修课', '1');
INSERT INTO `plan` VALUES ('611', '4', '8', '2015', '通识必修课', '1');
INSERT INTO `plan` VALUES ('612', '4', '7', '2015', '通识必修课', '1');
INSERT INTO `plan` VALUES ('613', '4', '1', '2015', '专业基础课', '2');
INSERT INTO `plan` VALUES ('614', '4', '3', '2015', '通识必修课', '2');
INSERT INTO `plan` VALUES ('615', '4', '33', '2015', '通识必修课', '2');
INSERT INTO `plan` VALUES ('616', '4', '38', '2015', '通识必修课', '2');
INSERT INTO `plan` VALUES ('617', '4', '9', '2015', '学科基础课', '2');
INSERT INTO `plan` VALUES ('618', '4', '5', '2015', '学科基础课', '2');
INSERT INTO `plan` VALUES ('620', '4', '64', '2015', '通识必修课', '2');
INSERT INTO `plan` VALUES ('621', '4', '75', '2015', '学科基础课', '3');
INSERT INTO `plan` VALUES ('622', '4', '15', '2015', '学科基础课', '3');
INSERT INTO `plan` VALUES ('623', '4', '34', '2015', '通识必修课', '3');
INSERT INTO `plan` VALUES ('625', '4', '36', '2015', '通识必修课', '3');
INSERT INTO `plan` VALUES ('626', '4', '28', '2015', '学科基础课', '3');
INSERT INTO `plan` VALUES ('628', '4', '35', '2015', '通识必修课', '3');
INSERT INTO `plan` VALUES ('629', '4', '76', '2015', '学科基础课', '4');
INSERT INTO `plan` VALUES ('630', '4', '17', '2015', '学科基础课', '4');
INSERT INTO `plan` VALUES ('631', '4', '77', '2015', '专业核心课', '4');
INSERT INTO `plan` VALUES ('632', '4', '78', '2015', '学科基础课', '4');
INSERT INTO `plan` VALUES ('633', '4', '37', '2015', '通识选修课', '4');
INSERT INTO `plan` VALUES ('635', '4', '21', '2015', '学科基础课', '5');
INSERT INTO `plan` VALUES ('636', '4', '69', '2015', '学科基础课', '5');
INSERT INTO `plan` VALUES ('637', '4', '79', '2015', '专业核心课', '5');
INSERT INTO `plan` VALUES ('638', '4', '80', '2015', '学科基础课', '5');
INSERT INTO `plan` VALUES ('639', '4', '59', '2015', '学科基础课', '5');
INSERT INTO `plan` VALUES ('640', '4', '42', '2015', '学科基础课', '5');
INSERT INTO `plan` VALUES ('641', '4', '44', '2015', '专业核心课', '6');
INSERT INTO `plan` VALUES ('642', '4', '81', '2015', '专业核心课', '6');
INSERT INTO `plan` VALUES ('643', '4', '82', '2015', '学科基础课', '6');
INSERT INTO `plan` VALUES ('644', '4', '83', '2015', '学科基础课', '6');
INSERT INTO `plan` VALUES ('645', '4', '13', '2015', '学科基础课', '6');
INSERT INTO `plan` VALUES ('646', '4', '48', '2015', '专业方向课', '6');
INSERT INTO `plan` VALUES ('647', '4', '84', '2015', '学科基础课', '7');
INSERT INTO `plan` VALUES ('648', '4', '24', '2015', '专业方向课', '7');
INSERT INTO `plan` VALUES ('649', '4', '85', '2015', '专业方向课', '7');
INSERT INTO `plan` VALUES ('650', '4', '86', '2015', '通识选修课', '7');
INSERT INTO `plan` VALUES ('981', '1', '14', '2016', '公共课', '1');
INSERT INTO `plan` VALUES ('982', '1', '4', '2016', '公共课', '1');
INSERT INTO `plan` VALUES ('983', '1', '2', '2016', '公共课', '1');
INSERT INTO `plan` VALUES ('984', '1', '43', '2016', '公共', '1');
INSERT INTO `plan` VALUES ('985', '1', '7', '2016', '公共', '1');
INSERT INTO `plan` VALUES ('986', '1', '5', '2016', '公共', '2');
INSERT INTO `plan` VALUES ('987', '1', '33', '2016', '公共', '2');
INSERT INTO `plan` VALUES ('988', '1', '3', '2016', '公共', '2');
INSERT INTO `plan` VALUES ('989', '1', '38', '2016', '公共', '2');
INSERT INTO `plan` VALUES ('990', '1', '35', '2016', '公共', '2');
INSERT INTO `plan` VALUES ('991', '1', '1', '2016', '公共', '2');
INSERT INTO `plan` VALUES ('992', '1', '36', '2016', '公共', '3');
INSERT INTO `plan` VALUES ('993', '1', '34', '2016', '公共', '3');
INSERT INTO `plan` VALUES ('994', '1', '39', '2016', '公共', '3');
INSERT INTO `plan` VALUES ('995', '1', '15', '2016', '公共', '3');
INSERT INTO `plan` VALUES ('996', '1', '9', '2016', '公共', '3');
INSERT INTO `plan` VALUES ('997', '1', '6', '2016', '公共', '3');
INSERT INTO `plan` VALUES ('998', '1', '64', '2016', '通识必修课', '3');
INSERT INTO `plan` VALUES ('999', '1', '37', '2016', '公共', '4');
INSERT INTO `plan` VALUES ('1000', '1', '42', '2016', '公共', '4');
INSERT INTO `plan` VALUES ('1001', '1', '17', '2016', '公共', '4');
INSERT INTO `plan` VALUES ('1002', '1', '10', '2016', '公共', '4');
INSERT INTO `plan` VALUES ('1003', '1', '12', '2016', '公共', '4');
INSERT INTO `plan` VALUES ('1004', '1', '19', '2016', '公共', '4');
INSERT INTO `plan` VALUES ('1005', '1', '11', '2016', '公共', '5');
INSERT INTO `plan` VALUES ('1006', '1', '20', '2016', '', '5');
INSERT INTO `plan` VALUES ('1007', '1', '21', '2016', '', '5');
INSERT INTO `plan` VALUES ('1008', '1', '22', '2016', '', '5');
INSERT INTO `plan` VALUES ('1009', '1', '23', '2016', '专业', '5');
INSERT INTO `plan` VALUES ('1010', '1', '22', '2016', '', '6');
INSERT INTO `plan` VALUES ('1011', '1', '25', '2016', '', '6');
INSERT INTO `plan` VALUES ('1012', '1', '13', '2016', '', '6');
INSERT INTO `plan` VALUES ('1013', '1', '45', '2016', '', '6');
INSERT INTO `plan` VALUES ('1014', '1', '26', '2016', '', '6');
INSERT INTO `plan` VALUES ('1015', '1', '27', '2016', '', '6');
INSERT INTO `plan` VALUES ('1016', '1', '46', '2016', '', '7');
INSERT INTO `plan` VALUES ('1017', '1', '47', '2016', '', '7');
INSERT INTO `plan` VALUES ('1018', '1', '48', '2016', '', '7');
INSERT INTO `plan` VALUES ('1019', '1', '24', '2016', '', '7');
INSERT INTO `plan` VALUES ('1020', '1', '50', '2016', '', '7');
INSERT INTO `plan` VALUES ('1021', '1', '14', '2017', '公共课', '1');
INSERT INTO `plan` VALUES ('1022', '1', '4', '2017', '公共课', '1');
INSERT INTO `plan` VALUES ('1023', '1', '2', '2017', '公共课', '1');
INSERT INTO `plan` VALUES ('1024', '1', '43', '2017', '公共', '1');
INSERT INTO `plan` VALUES ('1025', '1', '7', '2017', '公共', '1');
INSERT INTO `plan` VALUES ('1026', '1', '5', '2017', '公共', '2');
INSERT INTO `plan` VALUES ('1027', '1', '33', '2017', '公共', '2');
INSERT INTO `plan` VALUES ('1028', '1', '3', '2017', '公共', '2');
INSERT INTO `plan` VALUES ('1029', '1', '38', '2017', '公共', '2');
INSERT INTO `plan` VALUES ('1030', '1', '35', '2017', '公共', '2');
INSERT INTO `plan` VALUES ('1031', '1', '1', '2017', '公共', '2');
INSERT INTO `plan` VALUES ('1032', '1', '36', '2017', '公共', '3');
INSERT INTO `plan` VALUES ('1033', '1', '34', '2017', '公共', '3');
INSERT INTO `plan` VALUES ('1034', '1', '39', '2017', '公共', '3');
INSERT INTO `plan` VALUES ('1035', '1', '15', '2017', '公共', '3');
INSERT INTO `plan` VALUES ('1036', '1', '9', '2017', '公共', '3');
INSERT INTO `plan` VALUES ('1037', '1', '6', '2017', '公共', '3');
INSERT INTO `plan` VALUES ('1038', '1', '64', '2017', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1039', '1', '37', '2017', '公共', '4');
INSERT INTO `plan` VALUES ('1040', '1', '42', '2017', '公共', '4');
INSERT INTO `plan` VALUES ('1041', '1', '17', '2017', '公共', '4');
INSERT INTO `plan` VALUES ('1042', '1', '10', '2017', '公共', '4');
INSERT INTO `plan` VALUES ('1043', '1', '12', '2017', '公共', '4');
INSERT INTO `plan` VALUES ('1044', '1', '19', '2017', '公共', '4');
INSERT INTO `plan` VALUES ('1045', '1', '11', '2017', '公共', '5');
INSERT INTO `plan` VALUES ('1046', '1', '20', '2017', '', '5');
INSERT INTO `plan` VALUES ('1047', '1', '21', '2017', '', '5');
INSERT INTO `plan` VALUES ('1048', '1', '22', '2017', '', '5');
INSERT INTO `plan` VALUES ('1049', '1', '23', '2017', '专业', '5');
INSERT INTO `plan` VALUES ('1050', '1', '22', '2017', '', '6');
INSERT INTO `plan` VALUES ('1051', '1', '25', '2017', '', '6');
INSERT INTO `plan` VALUES ('1052', '1', '13', '2017', '', '6');
INSERT INTO `plan` VALUES ('1053', '1', '45', '2017', '', '6');
INSERT INTO `plan` VALUES ('1054', '1', '26', '2017', '', '6');
INSERT INTO `plan` VALUES ('1055', '1', '27', '2017', '', '6');
INSERT INTO `plan` VALUES ('1056', '1', '46', '2017', '', '7');
INSERT INTO `plan` VALUES ('1057', '1', '47', '2017', '', '7');
INSERT INTO `plan` VALUES ('1058', '1', '48', '2017', '', '7');
INSERT INTO `plan` VALUES ('1059', '1', '24', '2017', '', '7');
INSERT INTO `plan` VALUES ('1060', '1', '50', '2017', '', '7');
INSERT INTO `plan` VALUES ('1061', '1', '14', '2018', '公共课', '1');
INSERT INTO `plan` VALUES ('1062', '1', '4', '2018', '公共课', '1');
INSERT INTO `plan` VALUES ('1063', '1', '2', '2018', '公共课', '1');
INSERT INTO `plan` VALUES ('1064', '1', '43', '2018', '公共', '1');
INSERT INTO `plan` VALUES ('1065', '1', '7', '2018', '公共', '1');
INSERT INTO `plan` VALUES ('1066', '1', '5', '2018', '公共', '2');
INSERT INTO `plan` VALUES ('1067', '1', '33', '2018', '公共', '2');
INSERT INTO `plan` VALUES ('1068', '1', '3', '2018', '公共', '2');
INSERT INTO `plan` VALUES ('1069', '1', '38', '2018', '公共', '2');
INSERT INTO `plan` VALUES ('1070', '1', '35', '2018', '公共', '2');
INSERT INTO `plan` VALUES ('1071', '1', '1', '2018', '公共', '2');
INSERT INTO `plan` VALUES ('1072', '1', '36', '2018', '公共', '3');
INSERT INTO `plan` VALUES ('1073', '1', '34', '2018', '公共', '3');
INSERT INTO `plan` VALUES ('1074', '1', '39', '2018', '公共', '3');
INSERT INTO `plan` VALUES ('1075', '1', '15', '2018', '公共', '3');
INSERT INTO `plan` VALUES ('1076', '1', '9', '2018', '公共', '3');
INSERT INTO `plan` VALUES ('1077', '1', '6', '2018', '公共', '3');
INSERT INTO `plan` VALUES ('1078', '1', '64', '2018', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1079', '1', '37', '2018', '公共', '4');
INSERT INTO `plan` VALUES ('1080', '1', '42', '2018', '公共', '4');
INSERT INTO `plan` VALUES ('1081', '1', '17', '2018', '公共', '4');
INSERT INTO `plan` VALUES ('1082', '1', '10', '2018', '公共', '4');
INSERT INTO `plan` VALUES ('1083', '1', '12', '2018', '公共', '4');
INSERT INTO `plan` VALUES ('1084', '1', '19', '2018', '公共', '4');
INSERT INTO `plan` VALUES ('1085', '1', '11', '2018', '公共', '5');
INSERT INTO `plan` VALUES ('1086', '1', '20', '2018', '', '5');
INSERT INTO `plan` VALUES ('1087', '1', '21', '2018', '', '5');
INSERT INTO `plan` VALUES ('1088', '1', '22', '2018', '', '5');
INSERT INTO `plan` VALUES ('1089', '1', '23', '2018', '专业', '5');
INSERT INTO `plan` VALUES ('1090', '1', '22', '2018', '', '6');
INSERT INTO `plan` VALUES ('1091', '1', '25', '2018', '', '6');
INSERT INTO `plan` VALUES ('1092', '1', '13', '2018', '', '6');
INSERT INTO `plan` VALUES ('1093', '1', '45', '2018', '', '6');
INSERT INTO `plan` VALUES ('1094', '1', '26', '2018', '', '6');
INSERT INTO `plan` VALUES ('1095', '1', '27', '2018', '', '6');
INSERT INTO `plan` VALUES ('1096', '1', '46', '2018', '', '7');
INSERT INTO `plan` VALUES ('1097', '1', '47', '2018', '', '7');
INSERT INTO `plan` VALUES ('1098', '1', '48', '2018', '', '7');
INSERT INTO `plan` VALUES ('1099', '1', '24', '2018', '', '7');
INSERT INTO `plan` VALUES ('1100', '1', '50', '2018', '', '7');
INSERT INTO `plan` VALUES ('1101', '2', '14', '2016', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1102', '2', '2', '2016', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1103', '2', '4', '2016', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1104', '2', '7', '2016', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1105', '2', '1', '2016', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1106', '2', '3', '2016', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1107', '2', '33', '2016', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1108', '2', '38', '2016', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1109', '2', '9', '2016', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1110', '2', '5', '2016', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1111', '2', '64', '2016', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1112', '2', '52', '2016', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1113', '2', '15', '2016', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1114', '2', '34', '2016', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1116', '2', '28', '2016', '学科基础课', '3');
INSERT INTO `plan` VALUES ('1117', '2', '10', '2016', '学科基础课', '3');
INSERT INTO `plan` VALUES ('1118', '2', '36', '2016', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1120', '2', '35', '2016', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1121', '2', '65', '2016', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1122', '2', '17', '2016', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1123', '2', '16', '2016', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1124', '2', '37', '2016', '通识必修课', '4');
INSERT INTO `plan` VALUES ('1125', '2', '42', '2016', '通识必修课', '4');
INSERT INTO `plan` VALUES ('1126', '2', '66', '2016', '专业核心课', '4');
INSERT INTO `plan` VALUES ('1127', '2', '22', '2016', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1128', '2', '21', '2016', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1129', '2', '69', '2016', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1130', '2', '44', '2016', '专业核心课', '5');
INSERT INTO `plan` VALUES ('1131', '2', '70', '2016', '专业核心课', '5');
INSERT INTO `plan` VALUES ('1132', '2', '42', '2016', '通识必修课', '5');
INSERT INTO `plan` VALUES ('1133', '2', '6', '2016', '专业方向课', '6');
INSERT INTO `plan` VALUES ('1134', '2', '59', '2016', '专业方向课', '6');
INSERT INTO `plan` VALUES ('1135', '2', '71', '2016', '专业核心课', '6');
INSERT INTO `plan` VALUES ('1136', '2', '24', '2016', '专业方向课', '6');
INSERT INTO `plan` VALUES ('1137', '2', '62', '2016', '专业核心课', '6');
INSERT INTO `plan` VALUES ('1138', '2', '47', '2016', '专业方向课', '7');
INSERT INTO `plan` VALUES ('1139', '2', '72', '2016', '专业方向课', '7');
INSERT INTO `plan` VALUES ('1140', '2', '73', '2016', '专业方向课', '7');
INSERT INTO `plan` VALUES ('1141', '2', '74', '2016', '专业核心课', '7');
INSERT INTO `plan` VALUES ('1142', '2', '48', '2016', '学科基础课', '7');
INSERT INTO `plan` VALUES ('1143', '2', '14', '2017', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1144', '2', '2', '2017', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1145', '2', '4', '2017', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1146', '2', '7', '2017', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1147', '2', '1', '2017', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1148', '2', '3', '2017', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1149', '2', '33', '2017', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1150', '2', '38', '2017', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1151', '2', '9', '2017', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1152', '2', '5', '2017', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1153', '2', '64', '2017', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1154', '2', '52', '2017', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1155', '2', '15', '2017', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1156', '2', '34', '2017', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1158', '2', '28', '2017', '学科基础课', '3');
INSERT INTO `plan` VALUES ('1159', '2', '10', '2017', '学科基础课', '3');
INSERT INTO `plan` VALUES ('1160', '2', '36', '2017', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1162', '2', '35', '2017', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1163', '2', '65', '2017', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1164', '2', '17', '2017', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1165', '2', '16', '2017', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1166', '2', '37', '2017', '通识必修课', '4');
INSERT INTO `plan` VALUES ('1167', '2', '42', '2017', '通识必修课', '4');
INSERT INTO `plan` VALUES ('1168', '2', '66', '2017', '专业核心课', '4');
INSERT INTO `plan` VALUES ('1169', '2', '22', '2017', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1170', '2', '21', '2017', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1171', '2', '69', '2017', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1172', '2', '44', '2017', '专业核心课', '5');
INSERT INTO `plan` VALUES ('1173', '2', '70', '2017', '专业核心课', '5');
INSERT INTO `plan` VALUES ('1174', '2', '42', '2017', '通识必修课', '5');
INSERT INTO `plan` VALUES ('1175', '2', '6', '2017', '专业方向课', '6');
INSERT INTO `plan` VALUES ('1176', '2', '59', '2017', '专业方向课', '6');
INSERT INTO `plan` VALUES ('1177', '2', '71', '2017', '专业核心课', '6');
INSERT INTO `plan` VALUES ('1178', '2', '24', '2017', '专业方向课', '6');
INSERT INTO `plan` VALUES ('1179', '2', '62', '2017', '专业核心课', '6');
INSERT INTO `plan` VALUES ('1180', '2', '47', '2017', '专业方向课', '7');
INSERT INTO `plan` VALUES ('1181', '2', '72', '2017', '专业方向课', '7');
INSERT INTO `plan` VALUES ('1182', '2', '73', '2017', '专业方向课', '7');
INSERT INTO `plan` VALUES ('1183', '2', '74', '2017', '专业核心课', '7');
INSERT INTO `plan` VALUES ('1184', '2', '48', '2017', '学科基础课', '7');
INSERT INTO `plan` VALUES ('1185', '2', '14', '2018', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1186', '2', '2', '2018', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1187', '2', '4', '2018', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1188', '2', '7', '2018', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1189', '2', '1', '2018', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1190', '2', '3', '2018', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1191', '2', '33', '2018', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1192', '2', '38', '2018', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1193', '2', '9', '2018', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1194', '2', '5', '2018', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1195', '2', '64', '2018', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1196', '2', '52', '2018', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1197', '2', '15', '2018', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1198', '2', '34', '2018', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1200', '2', '28', '2018', '学科基础课', '3');
INSERT INTO `plan` VALUES ('1201', '2', '10', '2018', '学科基础课', '3');
INSERT INTO `plan` VALUES ('1202', '2', '36', '2018', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1204', '2', '35', '2018', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1205', '2', '65', '2018', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1206', '2', '17', '2018', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1207', '2', '16', '2018', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1208', '2', '37', '2018', '通识必修课', '4');
INSERT INTO `plan` VALUES ('1209', '2', '42', '2018', '通识必修课', '4');
INSERT INTO `plan` VALUES ('1210', '2', '66', '2018', '专业核心课', '4');
INSERT INTO `plan` VALUES ('1211', '2', '22', '2018', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1212', '2', '21', '2018', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1213', '2', '69', '2018', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1214', '2', '44', '2018', '专业核心课', '5');
INSERT INTO `plan` VALUES ('1215', '2', '70', '2018', '专业核心课', '5');
INSERT INTO `plan` VALUES ('1216', '2', '42', '2018', '通识必修课', '5');
INSERT INTO `plan` VALUES ('1217', '2', '6', '2018', '专业方向课', '6');
INSERT INTO `plan` VALUES ('1218', '2', '59', '2018', '专业方向课', '6');
INSERT INTO `plan` VALUES ('1219', '2', '71', '2018', '专业核心课', '6');
INSERT INTO `plan` VALUES ('1220', '2', '24', '2018', '专业方向课', '6');
INSERT INTO `plan` VALUES ('1221', '2', '62', '2018', '专业核心课', '6');
INSERT INTO `plan` VALUES ('1222', '2', '47', '2018', '专业方向课', '7');
INSERT INTO `plan` VALUES ('1223', '2', '72', '2018', '专业方向课', '7');
INSERT INTO `plan` VALUES ('1224', '2', '73', '2018', '专业方向课', '7');
INSERT INTO `plan` VALUES ('1225', '2', '74', '2018', '专业核心课', '7');
INSERT INTO `plan` VALUES ('1226', '2', '48', '2018', '学科基础课', '7');
INSERT INTO `plan` VALUES ('1227', '3', '14', '2016', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1228', '3', '51', '2016', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1229', '3', '2', '2016', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1230', '3', '4', '2016', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1231', '3', '8', '2016', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1232', '3', '7', '2016', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1233', '3', '1', '2016', '学科基础课', '2');
INSERT INTO `plan` VALUES ('1234', '3', '3', '2016', '通识选修课', '2');
INSERT INTO `plan` VALUES ('1235', '3', '33', '2016', '通识选修课', '2');
INSERT INTO `plan` VALUES ('1236', '3', '38', '2016', '通识选修课', '2');
INSERT INTO `plan` VALUES ('1237', '3', '9', '2016', '通识选修课', '2');
INSERT INTO `plan` VALUES ('1238', '3', '5', '2016', '通识选修课', '2');
INSERT INTO `plan` VALUES ('1239', '3', '35', '2016', '通识选修课', '2');
INSERT INTO `plan` VALUES ('1240', '3', '52', '2016', '学科基础课', '3');
INSERT INTO `plan` VALUES ('1241', '3', '53', '2016', '学科基础课', '3');
INSERT INTO `plan` VALUES ('1243', '3', '28', '2016', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1244', '3', '10', '2016', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1245', '3', '54', '2016', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1246', '3', '36', '2016', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1247', '3', '64', '2016', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1248', '3', '16', '2016', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1249', '3', '17', '2016', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1250', '3', '42', '2016', '通识必修课', '4');
INSERT INTO `plan` VALUES ('1251', '3', '65', '2016', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1252', '3', '22', '2016', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1253', '3', '21', '2016', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1254', '3', '44', '2016', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1255', '3', '15', '2016', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1256', '3', '59', '2016', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1257', '3', '60', '2016', '学科基础课', '6');
INSERT INTO `plan` VALUES ('1258', '3', '63', '2016', '专业方向课', '6');
INSERT INTO `plan` VALUES ('1259', '3', '62', '2016', '专业方向课', '6');
INSERT INTO `plan` VALUES ('1260', '3', '61', '2016', '专业方向课', '6');
INSERT INTO `plan` VALUES ('1261', '3', '14', '2017', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1262', '3', '51', '2017', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1263', '3', '2', '2017', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1264', '3', '4', '2017', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1265', '3', '8', '2017', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1266', '3', '7', '2017', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1267', '3', '1', '2017', '学科基础课', '2');
INSERT INTO `plan` VALUES ('1268', '3', '3', '2017', '通识选修课', '2');
INSERT INTO `plan` VALUES ('1269', '3', '33', '2017', '通识选修课', '2');
INSERT INTO `plan` VALUES ('1270', '3', '38', '2017', '通识选修课', '2');
INSERT INTO `plan` VALUES ('1271', '3', '9', '2017', '通识选修课', '2');
INSERT INTO `plan` VALUES ('1272', '3', '5', '2017', '通识选修课', '2');
INSERT INTO `plan` VALUES ('1273', '3', '35', '2017', '通识选修课', '2');
INSERT INTO `plan` VALUES ('1274', '3', '52', '2017', '学科基础课', '3');
INSERT INTO `plan` VALUES ('1275', '3', '53', '2017', '学科基础课', '3');
INSERT INTO `plan` VALUES ('1277', '3', '28', '2017', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1278', '3', '10', '2017', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1279', '3', '54', '2017', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1280', '3', '36', '2017', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1281', '3', '64', '2017', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1282', '3', '16', '2017', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1283', '3', '17', '2017', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1284', '3', '42', '2017', '通识必修课', '4');
INSERT INTO `plan` VALUES ('1285', '3', '65', '2017', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1286', '3', '22', '2017', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1287', '3', '21', '2017', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1288', '3', '44', '2017', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1289', '3', '15', '2017', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1290', '3', '59', '2017', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1291', '3', '60', '2017', '学科基础课', '6');
INSERT INTO `plan` VALUES ('1292', '3', '63', '2017', '专业方向课', '6');
INSERT INTO `plan` VALUES ('1293', '3', '62', '2017', '专业方向课', '6');
INSERT INTO `plan` VALUES ('1294', '3', '61', '2017', '专业方向课', '6');
INSERT INTO `plan` VALUES ('1295', '3', '14', '2018', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1296', '3', '51', '2018', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1297', '3', '2', '2018', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1298', '3', '4', '2018', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1299', '3', '8', '2018', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1300', '3', '7', '2018', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1301', '3', '1', '2018', '学科基础课', '2');
INSERT INTO `plan` VALUES ('1302', '3', '3', '2018', '通识选修课', '2');
INSERT INTO `plan` VALUES ('1303', '3', '33', '2018', '通识选修课', '2');
INSERT INTO `plan` VALUES ('1304', '3', '38', '2018', '通识选修课', '2');
INSERT INTO `plan` VALUES ('1305', '3', '9', '2018', '通识选修课', '2');
INSERT INTO `plan` VALUES ('1306', '3', '5', '2018', '通识选修课', '2');
INSERT INTO `plan` VALUES ('1307', '3', '35', '2018', '通识选修课', '2');
INSERT INTO `plan` VALUES ('1308', '3', '52', '2018', '学科基础课', '3');
INSERT INTO `plan` VALUES ('1309', '3', '53', '2018', '学科基础课', '3');
INSERT INTO `plan` VALUES ('1311', '3', '28', '2018', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1312', '3', '10', '2018', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1313', '3', '54', '2018', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1314', '3', '36', '2018', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1315', '3', '64', '2018', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1316', '3', '16', '2018', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1317', '3', '17', '2018', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1318', '3', '42', '2018', '通识必修课', '4');
INSERT INTO `plan` VALUES ('1319', '3', '65', '2018', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1320', '3', '22', '2018', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1321', '3', '21', '2018', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1322', '3', '44', '2018', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1323', '3', '15', '2018', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1324', '3', '59', '2018', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1325', '3', '60', '2018', '学科基础课', '6');
INSERT INTO `plan` VALUES ('1326', '3', '63', '2018', '专业方向课', '6');
INSERT INTO `plan` VALUES ('1327', '3', '62', '2018', '专业方向课', '6');
INSERT INTO `plan` VALUES ('1328', '3', '61', '2018', '专业方向课', '6');
INSERT INTO `plan` VALUES ('1329', '4', '14', '2016', '', '1');
INSERT INTO `plan` VALUES ('1330', '4', '2', '2016', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1331', '4', '4', '2016', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1333', '4', '8', '2016', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1334', '4', '7', '2016', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1335', '4', '1', '2016', '专业基础课', '2');
INSERT INTO `plan` VALUES ('1336', '4', '3', '2016', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1337', '4', '33', '2016', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1338', '4', '38', '2016', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1339', '4', '9', '2016', '学科基础课', '2');
INSERT INTO `plan` VALUES ('1340', '4', '5', '2016', '学科基础课', '2');
INSERT INTO `plan` VALUES ('1342', '4', '64', '2016', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1343', '4', '75', '2016', '学科基础课', '3');
INSERT INTO `plan` VALUES ('1344', '4', '15', '2016', '学科基础课', '3');
INSERT INTO `plan` VALUES ('1345', '4', '34', '2016', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1346', '4', '36', '2016', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1347', '4', '28', '2016', '学科基础课', '3');
INSERT INTO `plan` VALUES ('1349', '4', '35', '2016', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1350', '4', '76', '2016', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1351', '4', '17', '2016', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1352', '4', '77', '2016', '专业核心课', '4');
INSERT INTO `plan` VALUES ('1353', '4', '78', '2016', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1354', '4', '37', '2016', '通识选修课', '4');
INSERT INTO `plan` VALUES ('1356', '4', '21', '2016', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1357', '4', '69', '2016', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1358', '4', '79', '2016', '专业核心课', '5');
INSERT INTO `plan` VALUES ('1359', '4', '80', '2016', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1360', '4', '59', '2016', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1361', '4', '42', '2016', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1362', '4', '44', '2016', '专业核心课', '6');
INSERT INTO `plan` VALUES ('1363', '4', '81', '2016', '专业核心课', '6');
INSERT INTO `plan` VALUES ('1364', '4', '82', '2016', '学科基础课', '6');
INSERT INTO `plan` VALUES ('1365', '4', '83', '2016', '学科基础课', '6');
INSERT INTO `plan` VALUES ('1366', '4', '13', '2016', '学科基础课', '6');
INSERT INTO `plan` VALUES ('1367', '4', '48', '2016', '专业方向课', '6');
INSERT INTO `plan` VALUES ('1368', '4', '84', '2016', '学科基础课', '7');
INSERT INTO `plan` VALUES ('1369', '4', '24', '2016', '专业方向课', '7');
INSERT INTO `plan` VALUES ('1370', '4', '85', '2016', '专业方向课', '7');
INSERT INTO `plan` VALUES ('1371', '4', '86', '2016', '通识选修课', '7');
INSERT INTO `plan` VALUES ('1372', '4', '14', '2017', '', '1');
INSERT INTO `plan` VALUES ('1373', '4', '2', '2017', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1374', '4', '4', '2017', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1376', '4', '8', '2017', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1377', '4', '7', '2017', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1378', '4', '1', '2017', '专业基础课', '2');
INSERT INTO `plan` VALUES ('1379', '4', '3', '2017', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1380', '4', '33', '2017', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1381', '4', '38', '2017', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1382', '4', '9', '2017', '学科基础课', '2');
INSERT INTO `plan` VALUES ('1383', '4', '5', '2017', '学科基础课', '2');
INSERT INTO `plan` VALUES ('1385', '4', '64', '2017', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1386', '4', '75', '2017', '学科基础课', '3');
INSERT INTO `plan` VALUES ('1387', '4', '15', '2017', '学科基础课', '3');
INSERT INTO `plan` VALUES ('1388', '4', '34', '2017', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1389', '4', '36', '2017', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1390', '4', '28', '2017', '学科基础课', '3');
INSERT INTO `plan` VALUES ('1392', '4', '35', '2017', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1393', '4', '76', '2017', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1394', '4', '17', '2017', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1395', '4', '77', '2017', '专业核心课', '4');
INSERT INTO `plan` VALUES ('1396', '4', '78', '2017', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1397', '4', '37', '2017', '通识选修课', '4');
INSERT INTO `plan` VALUES ('1399', '4', '21', '2017', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1400', '4', '69', '2017', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1401', '4', '79', '2017', '专业核心课', '5');
INSERT INTO `plan` VALUES ('1402', '4', '80', '2017', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1403', '4', '59', '2017', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1404', '4', '42', '2017', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1405', '4', '44', '2017', '专业核心课', '6');
INSERT INTO `plan` VALUES ('1406', '4', '81', '2017', '专业核心课', '6');
INSERT INTO `plan` VALUES ('1407', '4', '82', '2017', '学科基础课', '6');
INSERT INTO `plan` VALUES ('1408', '4', '83', '2017', '学科基础课', '6');
INSERT INTO `plan` VALUES ('1409', '4', '13', '2017', '学科基础课', '6');
INSERT INTO `plan` VALUES ('1410', '4', '48', '2017', '专业方向课', '6');
INSERT INTO `plan` VALUES ('1411', '4', '84', '2017', '学科基础课', '7');
INSERT INTO `plan` VALUES ('1412', '4', '24', '2017', '专业方向课', '7');
INSERT INTO `plan` VALUES ('1413', '4', '85', '2017', '专业方向课', '7');
INSERT INTO `plan` VALUES ('1414', '4', '86', '2017', '通识选修课', '7');
INSERT INTO `plan` VALUES ('1415', '4', '14', '2018', '', '1');
INSERT INTO `plan` VALUES ('1416', '4', '2', '2018', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1417', '4', '4', '2018', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1419', '4', '8', '2018', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1420', '4', '7', '2018', '通识必修课', '1');
INSERT INTO `plan` VALUES ('1421', '4', '1', '2018', '专业基础课', '2');
INSERT INTO `plan` VALUES ('1422', '4', '3', '2018', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1423', '4', '33', '2018', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1424', '4', '38', '2018', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1425', '4', '9', '2018', '学科基础课', '2');
INSERT INTO `plan` VALUES ('1426', '4', '5', '2018', '学科基础课', '2');
INSERT INTO `plan` VALUES ('1428', '4', '64', '2018', '通识必修课', '2');
INSERT INTO `plan` VALUES ('1429', '4', '75', '2018', '学科基础课', '3');
INSERT INTO `plan` VALUES ('1430', '4', '15', '2018', '学科基础课', '3');
INSERT INTO `plan` VALUES ('1431', '4', '34', '2018', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1432', '4', '36', '2018', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1433', '4', '28', '2018', '学科基础课', '3');
INSERT INTO `plan` VALUES ('1435', '4', '35', '2018', '通识必修课', '3');
INSERT INTO `plan` VALUES ('1436', '4', '76', '2018', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1437', '4', '17', '2018', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1438', '4', '77', '2018', '专业核心课', '4');
INSERT INTO `plan` VALUES ('1439', '4', '78', '2018', '学科基础课', '4');
INSERT INTO `plan` VALUES ('1440', '4', '37', '2018', '通识选修课', '4');
INSERT INTO `plan` VALUES ('1442', '4', '21', '2018', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1443', '4', '69', '2018', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1444', '4', '79', '2018', '专业核心课', '5');
INSERT INTO `plan` VALUES ('1445', '4', '80', '2018', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1446', '4', '59', '2018', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1447', '4', '42', '2018', '学科基础课', '5');
INSERT INTO `plan` VALUES ('1448', '4', '44', '2018', '专业核心课', '6');
INSERT INTO `plan` VALUES ('1449', '4', '81', '2018', '专业核心课', '6');
INSERT INTO `plan` VALUES ('1450', '4', '82', '2018', '学科基础课', '6');
INSERT INTO `plan` VALUES ('1451', '4', '83', '2018', '学科基础课', '6');
INSERT INTO `plan` VALUES ('1452', '4', '13', '2018', '学科基础课', '6');
INSERT INTO `plan` VALUES ('1453', '4', '48', '2018', '专业方向课', '6');
INSERT INTO `plan` VALUES ('1454', '4', '84', '2018', '学科基础课', '7');
INSERT INTO `plan` VALUES ('1455', '4', '24', '2018', '专业方向课', '7');
INSERT INTO `plan` VALUES ('1456', '4', '85', '2018', '专业方向课', '7');
INSERT INTO `plan` VALUES ('1457', '4', '86', '2018', '通识选修课', '7');

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teachingclass` int(255) DEFAULT NULL,
  `classroom` int(255) DEFAULT NULL,
  `day` int(255) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_foreignkey_teachingclass` (`teachingclass`),
  KEY `schedule_foreignkey_classroom` (`classroom`),
  CONSTRAINT `schedule_foreignkey_classroom` FOREIGN KEY (`classroom`) REFERENCES `classroom` (`id`),
  CONSTRAINT `schedule_foreignkey_teachingclass` FOREIGN KEY (`teachingclass`) REFERENCES `teachingclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES ('115', '204', '1', '1', '1');
INSERT INTO `schedule` VALUES ('116', '204', '1', '3', '2');
INSERT INTO `schedule` VALUES ('117', '205', '2', '1', '1');
INSERT INTO `schedule` VALUES ('118', '205', '2', '3', '2');
INSERT INTO `schedule` VALUES ('119', '206', '1', '1', '2');
INSERT INTO `schedule` VALUES ('120', '206', '1', '3', '1');
INSERT INTO `schedule` VALUES ('121', '207', '2', '1', '2');
INSERT INTO `schedule` VALUES ('122', '207', '2', '3', '1');
INSERT INTO `schedule` VALUES ('123', '208', '1', '1', '3');
INSERT INTO `schedule` VALUES ('124', '208', '1', '3', '3');
INSERT INTO `schedule` VALUES ('125', '209', '2', '1', '3');
INSERT INTO `schedule` VALUES ('126', '209', '2', '3', '3');
INSERT INTO `schedule` VALUES ('127', '210', '1', '1', '4');
INSERT INTO `schedule` VALUES ('128', '210', '1', '3', '4');
INSERT INTO `schedule` VALUES ('129', '211', '2', '1', '4');
INSERT INTO `schedule` VALUES ('130', '211', '2', '3', '4');
INSERT INTO `schedule` VALUES ('131', '212', '1', '2', '1');
INSERT INTO `schedule` VALUES ('132', '212', '1', '4', '2');
INSERT INTO `schedule` VALUES ('133', '213', '2', '2', '1');
INSERT INTO `schedule` VALUES ('134', '213', '2', '4', '2');
INSERT INTO `schedule` VALUES ('135', '214', '1', '2', '2');
INSERT INTO `schedule` VALUES ('136', '214', '1', '4', '1');
INSERT INTO `schedule` VALUES ('137', '215', '2', '2', '2');
INSERT INTO `schedule` VALUES ('138', '215', '2', '4', '1');
INSERT INTO `schedule` VALUES ('139', '216', '1', '2', '3');
INSERT INTO `schedule` VALUES ('140', '216', '1', '4', '3');
INSERT INTO `schedule` VALUES ('141', '217', '2', '2', '3');
INSERT INTO `schedule` VALUES ('142', '217', '2', '4', '3');
INSERT INTO `schedule` VALUES ('143', '218', '1', '2', '4');
INSERT INTO `schedule` VALUES ('144', '218', '1', '4', '4');
INSERT INTO `schedule` VALUES ('145', '219', '2', '2', '4');
INSERT INTO `schedule` VALUES ('146', '219', '2', '4', '4');
INSERT INTO `schedule` VALUES ('147', '220', '1', '5', '1');
INSERT INTO `schedule` VALUES ('148', '220', '3', '1', '2');
INSERT INTO `schedule` VALUES ('149', '221', '2', '5', '1');
INSERT INTO `schedule` VALUES ('150', '221', '4', '1', '2');
INSERT INTO `schedule` VALUES ('151', '222', '1', '5', '2');
INSERT INTO `schedule` VALUES ('152', '222', '3', '1', '1');
INSERT INTO `schedule` VALUES ('153', '223', '2', '5', '2');
INSERT INTO `schedule` VALUES ('154', '223', '4', '1', '1');
INSERT INTO `schedule` VALUES ('155', '224', '1', '5', '3');
INSERT INTO `schedule` VALUES ('156', '224', '3', '1', '3');
INSERT INTO `schedule` VALUES ('157', '225', '1', '5', '4');
INSERT INTO `schedule` VALUES ('158', '225', '3', '1', '4');
INSERT INTO `schedule` VALUES ('159', '226', '2', '5', '3');
INSERT INTO `schedule` VALUES ('160', '226', '3', '2', '2');
INSERT INTO `schedule` VALUES ('161', '227', '3', '5', '3');
INSERT INTO `schedule` VALUES ('162', '227', '4', '2', '2');
INSERT INTO `schedule` VALUES ('163', '228', '2', '5', '4');
INSERT INTO `schedule` VALUES ('164', '228', '3', '2', '4');
INSERT INTO `schedule` VALUES ('165', '229', '3', '3', '1');
INSERT INTO `schedule` VALUES ('166', '229', '3', '5', '2');
INSERT INTO `schedule` VALUES ('167', '230', '3', '2', '1');
INSERT INTO `schedule` VALUES ('168', '230', '3', '4', '2');
INSERT INTO `schedule` VALUES ('169', '231', '3', '2', '3');
INSERT INTO `schedule` VALUES ('170', '231', '3', '4', '1');
INSERT INTO `schedule` VALUES ('171', '232', '3', '4', '3');
INSERT INTO `schedule` VALUES ('172', '232', '4', '2', '1');
INSERT INTO `schedule` VALUES ('173', '233', '3', '3', '2');
INSERT INTO `schedule` VALUES ('174', '233', '3', '5', '1');
INSERT INTO `schedule` VALUES ('175', '234', '3', '3', '3');
INSERT INTO `schedule` VALUES ('176', '234', '4', '1', '3');
INSERT INTO `schedule` VALUES ('177', '235', '3', '3', '4');
INSERT INTO `schedule` VALUES ('178', '235', '4', '5', '1');
INSERT INTO `schedule` VALUES ('179', '236', '3', '4', '4');
INSERT INTO `schedule` VALUES ('180', '236', '4', '2', '3');
INSERT INTO `schedule` VALUES ('181', '237', '4', '1', '4');
INSERT INTO `schedule` VALUES ('182', '237', '4', '3', '4');
INSERT INTO `schedule` VALUES ('183', '238', '4', '2', '4');
INSERT INTO `schedule` VALUES ('184', '238', '4', '4', '3');
INSERT INTO `schedule` VALUES ('185', '239', '4', '3', '3');
INSERT INTO `schedule` VALUES ('186', '239', '5', '1', '1');
INSERT INTO `schedule` VALUES ('187', '240', '4', '3', '1');
INSERT INTO `schedule` VALUES ('188', '240', '4', '5', '2');
INSERT INTO `schedule` VALUES ('189', '241', '4', '3', '2');
INSERT INTO `schedule` VALUES ('190', '241', '4', '5', '3');
INSERT INTO `schedule` VALUES ('191', '242', '4', '4', '1');
INSERT INTO `schedule` VALUES ('192', '242', '5', '1', '2');
INSERT INTO `schedule` VALUES ('193', '243', '4', '4', '2');
INSERT INTO `schedule` VALUES ('194', '243', '5', '2', '1');
INSERT INTO `schedule` VALUES ('195', '244', '4', '4', '4');
INSERT INTO `schedule` VALUES ('196', '244', '5', '2', '3');
INSERT INTO `schedule` VALUES ('197', '245', '5', '2', '4');
INSERT INTO `schedule` VALUES ('198', '245', '5', '4', '3');
INSERT INTO `schedule` VALUES ('199', '246', '5', '1', '3');
INSERT INTO `schedule` VALUES ('200', '246', '5', '3', '4');
INSERT INTO `schedule` VALUES ('201', '247', '3', '5', '4');
INSERT INTO `schedule` VALUES ('202', '247', '5', '2', '2');
INSERT INTO `schedule` VALUES ('203', '248', '4', '5', '4');
INSERT INTO `schedule` VALUES ('204', '248', '6', '2', '2');
INSERT INTO `schedule` VALUES ('205', '249', '5', '3', '1');
INSERT INTO `schedule` VALUES ('206', '249', '5', '5', '2');
INSERT INTO `schedule` VALUES ('207', '250', '5', '4', '1');
INSERT INTO `schedule` VALUES ('208', '250', '6', '1', '2');
INSERT INTO `schedule` VALUES ('209', '251', '5', '3', '2');
INSERT INTO `schedule` VALUES ('210', '251', '6', '1', '1');
INSERT INTO `schedule` VALUES ('211', '252', '5', '1', '4');
INSERT INTO `schedule` VALUES ('212', '252', '5', '3', '3');
INSERT INTO `schedule` VALUES ('213', '253', '5', '4', '2');
INSERT INTO `schedule` VALUES ('214', '253', '6', '1', '3');
INSERT INTO `schedule` VALUES ('215', '254', '5', '4', '4');
INSERT INTO `schedule` VALUES ('216', '254', '6', '2', '1');
INSERT INTO `schedule` VALUES ('217', '255', '5', '5', '1');
INSERT INTO `schedule` VALUES ('218', '255', '6', '1', '4');
INSERT INTO `schedule` VALUES ('219', '256', '5', '5', '3');
INSERT INTO `schedule` VALUES ('220', '256', '6', '2', '3');
INSERT INTO `schedule` VALUES ('221', '257', '5', '5', '4');
INSERT INTO `schedule` VALUES ('222', '257', '6', '3', '2');
INSERT INTO `schedule` VALUES ('223', '258', '6', '3', '1');
INSERT INTO `schedule` VALUES ('224', '258', '6', '5', '2');
INSERT INTO `schedule` VALUES ('225', '259', '6', '3', '3');
INSERT INTO `schedule` VALUES ('226', '259', '6', '5', '1');
INSERT INTO `schedule` VALUES ('227', '260', '6', '3', '4');
INSERT INTO `schedule` VALUES ('228', '260', '6', '5', '3');

-- ----------------------------
-- Table structure for select_course
-- ----------------------------
DROP TABLE IF EXISTS `select_course`;
CREATE TABLE `select_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student` int(11) DEFAULT NULL,
  `teachingclass` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `toStudent` (`student`),
  KEY `toTeachingclass` (`teachingclass`),
  CONSTRAINT `toStudent` FOREIGN KEY (`student`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `toTeachingclass` FOREIGN KEY (`teachingclass`) REFERENCES `teachingclass` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of select_course
-- ----------------------------
INSERT INTO `select_course` VALUES ('1', '5', '230');
INSERT INTO `select_course` VALUES ('2', '5', '220');
INSERT INTO `select_course` VALUES ('3', '5', '223');
INSERT INTO `select_course` VALUES ('4', '5', '218');
INSERT INTO `select_course` VALUES ('5', '5', '231');
INSERT INTO `select_course` VALUES ('6', '1', '230');
INSERT INTO `select_course` VALUES ('7', '1', '221');
INSERT INTO `select_course` VALUES ('8', '1', '222');
INSERT INTO `select_course` VALUES ('9', '1', '219');
INSERT INTO `select_course` VALUES ('10', '1', '231');
INSERT INTO `select_course` VALUES ('11', '505', '237');
INSERT INTO `select_course` VALUES ('12', '505', '213');
INSERT INTO `select_course` VALUES ('13', '505', '226');
INSERT INTO `select_course` VALUES ('14', '505', '228');
INSERT INTO `select_course` VALUES ('15', '505', '233');
INSERT INTO `select_course` VALUES ('16', '505', '216');
INSERT INTO `select_course` VALUES ('17', '505', '234');
INSERT INTO `select_course` VALUES ('18', '438', '249');
INSERT INTO `select_course` VALUES ('19', '438', '237');
INSERT INTO `select_course` VALUES ('20', '438', '227');
INSERT INTO `select_course` VALUES ('21', '438', '233');
INSERT INTO `select_course` VALUES ('22', '438', '216');
INSERT INTO `select_course` VALUES ('23', '438', '250');
INSERT INTO `select_course` VALUES ('24', '438', '239');
INSERT INTO `select_course` VALUES ('25', '3', '230');
INSERT INTO `select_course` VALUES ('26', '3', '220');
INSERT INTO `select_course` VALUES ('27', '3', '222');
INSERT INTO `select_course` VALUES ('28', '3', '218');
INSERT INTO `select_course` VALUES ('29', '3', '231');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `clazz` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_username_unique` (`username`),
  KEY `student_foreignkeyclass` (`clazz`),
  CONSTRAINT `student_foreignkeyclass` FOREIGN KEY (`clazz`) REFERENCES `clazz` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=741 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '3150704104', 'wangkang', 'wangkang', '男', '22', '1');
INSERT INTO `student` VALUES ('2', '3150704105', 'wangkang', 'wangbinbin', '男', '22', '1');
INSERT INTO `student` VALUES ('3', '1', '1', 'student1', '男', '22', '1');
INSERT INTO `student` VALUES ('5', '2', '2', 'student2', '女', '22', '1');
INSERT INTO `student` VALUES ('6', '3', '3', 'student3', '男', '22', '1');
INSERT INTO `student` VALUES ('7', '4', '4', 'student4', '女', '22', '1');
INSERT INTO `student` VALUES ('8', '5', '5', 'student5', '男', '22', '1');
INSERT INTO `student` VALUES ('9', '6', '6', 'student6', '女', '22', '1');
INSERT INTO `student` VALUES ('10', '7', '7', 'student7', '男', '22', '1');
INSERT INTO `student` VALUES ('11', '8', '8', 'student8', '女', '22', '1');
INSERT INTO `student` VALUES ('12', '9', '9', 'student9', '男', '22', '1');
INSERT INTO `student` VALUES ('13', '10', '10', 'student10', '女', '22', '1');
INSERT INTO `student` VALUES ('14', '11', '11', 'student11', '男', '22', '1');
INSERT INTO `student` VALUES ('15', '12', '12', 'student12', '女', '22', '1');
INSERT INTO `student` VALUES ('16', '13', '13', 'student13', '男', '22', '1');
INSERT INTO `student` VALUES ('17', '14', '14', 'student14', '女', '22', '1');
INSERT INTO `student` VALUES ('18', '15', '15', 'student15', '男', '22', '1');
INSERT INTO `student` VALUES ('19', '16', '16', 'student16', '女', '22', '1');
INSERT INTO `student` VALUES ('20', '17', '17', 'student17', '男', '22', '1');
INSERT INTO `student` VALUES ('21', '18', '18', 'student18', '女', '22', '1');
INSERT INTO `student` VALUES ('22', '19', '19', 'student19', '男', '22', '1');
INSERT INTO `student` VALUES ('23', '20', '20', 'student20', '女', '22', '1');
INSERT INTO `student` VALUES ('24', '21', '21', 'student21', '男', '22', '1');
INSERT INTO `student` VALUES ('25', '22', '22', 'student22', '女', '22', '1');
INSERT INTO `student` VALUES ('26', '23', '23', 'student23', '男', '22', '1');
INSERT INTO `student` VALUES ('27', '24', '24', 'student24', '女', '22', '1');
INSERT INTO `student` VALUES ('28', '25', '25', 'student25', '男', '22', '1');
INSERT INTO `student` VALUES ('29', '26', '26', 'student26', '女', '22', '1');
INSERT INTO `student` VALUES ('30', '27', '27', 'student27', '男', '22', '1');
INSERT INTO `student` VALUES ('31', '28', '28', 'student28', '女', '22', '1');
INSERT INTO `student` VALUES ('32', '29', '29', 'student29', '男', '22', '1');
INSERT INTO `student` VALUES ('33', '30', '30', 'student30', '女', '22', '1');
INSERT INTO `student` VALUES ('34', '31', '31', 'student31', '男', '22', '1');
INSERT INTO `student` VALUES ('35', '32', '32', 'student32', '女', '22', '1');
INSERT INTO `student` VALUES ('36', '33', '33', 'student33', '男', '22', '1');
INSERT INTO `student` VALUES ('37', '34', '34', 'student34', '女', '22', '1');
INSERT INTO `student` VALUES ('38', '35', '35', 'student35', '男', '22', '1');
INSERT INTO `student` VALUES ('39', '36', '36', 'student36', '女', '22', '1');
INSERT INTO `student` VALUES ('40', '37', '37', 'student37', '男', '22', '1');
INSERT INTO `student` VALUES ('41', '38', '38', 'student38', '女', '22', '1');
INSERT INTO `student` VALUES ('42', '39', '39', 'student39', '男', '22', '1');
INSERT INTO `student` VALUES ('43', '40', '40', 'student40', '女', '22', '1');
INSERT INTO `student` VALUES ('44', '41', '41', 'student41', '男', '22', '1');
INSERT INTO `student` VALUES ('45', '42', '42', 'student42', '女', '22', '1');
INSERT INTO `student` VALUES ('46', '43', '43', 'student43', '男', '22', '1');
INSERT INTO `student` VALUES ('47', '44', '44', 'student44', '女', '22', '1');
INSERT INTO `student` VALUES ('48', '45', '45', 'student45', '男', '22', '2');
INSERT INTO `student` VALUES ('49', '46', '46', 'student46', '女', '22', '2');
INSERT INTO `student` VALUES ('50', '47', '47', 'student47', '男', '22', '2');
INSERT INTO `student` VALUES ('51', '48', '48', 'student48', '女', '22', '2');
INSERT INTO `student` VALUES ('52', '49', '49', 'student49', '男', '22', '2');
INSERT INTO `student` VALUES ('53', '50', '50', 'student50', '女', '22', '2');
INSERT INTO `student` VALUES ('54', '51', '51', 'student51', '男', '22', '2');
INSERT INTO `student` VALUES ('55', '52', '52', 'student52', '女', '22', '2');
INSERT INTO `student` VALUES ('56', '53', '53', 'student53', '男', '22', '2');
INSERT INTO `student` VALUES ('57', '54', '54', 'student54', '女', '22', '2');
INSERT INTO `student` VALUES ('58', '55', '55', 'student55', '男', '22', '2');
INSERT INTO `student` VALUES ('59', '56', '56', 'student56', '女', '22', '2');
INSERT INTO `student` VALUES ('60', '57', '57', 'student57', '男', '22', '2');
INSERT INTO `student` VALUES ('61', '58', '58', 'student58', '女', '22', '2');
INSERT INTO `student` VALUES ('62', '59', '59', 'student59', '男', '22', '2');
INSERT INTO `student` VALUES ('63', '60', '60', 'student60', '女', '22', '2');
INSERT INTO `student` VALUES ('64', '61', '61', 'student61', '男', '22', '2');
INSERT INTO `student` VALUES ('65', '62', '62', 'student62', '女', '22', '2');
INSERT INTO `student` VALUES ('66', '63', '63', 'student63', '男', '22', '2');
INSERT INTO `student` VALUES ('67', '64', '64', 'student64', '女', '22', '2');
INSERT INTO `student` VALUES ('68', '65', '65', 'student65', '男', '22', '2');
INSERT INTO `student` VALUES ('69', '66', '66', 'student66', '女', '22', '2');
INSERT INTO `student` VALUES ('70', '67', '67', 'student67', '男', '22', '2');
INSERT INTO `student` VALUES ('71', '68', '68', 'student68', '女', '22', '2');
INSERT INTO `student` VALUES ('72', '69', '69', 'student69', '男', '22', '2');
INSERT INTO `student` VALUES ('73', '70', '70', 'student70', '女', '22', '2');
INSERT INTO `student` VALUES ('74', '71', '71', 'student71', '男', '22', '2');
INSERT INTO `student` VALUES ('75', '72', '72', 'student72', '女', '22', '2');
INSERT INTO `student` VALUES ('76', '73', '73', 'student73', '男', '22', '2');
INSERT INTO `student` VALUES ('77', '74', '74', 'student74', '女', '22', '2');
INSERT INTO `student` VALUES ('78', '75', '75', 'student75', '男', '22', '2');
INSERT INTO `student` VALUES ('79', '76', '76', 'student76', '女', '22', '2');
INSERT INTO `student` VALUES ('80', '77', '77', 'student77', '男', '22', '2');
INSERT INTO `student` VALUES ('81', '78', '78', 'student78', '女', '22', '2');
INSERT INTO `student` VALUES ('82', '79', '79', 'student79', '男', '22', '2');
INSERT INTO `student` VALUES ('83', '80', '80', 'student80', '女', '22', '2');
INSERT INTO `student` VALUES ('84', '81', '81', 'student81', '男', '22', '2');
INSERT INTO `student` VALUES ('85', '82', '82', 'student82', '女', '22', '2');
INSERT INTO `student` VALUES ('86', '83', '83', 'student83', '男', '22', '2');
INSERT INTO `student` VALUES ('87', '84', '84', 'student84', '女', '22', '2');
INSERT INTO `student` VALUES ('88', '85', '85', 'student85', '男', '22', '2');
INSERT INTO `student` VALUES ('89', '86', '86', 'student86', '女', '22', '2');
INSERT INTO `student` VALUES ('90', '87', '87', 'student87', '男', '22', '2');
INSERT INTO `student` VALUES ('93', '88', '88', 'student88', '女', '22', '5');
INSERT INTO `student` VALUES ('94', '89', '89', 'student89', '男', '22', '5');
INSERT INTO `student` VALUES ('95', '90', '90', 'student90', '女', '22', '5');
INSERT INTO `student` VALUES ('96', '91', '91', 'student91', '男', '22', '5');
INSERT INTO `student` VALUES ('97', '92', '92', 'student92', '女', '22', '5');
INSERT INTO `student` VALUES ('98', '93', '93', 'student93', '男', '22', '5');
INSERT INTO `student` VALUES ('99', '94', '94', 'student94', '女', '22', '5');
INSERT INTO `student` VALUES ('100', '95', '95', 'student95', '男', '22', '5');
INSERT INTO `student` VALUES ('101', '96', '96', 'student96', '女', '22', '5');
INSERT INTO `student` VALUES ('102', '97', '97', 'student97', '男', '22', '5');
INSERT INTO `student` VALUES ('103', '98', '98', 'student98', '女', '22', '5');
INSERT INTO `student` VALUES ('104', '99', '99', 'student99', '男', '22', '5');
INSERT INTO `student` VALUES ('105', '100', '100', 'student100', '女', '22', '5');
INSERT INTO `student` VALUES ('106', '101', '101', 'student101', '男', '22', '5');
INSERT INTO `student` VALUES ('107', '102', '102', 'student102', '女', '22', '5');
INSERT INTO `student` VALUES ('108', '103', '103', 'student103', '男', '22', '5');
INSERT INTO `student` VALUES ('109', '104', '104', 'student104', '女', '22', '5');
INSERT INTO `student` VALUES ('110', '105', '105', 'student105', '男', '22', '5');
INSERT INTO `student` VALUES ('111', '106', '106', 'student106', '女', '22', '5');
INSERT INTO `student` VALUES ('112', '107', '107', 'student107', '男', '22', '5');
INSERT INTO `student` VALUES ('113', '108', '108', 'student108', '女', '22', '5');
INSERT INTO `student` VALUES ('114', '109', '109', 'student109', '男', '22', '5');
INSERT INTO `student` VALUES ('115', '110', '110', 'student110', '女', '22', '5');
INSERT INTO `student` VALUES ('116', '111', '111', 'student111', '男', '22', '5');
INSERT INTO `student` VALUES ('117', '112', '112', 'student112', '女', '22', '5');
INSERT INTO `student` VALUES ('118', '113', '113', 'student113', '男', '22', '5');
INSERT INTO `student` VALUES ('119', '114', '114', 'student114', '女', '22', '5');
INSERT INTO `student` VALUES ('120', '115', '115', 'student115', '男', '22', '5');
INSERT INTO `student` VALUES ('121', '116', '116', 'student116', '女', '22', '5');
INSERT INTO `student` VALUES ('122', '117', '117', 'student117', '男', '22', '5');
INSERT INTO `student` VALUES ('123', '118', '118', 'student118', '女', '22', '5');
INSERT INTO `student` VALUES ('124', '119', '119', 'student119', '男', '22', '5');
INSERT INTO `student` VALUES ('125', '120', '120', 'student120', '女', '22', '5');
INSERT INTO `student` VALUES ('126', '121', '121', 'student121', '男', '22', '5');
INSERT INTO `student` VALUES ('127', '122', '122', 'student122', '女', '22', '5');
INSERT INTO `student` VALUES ('128', '123', '123', 'student123', '男', '22', '5');
INSERT INTO `student` VALUES ('129', '124', '124', 'student124', '女', '22', '5');
INSERT INTO `student` VALUES ('130', '125', '125', 'student125', '男', '22', '5');
INSERT INTO `student` VALUES ('131', '126', '126', 'student126', '女', '22', '5');
INSERT INTO `student` VALUES ('132', '127', '127', 'student127', '男', '22', '5');
INSERT INTO `student` VALUES ('133', '128', '128', 'student128', '女', '22', '5');
INSERT INTO `student` VALUES ('134', '129', '129', 'student129', '男', '22', '5');
INSERT INTO `student` VALUES ('135', '130', '130', 'student130', '女', '22', '5');
INSERT INTO `student` VALUES ('136', '131', '131', 'student131', '男', '22', '6');
INSERT INTO `student` VALUES ('137', '132', '132', 'student132', '女', '22', '6');
INSERT INTO `student` VALUES ('138', '133', '133', 'student133', '男', '22', '6');
INSERT INTO `student` VALUES ('139', '134', '134', 'student134', '女', '22', '6');
INSERT INTO `student` VALUES ('140', '135', '135', 'student135', '男', '22', '6');
INSERT INTO `student` VALUES ('141', '136', '136', 'student136', '女', '22', '6');
INSERT INTO `student` VALUES ('142', '137', '137', 'student137', '男', '22', '6');
INSERT INTO `student` VALUES ('143', '138', '138', 'student138', '女', '22', '6');
INSERT INTO `student` VALUES ('144', '139', '139', 'student139', '男', '22', '6');
INSERT INTO `student` VALUES ('145', '140', '140', 'student140', '女', '22', '6');
INSERT INTO `student` VALUES ('146', '141', '141', 'student141', '男', '22', '6');
INSERT INTO `student` VALUES ('147', '142', '142', 'student142', '女', '22', '6');
INSERT INTO `student` VALUES ('148', '143', '143', 'student143', '男', '22', '6');
INSERT INTO `student` VALUES ('149', '144', '144', 'student144', '女', '22', '6');
INSERT INTO `student` VALUES ('150', '145', '145', 'student145', '男', '22', '6');
INSERT INTO `student` VALUES ('151', '146', '146', 'student146', '女', '22', '6');
INSERT INTO `student` VALUES ('152', '147', '147', 'student147', '男', '22', '6');
INSERT INTO `student` VALUES ('153', '148', '148', 'student148', '女', '22', '6');
INSERT INTO `student` VALUES ('154', '149', '149', 'student149', '男', '22', '6');
INSERT INTO `student` VALUES ('155', '150', '150', 'student150', '女', '22', '6');
INSERT INTO `student` VALUES ('156', '151', '151', 'student151', '男', '22', '6');
INSERT INTO `student` VALUES ('157', '152', '152', 'student152', '女', '22', '6');
INSERT INTO `student` VALUES ('158', '153', '153', 'student153', '男', '22', '6');
INSERT INTO `student` VALUES ('159', '154', '154', 'student154', '女', '22', '6');
INSERT INTO `student` VALUES ('160', '155', '155', 'student155', '男', '22', '6');
INSERT INTO `student` VALUES ('161', '156', '156', 'student156', '女', '22', '6');
INSERT INTO `student` VALUES ('162', '157', '157', 'student157', '男', '22', '6');
INSERT INTO `student` VALUES ('163', '158', '158', 'student158', '女', '22', '6');
INSERT INTO `student` VALUES ('164', '159', '159', 'student159', '男', '22', '6');
INSERT INTO `student` VALUES ('165', '160', '160', 'student160', '女', '22', '6');
INSERT INTO `student` VALUES ('166', '161', '161', 'student161', '男', '22', '6');
INSERT INTO `student` VALUES ('167', '162', '162', 'student162', '女', '22', '6');
INSERT INTO `student` VALUES ('168', '163', '163', 'student163', '男', '22', '6');
INSERT INTO `student` VALUES ('169', '164', '164', 'student164', '女', '22', '6');
INSERT INTO `student` VALUES ('170', '165', '165', 'student165', '男', '22', '6');
INSERT INTO `student` VALUES ('171', '166', '166', 'student166', '女', '22', '6');
INSERT INTO `student` VALUES ('172', '167', '167', 'student167', '男', '22', '6');
INSERT INTO `student` VALUES ('173', '168', '168', 'student168', '女', '22', '6');
INSERT INTO `student` VALUES ('174', '169', '169', 'student169', '男', '22', '6');
INSERT INTO `student` VALUES ('175', '170', '170', 'student170', '女', '22', '6');
INSERT INTO `student` VALUES ('176', '171', '171', 'student171', '男', '22', '6');
INSERT INTO `student` VALUES ('177', '172', '172', 'student172', '女', '22', '6');
INSERT INTO `student` VALUES ('178', '173', '173', 'student173', '男', '22', '6');
INSERT INTO `student` VALUES ('179', '174', '174', 'student174', '女', '22', '7');
INSERT INTO `student` VALUES ('180', '175', '175', 'student175', '男', '22', '7');
INSERT INTO `student` VALUES ('181', '176', '176', 'student176', '女', '22', '7');
INSERT INTO `student` VALUES ('182', '177', '177', 'student177', '男', '22', '7');
INSERT INTO `student` VALUES ('183', '178', '178', 'student178', '女', '22', '7');
INSERT INTO `student` VALUES ('184', '179', '179', 'student179', '男', '22', '7');
INSERT INTO `student` VALUES ('185', '180', '180', 'student180', '女', '22', '7');
INSERT INTO `student` VALUES ('186', '181', '181', 'student181', '男', '22', '7');
INSERT INTO `student` VALUES ('187', '182', '182', 'student182', '女', '22', '7');
INSERT INTO `student` VALUES ('188', '183', '183', 'student183', '男', '22', '7');
INSERT INTO `student` VALUES ('189', '184', '184', 'student184', '女', '22', '7');
INSERT INTO `student` VALUES ('190', '185', '185', 'student185', '男', '22', '7');
INSERT INTO `student` VALUES ('191', '186', '186', 'student186', '女', '22', '7');
INSERT INTO `student` VALUES ('192', '187', '187', 'student187', '男', '22', '7');
INSERT INTO `student` VALUES ('193', '188', '188', 'student188', '女', '22', '7');
INSERT INTO `student` VALUES ('194', '189', '189', 'student189', '男', '22', '7');
INSERT INTO `student` VALUES ('195', '190', '190', 'student190', '女', '22', '7');
INSERT INTO `student` VALUES ('196', '191', '191', 'student191', '男', '22', '7');
INSERT INTO `student` VALUES ('197', '192', '192', 'student192', '女', '22', '7');
INSERT INTO `student` VALUES ('198', '193', '193', 'student193', '男', '22', '7');
INSERT INTO `student` VALUES ('199', '194', '194', 'student194', '女', '22', '7');
INSERT INTO `student` VALUES ('200', '195', '195', 'student195', '男', '22', '7');
INSERT INTO `student` VALUES ('201', '196', '196', 'student196', '女', '22', '7');
INSERT INTO `student` VALUES ('202', '197', '197', 'student197', '男', '22', '7');
INSERT INTO `student` VALUES ('203', '198', '198', 'student198', '女', '22', '7');
INSERT INTO `student` VALUES ('204', '199', '199', 'student199', '男', '22', '7');
INSERT INTO `student` VALUES ('205', '200', '200', 'student200', '女', '22', '7');
INSERT INTO `student` VALUES ('206', '201', '201', 'student201', '男', '22', '7');
INSERT INTO `student` VALUES ('207', '202', '202', 'student202', '女', '22', '7');
INSERT INTO `student` VALUES ('208', '203', '203', 'student203', '男', '22', '7');
INSERT INTO `student` VALUES ('209', '204', '204', 'student204', '女', '22', '7');
INSERT INTO `student` VALUES ('210', '205', '205', 'student205', '男', '22', '7');
INSERT INTO `student` VALUES ('211', '206', '206', 'student206', '女', '22', '7');
INSERT INTO `student` VALUES ('212', '207', '207', 'student207', '男', '22', '7');
INSERT INTO `student` VALUES ('213', '208', '208', 'student208', '女', '22', '7');
INSERT INTO `student` VALUES ('214', '209', '209', 'student209', '男', '22', '7');
INSERT INTO `student` VALUES ('215', '210', '210', 'student210', '女', '22', '7');
INSERT INTO `student` VALUES ('216', '211', '211', 'student211', '男', '22', '7');
INSERT INTO `student` VALUES ('217', '212', '212', 'student212', '女', '22', '7');
INSERT INTO `student` VALUES ('218', '213', '213', 'student213', '男', '22', '7');
INSERT INTO `student` VALUES ('219', '214', '214', 'student214', '女', '22', '7');
INSERT INTO `student` VALUES ('220', '215', '215', 'student215', '男', '22', '7');
INSERT INTO `student` VALUES ('221', '216', '216', 'student216', '女', '22', '7');
INSERT INTO `student` VALUES ('222', '217', '217', 'student217', '男', '22', '8');
INSERT INTO `student` VALUES ('223', '218', '218', 'student218', '女', '22', '8');
INSERT INTO `student` VALUES ('224', '219', '219', 'student219', '男', '22', '8');
INSERT INTO `student` VALUES ('225', '220', '220', 'student220', '女', '22', '8');
INSERT INTO `student` VALUES ('226', '221', '221', 'student221', '男', '22', '8');
INSERT INTO `student` VALUES ('227', '222', '222', 'student222', '女', '22', '8');
INSERT INTO `student` VALUES ('228', '223', '223', 'student223', '男', '22', '8');
INSERT INTO `student` VALUES ('229', '224', '224', 'student224', '女', '22', '8');
INSERT INTO `student` VALUES ('230', '225', '225', 'student225', '男', '22', '8');
INSERT INTO `student` VALUES ('231', '226', '226', 'student226', '女', '22', '8');
INSERT INTO `student` VALUES ('232', '227', '227', 'student227', '男', '22', '8');
INSERT INTO `student` VALUES ('233', '228', '228', 'student228', '女', '22', '8');
INSERT INTO `student` VALUES ('234', '229', '229', 'student229', '男', '22', '8');
INSERT INTO `student` VALUES ('235', '230', '230', 'student230', '女', '22', '8');
INSERT INTO `student` VALUES ('236', '231', '231', 'student231', '男', '22', '8');
INSERT INTO `student` VALUES ('237', '232', '232', 'student232', '女', '22', '8');
INSERT INTO `student` VALUES ('238', '233', '233', 'student233', '男', '22', '8');
INSERT INTO `student` VALUES ('239', '234', '234', 'student234', '女', '22', '8');
INSERT INTO `student` VALUES ('240', '235', '235', 'student235', '男', '22', '8');
INSERT INTO `student` VALUES ('241', '236', '236', 'student236', '女', '22', '8');
INSERT INTO `student` VALUES ('242', '237', '237', 'student237', '男', '22', '8');
INSERT INTO `student` VALUES ('243', '238', '238', 'student238', '女', '22', '8');
INSERT INTO `student` VALUES ('244', '239', '239', 'student239', '男', '22', '8');
INSERT INTO `student` VALUES ('245', '240', '240', 'student240', '女', '22', '8');
INSERT INTO `student` VALUES ('246', '241', '241', 'student241', '男', '22', '8');
INSERT INTO `student` VALUES ('247', '242', '242', 'student242', '女', '22', '8');
INSERT INTO `student` VALUES ('248', '243', '243', 'student243', '男', '22', '8');
INSERT INTO `student` VALUES ('249', '244', '244', 'student244', '女', '22', '8');
INSERT INTO `student` VALUES ('250', '245', '245', 'student245', '男', '22', '8');
INSERT INTO `student` VALUES ('251', '246', '246', 'student246', '女', '22', '8');
INSERT INTO `student` VALUES ('252', '247', '247', 'student247', '男', '22', '8');
INSERT INTO `student` VALUES ('253', '248', '248', 'student248', '女', '22', '8');
INSERT INTO `student` VALUES ('254', '249', '249', 'student249', '男', '22', '8');
INSERT INTO `student` VALUES ('255', '250', '250', 'student250', '女', '22', '8');
INSERT INTO `student` VALUES ('256', '251', '251', 'student251', '男', '22', '8');
INSERT INTO `student` VALUES ('257', '252', '252', 'student252', '女', '22', '8');
INSERT INTO `student` VALUES ('258', '253', '253', 'student253', '男', '22', '8');
INSERT INTO `student` VALUES ('259', '254', '254', 'student254', '女', '22', '8');
INSERT INTO `student` VALUES ('260', '255', '255', 'student255', '男', '22', '8');
INSERT INTO `student` VALUES ('261', '256', '256', 'student256', '女', '22', '8');
INSERT INTO `student` VALUES ('262', '257', '257', 'student257', '男', '22', '8');
INSERT INTO `student` VALUES ('263', '258', '258', 'student258', '女', '22', '8');
INSERT INTO `student` VALUES ('264', '259', '259', 'student259', '男', '22', '8');
INSERT INTO `student` VALUES ('265', '260', '260', 'student260', '女', '22', '9');
INSERT INTO `student` VALUES ('266', '261', '261', 'student261', '男', '22', '9');
INSERT INTO `student` VALUES ('267', '262', '262', 'student262', '女', '22', '9');
INSERT INTO `student` VALUES ('268', '263', '263', 'student263', '男', '22', '9');
INSERT INTO `student` VALUES ('269', '264', '264', 'student264', '女', '22', '9');
INSERT INTO `student` VALUES ('270', '265', '265', 'student265', '男', '22', '9');
INSERT INTO `student` VALUES ('271', '266', '266', 'student266', '女', '22', '9');
INSERT INTO `student` VALUES ('272', '267', '267', 'student267', '男', '22', '9');
INSERT INTO `student` VALUES ('273', '268', '268', 'student268', '女', '22', '9');
INSERT INTO `student` VALUES ('274', '269', '269', 'student269', '男', '22', '9');
INSERT INTO `student` VALUES ('275', '270', '270', 'student270', '女', '22', '9');
INSERT INTO `student` VALUES ('276', '271', '271', 'student271', '男', '22', '9');
INSERT INTO `student` VALUES ('277', '272', '272', 'student272', '女', '22', '9');
INSERT INTO `student` VALUES ('278', '273', '273', 'student273', '男', '22', '9');
INSERT INTO `student` VALUES ('279', '274', '274', 'student274', '女', '22', '9');
INSERT INTO `student` VALUES ('280', '275', '275', 'student275', '男', '22', '9');
INSERT INTO `student` VALUES ('281', '276', '276', 'student276', '女', '22', '9');
INSERT INTO `student` VALUES ('282', '277', '277', 'student277', '男', '22', '9');
INSERT INTO `student` VALUES ('283', '278', '278', 'student278', '女', '22', '9');
INSERT INTO `student` VALUES ('284', '279', '279', 'student279', '男', '22', '9');
INSERT INTO `student` VALUES ('285', '280', '280', 'student280', '女', '22', '9');
INSERT INTO `student` VALUES ('286', '281', '281', 'student281', '男', '22', '9');
INSERT INTO `student` VALUES ('287', '282', '282', 'student282', '女', '22', '9');
INSERT INTO `student` VALUES ('288', '283', '283', 'student283', '男', '22', '9');
INSERT INTO `student` VALUES ('289', '284', '284', 'student284', '女', '22', '9');
INSERT INTO `student` VALUES ('290', '285', '285', 'student285', '男', '22', '9');
INSERT INTO `student` VALUES ('291', '286', '286', 'student286', '女', '22', '9');
INSERT INTO `student` VALUES ('292', '287', '287', 'student287', '男', '22', '9');
INSERT INTO `student` VALUES ('293', '288', '288', 'student288', '女', '22', '9');
INSERT INTO `student` VALUES ('294', '289', '289', 'student289', '男', '22', '9');
INSERT INTO `student` VALUES ('295', '290', '290', 'student290', '女', '22', '9');
INSERT INTO `student` VALUES ('296', '291', '291', 'student291', '男', '22', '9');
INSERT INTO `student` VALUES ('297', '292', '292', 'student292', '女', '22', '9');
INSERT INTO `student` VALUES ('298', '293', '293', 'student293', '男', '22', '9');
INSERT INTO `student` VALUES ('299', '294', '294', 'student294', '女', '22', '9');
INSERT INTO `student` VALUES ('300', '295', '295', 'student295', '男', '22', '9');
INSERT INTO `student` VALUES ('301', '296', '296', 'student296', '女', '22', '9');
INSERT INTO `student` VALUES ('302', '297', '297', 'student297', '男', '22', '9');
INSERT INTO `student` VALUES ('303', '298', '298', 'student298', '女', '22', '9');
INSERT INTO `student` VALUES ('304', '299', '299', 'student299', '男', '22', '9');
INSERT INTO `student` VALUES ('305', '300', '300', 'student300', '女', '22', '9');
INSERT INTO `student` VALUES ('306', '301', '301', 'student301', '男', '22', '9');
INSERT INTO `student` VALUES ('307', '302', '302', 'student302', '女', '22', '9');
INSERT INTO `student` VALUES ('308', '303', '303', 'student303', '男', '22', '10');
INSERT INTO `student` VALUES ('309', '304', '304', 'student304', '女', '22', '10');
INSERT INTO `student` VALUES ('310', '305', '305', 'student305', '男', '22', '10');
INSERT INTO `student` VALUES ('311', '306', '306', 'student306', '女', '22', '10');
INSERT INTO `student` VALUES ('312', '307', '307', 'student307', '男', '22', '10');
INSERT INTO `student` VALUES ('313', '308', '308', 'student308', '女', '22', '10');
INSERT INTO `student` VALUES ('314', '309', '309', 'student309', '男', '22', '10');
INSERT INTO `student` VALUES ('315', '310', '310', 'student310', '女', '22', '10');
INSERT INTO `student` VALUES ('316', '311', '311', 'student311', '男', '22', '10');
INSERT INTO `student` VALUES ('317', '312', '312', 'student312', '女', '22', '10');
INSERT INTO `student` VALUES ('318', '313', '313', 'student313', '男', '22', '10');
INSERT INTO `student` VALUES ('319', '314', '314', 'student314', '女', '22', '10');
INSERT INTO `student` VALUES ('320', '315', '315', 'student315', '男', '22', '10');
INSERT INTO `student` VALUES ('321', '316', '316', 'student316', '女', '22', '10');
INSERT INTO `student` VALUES ('322', '317', '317', 'student317', '男', '22', '10');
INSERT INTO `student` VALUES ('323', '318', '318', 'student318', '女', '22', '10');
INSERT INTO `student` VALUES ('324', '319', '319', 'student319', '男', '22', '10');
INSERT INTO `student` VALUES ('325', '320', '320', 'student320', '女', '22', '10');
INSERT INTO `student` VALUES ('326', '321', '321', 'student321', '男', '22', '10');
INSERT INTO `student` VALUES ('327', '322', '322', 'student322', '女', '22', '10');
INSERT INTO `student` VALUES ('328', '323', '323', 'student323', '男', '22', '10');
INSERT INTO `student` VALUES ('329', '324', '324', 'student324', '女', '22', '10');
INSERT INTO `student` VALUES ('330', '325', '325', 'student325', '男', '22', '10');
INSERT INTO `student` VALUES ('331', '326', '326', 'student326', '女', '22', '10');
INSERT INTO `student` VALUES ('332', '327', '327', 'student327', '男', '22', '10');
INSERT INTO `student` VALUES ('333', '328', '328', 'student328', '女', '22', '10');
INSERT INTO `student` VALUES ('334', '329', '329', 'student329', '男', '22', '10');
INSERT INTO `student` VALUES ('335', '330', '330', 'student330', '女', '22', '10');
INSERT INTO `student` VALUES ('336', '331', '331', 'student331', '男', '22', '10');
INSERT INTO `student` VALUES ('337', '332', '332', 'student332', '女', '22', '10');
INSERT INTO `student` VALUES ('338', '333', '333', 'student333', '男', '22', '10');
INSERT INTO `student` VALUES ('339', '334', '334', 'student334', '女', '22', '10');
INSERT INTO `student` VALUES ('340', '335', '335', 'student335', '男', '22', '10');
INSERT INTO `student` VALUES ('341', '336', '336', 'student336', '女', '22', '10');
INSERT INTO `student` VALUES ('342', '337', '337', 'student337', '男', '22', '10');
INSERT INTO `student` VALUES ('343', '338', '338', 'student338', '女', '22', '10');
INSERT INTO `student` VALUES ('344', '339', '339', 'student339', '男', '22', '10');
INSERT INTO `student` VALUES ('345', '340', '340', 'student340', '女', '22', '10');
INSERT INTO `student` VALUES ('346', '341', '341', 'student341', '男', '22', '10');
INSERT INTO `student` VALUES ('347', '342', '342', 'student342', '女', '22', '10');
INSERT INTO `student` VALUES ('348', '343', '343', 'student343', '男', '22', '10');
INSERT INTO `student` VALUES ('349', '344', '344', 'student344', '女', '22', '10');
INSERT INTO `student` VALUES ('350', '345', '345', 'student345', '男', '22', '10');
INSERT INTO `student` VALUES ('351', '346', '346', 'student346', '女', '22', '11');
INSERT INTO `student` VALUES ('352', '347', '347', 'student347', '男', '22', '11');
INSERT INTO `student` VALUES ('353', '348', '348', 'student348', '女', '22', '11');
INSERT INTO `student` VALUES ('354', '349', '349', 'student349', '男', '22', '11');
INSERT INTO `student` VALUES ('355', '350', '350', 'student350', '女', '22', '11');
INSERT INTO `student` VALUES ('356', '351', '351', 'student351', '男', '22', '11');
INSERT INTO `student` VALUES ('357', '352', '352', 'student352', '女', '22', '11');
INSERT INTO `student` VALUES ('358', '353', '353', 'student353', '男', '22', '11');
INSERT INTO `student` VALUES ('359', '354', '354', 'student354', '女', '22', '11');
INSERT INTO `student` VALUES ('360', '355', '355', 'student355', '男', '22', '11');
INSERT INTO `student` VALUES ('361', '356', '356', 'student356', '女', '22', '11');
INSERT INTO `student` VALUES ('362', '357', '357', 'student357', '男', '22', '11');
INSERT INTO `student` VALUES ('363', '358', '358', 'student358', '女', '22', '11');
INSERT INTO `student` VALUES ('364', '359', '359', 'student359', '男', '22', '11');
INSERT INTO `student` VALUES ('365', '360', '360', 'student360', '女', '22', '11');
INSERT INTO `student` VALUES ('366', '361', '361', 'student361', '男', '22', '11');
INSERT INTO `student` VALUES ('367', '362', '362', 'student362', '女', '22', '11');
INSERT INTO `student` VALUES ('368', '363', '363', 'student363', '男', '22', '11');
INSERT INTO `student` VALUES ('369', '364', '364', 'student364', '女', '22', '11');
INSERT INTO `student` VALUES ('370', '365', '365', 'student365', '男', '22', '11');
INSERT INTO `student` VALUES ('371', '366', '366', 'student366', '女', '22', '11');
INSERT INTO `student` VALUES ('372', '367', '367', 'student367', '男', '22', '11');
INSERT INTO `student` VALUES ('373', '368', '368', 'student368', '女', '22', '11');
INSERT INTO `student` VALUES ('374', '369', '369', 'student369', '男', '22', '11');
INSERT INTO `student` VALUES ('375', '370', '370', 'student370', '女', '22', '11');
INSERT INTO `student` VALUES ('376', '371', '371', 'student371', '男', '22', '11');
INSERT INTO `student` VALUES ('377', '372', '372', 'student372', '女', '22', '11');
INSERT INTO `student` VALUES ('378', '373', '373', 'student373', '男', '22', '11');
INSERT INTO `student` VALUES ('379', '374', '374', 'student374', '女', '22', '11');
INSERT INTO `student` VALUES ('380', '375', '375', 'student375', '男', '22', '11');
INSERT INTO `student` VALUES ('381', '376', '376', 'student376', '女', '22', '11');
INSERT INTO `student` VALUES ('382', '377', '377', 'student377', '男', '22', '11');
INSERT INTO `student` VALUES ('383', '378', '378', 'student378', '女', '22', '11');
INSERT INTO `student` VALUES ('384', '379', '379', 'student379', '男', '22', '11');
INSERT INTO `student` VALUES ('385', '380', '380', 'student380', '女', '22', '11');
INSERT INTO `student` VALUES ('386', '381', '381', 'student381', '男', '22', '11');
INSERT INTO `student` VALUES ('387', '382', '382', 'student382', '女', '22', '11');
INSERT INTO `student` VALUES ('388', '383', '383', 'student383', '男', '22', '11');
INSERT INTO `student` VALUES ('389', '384', '384', 'student384', '女', '22', '11');
INSERT INTO `student` VALUES ('390', '385', '385', 'student385', '男', '22', '11');
INSERT INTO `student` VALUES ('391', '386', '386', 'student386', '女', '22', '11');
INSERT INTO `student` VALUES ('392', '387', '387', 'student387', '男', '22', '11');
INSERT INTO `student` VALUES ('393', '388', '388', 'student388', '女', '22', '11');
INSERT INTO `student` VALUES ('394', '389', '389', 'student389', '男', '22', '12');
INSERT INTO `student` VALUES ('395', '390', '390', 'student390', '女', '22', '12');
INSERT INTO `student` VALUES ('396', '391', '391', 'student391', '男', '22', '12');
INSERT INTO `student` VALUES ('397', '392', '392', 'student392', '女', '22', '12');
INSERT INTO `student` VALUES ('398', '393', '393', 'student393', '男', '22', '12');
INSERT INTO `student` VALUES ('399', '394', '394', 'student394', '女', '22', '12');
INSERT INTO `student` VALUES ('400', '395', '395', 'student395', '男', '22', '12');
INSERT INTO `student` VALUES ('401', '396', '396', 'student396', '女', '22', '12');
INSERT INTO `student` VALUES ('402', '397', '397', 'student397', '男', '22', '12');
INSERT INTO `student` VALUES ('403', '398', '398', 'student398', '女', '22', '12');
INSERT INTO `student` VALUES ('404', '399', '399', 'student399', '男', '22', '12');
INSERT INTO `student` VALUES ('405', '400', '400', 'student400', '女', '22', '12');
INSERT INTO `student` VALUES ('406', '401', '401', 'student401', '男', '22', '12');
INSERT INTO `student` VALUES ('407', '402', '402', 'student402', '女', '22', '12');
INSERT INTO `student` VALUES ('408', '403', '403', 'student403', '男', '22', '12');
INSERT INTO `student` VALUES ('409', '404', '404', 'student404', '女', '22', '12');
INSERT INTO `student` VALUES ('410', '405', '405', 'student405', '男', '22', '12');
INSERT INTO `student` VALUES ('411', '406', '406', 'student406', '女', '22', '12');
INSERT INTO `student` VALUES ('412', '407', '407', 'student407', '男', '22', '12');
INSERT INTO `student` VALUES ('413', '408', '408', 'student408', '女', '22', '12');
INSERT INTO `student` VALUES ('414', '409', '409', 'student409', '男', '22', '12');
INSERT INTO `student` VALUES ('415', '410', '410', 'student410', '女', '22', '12');
INSERT INTO `student` VALUES ('416', '411', '411', 'student411', '男', '22', '12');
INSERT INTO `student` VALUES ('417', '412', '412', 'student412', '女', '22', '12');
INSERT INTO `student` VALUES ('418', '413', '413', 'student413', '男', '22', '12');
INSERT INTO `student` VALUES ('419', '414', '414', 'student414', '女', '22', '12');
INSERT INTO `student` VALUES ('420', '415', '415', 'student415', '男', '22', '12');
INSERT INTO `student` VALUES ('421', '416', '416', 'student416', '女', '22', '12');
INSERT INTO `student` VALUES ('422', '417', '417', 'student417', '男', '22', '12');
INSERT INTO `student` VALUES ('423', '418', '418', 'student418', '女', '22', '12');
INSERT INTO `student` VALUES ('424', '419', '419', 'student419', '男', '22', '12');
INSERT INTO `student` VALUES ('425', '420', '420', 'student420', '女', '22', '12');
INSERT INTO `student` VALUES ('426', '421', '421', 'student421', '男', '22', '12');
INSERT INTO `student` VALUES ('427', '422', '422', 'student422', '女', '22', '12');
INSERT INTO `student` VALUES ('428', '423', '423', 'student423', '男', '22', '12');
INSERT INTO `student` VALUES ('429', '424', '424', 'student424', '女', '22', '12');
INSERT INTO `student` VALUES ('430', '425', '425', 'student425', '男', '22', '12');
INSERT INTO `student` VALUES ('431', '426', '426', 'student426', '女', '22', '12');
INSERT INTO `student` VALUES ('432', '427', '427', 'student427', '男', '22', '12');
INSERT INTO `student` VALUES ('433', '428', '428', 'student428', '女', '22', '12');
INSERT INTO `student` VALUES ('434', '429', '429', 'student429', '男', '22', '12');
INSERT INTO `student` VALUES ('435', '430', '430', 'student430', '女', '22', '12');
INSERT INTO `student` VALUES ('436', '431', '431', 'student431', '男', '22', '12');
INSERT INTO `student` VALUES ('437', '432', '432', 'student432', '女', '22', '13');
INSERT INTO `student` VALUES ('438', '433', '433', 'student433', '男', '22', '13');
INSERT INTO `student` VALUES ('439', '434', '434', 'student434', '女', '22', '13');
INSERT INTO `student` VALUES ('440', '435', '435', 'student435', '男', '22', '13');
INSERT INTO `student` VALUES ('441', '436', '436', 'student436', '女', '22', '13');
INSERT INTO `student` VALUES ('442', '437', '437', 'student437', '男', '22', '13');
INSERT INTO `student` VALUES ('443', '438', '438', 'student438', '女', '22', '13');
INSERT INTO `student` VALUES ('444', '439', '439', 'student439', '男', '22', '13');
INSERT INTO `student` VALUES ('445', '440', '440', 'student440', '女', '22', '13');
INSERT INTO `student` VALUES ('446', '441', '441', 'student441', '男', '22', '13');
INSERT INTO `student` VALUES ('447', '442', '442', 'student442', '女', '22', '13');
INSERT INTO `student` VALUES ('448', '443', '443', 'student443', '男', '22', '13');
INSERT INTO `student` VALUES ('449', '444', '444', 'student444', '女', '22', '13');
INSERT INTO `student` VALUES ('450', '445', '445', 'student445', '男', '22', '13');
INSERT INTO `student` VALUES ('451', '446', '446', 'student446', '女', '22', '13');
INSERT INTO `student` VALUES ('452', '447', '447', 'student447', '男', '22', '13');
INSERT INTO `student` VALUES ('453', '448', '448', 'student448', '女', '22', '13');
INSERT INTO `student` VALUES ('454', '449', '449', 'student449', '男', '22', '13');
INSERT INTO `student` VALUES ('455', '450', '450', 'student450', '女', '22', '13');
INSERT INTO `student` VALUES ('456', '451', '451', 'student451', '男', '22', '13');
INSERT INTO `student` VALUES ('457', '452', '452', 'student452', '女', '22', '13');
INSERT INTO `student` VALUES ('458', '453', '453', 'student453', '男', '22', '13');
INSERT INTO `student` VALUES ('459', '454', '454', 'student454', '女', '22', '13');
INSERT INTO `student` VALUES ('460', '455', '455', 'student455', '男', '22', '13');
INSERT INTO `student` VALUES ('461', '456', '456', 'student456', '女', '22', '13');
INSERT INTO `student` VALUES ('462', '457', '457', 'student457', '男', '22', '13');
INSERT INTO `student` VALUES ('463', '458', '458', 'student458', '女', '22', '13');
INSERT INTO `student` VALUES ('464', '459', '459', 'student459', '男', '22', '13');
INSERT INTO `student` VALUES ('465', '460', '460', 'student460', '女', '22', '13');
INSERT INTO `student` VALUES ('466', '461', '461', 'student461', '男', '22', '13');
INSERT INTO `student` VALUES ('467', '462', '462', 'student462', '女', '22', '13');
INSERT INTO `student` VALUES ('468', '463', '463', 'student463', '男', '22', '13');
INSERT INTO `student` VALUES ('469', '464', '464', 'student464', '女', '22', '13');
INSERT INTO `student` VALUES ('470', '465', '465', 'student465', '男', '22', '13');
INSERT INTO `student` VALUES ('471', '466', '466', 'student466', '女', '22', '13');
INSERT INTO `student` VALUES ('472', '467', '467', 'student467', '男', '22', '13');
INSERT INTO `student` VALUES ('473', '468', '468', 'student468', '女', '22', '13');
INSERT INTO `student` VALUES ('474', '469', '469', 'student469', '男', '22', '13');
INSERT INTO `student` VALUES ('475', '470', '470', 'student470', '女', '22', '13');
INSERT INTO `student` VALUES ('476', '471', '471', 'student471', '男', '22', '13');
INSERT INTO `student` VALUES ('477', '472', '472', 'student472', '女', '22', '13');
INSERT INTO `student` VALUES ('478', '473', '473', 'student473', '男', '22', '13');
INSERT INTO `student` VALUES ('479', '474', '474', 'student474', '女', '22', '13');
INSERT INTO `student` VALUES ('480', '475', '475', 'student475', '男', '22', '14');
INSERT INTO `student` VALUES ('481', '476', '476', 'student476', '女', '22', '14');
INSERT INTO `student` VALUES ('482', '477', '477', 'student477', '男', '22', '14');
INSERT INTO `student` VALUES ('483', '478', '478', 'student478', '女', '22', '14');
INSERT INTO `student` VALUES ('484', '479', '479', 'student479', '男', '22', '14');
INSERT INTO `student` VALUES ('485', '480', '480', 'student480', '女', '22', '14');
INSERT INTO `student` VALUES ('486', '481', '481', 'student481', '男', '22', '14');
INSERT INTO `student` VALUES ('487', '482', '482', 'student482', '女', '22', '14');
INSERT INTO `student` VALUES ('488', '483', '483', 'student483', '男', '22', '14');
INSERT INTO `student` VALUES ('489', '484', '484', 'student484', '女', '22', '14');
INSERT INTO `student` VALUES ('490', '485', '485', 'student485', '男', '22', '14');
INSERT INTO `student` VALUES ('491', '486', '486', 'student486', '女', '22', '14');
INSERT INTO `student` VALUES ('492', '487', '487', 'student487', '男', '22', '14');
INSERT INTO `student` VALUES ('493', '488', '488', 'student488', '女', '22', '14');
INSERT INTO `student` VALUES ('494', '489', '489', 'student489', '男', '22', '14');
INSERT INTO `student` VALUES ('495', '490', '490', 'student490', '女', '22', '14');
INSERT INTO `student` VALUES ('496', '491', '491', 'student491', '男', '22', '14');
INSERT INTO `student` VALUES ('497', '492', '492', 'student492', '女', '22', '14');
INSERT INTO `student` VALUES ('498', '493', '493', 'student493', '男', '22', '14');
INSERT INTO `student` VALUES ('499', '494', '494', 'student494', '女', '22', '14');
INSERT INTO `student` VALUES ('500', '495', '495', 'student495', '男', '22', '14');
INSERT INTO `student` VALUES ('501', '496', '496', 'student496', '女', '22', '14');
INSERT INTO `student` VALUES ('502', '497', '497', 'student497', '男', '22', '14');
INSERT INTO `student` VALUES ('503', '498', '498', 'student498', '女', '22', '14');
INSERT INTO `student` VALUES ('504', '499', '499', 'student499', '男', '22', '14');
INSERT INTO `student` VALUES ('505', '500', '500', 'student500', '女', '22', '14');
INSERT INTO `student` VALUES ('506', '501', '501', 'student501', '男', '22', '14');
INSERT INTO `student` VALUES ('507', '502', '502', 'student502', '女', '22', '14');
INSERT INTO `student` VALUES ('508', '503', '503', 'student503', '男', '22', '14');
INSERT INTO `student` VALUES ('509', '504', '504', 'student504', '女', '22', '14');
INSERT INTO `student` VALUES ('510', '505', '505', 'student505', '男', '22', '14');
INSERT INTO `student` VALUES ('511', '506', '506', 'student506', '女', '22', '14');
INSERT INTO `student` VALUES ('512', '507', '507', 'student507', '男', '22', '14');
INSERT INTO `student` VALUES ('513', '508', '508', 'student508', '女', '22', '14');
INSERT INTO `student` VALUES ('514', '509', '509', 'student509', '男', '22', '14');
INSERT INTO `student` VALUES ('515', '510', '510', 'student510', '女', '22', '14');
INSERT INTO `student` VALUES ('516', '511', '511', 'student511', '男', '22', '14');
INSERT INTO `student` VALUES ('517', '512', '512', 'student512', '女', '22', '14');
INSERT INTO `student` VALUES ('518', '513', '513', 'student513', '男', '22', '14');
INSERT INTO `student` VALUES ('519', '514', '514', 'student514', '女', '22', '14');
INSERT INTO `student` VALUES ('520', '515', '515', 'student515', '男', '22', '14');
INSERT INTO `student` VALUES ('521', '516', '516', 'student516', '女', '22', '14');
INSERT INTO `student` VALUES ('522', '517', '517', 'student517', '男', '22', '14');
INSERT INTO `student` VALUES ('523', '518', '518', 'student518', '女', '22', '15');
INSERT INTO `student` VALUES ('524', '519', '519', 'student519', '男', '22', '15');
INSERT INTO `student` VALUES ('525', '520', '520', 'student520', '女', '22', '15');
INSERT INTO `student` VALUES ('526', '521', '521', 'student521', '男', '22', '15');
INSERT INTO `student` VALUES ('527', '522', '522', 'student522', '女', '22', '15');
INSERT INTO `student` VALUES ('528', '523', '523', 'student523', '男', '22', '15');
INSERT INTO `student` VALUES ('529', '524', '524', 'student524', '女', '22', '15');
INSERT INTO `student` VALUES ('530', '525', '525', 'student525', '男', '22', '15');
INSERT INTO `student` VALUES ('531', '526', '526', 'student526', '女', '22', '15');
INSERT INTO `student` VALUES ('532', '527', '527', 'student527', '男', '22', '15');
INSERT INTO `student` VALUES ('533', '528', '528', 'student528', '女', '22', '15');
INSERT INTO `student` VALUES ('534', '529', '529', 'student529', '男', '22', '15');
INSERT INTO `student` VALUES ('535', '530', '530', 'student530', '女', '22', '15');
INSERT INTO `student` VALUES ('536', '531', '531', 'student531', '男', '22', '15');
INSERT INTO `student` VALUES ('537', '532', '532', 'student532', '女', '22', '15');
INSERT INTO `student` VALUES ('538', '533', '533', 'student533', '男', '22', '15');
INSERT INTO `student` VALUES ('539', '534', '534', 'student534', '女', '22', '15');
INSERT INTO `student` VALUES ('540', '535', '535', 'student535', '男', '22', '15');
INSERT INTO `student` VALUES ('541', '536', '536', 'student536', '女', '22', '15');
INSERT INTO `student` VALUES ('542', '537', '537', 'student537', '男', '22', '15');
INSERT INTO `student` VALUES ('543', '538', '538', 'student538', '女', '22', '15');
INSERT INTO `student` VALUES ('544', '539', '539', 'student539', '男', '22', '15');
INSERT INTO `student` VALUES ('545', '540', '540', 'student540', '女', '22', '15');
INSERT INTO `student` VALUES ('546', '541', '541', 'student541', '男', '22', '15');
INSERT INTO `student` VALUES ('547', '542', '542', 'student542', '女', '22', '15');
INSERT INTO `student` VALUES ('548', '543', '543', 'student543', '男', '22', '15');
INSERT INTO `student` VALUES ('549', '544', '544', 'student544', '女', '22', '15');
INSERT INTO `student` VALUES ('550', '545', '545', 'student545', '男', '22', '15');
INSERT INTO `student` VALUES ('551', '546', '546', 'student546', '女', '22', '15');
INSERT INTO `student` VALUES ('552', '547', '547', 'student547', '男', '22', '15');
INSERT INTO `student` VALUES ('553', '548', '548', 'student548', '女', '22', '15');
INSERT INTO `student` VALUES ('554', '549', '549', 'student549', '男', '22', '15');
INSERT INTO `student` VALUES ('555', '550', '550', 'student550', '女', '22', '15');
INSERT INTO `student` VALUES ('556', '551', '551', 'student551', '男', '22', '15');
INSERT INTO `student` VALUES ('557', '552', '552', 'student552', '女', '22', '15');
INSERT INTO `student` VALUES ('558', '553', '553', 'student553', '男', '22', '15');
INSERT INTO `student` VALUES ('559', '554', '554', 'student554', '女', '22', '15');
INSERT INTO `student` VALUES ('560', '555', '555', 'student555', '男', '22', '15');
INSERT INTO `student` VALUES ('561', '556', '556', 'student556', '女', '22', '15');
INSERT INTO `student` VALUES ('562', '557', '557', 'student557', '男', '22', '15');
INSERT INTO `student` VALUES ('563', '558', '558', 'student558', '女', '22', '15');
INSERT INTO `student` VALUES ('564', '559', '559', 'student559', '男', '22', '15');
INSERT INTO `student` VALUES ('565', '560', '560', 'student560', '女', '22', '15');
INSERT INTO `student` VALUES ('566', '561', '561', 'student561', '男', '22', '16');
INSERT INTO `student` VALUES ('567', '562', '562', 'student562', '女', '22', '16');
INSERT INTO `student` VALUES ('568', '563', '563', 'student563', '男', '22', '16');
INSERT INTO `student` VALUES ('569', '564', '564', 'student564', '女', '22', '16');
INSERT INTO `student` VALUES ('570', '565', '565', 'student565', '男', '22', '16');
INSERT INTO `student` VALUES ('571', '566', '566', 'student566', '女', '22', '16');
INSERT INTO `student` VALUES ('572', '567', '567', 'student567', '男', '22', '16');
INSERT INTO `student` VALUES ('573', '568', '568', 'student568', '女', '22', '16');
INSERT INTO `student` VALUES ('574', '569', '569', 'student569', '男', '22', '16');
INSERT INTO `student` VALUES ('575', '570', '570', 'student570', '女', '22', '16');
INSERT INTO `student` VALUES ('576', '571', '571', 'student571', '男', '22', '16');
INSERT INTO `student` VALUES ('577', '572', '572', 'student572', '女', '22', '16');
INSERT INTO `student` VALUES ('578', '573', '573', 'student573', '男', '22', '16');
INSERT INTO `student` VALUES ('579', '574', '574', 'student574', '女', '22', '16');
INSERT INTO `student` VALUES ('580', '575', '575', 'student575', '男', '22', '16');
INSERT INTO `student` VALUES ('581', '576', '576', 'student576', '女', '22', '16');
INSERT INTO `student` VALUES ('582', '577', '577', 'student577', '男', '22', '16');
INSERT INTO `student` VALUES ('583', '578', '578', 'student578', '女', '22', '16');
INSERT INTO `student` VALUES ('584', '579', '579', 'student579', '男', '22', '16');
INSERT INTO `student` VALUES ('585', '580', '580', 'student580', '女', '22', '16');
INSERT INTO `student` VALUES ('586', '581', '581', 'student581', '男', '22', '16');
INSERT INTO `student` VALUES ('587', '582', '582', 'student582', '女', '22', '16');
INSERT INTO `student` VALUES ('588', '583', '583', 'student583', '男', '22', '16');
INSERT INTO `student` VALUES ('589', '584', '584', 'student584', '女', '22', '16');
INSERT INTO `student` VALUES ('590', '585', '585', 'student585', '男', '22', '16');
INSERT INTO `student` VALUES ('591', '586', '586', 'student586', '女', '22', '16');
INSERT INTO `student` VALUES ('592', '587', '587', 'student587', '男', '22', '16');
INSERT INTO `student` VALUES ('593', '588', '588', 'student588', '女', '22', '16');
INSERT INTO `student` VALUES ('594', '589', '589', 'student589', '男', '22', '16');
INSERT INTO `student` VALUES ('595', '590', '590', 'student590', '女', '22', '16');
INSERT INTO `student` VALUES ('596', '591', '591', 'student591', '男', '22', '16');
INSERT INTO `student` VALUES ('597', '592', '592', 'student592', '女', '22', '16');
INSERT INTO `student` VALUES ('598', '593', '593', 'student593', '男', '22', '16');
INSERT INTO `student` VALUES ('599', '594', '594', 'student594', '女', '22', '16');
INSERT INTO `student` VALUES ('600', '595', '595', 'student595', '男', '22', '16');
INSERT INTO `student` VALUES ('601', '596', '596', 'student596', '女', '22', '16');
INSERT INTO `student` VALUES ('602', '597', '597', 'student597', '男', '22', '16');
INSERT INTO `student` VALUES ('603', '598', '598', 'student598', '女', '22', '16');
INSERT INTO `student` VALUES ('604', '599', '599', 'student599', '男', '22', '16');
INSERT INTO `student` VALUES ('605', '600', '600', 'student600', '女', '22', '16');
INSERT INTO `student` VALUES ('606', '601', '601', 'student601', '男', '22', '16');
INSERT INTO `student` VALUES ('607', '602', '602', 'student602', '女', '22', '16');
INSERT INTO `student` VALUES ('608', '603', '603', 'student603', '男', '22', '16');
INSERT INTO `student` VALUES ('609', '604', '604', 'student604', '女', '22', '17');
INSERT INTO `student` VALUES ('610', '605', '605', 'student605', '男', '22', '17');
INSERT INTO `student` VALUES ('611', '606', '606', 'student606', '女', '22', '17');
INSERT INTO `student` VALUES ('612', '607', '607', 'student607', '男', '22', '17');
INSERT INTO `student` VALUES ('613', '608', '608', 'student608', '女', '22', '17');
INSERT INTO `student` VALUES ('614', '609', '609', 'student609', '男', '22', '17');
INSERT INTO `student` VALUES ('615', '610', '610', 'student610', '女', '22', '17');
INSERT INTO `student` VALUES ('616', '611', '611', 'student611', '男', '22', '17');
INSERT INTO `student` VALUES ('617', '612', '612', 'student612', '女', '22', '17');
INSERT INTO `student` VALUES ('618', '613', '613', 'student613', '男', '22', '17');
INSERT INTO `student` VALUES ('619', '614', '614', 'student614', '女', '22', '17');
INSERT INTO `student` VALUES ('620', '615', '615', 'student615', '男', '22', '17');
INSERT INTO `student` VALUES ('621', '616', '616', 'student616', '女', '22', '17');
INSERT INTO `student` VALUES ('622', '617', '617', 'student617', '男', '22', '17');
INSERT INTO `student` VALUES ('623', '618', '618', 'student618', '女', '22', '17');
INSERT INTO `student` VALUES ('624', '619', '619', 'student619', '男', '22', '17');
INSERT INTO `student` VALUES ('625', '620', '620', 'student620', '女', '22', '17');
INSERT INTO `student` VALUES ('626', '621', '621', 'student621', '男', '22', '17');
INSERT INTO `student` VALUES ('627', '622', '622', 'student622', '女', '22', '17');
INSERT INTO `student` VALUES ('628', '623', '623', 'student623', '男', '22', '17');
INSERT INTO `student` VALUES ('629', '624', '624', 'student624', '女', '22', '17');
INSERT INTO `student` VALUES ('630', '625', '625', 'student625', '男', '22', '17');
INSERT INTO `student` VALUES ('631', '626', '626', 'student626', '女', '22', '17');
INSERT INTO `student` VALUES ('632', '627', '627', 'student627', '男', '22', '17');
INSERT INTO `student` VALUES ('633', '628', '628', 'student628', '女', '22', '17');
INSERT INTO `student` VALUES ('634', '629', '629', 'student629', '男', '22', '17');
INSERT INTO `student` VALUES ('635', '630', '630', 'student630', '女', '22', '17');
INSERT INTO `student` VALUES ('636', '631', '631', 'student631', '男', '22', '17');
INSERT INTO `student` VALUES ('637', '632', '632', 'student632', '女', '22', '17');
INSERT INTO `student` VALUES ('638', '633', '633', 'student633', '男', '22', '17');
INSERT INTO `student` VALUES ('639', '634', '634', 'student634', '女', '22', '17');
INSERT INTO `student` VALUES ('640', '635', '635', 'student635', '男', '22', '17');
INSERT INTO `student` VALUES ('641', '636', '636', 'student636', '女', '22', '17');
INSERT INTO `student` VALUES ('642', '637', '637', 'student637', '男', '22', '17');
INSERT INTO `student` VALUES ('643', '638', '638', 'student638', '女', '22', '17');
INSERT INTO `student` VALUES ('644', '639', '639', 'student639', '男', '22', '17');
INSERT INTO `student` VALUES ('645', '640', '640', 'student640', '女', '22', '17');
INSERT INTO `student` VALUES ('646', '641', '641', 'student641', '男', '22', '17');
INSERT INTO `student` VALUES ('647', '642', '642', 'student642', '女', '22', '17');
INSERT INTO `student` VALUES ('648', '643', '643', 'student643', '男', '22', '17');
INSERT INTO `student` VALUES ('649', '644', '644', 'student644', '女', '22', '17');
INSERT INTO `student` VALUES ('650', '645', '645', 'student645', '男', '22', '17');
INSERT INTO `student` VALUES ('651', '646', '646', 'student646', '女', '22', '17');
INSERT INTO `student` VALUES ('652', '647', '647', 'student647', '男', '22', '18');
INSERT INTO `student` VALUES ('653', '648', '648', 'student648', '女', '22', '18');
INSERT INTO `student` VALUES ('654', '649', '649', 'student649', '男', '22', '18');
INSERT INTO `student` VALUES ('655', '650', '650', 'student650', '女', '22', '18');
INSERT INTO `student` VALUES ('656', '651', '651', 'student651', '男', '22', '18');
INSERT INTO `student` VALUES ('657', '652', '652', 'student652', '女', '22', '18');
INSERT INTO `student` VALUES ('658', '653', '653', 'student653', '男', '22', '18');
INSERT INTO `student` VALUES ('659', '654', '654', 'student654', '女', '22', '18');
INSERT INTO `student` VALUES ('660', '655', '655', 'student655', '男', '22', '18');
INSERT INTO `student` VALUES ('661', '656', '656', 'student656', '女', '22', '18');
INSERT INTO `student` VALUES ('662', '657', '657', 'student657', '男', '22', '18');
INSERT INTO `student` VALUES ('663', '658', '658', 'student658', '女', '22', '18');
INSERT INTO `student` VALUES ('664', '659', '659', 'student659', '男', '22', '18');
INSERT INTO `student` VALUES ('665', '660', '660', 'student660', '女', '22', '18');
INSERT INTO `student` VALUES ('666', '661', '661', 'student661', '男', '22', '18');
INSERT INTO `student` VALUES ('667', '662', '662', 'student662', '女', '22', '18');
INSERT INTO `student` VALUES ('668', '663', '663', 'student663', '男', '22', '18');
INSERT INTO `student` VALUES ('669', '664', '664', 'student664', '女', '22', '18');
INSERT INTO `student` VALUES ('670', '665', '665', 'student665', '男', '22', '18');
INSERT INTO `student` VALUES ('671', '666', '666', 'student666', '女', '22', '18');
INSERT INTO `student` VALUES ('672', '667', '667', 'student667', '男', '22', '18');
INSERT INTO `student` VALUES ('673', '668', '668', 'student668', '女', '22', '18');
INSERT INTO `student` VALUES ('674', '669', '669', 'student669', '男', '22', '18');
INSERT INTO `student` VALUES ('675', '670', '670', 'student670', '女', '22', '18');
INSERT INTO `student` VALUES ('676', '671', '671', 'student671', '男', '22', '18');
INSERT INTO `student` VALUES ('677', '672', '672', 'student672', '女', '22', '18');
INSERT INTO `student` VALUES ('678', '673', '673', 'student673', '男', '22', '18');
INSERT INTO `student` VALUES ('679', '674', '674', 'student674', '女', '22', '18');
INSERT INTO `student` VALUES ('680', '675', '675', 'student675', '男', '22', '18');
INSERT INTO `student` VALUES ('681', '676', '676', 'student676', '女', '22', '18');
INSERT INTO `student` VALUES ('682', '677', '677', 'student677', '男', '22', '18');
INSERT INTO `student` VALUES ('683', '678', '678', 'student678', '女', '22', '18');
INSERT INTO `student` VALUES ('684', '679', '679', 'student679', '男', '22', '18');
INSERT INTO `student` VALUES ('685', '680', '680', 'student680', '女', '22', '18');
INSERT INTO `student` VALUES ('686', '681', '681', 'student681', '男', '22', '18');
INSERT INTO `student` VALUES ('687', '682', '682', 'student682', '女', '22', '18');
INSERT INTO `student` VALUES ('688', '683', '683', 'student683', '男', '22', '18');
INSERT INTO `student` VALUES ('689', '684', '684', 'student684', '女', '22', '18');
INSERT INTO `student` VALUES ('690', '685', '685', 'student685', '男', '22', '18');
INSERT INTO `student` VALUES ('691', '686', '686', 'student686', '女', '22', '18');
INSERT INTO `student` VALUES ('692', '687', '687', 'student687', '男', '22', '18');
INSERT INTO `student` VALUES ('693', '688', '688', 'student688', '女', '22', '18');
INSERT INTO `student` VALUES ('694', '689', '689', 'student689', '男', '22', '18');
INSERT INTO `student` VALUES ('695', '690', '690', 'student690', '女', '22', '19');
INSERT INTO `student` VALUES ('696', '691', '691', 'student691', '男', '22', '19');
INSERT INTO `student` VALUES ('697', '692', '692', 'student692', '女', '22', '19');
INSERT INTO `student` VALUES ('698', '693', '693', 'student693', '男', '22', '19');
INSERT INTO `student` VALUES ('699', '694', '694', 'student694', '女', '22', '19');
INSERT INTO `student` VALUES ('700', '695', '695', 'student695', '男', '22', '19');
INSERT INTO `student` VALUES ('701', '696', '696', 'student696', '女', '22', '19');
INSERT INTO `student` VALUES ('702', '697', '697', 'student697', '男', '22', '19');
INSERT INTO `student` VALUES ('703', '698', '698', 'student698', '女', '22', '19');
INSERT INTO `student` VALUES ('704', '699', '699', 'student699', '男', '22', '19');
INSERT INTO `student` VALUES ('705', '700', '700', 'student700', '女', '22', '19');
INSERT INTO `student` VALUES ('706', '701', '701', 'student701', '男', '22', '19');
INSERT INTO `student` VALUES ('707', '702', '702', 'student702', '女', '22', '19');
INSERT INTO `student` VALUES ('708', '703', '703', 'student703', '男', '22', '19');
INSERT INTO `student` VALUES ('709', '704', '704', 'student704', '女', '22', '19');
INSERT INTO `student` VALUES ('710', '705', '705', 'student705', '男', '22', '19');
INSERT INTO `student` VALUES ('711', '706', '706', 'student706', '女', '22', '19');
INSERT INTO `student` VALUES ('712', '707', '707', 'student707', '男', '22', '19');
INSERT INTO `student` VALUES ('713', '708', '708', 'student708', '女', '22', '19');
INSERT INTO `student` VALUES ('714', '709', '709', 'student709', '男', '22', '19');
INSERT INTO `student` VALUES ('715', '710', '710', 'student710', '女', '22', '19');
INSERT INTO `student` VALUES ('716', '711', '711', 'student711', '男', '22', '19');
INSERT INTO `student` VALUES ('717', '712', '712', 'student712', '女', '22', '19');
INSERT INTO `student` VALUES ('718', '713', '713', 'student713', '男', '22', '19');
INSERT INTO `student` VALUES ('719', '714', '714', 'student714', '女', '22', '19');
INSERT INTO `student` VALUES ('720', '715', '715', 'student715', '男', '22', '19');
INSERT INTO `student` VALUES ('721', '716', '716', 'student716', '女', '22', '19');
INSERT INTO `student` VALUES ('722', '717', '717', 'student717', '男', '22', '19');
INSERT INTO `student` VALUES ('723', '718', '718', 'student718', '女', '22', '19');
INSERT INTO `student` VALUES ('724', '719', '719', 'student719', '男', '22', '19');
INSERT INTO `student` VALUES ('725', '720', '720', 'student720', '女', '22', '19');
INSERT INTO `student` VALUES ('726', '721', '721', 'student721', '男', '22', '19');
INSERT INTO `student` VALUES ('727', '722', '722', 'student722', '女', '22', '19');
INSERT INTO `student` VALUES ('728', '723', '723', 'student723', '男', '22', '19');
INSERT INTO `student` VALUES ('729', '724', '724', 'student724', '女', '22', '19');
INSERT INTO `student` VALUES ('730', '725', '725', 'student725', '男', '22', '19');
INSERT INTO `student` VALUES ('731', '726', '726', 'student726', '女', '22', '19');
INSERT INTO `student` VALUES ('732', '727', '727', 'student727', '男', '22', '19');
INSERT INTO `student` VALUES ('733', '728', '728', 'student728', '女', '22', '19');
INSERT INTO `student` VALUES ('734', '729', '729', 'student729', '男', '22', '19');
INSERT INTO `student` VALUES ('735', '730', '730', 'student730', '女', '22', '19');
INSERT INTO `student` VALUES ('736', '731', '731', 'student731', '男', '22', '19');
INSERT INTO `student` VALUES ('737', '732', '732', 'student732', '女', '22', '19');
INSERT INTO `student` VALUES ('739', '739', 'wang.kang', 'wangkang', '男', '22', '20');
INSERT INTO `student` VALUES ('740', '740', 'wang.kang', 'wangkang', '男', '22', '20');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `academy` int(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teacher_username_unique` (`username`),
  KEY `teacher_foreignkey_academy` (`academy`),
  CONSTRAINT `teacher_foreignkey_academy` FOREIGN KEY (`academy`) REFERENCES `academy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '100001', '1', 'wangkang', '1', '1889537XXXX', '男12栋426');
INSERT INTO `teacher` VALUES ('2', '2', '2', 'wang', '1', '1889537XXXX', '男12#426');
INSERT INTO `teacher` VALUES ('3', '100003', '3', '教师3', '2', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('4', '100004', '4', '教师4', '3', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('5', '100005', '5', '教师5', '4', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('6', '100006', '6', '教师6', '5', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('7', '100007', '7', '教师7', '6', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('8', '100008', '8', '教师8', '7', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('9', '100009', '9', '教师9', '8', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('10', '100010', '10', '教师10', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('11', '100011', '11', '教师11', '2', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('12', '100012', '12', '教师12', '3', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('13', '100013', '13', '教师13', '4', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('14', '100014', '14', '教师14', '5', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('15', '100015', '15', '教师15', '6', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('16', '100016', '16', '教师16', '7', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('17', '100017', '17', '教师17', '8', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('18', '100018', '18', '教师18', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('19', '100019', '19', '教师19', '2', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('20', '100020', '20', '教师20', '3', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('21', '100021', '21', '教师21', '4', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('22', '100022', '22', '教师22', '5', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('23', '100023', '23', '教师23', '6', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('24', '100024', '24', '教师24', '7', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('25', '100025', '25', '教师25', '8', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('26', '100026', '26', '教师26', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('27', '100027', '27', '教师27', '2', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('28', '100028', '28', '教师28', '3', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('29', '100029', '29', '教师29', '4', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('30', '100030', '30', '教师30', '5', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('31', '100031', '31', '教师31', '6', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('32', '100032', '32', '教师32', '7', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('33', '100033', '33', '教师33', '8', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('34', '100034', '34', '教师34', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('35', '100035', '35', '教师35', '2', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('36', '100036', '36', '教师36', '3', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('37', '100037', '37', '教师37', '4', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('38', '100038', '38', '教师38', '5', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('39', '100039', '39', '教师39', '6', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('40', '100040', '40', '教师40', '7', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('41', '100041', '41', '教师41', '8', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('42', '100042', '42', '教师42', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('43', '100043', '43', '教师43', '2', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('44', '100044', '44', '教师44', '3', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('45', '100045', '45', '教师45', '4', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('46', '100046', '46', '教师46', '5', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('47', '100047', '47', '教师47', '6', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('48', '100048', '48', '教师48', '7', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('49', '100049', '49', '教师49', '8', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('50', '100050', '50', '教师50', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('51', '100051', '51', '教师51', '2', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('52', '100052', '52', '教师52', '3', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('53', '100053', '53', '教师53', '4', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('54', '100054', '54', '教师54', '5', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('55', '100055', '55', '教师55', '6', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('56', '100056', '56', '教师56', '7', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('57', '100057', '57', '教师57', '8', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('58', '100058', '58', '教师58', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('59', '100059', '59', '教师59', '2', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('60', '100060', '60', '教师60', '3', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('61', '100061', '61', '教师61', '4', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('62', '100062', '62', '教师62', '5', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('63', '100063', '63', '教师63', '6', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('64', '100064', '64', '教师64', '7', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('65', '100065', '65', '教师65', '8', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('66', '100066', '66', '教师66', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('67', '100067', '67', '教师67', '2', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('68', '100068', '68', '教师68', '3', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('69', '100069', '69', '教师69', '4', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('70', '100070', '70', '教师70', '5', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('71', '100071', '71', '教师71', '6', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('72', '100072', '72', '教师72', '7', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('73', '100073', '73', '教师73', '8', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('74', '100074', '74', '教师74', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('75', '100075', '75', '教师75', '2', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('76', '100076', '76', '教师76', '3', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('77', '100077', '77', '教师77', '4', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('78', '100078', '78', '教师78', '5', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('79', '100079', '79', '教师79', '6', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('80', '100080', '80', '教师80', '7', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('81', '100081', '81', '教师81', '8', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('82', '100082', '82', '教师82', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('83', '100083', '83', '教师83', '2', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('84', '100084', '84', '教师84', '3', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('85', '100085', '85', '教师85', '4', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('86', '100086', '86', '教师86', '5', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('87', '100087', '87', '教师87', '6', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('88', '100088', '88', '教师88', '7', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('89', '100089', '89', '教师89', '8', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('90', '100090', '90', '教师90', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('91', '100091', '91', '教师91', '2', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('92', '100092', '92', '教师92', '3', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('93', '100093', '93', '教师93', '4', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('94', '100094', '94', '教师94', '5', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('95', '100095', '95', '教师95', '6', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('96', '100096', '96', '教师96', '7', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('97', '100097', '97', '教师97', '8', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('98', '100098', '98', '教师98', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('99', '100099', '99', '教师99', '2', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('100', '100100', '100', '教师100', '3', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('101', '100101', '101', '教师101', '4', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('103', '100102', '103', '教师102', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('104', '100103', '104', '教师103', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('105', '100104', '105', '教师104', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('106', '100105', '106', '教师105', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('107', '100106', '107', '教师106', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('108', '100107', '108', '教师107', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('109', '100108', '109', '教师108', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('110', '100109', '110', '教师109', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('111', '100110', '111', '教师110', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('112', '100111', '112', '教师111', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('113', '100112', '113', '教师112', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('114', '100113', '114', '教师113', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('115', '100114', '115', '教师114', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('116', '100115', '116', '教师115', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('117', '100116', '117', '教师116', '1', '1889537XXXX', '.......');
INSERT INTO `teacher` VALUES ('118', '100118', '118', '教师118', '1', '1889537XXXX', '......');
INSERT INTO `teacher` VALUES ('119', '100119', '119', '教师119', '1', '1889537XXXX', '......');
INSERT INTO `teacher` VALUES ('120', '100120', 'wang.kang', 'kangkang', '1', '12345678910', '...');

-- ----------------------------
-- Table structure for teachingclass
-- ----------------------------
DROP TABLE IF EXISTS `teachingclass`;
CREATE TABLE `teachingclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course` int(255) DEFAULT NULL,
  `teacher` int(255) DEFAULT NULL,
  `start` int(255) DEFAULT NULL,
  `end` int(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `term` int(255) DEFAULT NULL,
  `cnt` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `toTeahcer` (`teacher`),
  CONSTRAINT `toTeahcer` FOREIGN KEY (`teacher`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teachingclass
-- ----------------------------
INSERT INTO `teachingclass` VALUES ('204', '2', '48', '1', '16', '87', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('205', '2', '40', '1', '16', '87', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('206', '4', '57', '1', '16', '87', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('207', '4', '33', '1', '16', '87', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('208', '7', '75', '1', '16', '87', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('209', '7', '19', '1', '16', '87', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('210', '14', '114', '1', '16', '87', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('211', '14', '104', '1', '16', '87', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('212', '15', '98', '1', '16', '87', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('213', '15', '26', '1', '16', '87', '2018', '1', '1');
INSERT INTO `teachingclass` VALUES ('214', '21', '105', '1', '16', '87', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('215', '21', '42', '1', '16', '87', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('216', '36', '49', '1', '16', '87', '2018', '1', '2');
INSERT INTO `teachingclass` VALUES ('217', '36', '41', '1', '16', '87', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('218', '24', '34', '1', '16', '67', '2018', '1', '2');
INSERT INTO `teachingclass` VALUES ('219', '24', '98', '1', '16', '67', '2018', '1', '1');
INSERT INTO `teachingclass` VALUES ('220', '47', '113', '1', '16', '67', '2018', '1', '2');
INSERT INTO `teachingclass` VALUES ('221', '47', '107', '1', '16', '67', '2018', '1', '1');
INSERT INTO `teachingclass` VALUES ('222', '48', '109', '1', '16', '67', '2018', '1', '2');
INSERT INTO `teachingclass` VALUES ('223', '48', '74', '1', '16', '67', '2018', '1', '1');
INSERT INTO `teachingclass` VALUES ('224', '22', '103', '1', '16', '65', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('225', '22', '103', '1', '16', '65', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('226', '28', '64', '1', '16', '65', '2018', '1', '1');
INSERT INTO `teachingclass` VALUES ('227', '28', '56', '1', '16', '65', '2018', '1', '1');
INSERT INTO `teachingclass` VALUES ('228', '34', '80', '1', '16', '65', '2018', '1', '1');
INSERT INTO `teachingclass` VALUES ('229', '34', '80', '1', '16', '65', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('230', '46', '108', '1', '16', '90', '2018', '1', '3');
INSERT INTO `teachingclass` VALUES ('231', '50', '50', '1', '16', '90', '2018', '1', '3');
INSERT INTO `teachingclass` VALUES ('232', '8', '91', '1', '16', '87', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('233', '10', '88', '1', '16', '87', '2018', '1', '2');
INSERT INTO `teachingclass` VALUES ('234', '35', '83', '1', '16', '87', '2018', '1', '1');
INSERT INTO `teachingclass` VALUES ('235', '42', '99', '1', '16', '87', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('236', '44', '90', '1', '16', '87', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('237', '52', '1', '1', '16', '87', '2018', '1', '2');
INSERT INTO `teachingclass` VALUES ('238', '59', '10', '1', '16', '87', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('239', '64', '27', '1', '16', '87', '2018', '1', '1');
INSERT INTO `teachingclass` VALUES ('240', '69', '111', '1', '16', '87', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('241', '6', '110', '1', '16', '44', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('242', '9', '96', '1', '16', '44', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('243', '11', '117', '1', '16', '44', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('244', '20', '116', '1', '16', '44', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('245', '23', '90', '1', '16', '44', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('246', '39', '88', '1', '16', '44', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('247', '43', '115', '1', '16', '44', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('248', '51', '116', '1', '16', '44', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('249', '53', '2', '1', '16', '44', '2018', '1', '1');
INSERT INTO `teachingclass` VALUES ('250', '54', '112', '1', '16', '44', '2018', '1', '1');
INSERT INTO `teachingclass` VALUES ('251', '70', '82', '1', '16', '44', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('252', '72', '106', '1', '16', '44', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('253', '73', '109', '1', '16', '44', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('254', '74', '115', '1', '16', '44', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('255', '75', '32', '1', '16', '44', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('256', '79', '66', '1', '16', '44', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('257', '80', '50', '1', '16', '44', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('258', '84', '106', '1', '16', '44', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('259', '85', '58', '1', '16', '44', '2018', '1', '0');
INSERT INTO `teachingclass` VALUES ('260', '86', '2', '1', '16', '44', '2018', '1', '0');
