CREATE DATABASE  IF NOT EXISTS `revisao11` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `revisao11`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: revisao11
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `aviao`
--

DROP TABLE IF EXISTS `aviao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aviao` (
  `codaviao` int NOT NULL AUTO_INCREMENT,
  `codemp` int NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `capacidade` int NOT NULL,
  PRIMARY KEY (`codaviao`),
  KEY `codemp` (`codemp`),
  CONSTRAINT `aviao_ibfk_1` FOREIGN KEY (`codemp`) REFERENCES `empresa` (`codemp`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aviao`
--

LOCK TABLES `aviao` WRITE;
/*!40000 ALTER TABLE `aviao` DISABLE KEYS */;
INSERT INTO `aviao` VALUES (1,2,'Boeing',500),(2,5,'Jatinho',30),(3,3,'Boeing',400),(4,1,'Jatinho',50),(5,4,'Boeing',350);
/*!40000 ALTER TABLE `aviao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `codemp` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codemp`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'Gol'),(2,'Latam'),(3,'Lamia'),(4,'Air France'),(5,'Quatar Airways');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rota`
--

DROP TABLE IF EXISTS `rota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rota` (
  `codrota` int NOT NULL AUTO_INCREMENT,
  `origem` varchar(200) NOT NULL,
  `destino` varchar(200) NOT NULL,
  `codvoo` int NOT NULL,
  `h_saida` datetime NOT NULL,
  `h_chegada` datetime NOT NULL,
  PRIMARY KEY (`codrota`),
  KEY `origem` (`origem`,`destino`),
  KEY `codvoo` (`codvoo`),
  CONSTRAINT `rota_ibfk_1` FOREIGN KEY (`origem`, `destino`) REFERENCES `trecho` (`origem`, `destino`),
  CONSTRAINT `rota_ibfk_2` FOREIGN KEY (`codvoo`) REFERENCES `voo` (`codvoo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rota`
--

LOCK TABLES `rota` WRITE;
/*!40000 ALTER TABLE `rota` DISABLE KEYS */;
INSERT INTO `rota` VALUES (1,'Helsinque','Chicago',2,'2020-05-19 19:25:34','2020-05-20 03:45:25'),(2,'Juiz de Fora','Paris',3,'2020-08-31 04:35:56','2020-09-01 00:25:36'),(3,'Oiapoque','Chuí',4,'2020-11-21 09:15:46','2020-11-21 16:02:39'),(4,'São Paulo','Rio de Janeiro',5,'2020-12-31 23:00:00','2021-01-01 00:00:00'),(5,'Rio de Janeiro','São Paulo',1,'2020-07-23 19:25:34','2020-07-23 20:25:34');
/*!40000 ALTER TABLE `rota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trecho`
--

DROP TABLE IF EXISTS `trecho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trecho` (
  `origem` varchar(200) NOT NULL,
  `destino` varchar(200) NOT NULL,
  `distancia` int NOT NULL,
  PRIMARY KEY (`origem`,`destino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trecho`
--

LOCK TABLES `trecho` WRITE;
/*!40000 ALTER TABLE `trecho` DISABLE KEYS */;
INSERT INTO `trecho` VALUES ('Helsinque','Chicago',7126),('Juiz de Fora','Paris',9064),('Oiapoque','Chuí',1456),('Rio de Janeiro','São Paulo',350),('São Paulo','Rio de Janeiro',350);
/*!40000 ALTER TABLE `trecho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viagem`
--

DROP TABLE IF EXISTS `viagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viagem` (
  `codrota` int NOT NULL,
  `data_voo` date NOT NULL,
  `codaviao` int NOT NULL,
  `h_saida_real` datetime NOT NULL,
  `h_chegada_real` datetime NOT NULL,
  PRIMARY KEY (`codrota`),
  KEY `codaviao` (`codaviao`),
  CONSTRAINT `viagem_ibfk_1` FOREIGN KEY (`codrota`) REFERENCES `rota` (`codrota`),
  CONSTRAINT `viagem_ibfk_2` FOREIGN KEY (`codaviao`) REFERENCES `aviao` (`codaviao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viagem`
--

LOCK TABLES `viagem` WRITE;
/*!40000 ALTER TABLE `viagem` DISABLE KEYS */;
INSERT INTO `viagem` VALUES (1,'2020-05-19',1,'2020-05-19 19:25:34','2020-05-20 03:45:25'),(2,'2020-08-31',3,'2020-08-31 04:35:56','2020-09-01 00:25:36'),(3,'2020-11-21',2,'2020-11-21 09:15:46','2020-11-21 16:02:39'),(4,'2020-12-31',5,'2020-12-31 23:00:00','2021-01-01 00:00:00'),(5,'2020-07-23',4,'2020-07-23 19:25:34','2020-07-23 20:25:34');
/*!40000 ALTER TABLE `viagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voo`
--

DROP TABLE IF EXISTS `voo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voo` (
  `codvoo` int NOT NULL AUTO_INCREMENT,
  `codemp` int NOT NULL,
  PRIMARY KEY (`codvoo`),
  KEY `codemp` (`codemp`),
  CONSTRAINT `voo_ibfk_1` FOREIGN KEY (`codemp`) REFERENCES `empresa` (`codemp`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voo`
--

LOCK TABLES `voo` WRITE;
/*!40000 ALTER TABLE `voo` DISABLE KEYS */;
INSERT INTO `voo` VALUES (5,1),(4,2),(3,3),(2,4),(1,5);
/*!40000 ALTER TABLE `voo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'revisao11'
--

--
-- Dumping routines for database 'revisao11'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-13 17:05:02
