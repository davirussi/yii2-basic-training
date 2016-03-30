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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-30 17:35:17
