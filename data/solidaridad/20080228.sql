-- MySQL dump 10.11
--
-- Host: localhost    Database: calcpages_development
-- ------------------------------------------------------
-- Server version	5.0.45-Debian_1ubuntu3.1-log

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
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL auto_increment,
  `content_type` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  `size` int(11) default NULL,
  `tags` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `parent_id` int(11) default NULL,
  `thumbnail` varchar(255) default NULL,
  `width` int(11) default NULL,
  `height` int(11) default NULL,
  `project_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` VALUES (3,'image/jpeg','efh_wettswil_albis02.jpg',25756,NULL,NULL,NULL,NULL,369,239,1,'2008-02-28 03:00:38','2008-02-28 03:00:38'),(4,'image/jpeg','efh_wettswil_albis02_thumb.jpg',5461,NULL,NULL,3,'thumb',77,50,NULL,'2008-02-28 03:00:38','2008-02-28 03:00:38');
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
CREATE TABLE `contents` (
  `id` int(11) NOT NULL auto_increment,
  `page_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `data` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contents`
--

LOCK TABLES `contents` WRITE;
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` VALUES (1,1,NULL,NULL,'2008-02-27 18:47:53','2008-02-27 18:47:53'),(2,2,NULL,'Hola amigxs:<br><br>esta es la primera prueba de calc-pages, el cms de calc! ;)<br>esto que véis es una <span style=\"font-weight: bold;\">aproximación</span> al interface de apy... es sólo un boceto para que<br>nos vayamos haciendo a la idea<br><br>arriba a la izquierda tenéis los botones para, ver las páginas del proyecto (admin) y para editar esta página (editar)<br><br>si pulsáis editar podréis editar esta misma página. aparecerá un editor de texto donde se puede poner tipos de letra y todas estas cosas, así como añadir imágenes como esta:<br><img src=\"/attachments/0000/0003/efh_wettswil_albis02.jpg\"><br>¿os suena?<br>de momento es todo un poco rudimentario, pero tengo ganas de que lo veáis para que<br><div style=\"margin-left: 80px;\"><ul><li>os hagáis una idea</li><li>vayáis pensando en mejoras, cambios, etcétera</li></ul></div>mi idea es que este cms se pueda usar, tal cual, para la web de solidaridad... a ver si lo conseguimos!<br><br>bueno, compañeros, esto es todo<br>escribidme algo...<br>besos<br><br><br>','2008-02-27 18:50:43','2008-02-28 12:39:21'),(7,7,NULL,'esta es la página de cooperación internacional<br><br>','2008-02-28 12:01:53','2008-02-28 12:02:03'),(8,8,NULL,NULL,'2008-02-28 12:03:08','2008-02-28 12:03:08'),(9,9,NULL,NULL,'2008-02-28 12:03:23','2008-02-28 12:03:23'),(10,10,NULL,NULL,'2008-02-28 12:03:33','2008-02-28 12:03:33'),(11,11,NULL,NULL,'2008-02-28 12:03:58','2008-02-28 12:03:58'),(12,12,NULL,NULL,'2008-02-28 12:04:05','2008-02-28 12:04:05'),(13,13,NULL,NULL,'2008-02-28 12:12:51','2008-02-28 12:12:51'),(14,14,NULL,NULL,'2008-02-28 12:13:02','2008-02-28 12:13:02'),(15,15,NULL,NULL,'2008-02-28 12:14:00','2008-02-28 12:14:00'),(16,16,NULL,NULL,'2008-02-28 12:14:13','2008-02-28 12:14:13'),(17,17,NULL,NULL,'2008-02-28 12:14:26','2008-02-28 12:14:26'),(18,18,NULL,NULL,'2008-02-28 12:14:33','2008-02-28 12:14:33'),(19,19,NULL,NULL,'2008-02-28 12:14:45','2008-02-28 12:14:45'),(20,20,NULL,NULL,'2008-02-28 12:14:51','2008-02-28 12:14:51'),(21,21,NULL,NULL,'2008-02-28 12:14:56','2008-02-28 12:14:56'),(22,22,NULL,NULL,'2008-02-28 12:15:04','2008-02-28 12:15:04'),(23,23,NULL,NULL,'2008-02-28 12:15:14','2008-02-28 12:15:14'),(24,24,NULL,NULL,'2008-02-28 12:15:25','2008-02-28 12:15:25');
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) default NULL,
  `title` varchar(255) NOT NULL,
  `position` int(11) default NULL,
  `depth` int(5) default NULL,
  `state` varchar(12) default NULL,
  `extra` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `project_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,NULL,'asdfasdf',1,0,NULL,NULL,'2008-02-27 18:47:53','2008-02-27 18:47:53',NULL),(2,NULL,'Apy',2,0,'borrador','2F5BA5','2008-02-27 18:50:43','2008-02-28 12:01:24',1),(7,NULL,'cooperación internacional',3,0,'borrador','DB3D4C','2008-02-28 12:01:53','2008-02-28 12:04:39',1),(8,NULL,'acción humanitaria',4,0,'borrador','E36C2D','2008-02-28 12:03:08','2008-02-28 12:04:53',1),(9,NULL,'educación para el desarrollo',5,0,'borrador','D79625','2008-02-28 12:03:23','2008-02-28 12:05:08',1),(10,NULL,'acción social',6,0,'borrador','D2C940','2008-02-28 12:03:33','2008-02-28 12:05:27',1),(11,NULL,'voluntariado',7,0,'borrador','9FA807','2008-02-28 12:03:58','2008-02-28 12:07:44',1),(12,NULL,'contactos',8,0,'borrador','809DCE','2008-02-28 12:04:05','2008-02-28 12:07:59',1),(13,2,'QUIENES SOMOS',1,1,NULL,NULL,'2008-02-28 12:12:51','2008-02-28 12:12:51',1),(14,2,'PUBLICACIONES',2,1,NULL,NULL,'2008-02-28 12:13:02','2008-02-28 12:13:02',1),(15,2,'EXPERT@S',3,1,NULL,NULL,'2008-02-28 12:14:00','2008-02-28 12:14:00',1),(16,13,'presentación',1,2,NULL,NULL,'2008-02-28 12:14:13','2008-02-28 12:14:13',1),(17,13,'delegaciones',2,2,NULL,NULL,'2008-02-28 12:14:26','2008-02-28 12:14:26',1),(18,13,'contactos',3,2,NULL,NULL,'2008-02-28 12:14:33','2008-02-28 12:14:33',1),(19,14,'memorias',1,2,NULL,NULL,'2008-02-28 12:14:45','2008-02-28 12:14:45',1),(20,14,'libros',2,2,NULL,NULL,'2008-02-28 12:14:51','2008-02-28 12:14:51',1),(21,14,'estudios',3,2,NULL,NULL,'2008-02-28 12:14:56','2008-02-28 12:14:56',1),(22,14,'publicaciones',4,2,NULL,NULL,'2008-02-28 12:15:04','2008-02-28 12:15:04',1),(23,15,'cómo colaborar',1,2,NULL,NULL,'2008-02-28 12:15:14','2008-02-28 12:15:14',1),(24,15,'¿quién colabora?',2,2,'borrador','','2008-02-28 12:15:25','2008-02-28 12:15:35',1);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `public_url` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Apy web site','2008-02-27 18:22:55','2008-02-28 12:32:56','/apy'),(2,'calc','2008-02-27 18:31:14','2008-02-27 18:31:14',NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
CREATE TABLE `templates` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `data` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `project_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `templates`
--

LOCK TABLES `templates` WRITE;
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
INSERT INTO `templates` VALUES (1,'default',NULL,'2008-02-27 21:06:27','2008-02-27 21:06:27',1);
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `project_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'danigb@gmail.com','dani',NULL,'2008-02-27 18:31:45','2008-02-27 18:31:45');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2008-02-28 11:41:55
