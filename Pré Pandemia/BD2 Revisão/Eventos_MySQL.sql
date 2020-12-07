CREATE DATABASE  IF NOT EXISTS `eventos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `eventos`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: eventos
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `palestra_fk` int(11) NOT NULL,
  `palestrante_fk` int(11) NOT NULL,
  `duracao` int(11) DEFAULT NULL,
  PRIMARY KEY (`palestra_fk`,`palestrante_fk`),
  KEY `palestrante_fk` (`palestrante_fk`),
  CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`palestra_fk`) REFERENCES `palestra` (`id`),
  CONSTRAINT `evento_ibfk_2` FOREIGN KEY (`palestrante_fk`) REFERENCES `palestrante` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,5,50),(2,1,100),(2,2,120),(3,4,130),(4,3,60);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscricao`
--

DROP TABLE IF EXISTS `inscricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscricao` (
  `participante_fk` int(11) NOT NULL,
  `palestra_fk` int(11) NOT NULL,
  `forma_pagamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`participante_fk`,`palestra_fk`),
  KEY `palestra_fk` (`palestra_fk`),
  CONSTRAINT `inscricao_ibfk_1` FOREIGN KEY (`palestra_fk`) REFERENCES `palestra` (`id`),
  CONSTRAINT `inscricao_ibfk_2` FOREIGN KEY (`participante_fk`) REFERENCES `participante` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscricao`
--

LOCK TABLES `inscricao` WRITE;
/*!40000 ALTER TABLE `inscricao` DISABLE KEYS */;
INSERT INTO `inscricao` VALUES (1,1,1),(1,2,1),(2,1,1),(2,2,3),(2,4,1),(3,2,NULL),(3,3,3),(4,1,3),(4,3,1),(5,1,2),(5,2,2),(7,2,3),(7,3,1);
/*!40000 ALTER TABLE `inscricao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localizacao`
--

DROP TABLE IF EXISTS `localizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localizacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) DEFAULT NULL,
  `rua` varchar(120) DEFAULT NULL,
  `cidade` varchar(80) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `ponto_referencia` varchar(255) DEFAULT NULL,
  `capacidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localizacao`
--

LOCK TABLES `localizacao` WRITE;
/*!40000 ALTER TABLE `localizacao` DISABLE KEYS */;
INSERT INTO `localizacao` VALUES (1,'Local A','Rua A','Niterói','-------',NULL,500),(2,'Local B','Rua B','Niterói','-------',NULL,1000),(3,'Local C','Rua C','Rio de Janeiro','-------',NULL,2500),(4,'Local D','Rua D','Rio de Janeiro','-------',NULL,800),(5,'Local E','Rua E','São Gonçalo','-------',NULL,1500);
/*!40000 ALTER TABLE `localizacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `palestra`
--

DROP TABLE IF EXISTS `palestra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `palestra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_hora` datetime DEFAULT NULL,
  `titulo` varchar(80) DEFAULT NULL,
  `local_fk` int(11) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `duracao_total` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `local_fk` (`local_fk`),
  CONSTRAINT `palestra_ibfk_1` FOREIGN KEY (`local_fk`) REFERENCES `localizacao` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palestra`
--

LOCK TABLES `palestra` WRITE;
/*!40000 ALTER TABLE `palestra` DISABLE KEYS */;
INSERT INTO `palestra` VALUES (1,'2016-01-10 00:00:00','Palestra 1',1,NULL,50,80),(2,'2016-01-11 00:00:00','Palestra Combo',3,NULL,240,220),(3,'2016-01-12 00:00:00','Palestra Sem lugar',NULL,NULL,80,130),(4,'2015-09-15 00:00:00','Palestra ja foi',4,NULL,90,110);
/*!40000 ALTER TABLE `palestra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `palestrante`
--

DROP TABLE IF EXISTS `palestrante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `palestrante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `profissao` varchar(80) DEFAULT NULL,
  `formacao` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palestrante`
--

LOCK TABLES `palestrante` WRITE;
/*!40000 ALTER TABLE `palestrante` DISABLE KEYS */;
INSERT INTO `palestrante` VALUES (1,'Steve Jobs','11111111111','TI','Superior','jobs@apple.com','111111111'),(2,'Bill Gates','22222222222',NULL,'Superior','gates@microsoft.com',NULL),(3,'Lula','33333333333','Metalúrgico',NULL,'lula@pt.com','333333333'),(4,'Alguém da Silva','44444444444',NULL,NULL,'alguem@someone.com','444444444'),(5,'Fulano de tal','55555555555',NULL,'Superior','fulano@email.com','555555555');
/*!40000 ALTER TABLE `palestrante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participante`
--

DROP TABLE IF EXISTS `participante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `endereco` varchar(120) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participante`
--

LOCK TABLES `participante` WRITE;
/*!40000 ALTER TABLE `participante` DISABLE KEYS */;
INSERT INTO `participante` VALUES (1,'João da Silva','12344444444','Rua do João','joao@email.com','919191919'),(2,'Antônio daSilva','12345555555','Rua do Antônio','antonio@email.com',NULL),(3,'Maria','12366666666','Rua da Maria',NULL,'939393936'),(4,'Carla','12345678888',NULL,'carla@email.com',NULL),(5,'João dos Santos','12222228821','Rua do outro João','j.santos@email.com',NULL),(6,'Marcelo','43435678901','Rua do Marcelo','marcelo@email.com','767676599'),(7,'Carlos','12345677777','Rua do Carlos',NULL,NULL);
/*!40000 ALTER TABLE `participante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'eventos'
--

--
-- Dumping routines for database 'eventos'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-12 14:34:12
