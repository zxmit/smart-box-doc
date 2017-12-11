/*
Navicat MySQL Data Transfer

Source Server         : 192.168.0.101_3306
Source Server Version : 50714
Source Host           : 192.168.0.101:3306
Source Database       : smart_box

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-12-12 00:20:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(128) NOT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admins
-- ----------------------------

-- ----------------------------
-- Table structure for bills
-- ----------------------------
DROP TABLE IF EXISTS `bills`;
CREATE TABLE `bills` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(8) DEFAULT NULL COMMENT '用户ID',
  `owner_id` int(8) DEFAULT NULL COMMENT '箱子所有者ID',
  `bill_number` varchar(32) DEFAULT NULL COMMENT '账单号',
  `amount` int(12) DEFAULT NULL COMMENT '账单金额',
  `state` char(2) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bills
-- ----------------------------

-- ----------------------------
-- Table structure for boxes
-- ----------------------------
DROP TABLE IF EXISTS `boxes`;
CREATE TABLE `boxes` (
  `box_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '箱子ID',
  `owner_id` int(8) DEFAULT NULL COMMENT '购买',
  `type_id` int(8) NOT NULL COMMENT '储物柜型号ID',
  `purchase_date` datetime DEFAULT NULL,
  `state` char(2) DEFAULT NULL COMMENT '储物柜状态，备用',
  PRIMARY KEY (`box_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of boxes
-- ----------------------------

-- ----------------------------
-- Table structure for box_type
-- ----------------------------
DROP TABLE IF EXISTS `box_type`;
CREATE TABLE `box_type` (
  `type_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_name` varchar(255) DEFAULT NULL COMMENT '型号编号',
  `cell_num` int(3) NOT NULL COMMENT '该种类型柜子的格子个数',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片链接，备用',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of box_type
-- ----------------------------

-- ----------------------------
-- Table structure for cell_number
-- ----------------------------
DROP TABLE IF EXISTS `cell_number`;
CREATE TABLE `cell_number` (
  `box_type_id` int(8) NOT NULL,
  `cell_num` int(3) NOT NULL,
  `cell_type` varchar(12) NOT NULL COMMENT '格子类型，分为大LARGE 中MEDIUM 小SMALL三种类型',
  `x_length` int(3) DEFAULT NULL,
  `y_length` int(3) DEFAULT NULL,
  `z_length` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cell_number
-- ----------------------------

-- ----------------------------
-- Table structure for owners
-- ----------------------------
DROP TABLE IF EXISTS `owners`;
CREATE TABLE `owners` (
  `owner_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `tel_num` varchar(12) NOT NULL COMMENT '电话号码',
  PRIMARY KEY (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of owners
-- ----------------------------

-- ----------------------------
-- Table structure for price
-- ----------------------------
DROP TABLE IF EXISTS `price`;
CREATE TABLE `price` (
  `price_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '单价ID',
  `box_id` int(8) NOT NULL COMMENT '盒子ID',
  `cell_num` int(8) DEFAULT NULL COMMENT '格子编号',
  `price_per_minute` int(8) DEFAULT NULL COMMENT '每分钟多少钱，单位分',
  `free_time` int(8) DEFAULT NULL COMMENT '存入后免费时长，单位分钟',
  PRIMARY KEY (`price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of price
-- ----------------------------

-- ----------------------------
-- Table structure for store_detail
-- ----------------------------
DROP TABLE IF EXISTS `store_detail`;
CREATE TABLE `store_detail` (
  `detail_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `box_id` int(8) DEFAULT NULL COMMENT '箱子ID',
  `cell_num` int(8) DEFAULT NULL COMMENT '格子编号',
  `store_user_id` int(8) DEFAULT NULL COMMENT '存储方ID',
  `take_user_id` int(8) DEFAULT NULL COMMENT '取货方ID',
  `take_code` varchar(12) DEFAULT NULL COMMENT '取货码',
  `store_date` datetime DEFAULT NULL COMMENT '存储日期',
  `take_date` datetime DEFAULT NULL COMMENT '取货时间',
  `state` char(2) DEFAULT NULL COMMENT '1存放中；2 已取出；3 物品已扣留',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of store_detail
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '用户方ID',
  `wx_id` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `tel_num` varchar(12) DEFAULT NULL COMMENT '电话号码',
  `state` varchar(255) DEFAULT NULL COMMENT '用户状态，备用',
  `statement` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
