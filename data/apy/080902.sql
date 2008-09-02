-- MySQL dump 10.11
--
-- Host: localhost    Database: apyweb
-- ------------------------------------------------------
-- Server version	5.0.51a-3ubuntu5.1

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
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL auto_increment,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `content_type` varchar(255) default NULL,
  `thumbnail` varchar(255) default NULL,
  `size` int(11) default NULL,
  `tags` varchar(255) default NULL,
  `page_id` int(11) default NULL,
  `description` varchar(255) default NULL,
  `height` int(11) default NULL,
  `filename` varchar(255) default NULL,
  `parent_id` int(11) default NULL,
  `width` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metas`
--

DROP TABLE IF EXISTS `metas`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `metas` (
  `id` int(11) NOT NULL auto_increment,
  `page_id` int(11) default NULL,
  `name` varchar(255) default NULL,
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `metas`
--

LOCK TABLES `metas` WRITE;
/*!40000 ALTER TABLE `metas` DISABLE KEYS */;
INSERT INTO `metas` VALUES (2,3,'color','#DB3D4C'),(4,4,'color','#E36C2D'),(5,5,'color','#D79625'),(6,6,'color','#D2C940'),(9,7,'color','#9FA807'),(10,2,'color','#24419B');
/*!40000 ALTER TABLE `metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `position` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `depth` int(5) default NULL,
  `content` text,
  `mime` varchar(12) default NULL,
  `parent_id` int(11) default NULL,
  `state` varchar(12) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Apy web',1,'2008-09-01 14:50:14','2008-09-01 14:59:42',0,'','',NULL,'locked'),(2,'APY',1,'2008-09-01 17:05:10','2008-09-02 18:48:28',1,'h1. Apy - solidaridad en acción\r\n\r\nApy, solidariad en acción; tiene el carácter de ONGD, sin ánimo de lucro, se funda el 3 de Julio de 1.992 con un número de socios de 281, fijándose posteriormente como domicilio de su sede la Avda. República de China nº34, local 2 en Sevilla C.P. 41020, siendo nombrado como su Presidente, D. Manuel Martínez Ocón.\r\n\r\n\r\nFines y Actividades:\r\n\r\n* Promover proyectos de cooperación en los siguientes términos:\r\n** Proyectos de desarrollo en materia socio-económica: infraestructuras, asistencia técnica, capacitación.\r\n** Proyectos de desrrollo en materia sanitaria: asistencia médica, material sanitario, formación y educación para la salud.\r\n** Proyectos de desarrollo en materia educativa: formación básica, escolarización, alfabetización y fornación técnica.\r\n* Promover proyectos de ayuda humanitaria y de emergencia en aquellos lugares afectados por guerras, conflictos armados, catástrofes naturales, hambrunas y otras situaciones de pobreza, desigualdad y marginación.\r\n* Promover proyectos de educación al desarrollo y sensibilización destinados a promover un cambio de actitud tendente a facilitar la compresión de las relaciones entre los pueblos, las causas y consecuencias de la pobreza y las desiguldades existentes entre el Norte y el Sur, a trabajar con enfoques globales que incluyan el desarrollo humano, la perspectiva de género, la interculturalidad, la paz y los derechos humanos; favorecer la actitud crítica y crear condiciones que permitan cambios sociales según los términos anteriores en los ámbitos individual, comunitario-local e internacional.\r\n* Promover proyectos y acciones relacionadas con el comercio justo, los microcréditos y las redes de econmía alternativa, potenciando el conocimiento de sus orígenes y funcionamiento y acercando la problemática de la economía internacional y la globalización a la población anadaluza.\r\n* Promover proyectos de formación profesional en materias relacionadas con el Desarrollo, destinados a la capacitación, inserción y reciclaje profesional de trabajadores de organizaciones del tercer sector.\r\n* Promover proyectos de acción social fomentando la participación e integración social de personas que se encuentren en situaciones generadoras de marginación y exclusión social dentro del Estado Español, en los siguientes terrenos:\r\n** Proyectos de promoción y participación social en los que se dote a los participantes de habilidades personales y sociales que permitan su integración social.\r\n** Proyectos en materia de educación no formal e integración sociolaboral que contribuyan a la adquisición de conocimientos para su incorporación al mercado laboral.\r\n** Proyectos destinados a la información, divulagación y movilización de recursos sociales existentes, que permitan el acceso, uso y permanencia de los mismos en condiciones de igualdad.\r\n* Promover proyectos de apoyo, formación e inserción de la población inmigrante en España.','apy',1,'published'),(3,'cooperación internacional',2,'2008-09-01 17:07:10','2008-09-02 17:28:32',1,'','',1,'locked'),(4,'acción humanitaria',3,'2008-09-01 17:07:24','2008-09-02 17:28:47',1,'','',1,'locked'),(5,'educación para el desarrollo',4,'2008-09-01 17:07:34','2008-09-02 17:29:09',1,'','',1,'locked'),(6,'acción social',5,'2008-09-01 17:07:42','2008-09-02 17:29:25',1,'','',1,'locked'),(7,'voluntariado',6,'2008-09-01 17:07:49','2008-09-02 17:29:53',1,'','',1,'locked'),(8,'QUIÉNES SOMOS',1,'2008-09-02 17:22:43','2008-09-02 17:22:43',2,NULL,NULL,2,'published'),(9,'PUBLICACIONES',2,'2008-09-02 17:22:58','2008-09-02 17:22:58',2,NULL,NULL,2,'published'),(10,'EXPERTXS',3,'2008-09-02 17:23:04','2008-09-02 17:23:04',2,NULL,NULL,2,'published'),(11,'COMO COLABORAR',4,'2008-09-02 17:23:18','2008-09-02 17:23:18',2,NULL,NULL,2,'locked'),(12,'presentación',1,'2008-09-02 17:23:44','2008-09-02 17:23:44',3,NULL,NULL,8,'published'),(13,'delegaciones',2,'2008-09-02 17:23:51','2008-09-02 17:23:51',3,NULL,NULL,8,'published'),(14,'contacto',3,'2008-09-02 17:23:57','2008-09-02 17:23:57',3,NULL,NULL,8,'published'),(15,'CENTRO AMÉRICA Y CARIBE ',1,'2008-09-02 19:04:22','2008-09-02 19:04:22',2,NULL,NULL,3,'published'),(16,'AMÉRICA DEL SUR',2,'2008-09-02 19:04:40','2008-09-02 19:04:40',2,NULL,NULL,3,'published'),(17,'AFRICA SUBSAHARIANA',3,'2008-09-02 19:04:47','2008-09-02 19:05:29',2,'','',3,'published'),(18,'AREA MEDITERRANEA',4,'2008-09-02 19:04:58','2008-09-02 19:04:58',2,NULL,NULL,3,'published'),(19,'PREVENCIÓN DE DESASTRES',1,'2008-09-02 19:06:32','2008-09-02 19:06:32',2,NULL,NULL,4,'published'),(20,'RESPUESTAS DE EMERGENCIA',2,'2008-09-02 19:06:47','2008-09-02 19:06:47',2,NULL,NULL,4,'published'),(21,'REHABILITACIÓN',3,'2008-09-02 19:07:01','2008-09-02 19:07:01',2,NULL,NULL,4,'published'),(22,'CONSTRUCCIÓN',4,'2008-09-02 19:07:10','2008-09-02 19:07:10',2,NULL,NULL,4,'published');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL auto_increment,
  `page_id` int(11) default NULL,
  `mime` varchar(255) default NULL,
  `data` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_info`
--

DROP TABLE IF EXISTS `schema_info`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `schema_info` (
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `schema_info`
--

LOCK TABLES `schema_info` WRITE;
/*!40000 ALTER TABLE `schema_info` DISABLE KEYS */;
INSERT INTO `schema_info` VALUES (5);
/*!40000 ALTER TABLE `schema_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2008-09-02 17:09:09
