-- MySQL dump 10.13  Distrib 5.7.14, for osx10.11 (x86_64)
--
-- Host: localhost    Database: smart_box
-- ------------------------------------------------------
-- Server version	5.7.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(128) NOT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill` (
  `bill_id` int(12) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(8) DEFAULT NULL COMMENT '用户ID',
  `owner_id` int(8) DEFAULT NULL COMMENT '箱子所有者ID',
  `bill_number` varchar(32) DEFAULT NULL COMMENT '账单号',
  `amount` int(12) DEFAULT NULL COMMENT '账单金额',
  `state` char(2) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `box`
--

DROP TABLE IF EXISTS `box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `box` (
  `box_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '箱子ID',
  `owner_id` int(8) DEFAULT NULL COMMENT '购买',
  `purchase_date` datetime DEFAULT NULL,
  `state` char(2) DEFAULT NULL COMMENT '储物柜状态，备用',
  PRIMARY KEY (`box_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `box`
--

LOCK TABLES `box` WRITE;
/*!40000 ALTER TABLE `box` DISABLE KEYS */;
INSERT INTO `box` VALUES (1,1,'2017-12-15 11:19:51','1');
/*!40000 ALTER TABLE `box` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cell`
--

DROP TABLE IF EXISTS `cell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cell` (
  `cell_id` int(8) NOT NULL AUTO_INCREMENT,
  `box_id` int(8) DEFAULT NULL,
  `cell_type` char(2) DEFAULT NULL,
  `cell_num` int(3) DEFAULT NULL,
  `on_use` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`cell_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cell`
--

LOCK TABLES `cell` WRITE;
/*!40000 ALTER TABLE `cell` DISABLE KEYS */;
INSERT INTO `cell` VALUES (1,1,'3',1,0),(2,1,'3',2,0),(3,1,'3',3,0),(5,1,'2',4,0),(6,1,'2',5,0),(7,1,'1',6,1);
/*!40000 ALTER TABLE `cell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cell_type`
--

DROP TABLE IF EXISTS `cell_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cell_type` (
  `type_id` int(8) NOT NULL AUTO_INCREMENT,
  `cell_type_name` varchar(8) NOT NULL COMMENT '格子类型，分为大LARGE 中MEDIUM 小SMALL三种类型',
  `x_length` int(3) DEFAULT NULL,
  `y_length` int(3) DEFAULT NULL,
  `z_length` int(3) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cell_type`
--

LOCK TABLES `cell_type` WRITE;
/*!40000 ALTER TABLE `cell_type` DISABLE KEYS */;
INSERT INTO `cell_type` VALUES (1,'BIG',100,200,300),(2,'MEDIUM',80,100,150),(3,'SMALL',50,50,100);
/*!40000 ALTER TABLE `cell_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners`
--

DROP TABLE IF EXISTS `owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owners` (
  `owner_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `tel_num` varchar(12) NOT NULL COMMENT '电话号码',
  PRIMARY KEY (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners`
--

LOCK TABLES `owners` WRITE;
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
INSERT INTO `owners` VALUES (1,'admin','123456','13766537786');
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price` (
  `price_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '单价ID',
  `box_id` int(8) NOT NULL COMMENT '盒子ID',
  `cell_num` int(8) DEFAULT NULL COMMENT '格子编号',
  `price_per_minute` int(8) DEFAULT NULL COMMENT '每分钟多少钱，单位分',
  `free_time` int(8) DEFAULT NULL COMMENT '存入后免费时长，单位分钟',
  PRIMARY KEY (`price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_detail`
--

DROP TABLE IF EXISTS `store_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_detail` (
  `detail_id` varchar(64) NOT NULL COMMENT '主键',
  `cell_id` varchar(64) DEFAULT NULL COMMENT '箱子ID',
  `deliverer_id` varchar(64) DEFAULT NULL COMMENT '存储方ID',
  `receiver_id` varchar(64) DEFAULT NULL COMMENT '取货方ID',
  `take_code` varchar(64) DEFAULT NULL COMMENT '取货码',
  `store_date` datetime DEFAULT NULL COMMENT '存储日期',
  `take_date` datetime DEFAULT NULL COMMENT '取货时间',
  `state` char(2) DEFAULT '1' COMMENT '1存放中；2 已取出；3 物品已扣留；4 取消存放',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_detail`
--

LOCK TABLES `store_detail` WRITE;
/*!40000 ALTER TABLE `store_detail` DISABLE KEYS */;
INSERT INTO `store_detail` VALUES ('1ceca33b-5888-4b1b-8ddd-551b018728e9','3','5c4d4ec3-5d62-4307-bba1-9b845c27a31e','5c4d4ec3-5d62-4307-bba1-9b845c27a31e','EBBE9B348CCD8DD46E397034477BA7D3','2017-12-20 00:00:00',NULL,'2'),('4210648b-0f64-4792-8796-3bda38e13f82','2','5c4d4ec3-5d62-4307-bba1-9b845c27a31e','5c4d4ec3-5d62-4307-bba1-9b845c27a31e','72CA3953B052863CB61C6A3C29E6888D','2017-12-20 00:00:00',NULL,'4'),('80ae266e-e062-430f-b36d-a6c6af3f44ce','1','5c4d4ec3-5d62-4307-bba1-9b845c27a31e','5c4d4ec3-5d62-4307-bba1-9b845c27a31e','0604142F5B9656BC1D571542B55C0820','2017-12-20 00:00:00',NULL,'2');
/*!40000 ALTER TABLE `store_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` varchar(128) NOT NULL COMMENT '用户方ID',
  `wx_id` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `tel_num` varchar(12) DEFAULT NULL COMMENT '电话号码',
  `state` char(2) DEFAULT '0' COMMENT '用户状态，备用',
  `statement` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1','wx0001','13788642649','1',NULL),('5c4d4ec3-5d62-4307-bba1-9b845c27a31e','wx0002','13877645639','1',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-20  1:07:49
