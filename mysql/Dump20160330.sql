CREATE DATABASE  IF NOT EXISTS `yii2basic` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `yii2basic`;
-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: yii2basic
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

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
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('sysadmin','2',1458757586),('user','3',1459184250),('user','4',1458761746),('user','7',1459364152);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('/*',2,NULL,NULL,NULL,1458759160,1458759160),('/country/*',2,NULL,NULL,NULL,1458761768,1458761768),('/post/*',2,NULL,NULL,NULL,1459184281,1459184281),('/post/create',2,NULL,NULL,NULL,1459364880,1459364880),('/post/delete',2,NULL,NULL,NULL,1459364884,1459364884),('/post/index',2,NULL,NULL,NULL,1459364870,1459364870),('/post/update',2,NULL,NULL,NULL,1459364369,1459364369),('/post/view',2,NULL,NULL,NULL,1459364876,1459364876),('/site/*',2,NULL,NULL,NULL,1458759156,1458759156),('permission_admin',2,'Permission to add/setup/modify permissions, roles and roles assignments',NULL,NULL,1458757421,1458757421),('sysadmin',1,'Can do anything in the entire system',NULL,NULL,NULL,1459368523),('teste',1,'tsete',NULL,NULL,1459362316,1459362316),('update_your_post',2,NULL,'authorrule',NULL,1459364430,1459364430),('user',1,'Basic user can do anything that a restricted user can do',NULL,NULL,1458757334,1459364486);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('permission_admin','/*'),('sysadmin','/*'),('user','/country/*'),('user','/post/create'),('user','/post/delete'),('user','/post/index'),('update_your_post','/post/update'),('user','/post/view'),('sysadmin','permission_admin'),('teste','permission_admin'),('user','update_your_post');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
INSERT INTO `auth_rule` VALUES ('authorrule','O:19:\"app\\rbac\\AuthorRule\":3:{s:4:\"name\";s:10:\"authorrule\";s:9:\"createdAt\";i:1459363714;s:9:\"updatedAt\";i:1459363720;}',1459363714,1459363720);
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `code` char(2) NOT NULL,
  `name` char(52) NOT NULL,
  `population` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('AU','Australia',24016400),('BR','Brazil',205722000),('CA','Canada',35985751),('CN','China',1375210000),('DE','Germany',81459000),('FR','France',64513242),('GB','United Kingdom',65097000),('IN','India',1285400000),('RU','Russia',146519759),('US','United States',322976000);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1458650947),('m140209_132017_init',1458651112),('m140403_174025_create_account_table',1458652796),('m140504_113157_update_tables',1458652796),('m140504_130429_create_token_table',1458652796),('m140506_102106_rbac_init',1458752610),('m140830_171933_fix_ip_field',1458652796),('m140830_172703_change_account_table_name',1458652796),('m141222_110026_update_ip_field',1458652796),('m141222_135246_alter_username_length',1458652796),('m150614_103145_update_social_account_table',1458652796),('m150623_212711_fix_username_notnull',1458652796);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `conteudo` text,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`,`userId`),
  KEY `fk_post_user_idx` (`userId`),
  CONSTRAINT `fk_post_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'2','21ef',3),(2,'segundo','conteudo do segundo post',2),(3,'teste','teste',3),(4,'fsad','fasd',2),(5,'testeMarcos','alternado marcos teste',7),(6,'My Post','test',3);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `public_email` varchar(255) DEFAULT NULL,
  `gravatar_email` varchar(255) DEFAULT NULL,
  `gravatar_id` varchar(32) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `bio` text,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (2,'Davi Russi','davirussi@gmail.com','davirussi@gmail.com','b10272778e009c67c3dc32e436623724','Santa Maria','http://www.foo.com','Something about me'),(3,'Marcos Avila','','','d41d8cd98f00b204e9800998ecf8427e','','',''),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_account`
--

DROP TABLE IF EXISTS `social_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `data` text,
  `code` varchar(32) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`provider`,`client_id`),
  UNIQUE KEY `account_unique_code` (`code`),
  KEY `fk_user_account` (`user_id`),
  CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_account`
--

LOCK TABLES `social_account` WRITE;
/*!40000 ALTER TABLE `social_account` DISABLE KEYS */;
INSERT INTO `social_account` VALUES (1,6,'twitter','97679915','{\"id\":97679915,\"id_str\":\"97679915\",\"name\":\"Davi Russi\",\"screen_name\":\"davirussi\",\"location\":\"Santa Maria\",\"description\":\"LoL\",\"url\":null,\"entities\":{\"description\":{\"urls\":[]}},\"protected\":false,\"followers_count\":61,\"friends_count\":46,\"listed_count\":0,\"created_at\":\"Fri Dec 18 14:39:56 +0000 2009\",\"favourites_count\":0,\"utc_offset\":null,\"time_zone\":null,\"geo_enabled\":true,\"verified\":false,\"statuses_count\":90,\"lang\":\"en\",\"status\":{\"created_at\":\"Wed Aug 05 15:23:02 +0000 2015\",\"id\":628949338228715520,\"id_str\":\"628949338228715520\",\"text\":\"RT @smealum: everyone interested in 3DS homebrew should get IRONFALL from the eshop for FREE ! tell all your friends, please RT ! http:\\/\\/t.\\u2026\",\"truncated\":false,\"source\":\"<a href=\\\"http:\\/\\/twitter.com\\\" rel=\\\"nofollow\\\">Twitter Web Client<\\/a>\",\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"geo\":null,\"coordinates\":null,\"place\":null,\"contributors\":null,\"retweeted_status\":{\"created_at\":\"Sat Aug 01 00:59:24 +0000 2015\",\"id\":627282448343171072,\"id_str\":\"627282448343171072\",\"text\":\"everyone interested in 3DS homebrew should get IRONFALL from the eshop for FREE ! tell all your friends, please RT ! http:\\/\\/t.co\\/8xITRNayI3\",\"truncated\":false,\"source\":\"<a href=\\\"http:\\/\\/twitter.com\\/download\\/android\\\" rel=\\\"nofollow\\\">Twitter for Android<\\/a>\",\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"geo\":null,\"coordinates\":null,\"place\":null,\"contributors\":null,\"is_quote_status\":false,\"retweet_count\":1577,\"favorite_count\":882,\"entities\":{\"hashtags\":[],\"symbols\":[],\"user_mentions\":[],\"urls\":[],\"media\":[{\"id\":627282441368002560,\"id_str\":\"627282441368002560\",\"indices\":[117,139],\"media_url\":\"http:\\/\\/pbs.twimg.com\\/media\\/CLSODpOUYAAXwQn.jpg\",\"media_url_https\":\"https:\\/\\/pbs.twimg.com\\/media\\/CLSODpOUYAAXwQn.jpg\",\"url\":\"http:\\/\\/t.co\\/8xITRNayI3\",\"display_url\":\"pic.twitter.com\\/8xITRNayI3\",\"expanded_url\":\"http:\\/\\/twitter.com\\/smealum\\/status\\/627282448343171072\\/photo\\/1\",\"type\":\"photo\",\"sizes\":{\"large\":{\"w\":1024,\"h\":768,\"resize\":\"fit\"},\"thumb\":{\"w\":150,\"h\":150,\"resize\":\"crop\"},\"medium\":{\"w\":600,\"h\":450,\"resize\":\"fit\"},\"small\":{\"w\":340,\"h\":255,\"resize\":\"fit\"}}}]},\"extended_entities\":{\"media\":[{\"id\":627282441368002560,\"id_str\":\"627282441368002560\",\"indices\":[117,139],\"media_url\":\"http:\\/\\/pbs.twimg.com\\/media\\/CLSODpOUYAAXwQn.jpg\",\"media_url_https\":\"https:\\/\\/pbs.twimg.com\\/media\\/CLSODpOUYAAXwQn.jpg\",\"url\":\"http:\\/\\/t.co\\/8xITRNayI3\",\"display_url\":\"pic.twitter.com\\/8xITRNayI3\",\"expanded_url\":\"http:\\/\\/twitter.com\\/smealum\\/status\\/627282448343171072\\/photo\\/1\",\"type\":\"photo\",\"sizes\":{\"large\":{\"w\":1024,\"h\":768,\"resize\":\"fit\"},\"thumb\":{\"w\":150,\"h\":150,\"resize\":\"crop\"},\"medium\":{\"w\":600,\"h\":450,\"resize\":\"fit\"},\"small\":{\"w\":340,\"h\":255,\"resize\":\"fit\"}}}]},\"favorited\":false,\"retweeted\":true,\"possibly_sensitive\":false,\"lang\":\"en\"},\"is_quote_status\":false,\"retweet_count\":1577,\"favorite_count\":0,\"entities\":{\"hashtags\":[],\"symbols\":[],\"user_mentions\":[{\"screen_name\":\"smealum\",\"name\":\"smea\",\"id\":45110535,\"id_str\":\"45110535\",\"indices\":[3,11]}],\"urls\":[],\"media\":[{\"id\":627282441368002560,\"id_str\":\"627282441368002560\",\"indices\":[139,140],\"media_url\":\"http:\\/\\/pbs.twimg.com\\/media\\/CLSODpOUYAAXwQn.jpg\",\"media_url_https\":\"https:\\/\\/pbs.twimg.com\\/media\\/CLSODpOUYAAXwQn.jpg\",\"url\":\"http:\\/\\/t.co\\/8xITRNayI3\",\"display_url\":\"pic.twitter.com\\/8xITRNayI3\",\"expanded_url\":\"http:\\/\\/twitter.com\\/smealum\\/status\\/627282448343171072\\/photo\\/1\",\"type\":\"photo\",\"sizes\":{\"large\":{\"w\":1024,\"h\":768,\"resize\":\"fit\"},\"thumb\":{\"w\":150,\"h\":150,\"resize\":\"crop\"},\"medium\":{\"w\":600,\"h\":450,\"resize\":\"fit\"},\"small\":{\"w\":340,\"h\":255,\"resize\":\"fit\"}},\"source_status_id\":627282448343171072,\"source_status_id_str\":\"627282448343171072\",\"source_user_id\":45110535,\"source_user_id_str\":\"45110535\"}]},\"extended_entities\":{\"media\":[{\"id\":627282441368002560,\"id_str\":\"627282441368002560\",\"indices\":[139,140],\"media_url\":\"http:\\/\\/pbs.twimg.com\\/media\\/CLSODpOUYAAXwQn.jpg\",\"media_url_https\":\"https:\\/\\/pbs.twimg.com\\/media\\/CLSODpOUYAAXwQn.jpg\",\"url\":\"http:\\/\\/t.co\\/8xITRNayI3\",\"display_url\":\"pic.twitter.com\\/8xITRNayI3\",\"expanded_url\":\"http:\\/\\/twitter.com\\/smealum\\/status\\/627282448343171072\\/photo\\/1\",\"type\":\"photo\",\"sizes\":{\"large\":{\"w\":1024,\"h\":768,\"resize\":\"fit\"},\"thumb\":{\"w\":150,\"h\":150,\"resize\":\"crop\"},\"medium\":{\"w\":600,\"h\":450,\"resize\":\"fit\"},\"small\":{\"w\":340,\"h\":255,\"resize\":\"fit\"}},\"source_status_id\":627282448343171072,\"source_status_id_str\":\"627282448343171072\",\"source_user_id\":45110535,\"source_user_id_str\":\"45110535\"}]},\"favorited\":false,\"retweeted\":true,\"possibly_sensitive\":false,\"lang\":\"en\"},\"contributors_enabled\":false,\"is_translator\":false,\"is_translation_enabled\":false,\"profile_background_color\":\"131516\",\"profile_background_image_url\":\"http:\\/\\/abs.twimg.com\\/images\\/themes\\/theme14\\/bg.gif\",\"profile_background_image_url_https\":\"https:\\/\\/abs.twimg.com\\/images\\/themes\\/theme14\\/bg.gif\",\"profile_background_tile\":true,\"profile_image_url\":\"http:\\/\\/pbs.twimg.com\\/profile_images\\/1895276412\\/165124_171983636175055_100000902608740_363819_2714052_n_normal.jpg\",\"profile_image_url_https\":\"https:\\/\\/pbs.twimg.com\\/profile_images\\/1895276412\\/165124_171983636175055_100000902608740_363819_2714052_n_normal.jpg\",\"profile_link_color\":\"009999\",\"profile_sidebar_border_color\":\"EEEEEE\",\"profile_sidebar_fill_color\":\"EFEFEF\",\"profile_text_color\":\"333333\",\"profile_use_background_image\":true,\"has_extended_profile\":false,\"default_profile\":false,\"default_profile_image\":false,\"following\":false,\"follow_request_sent\":false,\"notifications\":false}',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `social_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`),
  CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (2,'5SmbHMUKAoiqXSYWpEsiKCi8jKXVG_Wf',1458656044,1),(3,'qorF3pzS3EUV9wtkYAXaYk3AeI_4lNAV',1458655956,0),(4,'QStj-40bHBAO_-vy64UeTk-O_YG_S7Ac',1458656023,0),(7,'zII5QiPwiV3XOKFvqN-Nacc8xGxzsU6Z',1458667137,0),(8,'4djZvGjuUbfecTB9KfxiHLt1gDMzqPTI',1458667511,0),(10,'1sg232woi2kr9W-aZ5Wj9EFifT0jKpHs',1458667654,0);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `registration_ip` varchar(45) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_email` (`email`),
  UNIQUE KEY `user_unique_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'davirussi','davirussi@gmail.com','$2y$12$bQiJp9EfBS/7A2Lm0pSVMO2UiZ4iyDvKDM.kxuXAa3TmYzyzf3geS','LFiYS-2yH9hDxMnBE4ARLiwa2sySWBTx',1458655709,NULL,NULL,'10','127.0.0.1',1458654430,1458654430,0),(3,'marcos','marcosavilars@gmail.com','$2y$12$/mqTYMlrraAS8Knfh/xaD.1Rkf7Q1Jga9Z3e7kkmjAIF83rNaXu2i','tXivissY0e1rZ2wFEXJw7EXAGw53A8_3',NULL,NULL,NULL,NULL,'127.0.0.1',1458655956,1459257777,0),(4,'admin','davi.russi@gmail.com','$2y$12$b2gQW5TA44onTYRtpKbIcuRLVR7nvIzXqzZxCKmrPT1U3fkDpSf5u','J2s03MffwgGaNbjJWowXumIsKw-w4jjz',NULL,NULL,NULL,NULL,'127.0.0.1',1458656023,1458656023,0),(5,'davir','davir@gmail.com','$2y$12$29Qk4xye3XAOzeN/wew37.2IfaFq2zLqPSZbxSU5noqb3zneduey.','P1br4Zn6pB6xDWRWTD7sS2Q-Nkbn5-rJ',1458664424,NULL,NULL,NULL,'127.0.0.1',1458664424,1458664424,0),(6,'davirus','davirussi@inf.ufsm.br','$2y$12$QX1kfPq3T3X/VUgEZEkd7.TDzgoPD/cYd1T4/o0OuzhShxorSWQHa','0IMqc4kJ1Uaprk5kvXDEC1vmt7vbyQgI',1458664610,NULL,NULL,NULL,'127.0.0.1',1458664610,1458664610,0),(7,'asd','daf@gmail.com','$2y$12$azd0evPrllyu6ZLN3NRZWO5VQsVR7fAGfqvZVy9nDEOXEy7dW6U/S','yL4_RfdlDsZuM8KHztF0Z-J_e2wN4f8u',NULL,NULL,NULL,NULL,'127.0.0.1',1458667137,1458667137,0),(8,'asdf','fasdf@gmail.com','$2y$12$gmYzHaMTnGA/GeDVZ71axu/SXrO8QjStvLNXAyMt0NcYD/6RxNqly','EZV0fB4TIOdLFSr7p3_pNzFlxQ-Ml7YD',NULL,NULL,NULL,NULL,'127.0.0.1',1458667511,1458667511,0),(10,'mvnbmjfgh','mvbnmfgh@gmail.com','$2y$12$ZAHWB8.PPZDCuuyvZElty.9WX9eNBKhwnLBi5sRVC1J2OhfOBSIG.','JsG1mVywZz4tw8SyRc--Sx6vxzvb4zVD',1458673893,NULL,NULL,NULL,'127.0.0.1',1458667654,1458667654,0),(11,'sadaf','asd@gmail.com','$2y$12$2bOGJSEL9Ch1BoymHWENzO7/rNkAN.RSLs33gmnPJCWOaIq0PYMRa','gaurTA7LSeMxplr41KvmKO1ZJqdMV3oQ',1458842106,NULL,NULL,NULL,'127.0.0.1',1458842106,1458842106,0);
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

-- Dump completed on 2016-03-30 17:36:19
