-- MySQL dump 10.11
--
-- Host: localhost    Database: apyweb
-- ------------------------------------------------------
-- Server version	5.0.32-Debian_7etch6-log

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

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` VALUES (5,'2008-09-03 18:34:42','2008-09-03 18:34:42','image/jpeg',NULL,86593,NULL,23,NULL,446,'ac_hum_peru_02.jpg',NULL,595),(6,'2008-09-03 18:34:42','2008-09-03 18:34:42','image/jpeg','thumb',34370,NULL,NULL,NULL,150,'ac_hum_peru_02_thumb.jpg',5,200),(7,'2008-09-03 18:35:58','2008-09-03 18:35:58','image/jpeg',NULL,84165,NULL,23,NULL,446,'ac_hum_peru_01.jpg',NULL,595),(8,'2008-09-03 18:35:58','2008-09-03 18:35:58','image/jpeg','thumb',32924,NULL,NULL,NULL,150,'ac_hum_peru_01_thumb.jpg',7,200),(13,'2008-09-03 19:00:07','2008-09-03 19:00:07','image/jpeg',NULL,63635,NULL,24,NULL,413,'ac_hum_tambo_de_mora_01.jpg',NULL,550),(14,'2008-09-03 19:00:08','2008-09-03 19:00:08','image/jpeg','thumb',30963,NULL,NULL,NULL,150,'ac_hum_tambo_de_mora_01_thumb.jpg',13,200),(15,'2008-09-03 19:00:19','2008-09-03 19:00:19','image/jpeg',NULL,77212,NULL,24,NULL,413,'ac_hum_tambo_de_mora_02.jpg',NULL,550),(16,'2008-09-03 19:00:19','2008-09-03 19:00:19','image/jpeg','thumb',36032,NULL,NULL,NULL,150,'ac_hum_tambo_de_mora_02_thumb.jpg',15,200),(17,'2008-09-03 19:31:48','2008-09-03 19:31:48','image/jpeg',NULL,48195,NULL,26,NULL,298,'ac_soc_inf_soli_01.jpg',NULL,550),(18,'2008-09-03 19:31:48','2008-09-03 19:31:48','image/jpeg','thumb',41596,NULL,NULL,NULL,150,'ac_soc_inf_soli_01_thumb.jpg',17,277),(21,'2008-09-03 19:35:52','2008-09-03 19:35:52','image/jpeg',NULL,79785,NULL,25,NULL,413,'ac_soc_creciendo_01.jpg',NULL,550),(22,'2008-09-03 19:35:52','2008-09-03 19:35:52','image/jpeg','thumb',35492,NULL,NULL,NULL,150,'ac_soc_creciendo_01_thumb.jpg',21,200),(23,'2008-09-03 19:36:03','2008-09-03 19:36:03','image/jpeg',NULL,87962,NULL,25,NULL,361,'ac_soc_creciendo_02.jpg',NULL,550),(24,'2008-09-03 19:36:03','2008-09-03 19:36:03','image/jpeg','thumb',43062,NULL,NULL,NULL,150,'ac_soc_creciendo_02_thumb.jpg',23,229),(25,'2008-09-03 19:51:12','2008-09-03 19:51:12','image/jpeg',NULL,67690,NULL,26,NULL,433,'ac_soc_inf_soli_02.jpg',NULL,550),(26,'2008-09-03 19:51:12','2008-09-03 19:51:12','image/jpeg','thumb',31219,NULL,NULL,NULL,150,'ac_soc_inf_soli_02_thumb.jpg',25,191),(27,'2008-09-03 19:57:37','2008-09-03 19:57:37','image/jpeg',NULL,75507,NULL,4,NULL,413,'ac_hum_pres_01.jpg',NULL,550),(28,'2008-09-03 19:57:37','2008-09-03 19:57:37','image/jpeg','thumb',32999,NULL,NULL,NULL,150,'ac_hum_pres_01_thumb.jpg',27,200);
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metas`
--

DROP TABLE IF EXISTS `metas`;
CREATE TABLE `metas` (
  `id` int(11) NOT NULL auto_increment,
  `page_id` int(11) default NULL,
  `name` varchar(255) default NULL,
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Apy web',1,'2008-09-01 14:50:14','2008-09-01 14:59:42',0,'','',NULL,'locked'),(2,'APY',1,'2008-09-01 17:05:10','2008-09-02 18:48:28',1,'h1. Apy - solidaridad en acción\r\n\r\nApy, solidariad en acción; tiene el carácter de ONGD, sin ánimo de lucro, se funda el 3 de Julio de 1.992 con un número de socios de 281, fijándose posteriormente como domicilio de su sede la Avda. República de China nº34, local 2 en Sevilla C.P. 41020, siendo nombrado como su Presidente, D. Manuel Martínez Ocón.\r\n\r\n\r\nFines y Actividades:\r\n\r\n* Promover proyectos de cooperación en los siguientes términos:\r\n** Proyectos de desarrollo en materia socio-económica: infraestructuras, asistencia técnica, capacitación.\r\n** Proyectos de desrrollo en materia sanitaria: asistencia médica, material sanitario, formación y educación para la salud.\r\n** Proyectos de desarrollo en materia educativa: formación básica, escolarización, alfabetización y fornación técnica.\r\n* Promover proyectos de ayuda humanitaria y de emergencia en aquellos lugares afectados por guerras, conflictos armados, catástrofes naturales, hambrunas y otras situaciones de pobreza, desigualdad y marginación.\r\n* Promover proyectos de educación al desarrollo y sensibilización destinados a promover un cambio de actitud tendente a facilitar la compresión de las relaciones entre los pueblos, las causas y consecuencias de la pobreza y las desiguldades existentes entre el Norte y el Sur, a trabajar con enfoques globales que incluyan el desarrollo humano, la perspectiva de género, la interculturalidad, la paz y los derechos humanos; favorecer la actitud crítica y crear condiciones que permitan cambios sociales según los términos anteriores en los ámbitos individual, comunitario-local e internacional.\r\n* Promover proyectos y acciones relacionadas con el comercio justo, los microcréditos y las redes de econmía alternativa, potenciando el conocimiento de sus orígenes y funcionamiento y acercando la problemática de la economía internacional y la globalización a la población anadaluza.\r\n* Promover proyectos de formación profesional en materias relacionadas con el Desarrollo, destinados a la capacitación, inserción y reciclaje profesional de trabajadores de organizaciones del tercer sector.\r\n* Promover proyectos de acción social fomentando la participación e integración social de personas que se encuentren en situaciones generadoras de marginación y exclusión social dentro del Estado Español, en los siguientes terrenos:\r\n** Proyectos de promoción y participación social en los que se dote a los participantes de habilidades personales y sociales que permitan su integración social.\r\n** Proyectos en materia de educación no formal e integración sociolaboral que contribuyan a la adquisición de conocimientos para su incorporación al mercado laboral.\r\n** Proyectos destinados a la información, divulagación y movilización de recursos sociales existentes, que permitan el acceso, uso y permanencia de los mismos en condiciones de igualdad.\r\n* Promover proyectos de apoyo, formación e inserción de la población inmigrante en España.','apy',1,'published'),(3,'cooperación internacional',2,'2008-09-01 17:07:10','2008-09-02 17:28:32',1,'','',1,'locked'),(4,'acción humanitaria',3,'2008-09-01 17:07:24','2008-09-03 19:59:13',1,'\r\n!/files/apy/0000/0027/ac_hum_pres_01.jpg!\r\n\r\nLa Fundación para la Cooperación APY-Solidaridad en Acción basa su creación e historia en la respuesta social al conflicto originado en la antigua Yugoslavia. Desde entonces, la asistencia a las victimas de desastres naturales y conflictos armados, ha sido una de las tareas que se ha desarrollado desde la organización. Los Balcanes, Ruanda, el huracán Mitch, entre otros la ayuda humanitaria de emergencia y la reconstrucción han estado muy presentes en el crecimiento y desarrollo de la Fundación.\r\n\r\n\r\nEn el año 2007, se decide estructurar de manera más eficiente esta vocación humanitaria para responder mejor al mandato de la fundación. Es entonces cuando se crea el Área de Acción Humanitaria, con el fin de estructurar una línea de trabajo emanado de los fines fundacionales, que recogen lo siguiente:\r\n\r\n\r\n“La Fundación APY-Solidaridad en Acción tiene entre sus fines…Promover proyectos de cooperación y acción humanitaria, incluyendo la protección de los desplazados y/o refugiados por conflictos, catástrofes naturales o necesidad económica…”\r\n\r\n\r\nEl Área enmarca dentro de sus cometidos cuatro espacios de trabajo bien diferenciados y ligados a su vez. Estos espacios son:\r\n\r\n\r\n* *La prevención de desastres*. En línea con la Estrategia Internacional para la Reducción de Desastres (EIRD) y con en convencimiento que la prevención es el camino indispensable para la reducción de la vulnerabilidad y la mejora de las capacidades locales.\r\n\r\n* *Respuesta de emergencia*. Que comprenden las acciones inmediatas durante o posteriores al desastre, para garantizar el acceso urgente a servicios de salud, alimentación, refugio y agua.\r\n\r\n* *Rehabilitación de servicios esenciales*. Para favorecer el establecimiento de los servicios mínimos esenciales que favorezcan la transición hasta el reestablecimiento de la normalidad en las zonas afectadas.\r\n\r\n* *Reconstrucción*. Con el fin de devolver la autonomía de funcionamiento y gestión a los damnificados por los desastres.\r\n\r\n','',1,'published'),(5,'educación para el desarrollo',4,'2008-09-01 17:07:34','2008-09-02 17:29:09',1,'','',1,'locked'),(6,'acción social',5,'2008-09-01 17:07:42','2008-09-03 19:03:58',1,'Durante el año 2007 APY – Solidaridad en Acción ha trabajado con distintos proyectos sociales, cuya iniciativa busca favorecer a familias que viven en barrios de Sevilla Este, de manera que puedan conjugar su vida laboral y familiar; y que los niños que participan enriquezcan y desarrollo la interacción con chicos de su edad. \r\n\r\nEl colectivo con el que se han  desarrollado las acciones sociales  ha sido principalmente personas residentes de la zona, muchas de ellas en situación de riesgo de exclusión social y de escasos recursos sociales y económicos. Y en mucho de los casos, con familias monoparentales donde la madre es jefa de hogar.\r\n\r\nExiste una importante experiencia con menores y adultos en ésta zona. Se ha venido implementando programas exitosos, entre los cuales se encuentra: Aulas Solidarias I, II y III edición; Creciendo I, II y III edición. \r\n\r\nSe ha consolidado la relación con la Unidad de Trabajo Social de la Zona, siendo este el cuarto año que obtenemos financiación por parte de Ayuntamiento de Sevilla, en la convocatoria “Sevilla Solidaria”, para poner en marcha un servicio de Ludoteca Infantil, señalar que gran parte de la población con la que venimos trabajando en los distintos proyectos es derivaba por parte de los Servicios Sociales de la Zona. \r\n\r\nAsimismo en los proyectos vienen participando otras entidades como REDES, que nos ofrece estudiantes en practicas en el campo de lo social. También seguimos y contamos con Alternativa Abierta, a la que se ofrece la posibilidad de que menores que hayan cometido un delito menor, y por su edad no pueden ingresar en prisión,  puedan desarrollar la prestación de servicio a la comunidad dentro de nuestros proyectos, siempre supervisados por técnicos / as de APY y el propio de Alternativa Abierta.\r\n','',1,'published'),(7,'voluntariado',6,'2008-09-01 17:07:49','2008-09-02 17:29:53',1,'','',1,'locked'),(8,'QUIÉNES SOMOS',1,'2008-09-02 17:22:43','2008-09-02 17:22:43',2,NULL,NULL,2,'published'),(9,'PUBLICACIONES',2,'2008-09-02 17:22:58','2008-09-02 17:22:58',2,NULL,NULL,2,'published'),(10,'EXPERTXS',3,'2008-09-02 17:23:04','2008-09-02 17:23:04',2,NULL,NULL,2,'published'),(11,'COMO COLABORAR',4,'2008-09-02 17:23:18','2008-09-02 17:23:18',2,NULL,NULL,2,'locked'),(12,'presentación',1,'2008-09-02 17:23:44','2008-09-02 17:23:44',3,NULL,NULL,8,'published'),(13,'delegaciones',2,'2008-09-02 17:23:51','2008-09-02 17:23:51',3,NULL,NULL,8,'published'),(14,'contacto',3,'2008-09-02 17:23:57','2008-09-02 17:23:57',3,NULL,NULL,8,'published'),(15,'CENTRO AMÉRICA Y CARIBE ',1,'2008-09-02 19:04:22','2008-09-02 19:04:22',2,NULL,NULL,3,'published'),(16,'AMÉRICA DEL SUR',2,'2008-09-02 19:04:40','2008-09-02 19:04:40',2,NULL,NULL,3,'published'),(17,'AFRICA SUBSAHARIANA',3,'2008-09-02 19:04:47','2008-09-02 19:05:29',2,'','',3,'published'),(18,'AREA MEDITERRANEA',4,'2008-09-02 19:04:58','2008-09-02 19:04:58',2,NULL,NULL,3,'published'),(19,'PREVENCIÓN DE DESASTRES',1,'2008-09-02 19:06:32','2008-09-02 19:06:32',2,NULL,NULL,4,'published'),(20,'RESPUESTAS DE EMERGENCIA',2,'2008-09-02 19:06:47','2008-09-02 19:06:47',2,NULL,NULL,4,'published'),(21,'REHABILITACIÓN',3,'2008-09-02 19:07:01','2008-09-02 19:07:01',2,NULL,NULL,4,'published'),(22,'CONSTRUCCIÓN',4,'2008-09-02 19:07:10','2008-09-02 19:07:10',2,NULL,NULL,4,'published'),(23,'Terremoto Peru 2007',1,'2008-09-03 18:26:16','2008-09-03 20:01:35',3,'*Ayuda de emergencia a los damnificados por el terremoto de Perú de fecha 15 de agosto de 2007: \r\n\r\ndistribución de refugio de emergencia y abrigo / refuerzo de las capacidades locales de gestión de la emergencia*\r\n\r\nEl terremoto sufrido en Perú, con especial fuerza en las regiones de Lima, Ica, Castrovyrreina y Cañete, ha dejado un balance de 60mil familias damnificadas, el recuento de viviendas afectadas es de 6.240 y de casas destruidas de 59.795, según el informe emitido por SINADECI/INDECI.\r\n\r\n!/files/apy/0000/0005/ac_hum_peru_02.jpg!\r\n\r\nEl elevado número de familias damnificadas y viviendas destruidas hizo necesario que las tareas de emergencia, una vez atendidos los heridos y rescatados los cadáveres, se centrasen en proporcionar servicios esenciales a los afectados, entre ellos cobijo de emergencia y abrigo para superar el frío del invierno mientras se abordaba la reconstrucción de las casas.\r\n\r\n!/files/apy/0000/0007/ac_hum_peru_01.jpg!\r\n\r\nEn respuesta a las necesidades de primera emergencia y ayudas solicitadas por el Gobierno de Perú para paliar la situación de los damnificados, se realizó  un envío de Ayuda Humanitaria de Emergencia destinado a la cobertura de dos objetivos:\r\n\r\n\r\nPor un lado, suplir necesidades básicas de refugio y abrigo a 1500 damnificados, especialmente de las zonas rurales y las pequeñas poblaciones más dispersas. La distribución de la ayuda de refugio y abrigo se realizó en las poblaciones afectadas de la región de Ica.\r\n\r\n\r\nY por otro, el fortalecimiento de la capacidad local en la gestión de la emergencia por medio del equipamiento (entrega de kits de gestión de emergencias) y asesoramiento a los Centros de Operaciones de Emergencia (COE) de los Comités locales de Defensa Civil, con el propósito de reforzar la capacidad de respuesta y de esa forma, desempeñar una labor pública más eficiente para el restablecimiento de la normalidad en medio del caos y el dolor.\r\n\r\n\r\n*Contraparte local:* INDECI – Instituto Nacional de Defensa Civil\r\n*Entidad financiadora:* AACID \r\n','',20,'published'),(24,'Tambo Mora',2,'2008-09-03 18:27:23','2008-09-03 20:02:15',3,'h1. Intervención de emergencia en Tambo Mora\r\n\r\nTambo de Mora, pequeño pueblo de pescadores ubicado en la provincia de Chincha, departamento de Ica; fue uno de los distritos más afectados por el terremoto que estremeció el sur del Perú, el 15 de agosto de 2007. El seísmo tuvo una duración aproximada de  210 segundos causó una enorme destrucción en innumerables localidades.\r\n\r\n!/files/apy/0000/0013/ac_hum_tambo_de_mora_01.jpg!\r\n\r\nEste suceso dejó en Tambo de Mora un saldo aproximado de 860 viviendas destruidas, 419 familias afectadas, 853 familias damnificadas, 18 heridos y 5 fallecidos; además de servicios básicos como el agua, saneamiento, luz, sanidad y educación colapsados.\r\n\r\nEl proyecto “Intervención de Emergencia Terremoto 2007 en Tambo de Mora” ha conseguido los siguientes logros:\r\n\r\n* Se han fortalecido las capacidades y habilidades de los miembros del equipo de trabajo, específicamente de aquellos que desempeñaron los roles de promotores locales; estos se encuentran más empoderados, con una mayor capacidad para la resolución de conflictos, cuentan con una variedad de herramientas y estrategias para el trabajo con la población damnificada. Además de ser reconocidos como líderes de su comunidad.\r\n\r\n* 200 familias han encontrado soluciones temporales a sus problemas de vivienda, con la implementación de  módulos de vivienda temporal que les proporciona un alojamiento digno.\r\n\r\n* 585 familias cuentan con kits humanitarios que les proporcionan soluciones de abrigo, lo que les permitieron hacer más llevadera su prolongada permanencia en los módulos de vivienda temporal, carpas o ranchos hasta el momento de ser realojados en viviendas definitivas.\r\n\r\n* Se instalaron 111 letrinas para la mejora del las condiciones de vida de los damnificados.\r\n\r\n* Se ha contribuido a la diversificación y refuerzo de la dieta alimentaria de los niños y niñas, madres gestantes y lactantes de Tambo de Mora, mediante la distribución de diez toneladas de alimentos canalizados a través de las organizaciones del Vaso de Leche del distrito de Tambo de Mora.\r\n\r\n* 200 niños y niñas entre 3 a 13 años han recibido atención psicosocial, a través de los talleres de recuperación emocional y los espacios de juego libre; lo cual les ha permitido volver a su cotidianidad, reafirmar su autoestima, fortalecer sus mecanismos de afrontamiento al stress, mejorar el manejo de impulsos y la expresión de sus emociones, ampliando su red social y mejorando sus habilidades sociales.\r\n\r\n* Se consiguió implementar nueve Grupos de Ayuda Mutua desde donde se brindó soporte y contención emocional, se proporcionó herramientas de afrontamiento ante la nueva situación de la población vive; con lo cual se ha contribuido con la promoción de la salud mental de 135 pobladores de Tambo de Mora.\r\n\r\n!/files/apy/0000/0015/ac_hum_tambo_de_mora_02.jpg!  	\r\n\r\n*Socio local:* ASPEm - Asociación para la Solidaridad con los Países Emergentes\r\n*Entidad financiadora:* AACID  \r\n\r\n\r\n\r\n','',20,'published'),(25,'CRECIENDO III',1,'2008-09-03 19:10:50','2008-09-03 19:46:27',2,'*Creciendo III* se presenta como la tercera edición de un proyecto que se inicia pretendiendo dar respuesta a una serie de necesidades detectadas en Sevilla Este, declarada zona de actuación preferente con graves problemas de tipo social, económico, cultural y sobre todo familiar.\r\n\r\nEsta edición encuadra su marco de actuación en cuatro áreas sobre las que desarrollar el trabajo con menores a través de juegos lúdicos: el medioambiente, la interculturalidad, la animación a la lectura y los hábitos de vida saludable. “Creciendo III” promueve que los niños y familiares compaginen la vida laboral y escolar. Que se aumenten los lazos de unión de los niños con sus compañeros y adquieran habilidades de higiene, autonomía personal y convivencia en su tiempo de ocio.\r\n\r\n!/files/apy/0000/0021/ac_soc_creciendo_01.jpg!\r\n\r\nEl contar con esta ludoteca en la zona, ha posibilitado que por la tarde (de 4 a 8pm), cuando los niños no están en el colegio estén con nosotros, de este modo sus familiares pueden trabajar, mejorando la economía familiar, formarse y así optar a un mejor trabajo. En esta barriada la mayoría de las mujeres se dedican a limpiar por horas y los hombres a la venta ambulante.\r\n\r\n!/files/apy/0000/0023/ac_soc_creciendo_02.jpg!\r\n\r\nLos protagonistas del proyecto son niños de 3 a 8 años, que en vez de estar en la calle,  ocupan sus horas de ocio de forma provechosa. Estos chicos han encontrado un lugar donde reciben cariño y comparten con niños de su edad; se divierten con juegos y talleres, que de forma desenfadada nuestros monitores o educadores les atendemos, inculcándoles valores.\r\n\r\nDentro de las actividades que se desarrollan en las ludotecas  tenemos:\r\n\r\n* “El mar de las promesas”: busca concienciar a los niños que hay parte de su carácter que sería conveniente cambiar.\r\n* “Sigamos nuestras normas”: crear entre el grupo de niños y las monitoras una serie de normas para hacer más fácil la convivencia entre todos.\r\n* “Pon tu huella”: romper la monotonía e intentar que se diviertan y relaciones entre sí.\r\n* “Celebración de San Valentín”: recalcar la importancia de la amistad y enseñar a los niños que hay diversas clases de amor.\r\n* “Fiesta de carnaval”: desarrollar lazos de amistad entre ellos y fomentar que pierdan su timidez y aumenten su sociabilidad.\r\n* “Decora tu marco”: fomentar su interés por las actividades plásticas y manualidades.\r\n* “Crea tu máscara de escayola”: desarrollar su creatividad y fomentar el compañerismo.\r\n* “Los cinco sentidos”: conocer los sentidos a través de juegos con diferentes objetos.\r\n* “Juguemos con las letras”: fomentar la comprensión de la lectura y la escritura así como ayudarles a que tengan una lectura comprensiva.\r\n\r\n*Financiador:* Ayuntamiento de Sevilla, convocatoria “Sevilla Solidaria” y APY-Solidaridad en Acción.\r\n*Lugar:* Sevilla\r\n\r\n\r\n','',6,'published'),(26,'INFANCIA SOLIDARIA',2,'2008-09-03 19:11:08','2008-09-03 19:54:32',2,'h1. Infancia Solidaria\r\n\r\nSevilla Este es una zona desfavorecida y por consiguiente preferente a la hora de actuar. Tiene grandes problemas familiares. Existe en el área un importante número de mujeres que sufren de maltrato de género por parte de sus parejas o exparejas, y, en la mayoría de los casos éstas deben sacar adelante –y solas- a sus hijos e hijas.\r\n\r\n!/files/apy/0000/0017/ac_soc_inf_soli_01.jpg!\r\n\r\nEl proyecto se dirige a niños que se encuentran entre 3 y 7 años, cuyos padres- madres o tutores trabajan por las tardes; si no fuese por esta ludoteca estos niños estarían solos o a cargo de sus hermanos mayores, de sus abuelos o en la calle con el consiguiente peligro para ellos.\r\n\r\nEl comportamiento de los chicos en el aula ha transcurrido con normalidad bajo la supervisión de los educadores, intentando crear un clima de tranquilidad y confianza donde los niños se pudieran interrelacionar y aprender a través del juego. Hemos realizado actividades de animación infantil relacionadas principalmente con el juego y el juguete.\r\n\r\n!/files/apy/0000/0025/ac_soc_inf_soli_02.jpg!\r\n\r\nEl espacio proporciona a los niños aquellos juguetes que hayan escogido en función de sus gustos, aptitudes y posibilidades. En las ludotecas se promueve el juego en grupos, con compañeros de edades similares, favoreciendo de esta manera la comunicación y se mejora las relaciones del niño con el adulto, en general, y de los hijos con los padres, en particular.\r\n\r\nEl seguimiento de los menores ha sido continuo y personalizado por parte de los educadores, manteniendo contacto con los padres de los mismos y planteando actuaciones conjuntas en aquellos casos que lo requerían.\r\n\r\n\r\n*Financiador:* Consejería de Empleo, Junta de Andalucía.\r\n*Lugar:* Sevilla\r\n','',6,'published'),(27,'Marruecos',1,'2008-09-04 20:30:26','2008-09-04 20:33:36',3,'APY inició su labor de cooperación en Marruecos en 2003 con el proyecto “Creación y puesta en funcionamiento de dos Centros de la Mujer en las comunas de Beni Ouakil y Ait Sidarn’Udrar”. Las actuaciones en este proyecto se centraban en la construcción de dos centros y la puesta en marcha de cursos de formación laboral y servicios de asesoría y ayuda a la mujer. Su buena marcha y acogida entre las personas beneficiarias, han sido la base para dar continuidad a otras intervenciones de características similares, siempre coordinando con la planificación local (como la Iniciativa Nacional de Desarrollo Humano – INDH y otros programas estatales) a través del socio local CECODEL (Centro de Estudios Cooperativos Para el Desarrollo Local).\r\n\r\nEn la actualidad, APY continúa su labor en la zona con dos proyectos que se encuentran en ejecución: “Creación y puesta en marcha de una Escuela – Taller de técnicas de construcción en Uixan” y ”Mejora de las condiciones socioeconómicas de los campesinos y campesinas del municipio rural de Trougout en el Rif”.\r\n\r\nEl Rif es una región montañosa del norte de Marruecos, costera del mar Mediterráneo, entre las ciudades de Tetuán y Nador. Se trata de un área tradicionalmente aislada y desfavorecida. Sus habitantes son beréberes, y el idioma materno de la mayor parte de la población es el rifeño o tarifit, aunque la mayoría de la gente habla también el árabe (oficial) y el francés y el español como principales lenguas extranjeras.\r\n\r\nLas condiciones del Rif no permiten, por lo menos por el momento, un desarrollo económico basado en inversiones capitalistas. Las inversiones hechas por España en Marruecos lo demuestran, ya que éstas no se han hecho en la zona tradicionalmente bajo influencia española (el Norte), sino allí donde se acumula el capital: el triángulo Rabat-Casablanca-Settat. Los mismos rifeños, cuando acumulan un cierto capital, van a invertirlo fuera de su región. El fomento de la economía social en el Rif, más que necesario, es una obligación al menos en una primera etapa, siendo el cooperativismo esencial para el desarrollo de esta economía social.\r\n\r\nHay cuatro razones que nos obligan a concebir el desarrollo del Rif dentro de una perspectiva\r\nde economía social:\r\n* Escasez de los recursos naturales y financieros.\r\n* El sistema de la propiedad rústica en el Rif es uno de los más complejos en Marruecos, donde la tierra no es sólo un bien económico, sino más bien una identificación y una representación simbólica y cultural.\r\n* La destrucción de las estructuras tradicionales de cooperación y solidaridad. Cooperar es un concepto que hay que reintroducir.\r\n* El sistema de las mentalidades, sobre todo en lo que atañe a cuestiones de patrimonio, de las relaciones de sexo-género, de la sociedad-Estado, y las resistencias derivadas, forman en cierto modo, el principal obstáculo al desarrollo de la zona.\r\n\r\nEs por ello, que nuestra presencia en ésta zona deprimida del país tiene como propósito contribuir a mejorar las condiciones socio-económicas de sus habitantes; con un énfasis especial en la promoción de oportunidades para la mujer, sometida históricamente a vejaciones que han limitado sus posibilidades de inserción a la vida laboral, política, social y económica y confinada al ámbito privado de sus familias.\r\n\r\n','',18,'published'),(28,'Peru',1,'2008-09-04 20:35:00','2008-09-04 20:36:25',3,'APY – Solidaridad en Acción empezó a trabajar en Perú el año 2001.Los primeros contactos que se establecieron estuvieron orientados a enfocar el trabajo en la zona rural de la región de Piura, en la sierra, con propuestas de desarrollo rural de carácter integral que actuaran, por un lado, en la mejora de la calidad de vida de las poblaciones rurales en cuanto a los servicios básicos, habitabilidad y seguridad alimentaria de la población; y por otro, a la mejora del manejo del predio rural, con enfoque ecológico y, que a la vez, promueva la seguridad alimentaria, permita generar una economía local a partir de pequeñas empresas rurales de carácter familiar que den mayor valor agregado a sus materias primas y favorezca una comercialización a pequeña escala, que mejore los precios de venta y elimine intermediarios.\r\n\r\nEn la actualidad todas las intervenciones en Perú se desarrollan de la mano de un socio local, SOLCODE, con el que hasta el momento se han planteado todas las propuestas de desarrollo en el departamento de Piura. SOLCODE plantea una propuesta integral de desarrollo rural a partir de la autogestión de los recursos con los que cuenta el campesinado, mediante la cual se disponga de una seguridad alimentaria como base para la mejora de la salud de la población, erradicación de la desnutrición y promoción de un sistema productivo endógeno sostenible, dentro del marco de trabajo coordinado y concertado con el resto de agentes y gobiernos locales de la zona, insertándose en los procesos estratégicos de desarrollo local.\r\n\r\nActualmente se están desarrollando tres proyectos cuyos ejes estratégicos son servicios básicos, medio ambiente y desarrollo rural integral. Además se tuvo presencia importante con dos intervenciones de emergencia a raíz del terremoto del 15 de agosto de 2007. Las zonas específicas de nuestra intervención son:\r\n\r\n* Provincia de Ayabaca: Distrito de Frías\r\n* Provincia de Huancabamba: Distrito de Lalaquiz\r\n\r\nLa región de Piura está unida con Lima, capital de Perú, y otras ciudades de la costa a través de la carretera Panamericana Norte. La distancia entre Piura y Lima es de 1.000 Km. con aproximadamente 14 horas de viaje.\r\n','',16,'published'),(29,'El Salvador',1,'2008-09-04 20:37:26','2008-09-04 20:38:37',3,'APY-Solidaridad en Acción trabaja en El Salvador desde 1996. A lo largo de estos 11 años se han implementado 16 proyectos con el propósito de contribuir al desarrollo integral sostenible de los sectores más vulnerables de la población, fortaleciendo sus capacidades organizativas, económicas y sociales.\r\n\r\nNuestra intervención en El Salvador abarca aspectos de seguridad alimentaria, vivienda, agua y salubridad, formación y capacitación para la inserción sociolaboral, y fortalecimiento de la sociedad civil e instituciones locales.\r\n\r\nPara ubicar en su perspectiva histórica la actual situación económica, social y política de El Salvador, es necesario mostrar los principales factores de la crisis del modelo agro exportador, y los cambios que ha tenido la estructura económica y su impacto en la situación actual de la población.\r\n\r\nA finales de los años 80 se produce una masiva migración principalmente hacia los Estados Unidos como consecuencia del conflicto armado y de la crisis económica (1980-1992), situación que con el correr de los años le imprimió un giro importante a la composición de la estructura interna y externa de la base económica.\r\n\r\nA partir de esta recomposición, la economía ya no esta centrada en la agroexportación sino en la recepción de remesas enviadas por miles de salvadoreños / as que emigraron, las actividades financieras, maquila y servicios. Las remesas familiares se han convertido en el ingreso más importante en la economía familiar y nacional. Para el caso, en el 2007 le ingresó al país $3,695 millones en concepto de remesas, superior al presupuesto general de la nación que ronda los $2,944 millones en este mismo año. Las maquilas han contribuido de forma notable a la modificación de la estructura económica del país. Los ingresos por maquila ascendieron hasta los $214 millones en el año 2002. Las remesas y la maquila, potencian la tercerización de la economía por medio del apuntalamiento del sector financiero, comercio y servicios.\r\n','',15,'published');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL auto_increment,
  `page_id` int(11) default NULL,
  `mime` varchar(255) default NULL,
  `data` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
CREATE TABLE `schema_info` (
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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

-- Dump completed on 2008-09-08 15:44:54
