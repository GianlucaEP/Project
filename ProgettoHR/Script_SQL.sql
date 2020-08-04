-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: progetto_hr
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `progetto_hr`
--

/*!40000 DROP DATABASE IF EXISTS `progetto_hr`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `progetto_hr` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `progetto_hr`;

--
-- Table structure for table `area_competenza`
--

DROP TABLE IF EXISTS `area_competenza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area_competenza` (
  `id_area` int NOT NULL AUTO_INCREMENT,
  `area` varchar(45) NOT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_competenza`
--

LOCK TABLES `area_competenza` WRITE;
/*!40000 ALTER TABLE `area_competenza` DISABLE KEYS */;
INSERT INTO `area_competenza` VALUES (1,'Stilista');
/*!40000 ALTER TABLE `area_competenza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business` (
  `id_business` int NOT NULL AUTO_INCREMENT,
  `business` varchar(45) NOT NULL,
  PRIMARY KEY (`id_business`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business`
--

LOCK TABLES `business` WRITE;
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
INSERT INTO `business` VALUES (1,'ICT'),(2,'Telco'),(3,'Ingegneria');
/*!40000 ALTER TABLE `business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato`
--

DROP TABLE IF EXISTS `candidato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidato` (
  `id_candidato` int NOT NULL AUTO_INCREMENT,
  `cognome` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `anno_di_nascita` int NOT NULL,
  `num_tel` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mansione` varchar(45) NOT NULL,
  `seniority` varchar(45) NOT NULL,
  `inserimento_azienda` date NOT NULL,
  `specializzazione` text NOT NULL,
  `stato` varchar(45) NOT NULL,
  `business` int NOT NULL,
  `area` int NOT NULL,
  PRIMARY KEY (`id_candidato`),
  KEY `stato_idx` (`stato`),
  KEY `business_fk_idx` (`business`),
  KEY `area_fk_idx` (`area`),
  CONSTRAINT `area_fk` FOREIGN KEY (`area`) REFERENCES `area_competenza` (`id_area`),
  CONSTRAINT `business_fk` FOREIGN KEY (`business`) REFERENCES `business` (`id_business`),
  CONSTRAINT `stato` FOREIGN KEY (`stato`) REFERENCES `stato` (`descrizione`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato`
--

LOCK TABLES `candidato` WRITE;
/*!40000 ALTER TABLE `candidato` DISABLE KEYS */;
INSERT INTO `candidato` VALUES (6,'Bond','James',1970,'3334567890','james.bond@gmail.com','CAE','Senior','2020-06-30','Gao','attivo',2,1),(7,'Conti','Carlo',1960,'3334567891','carlo.conti@gmail.com','CAD','Junior','2020-06-30','Photoshop','selezionato',1,1),(8,'Jackson','Micheal',1960,'3334567892','micheal.jackson@gmail.com','CAD','Senior','2020-07-02','Photoshop','da_contattare',1,1),(9,'Jean','Billy',1980,'3334567894','billi.jean@gmail.com','CAD','Senior','2020-06-30','Photoshop','scartato',1,1),(10,'Rossi','Mario',1969,'3334567893','mario.rossi@gmail.com','CAD','Senior','2020-06-27','Photoshop','selezionato',1,1),(11,'Miku','Hatsune ',2009,'3330139807','hatsune.miku@vocaloid.jp','CAD','Senior','0002-01-31','Photoshop','nuovo_inserito',1,1),(12,'Bond','James',1974,'3334567890','james.bond@gmail.coms','CAEss','Senior','2020-07-23','dsds','attivo',2,1),(13,'Miku','Hatsune ',2009,'3330139807','hatsune.miku@vocaloid.jp','CADrr','Senior','2020-07-02','c','nuovo_inserito',1,1);
/*!40000 ALTER TABLE `candidato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_sinonimo`
--

DROP TABLE IF EXISTS `candidato_sinonimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidato_sinonimo` (
  `id_candidato_fk` int NOT NULL,
  `id_sinonimo_fk` int NOT NULL,
  KEY `id_candidato_idx` (`id_candidato_fk`),
  KEY `id_competenza_idx` (`id_sinonimo_fk`),
  CONSTRAINT `id_candidato` FOREIGN KEY (`id_candidato_fk`) REFERENCES `candidato` (`id_candidato`),
  CONSTRAINT `id_sinonimo` FOREIGN KEY (`id_sinonimo_fk`) REFERENCES `sinonimo` (`id_sinonimo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_sinonimo`
--

LOCK TABLES `candidato_sinonimo` WRITE;
/*!40000 ALTER TABLE `candidato_sinonimo` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidato_sinonimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id_feedback` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  `data` date NOT NULL,
  `commento` varchar(45) NOT NULL,
  `id_candidato` int NOT NULL,
  `user_insert` varchar(45) NOT NULL,
  `data_insert` date NOT NULL,
  PRIMARY KEY (`id_feedback`),
  KEY `id_candidato_idx` (`id_candidato`),
  KEY `tipo_fb_idx` (`tipo`),
  CONSTRAINT `id_candidato_fb` FOREIGN KEY (`id_candidato`) REFERENCES `candidato` (`id_candidato`),
  CONSTRAINT `tipo_fb` FOREIGN KEY (`tipo`) REFERENCES `tipo_feedback` (`tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'Telefono','2020-01-03','Vodka Martini agitato non mescolato',6,'Admin','2020-01-03');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funzionalita`
--

DROP TABLE IF EXISTS `funzionalita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funzionalita` (
  `id_funzionalita` int NOT NULL AUTO_INCREMENT,
  `funzionalita` varchar(45) NOT NULL,
  PRIMARY KEY (`id_funzionalita`),
  UNIQUE KEY `funzionalita_UNIQUE` (`funzionalita`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funzionalita`
--

LOCK TABLES `funzionalita` WRITE;
/*!40000 ALTER TABLE `funzionalita` DISABLE KEYS */;
INSERT INTO `funzionalita` VALUES (5,'aggiorna candidato'),(2,'aggiunta candidati'),(3,'aggiunta feedback'),(4,'aggiunta mansione'),(1,'visualizza anagrafica');
/*!40000 ALTER TABLE `funzionalita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mansione`
--

DROP TABLE IF EXISTS `mansione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mansione` (
  `id_mansione` int NOT NULL AUTO_INCREMENT,
  `mansione` varchar(45) NOT NULL,
  PRIMARY KEY (`id_mansione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mansione`
--

LOCK TABLES `mansione` WRITE;
/*!40000 ALTER TABLE `mansione` DISABLE KEYS */;
/*!40000 ALTER TABLE `mansione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualification_meeting`
--

DROP TABLE IF EXISTS `qualification_meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qualification_meeting` (
  `id_qualification` int NOT NULL AUTO_INCREMENT,
  `data_presentato` date NOT NULL,
  `data_colloquio` date NOT NULL,
  `commento` varchar(45) NOT NULL,
  `id_candidato` int NOT NULL,
  `azienda` varchar(45) NOT NULL,
  `ral` int NOT NULL,
  `preavviso` varchar(45) NOT NULL,
  `desiderata` int NOT NULL,
  `user_insert` varchar(45) NOT NULL,
  `data_insert` date NOT NULL,
  PRIMARY KEY (`id_qualification`),
  KEY `id_candidato_qm_idx` (`id_candidato`),
  CONSTRAINT `id_candidato_qm` FOREIGN KEY (`id_candidato`) REFERENCES `candidato` (`id_candidato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualification_meeting`
--

LOCK TABLES `qualification_meeting` WRITE;
/*!40000 ALTER TABLE `qualification_meeting` DISABLE KEYS */;
/*!40000 ALTER TABLE `qualification_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruolo`
--

DROP TABLE IF EXISTS `ruolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ruolo` (
  `id_ruolo` int NOT NULL AUTO_INCREMENT,
  `ruolo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_ruolo`),
  UNIQUE KEY `ruolo_UNIQUE` (`ruolo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruolo`
--

LOCK TABLES `ruolo` WRITE;
/*!40000 ALTER TABLE `ruolo` DISABLE KEYS */;
INSERT INTO `ruolo` VALUES (1,'admin');
/*!40000 ALTER TABLE `ruolo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruolo_funzionalita`
--

DROP TABLE IF EXISTS `ruolo_funzionalita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ruolo_funzionalita` (
  `id_funzionalita_fk` int NOT NULL,
  `id_ruolo_fk` int NOT NULL,
  PRIMARY KEY (`id_funzionalita_fk`,`id_ruolo_fk`),
  KEY `ruolof_fk_idx` (`id_ruolo_fk`),
  CONSTRAINT `funzionalita_fk` FOREIGN KEY (`id_funzionalita_fk`) REFERENCES `funzionalita` (`id_funzionalita`),
  CONSTRAINT `ruolof_fk` FOREIGN KEY (`id_ruolo_fk`) REFERENCES `ruolo` (`id_ruolo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruolo_funzionalita`
--

LOCK TABLES `ruolo_funzionalita` WRITE;
/*!40000 ALTER TABLE `ruolo_funzionalita` DISABLE KEYS */;
INSERT INTO `ruolo_funzionalita` VALUES (1,1),(2,1),(3,1),(4,1),(5,1);
/*!40000 ALTER TABLE `ruolo_funzionalita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruolo_utente`
--

DROP TABLE IF EXISTS `ruolo_utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ruolo_utente` (
  `id_ruolo_fk` int NOT NULL AUTO_INCREMENT,
  `id_utente_fk` int NOT NULL,
  PRIMARY KEY (`id_ruolo_fk`,`id_utente_fk`),
  KEY `utente_fk_idx` (`id_utente_fk`),
  CONSTRAINT `ruolo_fk` FOREIGN KEY (`id_ruolo_fk`) REFERENCES `ruolo` (`id_ruolo`),
  CONSTRAINT `utente_fk` FOREIGN KEY (`id_utente_fk`) REFERENCES `utente` (`id_utente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruolo_utente`
--

LOCK TABLES `ruolo_utente` WRITE;
/*!40000 ALTER TABLE `ruolo_utente` DISABLE KEYS */;
INSERT INTO `ruolo_utente` VALUES (1,1);
/*!40000 ALTER TABLE `ruolo_utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sinonimo`
--

DROP TABLE IF EXISTS `sinonimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sinonimo` (
  `id_sinonimo` int NOT NULL AUTO_INCREMENT,
  `sinonimo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_sinonimo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinonimo`
--

LOCK TABLES `sinonimo` WRITE;
/*!40000 ALTER TABLE `sinonimo` DISABLE KEYS */;
INSERT INTO `sinonimo` VALUES (1,'CAD'),(2,'CAD'),(3,'CAD'),(4,'CAD'),(5,'CAD'),(6,'CAEss'),(7,'CADrr');
/*!40000 ALTER TABLE `sinonimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stato`
--

DROP TABLE IF EXISTS `stato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stato` (
  `descrizione` varchar(45) NOT NULL,
  PRIMARY KEY (`descrizione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stato`
--

LOCK TABLES `stato` WRITE;
/*!40000 ALTER TABLE `stato` DISABLE KEYS */;
INSERT INTO `stato` VALUES ('attivo'),('da_contattare'),('nuovo_inserito'),('scartato'),('selezionato');
/*!40000 ALTER TABLE `stato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_feedback`
--

DROP TABLE IF EXISTS `tipo_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_feedback` (
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_feedback`
--

LOCK TABLES `tipo_feedback` WRITE;
/*!40000 ALTER TABLE `tipo_feedback` DISABLE KEYS */;
INSERT INTO `tipo_feedback` VALUES ('Telefono');
/*!40000 ALTER TABLE `tipo_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `id_utente` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id_utente`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'Admin','admin');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-04 14:53:36
