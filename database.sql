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
  `area` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_competenza`
--

LOCK TABLES `area_competenza` WRITE;
/*!40000 ALTER TABLE `area_competenza` DISABLE KEYS */;
INSERT INTO `area_competenza` VALUES ('Active Safety'),('Area funzionale'),('Area safety'),('Area sistemi'),('CAE'),('CAS'),('Data science'),('DBA'),('Design'),('Distinta base'),('Fattibilità e progettazione'),('Program e project management'),('Qualità'),('Sistemi elettrici ed elettronici'),('Sviluppo SW'),('Tempi e metodi'),('Test&Validation'),('UX-UI');
/*!40000 ALTER TABLE `area_competenza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business` (
  `business` varchar(45) NOT NULL,
  PRIMARY KEY (`business`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business`
--

LOCK TABLES `business` WRITE;
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
INSERT INTO `business` VALUES ('Engineering'),('ICT'),('Telco');
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
  `seniority` varchar(45) NOT NULL,
  `inserimento_azienda` date DEFAULT NULL,
  `stato` varchar(45) NOT NULL,
  `business` varchar(45) NOT NULL,
  `provenienza` varchar(45) NOT NULL,
  `categoria_protetta` tinyint NOT NULL,
  `codice_fiscale` varchar(16) DEFAULT NULL,
  `economics` int DEFAULT NULL,
  `costo` int DEFAULT NULL,
  PRIMARY KEY (`id_candidato`),
  KEY `business_fk_idx` (`business`),
  KEY `seniority_idx` (`seniority`),
  KEY `costo_fk_idx` (`costo`),
  KEY `stato_fk_idx` (`stato`),
  KEY `economics_fk_idx` (`economics`),
  CONSTRAINT `business_fk` FOREIGN KEY (`business`) REFERENCES `business` (`business`),
  CONSTRAINT `costo_fk` FOREIGN KEY (`costo`) REFERENCES `costo` (`id_costo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `economics_fk` FOREIGN KEY (`economics`) REFERENCES `economics` (`id_economics`),
  CONSTRAINT `seniority_fk` FOREIGN KEY (`seniority`) REFERENCES `seniority` (`seniority`),
  CONSTRAINT `stato_fk` FOREIGN KEY (`stato`) REFERENCES `stato` (`descrizione`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato`
--

LOCK TABLES `candidato` WRITE;
/*!40000 ALTER TABLE `candidato` DISABLE KEYS */;
INSERT INTO `candidato` VALUES (38,'Semco','Gheorghe',1999,'3291951678','info@semcogheorghe.com','Junior','2020-06-15','Selezionato','ICT','LinkdIn',0,'',4,4),(42,'Nita','Marius Ionut',1999,'3279716624','marius.nita@errepro.tech','Junior','2020-06-15','Attivo','ICT','LinkedIn',0,'',5,5),(43,'Bova','Gianluca',1992,'3317804713','gianluca.bova@errepro.tech','Junior','2020-06-15','Scartato','ICT','LinkedIn',0,'',6,6),(44,'Schiavone','Stefano',1997,'3486463867','stefano.schiavone@errepro.tech','Junior','2020-09-03','Da contattare','ICT','LinkedIn',0,'',7,7);
/*!40000 ALTER TABLE `candidato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_area`
--

DROP TABLE IF EXISTS `candidato_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidato_area` (
  `candidato` int NOT NULL,
  `area` varchar(45) NOT NULL,
  PRIMARY KEY (`candidato`,`area`),
  KEY `area_fk` (`area`),
  CONSTRAINT `area_fk` FOREIGN KEY (`area`) REFERENCES `area_competenza` (`area`) ON UPDATE CASCADE,
  CONSTRAINT `id_candidato_fk` FOREIGN KEY (`candidato`) REFERENCES `candidato` (`id_candidato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_area`
--

LOCK TABLES `candidato_area` WRITE;
/*!40000 ALTER TABLE `candidato_area` DISABLE KEYS */;
INSERT INTO `candidato_area` VALUES (43,'DBA'),(44,'Program e project management'),(38,'Sviluppo SW'),(42,'Sviluppo SW'),(43,'Sviluppo SW');
/*!40000 ALTER TABLE `candidato_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_mansione`
--

DROP TABLE IF EXISTS `candidato_mansione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidato_mansione` (
  `id_candidato_fk` int NOT NULL,
  `mansione` varchar(45) NOT NULL,
  PRIMARY KEY (`id_candidato_fk`,`mansione`),
  KEY `mansione_idx` (`mansione`),
  CONSTRAINT `candidato_fk` FOREIGN KEY (`id_candidato_fk`) REFERENCES `candidato` (`id_candidato`) ON UPDATE RESTRICT,
  CONSTRAINT `mansione` FOREIGN KEY (`mansione`) REFERENCES `mansione` (`mansione`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_mansione`
--

LOCK TABLES `candidato_mansione` WRITE;
/*!40000 ALTER TABLE `candidato_mansione` DISABLE KEYS */;
INSERT INTO `candidato_mansione` VALUES (44,'DBA Specialist '),(38,'Sviluppatore Java'),(42,'Sviluppatore Java'),(43,'Sviluppatore Java');
/*!40000 ALTER TABLE `candidato_mansione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_specializzazione`
--

DROP TABLE IF EXISTS `candidato_specializzazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidato_specializzazione` (
  `id_candidato_fk` int NOT NULL,
  `specializzazione_fk` varchar(45) NOT NULL,
  `anni_esperienza` int NOT NULL,
  PRIMARY KEY (`id_candidato_fk`,`specializzazione_fk`),
  KEY `id_candidato_idx` (`id_candidato_fk`),
  KEY `specializzazione_idx` (`specializzazione_fk`),
  CONSTRAINT `id_candidato` FOREIGN KEY (`id_candidato_fk`) REFERENCES `candidato` (`id_candidato`),
  CONSTRAINT `specializzazione` FOREIGN KEY (`specializzazione_fk`) REFERENCES `specializzazione` (`specializzazione`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_specializzazione`
--

LOCK TABLES `candidato_specializzazione` WRITE;
/*!40000 ALTER TABLE `candidato_specializzazione` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidato_specializzazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costo`
--

DROP TABLE IF EXISTS `costo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costo` (
  `id_costo` int NOT NULL AUTO_INCREMENT,
  `costo_orario` decimal(10,2) NOT NULL,
  `costo_giornaliero` decimal(10,2) NOT NULL,
  `commento` varchar(1000) NOT NULL,
  PRIMARY KEY (`id_costo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costo`
--

LOCK TABLES `costo` WRITE;
/*!40000 ALTER TABLE `costo` DISABLE KEYS */;
INSERT INTO `costo` VALUES (4,5.00,40.00,''),(5,7.50,60.00,''),(6,1.00,8.00,''),(7,1.00,1.00,'');
/*!40000 ALTER TABLE `costo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `economics`
--

DROP TABLE IF EXISTS `economics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `economics` (
  `id_economics` int NOT NULL AUTO_INCREMENT,
  `inquadramento` varchar(45) NOT NULL,
  `RAL` int NOT NULL,
  `benefit` varchar(45) NOT NULL,
  `preavviso` varchar(45) NOT NULL,
  `desiderata` int NOT NULL,
  PRIMARY KEY (`id_economics`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `economics`
--

LOCK TABLES `economics` WRITE;
/*!40000 ALTER TABLE `economics` DISABLE KEYS */;
INSERT INTO `economics` VALUES (4,'f',10000,'f','f',321),(5,'a',80000,'2','o',7),(6,'a',5000,'h','l',20),(7,'a',1,'b','c',2);
/*!40000 ALTER TABLE `economics` ENABLE KEYS */;
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
  `commento` varchar(1000) NOT NULL,
  `id_candidato` int NOT NULL,
  `user_insert` varchar(45) NOT NULL,
  `data_insert` date NOT NULL,
  PRIMARY KEY (`id_feedback`),
  KEY `id_candidato_idx` (`id_candidato`),
  KEY `tipo_fb_idx` (`tipo`),
  CONSTRAINT `id_candidato_fb` FOREIGN KEY (`id_candidato`) REFERENCES `candidato` (`id_candidato`),
  CONSTRAINT `tipo_fb` FOREIGN KEY (`tipo`) REFERENCES `tipo_feedback` (`tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `id_file` int NOT NULL AUTO_INCREMENT,
  `file_data` longblob NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `id_candidato` int NOT NULL,
  `tipo` varchar(200) NOT NULL,
  PRIMARY KEY (`id_file`),
  KEY `id_candidato_fk_idx` (`id_candidato`),
  CONSTRAINT `id_candidato_fk1` FOREIGN KEY (`id_candidato`) REFERENCES `candidato` (`id_candidato`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funzionalita`
--

LOCK TABLES `funzionalita` WRITE;
/*!40000 ALTER TABLE `funzionalita` DISABLE KEYS */;
INSERT INTO `funzionalita` VALUES (5,'aggiorna candidato'),(18,'aggiunta allegati'),(24,'aggiunta area'),(2,'aggiunta candidati'),(16,'aggiunta costi'),(17,'aggiunta economics'),(3,'aggiunta feedback'),(4,'aggiunta mansione'),(20,'aggiunta qualification meeting'),(23,'aggiunta specializzazione'),(6,'modifica anagrafica'),(12,'modifica costi'),(10,'modifica economics'),(14,'modifica feedback'),(8,'modifica profilo professionale'),(22,'modifica qualification meeting'),(19,'visualizza allegati'),(1,'visualizza anagrafica'),(15,'visualizza anagrafica completa'),(25,'visualizza area'),(11,'visualizza costi'),(9,'visualizza economics'),(13,'visualizza feedback'),(26,'visualizza mansione'),(7,'visualizza profilo professionale'),(21,'visualizza qualification meeting'),(27,'visualizza specializzazione');
/*!40000 ALTER TABLE `funzionalita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mansione`
--

DROP TABLE IF EXISTS `mansione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mansione` (
  `mansione` varchar(45) NOT NULL,
  PRIMARY KEY (`mansione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mansione`
--

LOCK TABLES `mansione` WRITE;
/*!40000 ALTER TABLE `mansione` DISABLE KEYS */;
INSERT INTO `mansione` VALUES ('Active safety\'\''),('ADAS'),('Analista funzionale'),('Analista tecnico'),('Analista tempi e metodi '),('Architect'),('Automotive designer'),('Batterie '),('BOM specialist'),('CAS modeler'),('Centraline'),('CFD'),('Clay modeler'),('Color&Trims'),('Composite designer'),('Crash test'),('Data scientist '),('DBA Specialist '),('Dinamica veicolo'),('DMU-VMU'),('Fattibilista'),('FEM'),('GD&T'),('Grafico'),('HMI'),('Industrial designer'),('Infotainment'),('Modellazione 3D'),('NVH'),('Passive safety'),('Progettazione sistemi di sicurezza'),('Progettista attrezzature'),('Progettista elettrico'),('Progettista esterni'),('Progettista ferroviario'),('Progettista interni'),('Progettista lighting'),('Progettista parti mobili'),('Progettista powertrain'),('Progettista stampi'),('Program manager'),('Project manager'),('Qualità percepita'),('Sistemista applicativo'),('Sistemista networking '),('Sistemista security'),('Sviluppatore .NET'),('Sviluppatore COBOL'),('Sviluppatore Embedded'),('Sviluppatore Java'),('Sviluppatore Mobile'),('Sviluppatore PL\\ SQL'),('Tecnico officina'),('Test engineer'),('Test sistemi elettrici'),('Test veicolo'),('UX-UI Specialist ');
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
  `feedback` varchar(1000) NOT NULL,
  `id_candidato` int NOT NULL,
  `cliente` varchar(45) NOT NULL,
  `user_insert` varchar(45) NOT NULL,
  `data_insert` date NOT NULL,
  `riferimento_gara` varchar(45) NOT NULL,
  PRIMARY KEY (`id_qualification`),
  KEY `id_candidato_qm_idx` (`id_candidato`),
  CONSTRAINT `id_candidato_qm` FOREIGN KEY (`id_candidato`) REFERENCES `candidato` (`id_candidato`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='	';
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruolo`
--

LOCK TABLES `ruolo` WRITE;
/*!40000 ALTER TABLE `ruolo` DISABLE KEYS */;
INSERT INTO `ruolo` VALUES (1,'admin'),(2,'hr'),(3,'sales');
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
INSERT INTO `ruolo_funzionalita` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(1,2),(2,2),(3,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(1,3),(7,3),(11,3),(13,3);
/*!40000 ALTER TABLE `ruolo_funzionalita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seniority`
--

DROP TABLE IF EXISTS `seniority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seniority` (
  `seniority` varchar(45) NOT NULL,
  PRIMARY KEY (`seniority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seniority`
--

LOCK TABLES `seniority` WRITE;
/*!40000 ALTER TABLE `seniority` DISABLE KEYS */;
INSERT INTO `seniority` VALUES ('Expert'),('Graduate'),('Intermediate'),('Junior'),('Senior');
/*!40000 ALTER TABLE `seniority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specializzazione`
--

DROP TABLE IF EXISTS `specializzazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specializzazione` (
  `specializzazione` varchar(45) NOT NULL,
  PRIMARY KEY (`specializzazione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specializzazione`
--

LOCK TABLES `specializzazione` WRITE;
/*!40000 ALTER TABLE `specializzazione` DISABLE KEYS */;
/*!40000 ALTER TABLE `specializzazione` ENABLE KEYS */;
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
INSERT INTO `stato` VALUES ('Attivo'),('Da contattare'),('Nuovo inserito'),('Scartato'),('Selezionato');
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
INSERT INTO `tipo_feedback` VALUES ('Colloquio HR'),('Colloquio Tecnico'),('Mail'),('Social'),('Telefonata');
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
  `id_ruolo` int NOT NULL,
  PRIMARY KEY (`id_utente`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `ruolo_idx` (`id_ruolo`),
  CONSTRAINT `ruolo` FOREIGN KEY (`id_ruolo`) REFERENCES `ruolo` (`id_ruolo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'Admin','admin',1),(2,'Chiara','bauducco',2),(3,'Sales','sales',3);
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

-- Dump completed on 2020-09-23 11:55:34
