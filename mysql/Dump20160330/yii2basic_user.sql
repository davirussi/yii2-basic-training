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

-- Dump completed on 2016-03-30 17:35:17
