CREATE DATABASE  IF NOT EXISTS `prova2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `prova2`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: prova2
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `compania` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'Rhynoodle'),(2,'Plajo'),(3,'Zoombox'),(4,'Fanoodle'),(5,'Brainverse'),(6,'Feedspan'),(7,'Shuffledrive'),(8,'Realcube'),(9,'Abatz'),(10,'Topiczoom');
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacao`
--

DROP TABLE IF EXISTS `operacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operacao` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `idvendedor` int DEFAULT NULL,
  `idempresa` int DEFAULT NULL,
  `qtde` int DEFAULT NULL,
  `tipo` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_V_O_idx` (`idvendedor`),
  KEY `FK_V_E_idx` (`idempresa`),
  CONSTRAINT `FK_V_E` FOREIGN KEY (`idempresa`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_V_O` FOREIGN KEY (`idvendedor`) REFERENCES `vendedor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacao`
--

LOCK TABLES `operacao` WRITE;
/*!40000 ALTER TABLE `operacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `operacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qtdeacoes`
--

DROP TABLE IF EXISTS `qtdeacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qtdeacoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idempresa` int DEFAULT NULL,
  `qtde` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Acoes_Empresa_idx` (`idempresa`),
  CONSTRAINT `FK_Acoes_Empresa` FOREIGN KEY (`idempresa`) REFERENCES `empresas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qtdeacoes`
--

LOCK TABLES `qtdeacoes` WRITE;
/*!40000 ALTER TABLE `qtdeacoes` DISABLE KEYS */;
INSERT INTO `qtdeacoes` VALUES (1,1,23),(2,2,10),(3,3,19),(4,4,18),(5,5,18),(6,6,24),(7,7,19),(8,8,20),(9,9,22),(10,10,12);
/*!40000 ALTER TABLE `qtdeacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `nacionalidade` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `dtnascimento` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1,'Louis Simmons','Portugal','lsimmons0@gizmodo.com','1982-05-23'),(2,'Jerry Hawkins','Thailand','jhawkins1@dropbox.com','1980-05-03'),(3,'Irene Jackson','Portugal','ijackson2@list-manage.com','1978-04-12'),(4,'James Kelly','Portugal','jkelly3@meetup.com','1986-09-10'),(5,'Norma Reynolds','Portugal','nreynolds4@bigcartel.com','1995-12-04'),(6,'Steven Hanson','Portugal','shanson5@google.com','1993-10-26'),(7,'Sarah Berry','China','sberry6@msu.edu','1994-09-11'),(8,'Andrea Nguyen','China','anguyen7@hexun.com','1984-12-13'),(9,'Fred Williamson','China','fwilliamson8@paginegialle.it','1976-01-28'),(10,'Steven Ford','Sweden','sford9@cbslocal.com','1995-01-15'),(11,'Tina Simpson','Portugal','tsimpsona@fema.gov','1972-01-23'),(12,'Jose Jordan','Russia','jjordanb@usgs.gov','1988-07-24'),(13,'Albert Lopez','Portugal','alopezc@geocities.com','1994-02-15'),(14,'Sharon Johnston','Greece','sjohnstond@jigsy.com','1983-02-06'),(15,'Betty Washington','Brazil','bwashingtone@comsenz.com','1977-09-24'),(16,'Jessica Medina','Peru','jmedinaf@twitpic.com','1974-09-16'),(17,'Irene Cunningham','Nigeria','icunninghamg@mapquest.com','1974-04-11'),(18,'Wayne Mitchell','China','wmitchellh@icio.us','1991-12-13'),(19,'Judith Stone','Ukraine','jstonei@vistaprint.com','1989-10-12'),(20,'Gloria Parker','Indonesia','gparkerj@goodreads.com','1972-04-13'),(21,'Karen Payne','Nigeria','kpaynek@homestead.com','1975-10-30'),(22,'Julie Cole','Indonesia','jcolel@a8.net','1976-09-06'),(23,'Marilyn Campbell','China','mcampbellm@twitpic.com','1977-11-19'),(24,'William Henderson','Argentina','whendersonn@omniture.com','1987-01-10'),(25,'Timothy Hughes','Saudi Arabia','thugheso@meetup.com','1988-01-06'),(26,'Janice Walker','Indonesia','jwalkerp@pinterest.com','1970-04-13'),(27,'Anna Cooper','Philippines','acooperq@ucoz.ru','1983-07-29'),(28,'Wanda Romero','Portugal','wromeror@hibu.com','1987-07-31'),(29,'Ruby Ortiz','Portugal','rortizs@dot.gov','1990-04-20'),(30,'Linda Brown','Nicaragua','lbrownt@cloudflare.com','1988-05-31'),(31,'Marie Harrison','Russia','mharrisonu@csmonitor.com','1985-07-20'),(32,'Shirley Howard','Russia','showardv@google.com.hk','1995-04-27'),(33,'Christine Lopez','Portugal','clopezw@pbs.org','1976-09-17'),(34,'Gregory Hughes','China','ghughesx@youtu.be','1993-03-17'),(35,'Kevin Griffin','Portugal','kgriffiny@myspace.com','1978-06-17'),(36,'Bonnie Howard','Poland','bhowardz@senate.gov','1982-05-08'),(37,'Sarah Collins','Egypt','scollins10@cloudflare.com','1986-08-23'),(38,'Alice Morrison','Portugal','amorrison11@wikipedia.org','1994-06-05'),(39,'Steven Barnes','Brazil','sbarnes12@123-reg.co.uk','1975-08-01'),(40,'Andrew Ferguson','Zimbabwe','aferguson13@prnewswire.com','1981-06-18'),(41,'Susan Ellis','France','sellis14@taobao.com','1983-01-11'),(42,'Sharon Nichols','Germany','snichols15@yelp.com','1987-08-20'),(43,'Edward Carpenter','Portugal','ecarpenter16@geocities.com','1992-04-01'),(44,'Diane Griffin','South Africa','dgriffin17@upenn.edu','1972-06-09'),(45,'Kevin Fox','France','kfox18@archive.org','1984-11-29'),(46,'Eugene King','Greece','eking19@wikispaces.com','1980-10-22'),(47,'Juan Young','China','jyoung1a@drupal.org','1972-11-20'),(48,'Sean Mason','Portugal','smason1b@upenn.edu','1973-11-30'),(49,'Antonio Dunn','Portugal','adunn1c@github.com','1970-07-10'),(50,'Norma Riley','Peru','nriley1d@jalbum.net','1993-05-15'),(51,'David Cruz','China','dcruz1e@zimbio.com','1985-03-06'),(52,'Edward Hayes','Kazakhstan','ehayes1f@linkedin.com','1987-09-29'),(53,'Justin Howard','Mexico','jhoward1g@joomla.org','1973-12-28'),(54,'Willie Wells','Portugal','wwells1h@yandex.ru','1974-05-06'),(55,'Alice Cunningham','Philippines','acunningham1i@telegraph.co.uk','1987-01-09'),(56,'Philip Schmidt','Mali','pschmidt1j@spiegel.de','1990-03-03'),(57,'Julia Hawkins','Poland','jhawkins1k@hhs.gov','1980-09-26'),(58,'Diane Peterson','United Arab Emirates','dpeterson1l@pagesperso-orange.fr','1979-07-24'),(59,'Phyllis Carpenter','Philippines','pcarpenter1m@amazon.co.uk','1972-03-31'),(60,'Ruby Tucker','Kenya','rtucker1n@vimeo.com','1982-07-02'),(61,'Annie Henry','China','ahenry1o@deviantart.com','1975-07-03'),(62,'Melissa Young','Portugal','myoung1p@nih.gov','1990-04-18'),(63,'Phyllis Johnston','China','pjohnston1q@elegantthemes.com','1980-03-02'),(64,'Jason Coleman','Portugal','jcoleman1r@unblog.fr','1974-01-28'),(65,'Gregory Romero','Benin','gromero1s@ucsd.edu','1983-10-16'),(66,'Patricia Burns','Portugal','pburns1t@ifeng.com','1983-04-21'),(67,'Nicholas Myers','Angola','nmyers1u@elpais.com','1984-12-15'),(68,'Jacqueline Perkins','Portugal','jperkins1v@ucsd.edu','1992-02-06'),(69,'Robert Fowler','Russia','rfowler1w@w3.org','1973-04-27'),(70,'Juan Boyd','Estonia','jboyd1x@ted.com','1981-09-01'),(71,'Catherine Reynolds','Portugal','creynolds1y@canalblog.com','1990-04-09'),(72,'Charles Reyes','Portugal','creyes1z@liveinternet.ru','1984-03-09'),(73,'Jonathan Evans','Poland','jevans20@myspace.com','1987-09-09'),(74,'William Simpson','Ivory Coast','wsimpson21@state.tx.us','1975-05-01'),(75,'John Grant','Brazil','jgrant22@goodreads.com','1990-10-28'),(76,'Bruce Fernandez','China','bfernandez23@forbes.com','1971-06-18'),(77,'Joan Price','Malta','jprice24@nih.gov','1992-11-28'),(78,'Roy Banks','Poland','rbanks25@xrea.com','1982-12-06'),(79,'Bonnie Howard','Brazil','bhoward26@census.gov','1978-01-31'),(80,'Martin Dean','Zimbabwe','mdean27@java.com','1972-10-02'),(81,'Benjamin Diaz','Indonesia','bdiaz28@bbb.org','1991-04-29'),(82,'Rachel Burton','Portugal','rburton29@hud.gov','1972-03-02'),(83,'Christine Kennedy','Portugal','ckennedy2a@vk.com','1990-10-07'),(84,'Lois Dunn','Portugal','ldunn2b@sbwire.com','1990-02-20'),(85,'Wanda Phillips','Russia','wphillips2c@cocolog-nifty.com','1989-11-20'),(86,'Dorothy Weaver','Portugal','dweaver2d@cyberchimps.com','1988-09-04'),(87,'Russell Payne','China','rpayne2e@google.cn','1994-12-05'),(88,'Anne Lane','Greece','alane2f@salon.com','1981-03-23'),(89,'Dorothy Oliver','Portugal','doliver2g@techcrunch.com','1992-05-07'),(90,'Anna Wright','China','awright2h@yellowbook.com','1991-03-04'),(91,'Russell Welch','Portugal','rwelch2i@sogou.com','1977-02-25'),(92,'Ashley Stevens','China','astevens2j@independent.co.uk','1983-09-02'),(93,'Jimmy Taylor','Russia','jtaylor2k@tinyurl.com','1984-07-12'),(94,'Andrew Arnold','China','aarnold2l@arstechnica.com','1990-01-11'),(95,'Earl Perez','Portugal','eperez2m@fda.gov','1989-12-12'),(96,'Keith Morrison','Indonesia','kmorrison2n@dell.com','1974-12-15'),(97,'Fred Reid','Indonesia','freid2o@altervista.org','1984-01-21'),(98,'Judith Rice','China','jrice2p@google.co.uk','1978-09-07'),(99,'Jason Jenkins','Portugal','jjenkins2q@xing.com','1978-06-15'),(100,'Linda Harper','Poland','lharper2r@bloomberg.com','1990-10-06'),(101,'Tadeu Classe','Portugal','lsimmons0@gizmodo.com','1982-05-23');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'prova2'
--

--
-- Dumping routines for database 'prova2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-01 15:44:35
