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
INSERT INTO `area_competenza` VALUES ('FattibilitÃ '),('Stile');
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
INSERT INTO `business` VALUES ('ICT'),('Ingegneria'),('Telco');
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
  KEY `stato_idx` (`stato`),
  KEY `business_fk_idx` (`business`),
  KEY `seniority_idx` (`seniority`),
  KEY `economics_fk_idx` (`economics`),
  KEY `costo_fk_idx` (`costo`),
  CONSTRAINT `business_fk` FOREIGN KEY (`business`) REFERENCES `business` (`business`),
  CONSTRAINT `costo_fk` FOREIGN KEY (`costo`) REFERENCES `costo` (`id_costo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `economics_fk` FOREIGN KEY (`economics`) REFERENCES `economics` (`id_economics`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `seniority_fk` FOREIGN KEY (`seniority`) REFERENCES `seniority` (`seniority`),
  CONSTRAINT `stato` FOREIGN KEY (`stato`) REFERENCES `stato` (`descrizione`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato`
--

LOCK TABLES `candidato` WRITE;
/*!40000 ALTER TABLE `candidato` DISABLE KEYS */;
INSERT INTO `candidato` VALUES (10,'Rossi','Mario',1969,'3334567893','mario.rossi@gmail.com','Senior','2020-06-27','selezionato','ICT','Linkedin',0,NULL,NULL,NULL),(11,'Stefano','Schiavone',1997,'3330139807','stefano.schiavone@gmail.com','Senior','2020-06-15','scartato','Ingegneria','Linkedin',0,NULL,NULL,NULL),(14,'Semco','Gheorghe',1999,'3291951678','info@semcogheorghe.com','Junior','2020-06-15','selezionato','Ingegneria','Linkedin',0,NULL,NULL,NULL),(16,'Vanna','Giorgio',1960,'3334567896','giorgio.vanna@gmail.com','Senior','2020-07-25','nuovo_inserito','Telco','Linkedin',0,NULL,NULL,NULL),(20,'Bova','Gianluca',1992,'3334567897','gianluca.bova@gmail.com','Junior','2020-06-15','attivo','Ingegneria','Linkedin',1,NULL,1,1),(21,'Nita','Marius',1995,'3334567898','marius.nita@gmail.com','Senior','2020-06-15','nuovo_inserito','Ingegneria','Linkedin',0,NULL,NULL,NULL),(22,'Rossi','Paolo',1994,'4324324','paolo.rossi@gmail.com','junior','2020-08-18','nuovo_inserito','Telco','Linkeidn',0,NULL,NULL,NULL),(23,'Bianchi','Mario',1986,'3333333335','Bianchi.Mario@gmail.com','junior','2020-01-01','nuovo_inserito','ICT','Linkedin',0,'',NULL,NULL),(28,'Nita','Marius',1995,'3279716624','nitamarius.job@gmail.com','Junior',NULL,'nuovo_inserito','Ingegneria','Portogallo',0,NULL,NULL,NULL),(29,'Semco','Stefano',1997,'3245553853','ronaldo@gmail.com','Senior',NULL,'da_contattare','Ingegneria','Portogallo',0,NULL,NULL,NULL),(30,'Samie','Stefano',1997,'3245553853','ronaldo@gmail.com','Senior',NULL,'da_contattare','Ingegneria','Portogallo',0,NULL,NULL,NULL),(31,'Ronaldo','Marius',1995,'3279716624','nitamarius.job@gmail.com','Junior',NULL,'scartato','Ingegneria','Portogallo',0,NULL,NULL,NULL),(32,'Paolino','Paolo',1996,'3334445556','paolo@gmail.com','Senior',NULL,'nuovo_inserito','Telco','Italia',0,NULL,NULL,NULL),(33,'bla ','Gheorghe',1998,'3334445556','semco@gmail.com','Senior',NULL,'nuovo_inserito','ICT','Romania',0,NULL,NULL,NULL),(34,'vasile','vasile',1995,'3245553853','ronaldo@gmail.com','Junior',NULL,'nuovo_inserito','Telco','Boh',0,NULL,NULL,NULL);
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
  CONSTRAINT `area_fk` FOREIGN KEY (`area`) REFERENCES `area_competenza` (`area`),
  CONSTRAINT `id_candidato_fk` FOREIGN KEY (`candidato`) REFERENCES `candidato` (`id_candidato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_area`
--

LOCK TABLES `candidato_area` WRITE;
/*!40000 ALTER TABLE `candidato_area` DISABLE KEYS */;
INSERT INTO `candidato_area` VALUES (10,'FattibilitÃ '),(11,'FattibilitÃ '),(14,'FattibilitÃ '),(16,'FattibilitÃ '),(20,'FattibilitÃ '),(21,'FattibilitÃ '),(28,'FattibilitÃ '),(22,'Stile'),(29,'Stile'),(30,'Stile'),(31,'Stile'),(32,'Stile'),(33,'Stile');
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
  CONSTRAINT `candidato_fk` FOREIGN KEY (`id_candidato_fk`) REFERENCES `candidato` (`id_candidato`),
  CONSTRAINT `mansione` FOREIGN KEY (`mansione`) REFERENCES `mansione` (`mansione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_mansione`
--

LOCK TABLES `candidato_mansione` WRITE;
/*!40000 ALTER TABLE `candidato_mansione` DISABLE KEYS */;
INSERT INTO `candidato_mansione` VALUES (32,'beb'),(10,'CAD'),(16,'CAD'),(30,'CAD'),(31,'CAD'),(34,'CAD'),(11,'Full stack developer'),(14,'Full stack developer'),(20,'Full stack developer'),(21,'Full stack developer'),(28,'Full Stack Developer'),(33,'Full Stack Developer'),(22,'Programmatore'),(29,'Programmatore'),(30,'Programmatore');
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
  CONSTRAINT `specializzazione` FOREIGN KEY (`specializzazione_fk`) REFERENCES `specializzazione` (`specializzazione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_specializzazione`
--

LOCK TABLES `candidato_specializzazione` WRITE;
/*!40000 ALTER TABLE `candidato_specializzazione` DISABLE KEYS */;
INSERT INTO `candidato_specializzazione` VALUES (10,'Photoshop',2),(11,'Java',1),(14,'Hibernate',3),(16,'Photoshop',1),(20,'Java',1),(21,'Java',1),(22,'Hibernate',5),(28,'Hibernate',1),(29,'Java',2),(30,'Java',0),(30,'Photoshop',5),(31,'Hibernate',3),(32,'Java',2),(33,'Hibernate',1),(34,'Java',2);
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
  `costo_orario` decimal(5,2) NOT NULL,
  `costo_giornaliero` decimal(5,2) NOT NULL,
  `commento` varchar(45) NOT NULL,
  PRIMARY KEY (`id_costo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costo`
--

LOCK TABLES `costo` WRITE;
/*!40000 ALTER TABLE `costo` DISABLE KEYS */;
INSERT INTO `costo` VALUES (1,5.00,5.00,'ciao');
/*!40000 ALTER TABLE `costo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `economics`
--

DROP TABLE IF EXISTS `economics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `economics` (
  `id_economics` int NOT NULL,
  `inquadramento` varchar(45) NOT NULL,
  `RAL` decimal(6,2) NOT NULL,
  `benefit` varchar(45) NOT NULL,
  `preavviso` varchar(45) NOT NULL,
  `desiderata` varchar(45) NOT NULL,
  PRIMARY KEY (`id_economics`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `economics`
--

LOCK TABLES `economics` WRITE;
/*!40000 ALTER TABLE `economics` DISABLE KEYS */;
INSERT INTO `economics` VALUES (1,'ok',6.20,'ok','ok','ok');
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
  `commento` varchar(200) NOT NULL,
  `id_candidato` int NOT NULL,
  `user_insert` varchar(45) NOT NULL,
  `data_insert` date NOT NULL,
  PRIMARY KEY (`id_feedback`),
  KEY `id_candidato_idx` (`id_candidato`),
  KEY `tipo_fb_idx` (`tipo`),
  CONSTRAINT `id_candidato_fb` FOREIGN KEY (`id_candidato`) REFERENCES `candidato` (`id_candidato`),
  CONSTRAINT `tipo_fb` FOREIGN KEY (`tipo`) REFERENCES `tipo_feedback` (`tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (3,'Social','2020-08-06','Esperienza minima, inglese e tedesco scolastici',10,'Chiara','2020-08-05'),(4,'Telefonata','2020-08-08','ingegnere aereospaziale. Non interessato all\'analisi FeM bendÃ¬ alle attivitÃ  di manufacturing ',11,'Chiara','2020-08-05'),(5,'Colloquio HR','2020-08-01','ha lavorato per una societÃ  che si occupava di stampaggio e imbutitura, come commerciale sul mercato tedesco. ',10,'Chiara','2020-08-05'),(7,'Social','2020-08-08','Neodiplomato itis pininfarina, timido all\'inizio ma proattivo. Ottimo potenziale, zero inglese.',10,'Chiara','2020-08-05'),(8,'Colloquio HR','2020-08-04','Bravissimo',11,'Chiara','2020-08-05'),(9,'Colloquio Tecnico','2020-08-13','Bravissimo',16,'Chiara','2020-08-05'),(10,'Mail','2020-08-11','Bravissimo',11,'Chiara','2020-08-05'),(11,'Telefonata','2020-07-31','Feedback di prova',29,'Chiara','2020-08-25'),(12,'Telefonata','2020-07-30','Feedback di prova',22,'Chiara','2020-08-26'),(13,'Telefonata','2020-08-06','Feedback di prova',32,'Chiara','2020-08-26');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (9,_binary 'mysqldump -u \"root\" -p\"corso\" --opt --add-drop-database --lock-all-tables --databases \"progetto_hr\" > \"mio_dump.sql\"','home.txt',16,'text/plain'),(10,_binary 'mysqldump -u \"root\" -p\"corso\" --opt --add-drop-database --lock-all-tables --databases \"progetto_hr\" > \"mio_dump.sql\"','home.txt',22,'text/plain'),(11,_binary 'IT\r\nProgettista Meccanico\r\nCAE\r\nProgettista Meccanico\r\nManufacturing Engineer\r\nProgettista Meccanico\r\nProject manager\r\nHR\r\nNeolaureato Automotive engineer\r\nProgettista Meccanico\r\nProgettista meccanico\r\nDistinta base\r\nDisinta base\r\nImpianti antincendio\r\nDesigner\r\ndistinta base\r\nIngegnere gestionale\r\nNeodiplomato\r\nTeam Leader\r\nDistinta base\r\nIngegnere Meccanico\r\nProgettista Meccanico\r\nDistinta base\r\nAssistant manager \r\nProgettista Meccanico\r\nMechanical Engineer\r\nIngegnere elettronico\r\nCategoria protetta\r\nDSE FPT\r\nProgettista Meccanico\r\nProgettista meccanico\r\nDistinta base\r\nIngegnere CFD\r\nProduction Engineer\r\nAlias Designer \r\nProgettazione meccanica\r\nProgettista Meccanico\r\nIngegnere aerospaziale\r\nIngegnere meccanico\r\nProgettista Meccanico\r\nControllo qualità\r\nCAE Engineer\r\nProject Manager\r\nIngegnere industriale\r\nIngegnere meccanico\r\nProject manager junior\r\nJunior Mechanical Engineer\r\nProgettista Meccanico\r\nIngegnere meccanico\r\nCAE Engineer\r\nDesigner\r\nCAE Engineer\r\nProgettista Meccanico\r\nIngegnere elettrico e dell\'automazione\r\nProgettista Meccanico\r\nTest engineer\r\nTecnico di laboratorio chimico biologico\r\ningegnere meccanico\r\nProgettista meccanico\r\nNVH Engineer\r\nProgettista Meccanico\r\nResponsabile ufficio tecnico\r\nProgettista Meccanico\r\ndistinte base\r\ningegnere elettronico\r\nIngegnere aerospaziale\r\nAnalista strutturale\r\nHR \r\nPM\r\nLastratura\r\nIngegnere meccatronico\r\nCAE Engineer\r\nCommerciale\r\nIngegnere aerospaziale\r\nProgettista Meccanico\r\nProgettista \r\nRecruiter\r\nProgettista\r\nSQA Altom Railway\r\nNeolaureato\r\nDistinta base\r\nProgettista Meccanico\r\nHelp Desk IT\r\nTempi&metodi\r\nElectric/Hybrid Engineer\r\nDMU\r\nModellatore CAS\r\nHR\r\nNeolaureato\r\nPerito Elettronico - Elettrotecnico\r\nIngegnere meccanico aerondinamica\r\nIngegnere biomedico\r\nTempi&metodi\r\nTecnico di Laboratorio\r\nJunior Business Manager\r\nHR\r\nCAE Engineer\r\nsap\r\nTecnico di Laboratorio\r\nDisegnatore tecnico\r\nLaureando in economia e commercio\r\nProgettista meccanico\r\nAccount Manager\r\nProgettazione meccanica\r\nIndustrial designer\r\ningegnere meccanico\r\nIngegnere aerospaziale\r\nDistinta base\r\nProgettista Meccanico\r\nTecnico Informatico\r\nTecnico Informatico\r\ningegnere meccanico-iso pantaleo\r\nCAE Engineer\r\nProgettista meccanico\r\nIngegnere meccanico\r\nPerformance engineer\r\nControl Engineer\r\nElectronic engineer\r\nProgettista Meccanico\r\nCategoria protetta\r\nProgettista Meccanico\r\nDMU\r\nCost and price analyst manager\r\nIngengere biomedico/meccatronico\r\nSoftware Project Manager \r\nNeolaureato\r\nCADCAM\r\nNeodiplomato\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nTecnico di Laboratorio\r\nHR\r\ningegnere meccanico\r\nProcess Engineer\r\nQuality Engineer\r\nQuality Manager\r\nPerformance engineer\r\nSpecifiche ADAS\r\nDMU Engineer\r\nProgettista Meccanico\r\nIndustrial designer\r\nPMO\r\nHR\r\nModel Based Design\r\n\r\nPMO\r\nIngegnere meccanico\r\nDB/HR\r\nProgettista Meccanico\r\nIngegnere Elettrico\r\nDistinta base\r\nSoftware engineer\r\nProgettista Meccanico\r\nCar Designer\r\nTempi e metodi\r\nStile\r\nProgettista Meccanico\r\nProject quality engineer\r\nProgettista Meccanico\r\nAnalista costi\r\nProgettista meccanico \r\nProgettista meccanico \r\nImpiegata commerciale\r\nBI Specialist\r\nMechanical/Industrial Engineer\r\nTecnico informatico\r\nPMO\r\nTest&Validation \r\nNeolaureato\r\nBusiness Intelligence\r\nHelp Desk IT\r\nHR\r\nHR\r\nDistinta base\r\nCAE Engineer\r\nLead Test engineer\r\nTecnico Diagnostico\r\nCost Engineer\r\nProgettista Meccanico\r\nProgettazione meccanica\r\nDistinta base\r\nProgettista Meccanico\r\nHR\r\nDistinta base\r\nCAE Engineer\r\nReferente applicativi aziendali\r\nDistinta base\r\nCategoria protetta\r\nCost modeling engineer\r\nProgettista meccanico\r\nProgettista Meccanico\r\nStudente ITIS\r\nHR\r\nProgettista Meccanico\r\nCAM/CAM\r\nProgettista Meccanico\r\nIngegnere elettrico\r\nIngegnere del cinema e dei mezzi di comunicazione\r\nProgettista meccanico\r\nCategoria protetta\r\nComposite Designer\r\nDistinta base\r\nProgettista meccanico\r\nCAE Engineer\r\nProgettista senior\r\nR&D Senior engineer\r\n\r\nProgettista Meccanico\r\nTempi e metodi\r\nIngegnere meccanico\r\nAutomotive engineer\r\ningegnere meccanico/analista strutturale\r\nProgettista Meccanico\r\nDesigner\r\nTeam Leader progettista\r\nHR\r\nDistinta base\r\ndistinte base\r\nDesign e comunicazione visiva\r\nalias designer\r\nCAD/CAS Modeler\r\nCrash engineer\r\nProject manager\r\nAutomotive engineer\r\nPerformance engineer\r\nProgettista\r\nProgettista\r\nLaureando Ingegneria meccanica\r\nCAE Engineer\r\nProgettista meccanico\r\nSenior car designer\r\nTempi&metodi\r\nPerformance engineer\r\nSenior Product Application Specialist\r\nProgettista meccanico\r\nSystem architect\r\nQuality Engineer\r\nProgettista Meccanico\r\nHR\r\nDistinta base\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nTecnico di Laboratorio\r\nDistinta base\r\nBusiness Intelligence \r\ncost engineer\r\nHR\r\nElectronic engineer\r\nProgettista Automotive\r\nSpecialista analisi virtuale\r\nProgettista Meccanico\r\nProduct and Process Engineer\r\nSystem Cost Engineer\r\nHR\r\nProgettista Meccanico\r\nSoftware Engineer\r\nHR\r\nProgettista Meccanico\r\nProgettista meccanico\r\ntecnico industriale\r\nProcess Engineer\r\nHR\r\nDistinta base\r\nDistinta base\r\nLaureando\r\nIngegnere biomedico\r\nNeolaureata \r\nSoftware Engineer\r\nInformation Technology\r\nProgettista Meccanico\r\nIngegnere di durata\r\nCAE Engineer\r\nProgettista Meccanico\r\nHR\r\nDMU Engineer\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nHR Consultant\r\nCategoria protetta\r\nCAE Engineer\r\nCustomer care\r\nFE Developer\r\nProgettista Meccanico\r\nIngegnere dell\'Autoveicolo\r\nCost \r\nDesigner\r\nCar Designer\r\nProgettista Meccanico\r\nProgettista Meccanico \r\nDistinta base\r\nSviluppatore software \r\nSoftware Engineer\r\nProgram manager \r\nProgettista meccanico\r\nProgettista Meccanico\r\nNeolaureato\r\nPerformance engineer\r\nHIL \r\nBusiness Intelligence Architect\r\nCAE Engineer\r\nStudentessa\r\nHR\r\nAnalista strutturale\r\nTest Manager\r\nCAD designer\r\nTempi&metodi\r\nProgettista Meccanico\r\nProgettazione meccanica\r\nProject Manager\r\nProgettista Meccanico\r\nProcess Engineer\r\nSenior Stress Engineer\r\nDistinta base\r\nPerito elettrotecnico\r\nOperaio tecnico\r\nProgettista Meccanico\r\nDistinta base\r\nDistinta base\r\nIngegnere meccanico\r\nPMO\r\nCAE Engineer\r\nStile\r\nProgettista Meccanico\r\nHR\r\nHR Consultant\r\nService Engineer\r\nDisegnatore modellista\r\nDistinta base\r\nProgettista meccanico\r\nCAE Engineer\r\nCAE Engineer\r\nFront end designer & developer\r\nWeb design\r\nAdas Specialist\r\nNeolaureato\r\nOptical designer\r\nStile\r\nCAE Engineer\r\nNeolaureato\r\nProgettista Meccanico\r\nGD&T\r\nCost Analist e Benchmarking\r\nModellatore CAS\r\nprogettista meccanico\r\nCAE Engineer\r\nHVAC Engineer\r\nIngegnere meccanico\r\nIngegnere innovazione del prodotto\r\nTest Engineer\r\nSAP\r\nProgettista Meccanico\r\nLead Engineer design\r\nResearch Fellow\r\ndistinte base\r\nProgettista Meccanico\r\nTesting\r\nDRE\r\nAutomotive designer\r\nProgettista CAD\r\nhr/amministrazione\r\nAssistant manager \r\nIndustrial Engineer\r\nVehicle Engineer\r\nADAS\r\nHR\r\nNeolaureata ingegneria aerospaziale\r\nProgettista Meccanico\r\nIngegnere aerospaziale\r\nProgettista senior,responsabile area tecnica\r\nTp engineer\r\nMechanical Engineer\r\nCAE Engineer\r\nResponsabile elettrico e coordinatore service\r\nTest engineer\r\nSviluppatore Software\r\nProgettista meccanico\r\nIT\r\nProject Manager\r\nProgettista meccanico\r\nCAE Engineer\r\nNeolaureata\r\ndistinta/ Cost\r\nProgettista Meccanico\r\nProgram manager \r\nProgettista meccanico\r\nProgettista meccanico\r\nCalcolista\r\nNeolaureata \r\nPerformance engineer\r\nInformatico\r\nTecnico Diagnostico\r\nHR\r\nTecnico informatico\r\nHR\r\nProgettista Meccanico\r\nVehicle Engineer\r\nProgettista meccanico\r\nDB/HR\r\nProject Manager\r\nEngine testing engineer bpe\r\nCAE Engineer\r\nStructural engineer\r\nFront end architect consultant\r\nHR\r\nVehicle application Engineer\r\nIngegnere meccanico\r\nProgettista Meccanico\r\nCAE Engineer\r\nTest engineer\r\nProgram Manager \r\nProgettista meccanico\r\nProgettista Meccanico\r\nSimulation Engineer-vehicle structural analyst\r\nLead Project Engineer\r\nTecnico di Laboratorio\r\nProgettista Meccanico\r\nPerformance Engineer\r\nProgettista Meccanico\r\nDistinta base\r\nComposite Designer\r\nHR\r\nProgettista Meccanico\r\nIngegnere biomedico\r\nApplication Engineer\r\nTransportation Designer\r\nProgettista  meccanico\r\nIngegnere aerospaziale\r\nFMEA Consultant\r\nNeolaureato\r\nCAE Engineer\r\nTransportation Designer\r\nIngegnere R&D\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nIngegnere meccanico\r\nNeolaureato\r\nAutomotive Engineer\r\nProgettista Meccanico\r\nProgettista meccanico\r\nDistinta base\r\nProgettista cablaggi\r\nWiring harness\r\nHR\r\nProgettista meccanico\r\nHR\r\nTeam Leader Progetto Lancia 037 4WD\r\nProgettista Meccanico\r\nHR\r\nProgettista meccanico\r\nProgettista Meccanico\r\nNeolaureato\r\nBusiness Analyst \r\nProgettista Meccanico\r\ningegneria Elettrica\r\nDistinta base\r\nWiring harness specialist\r\nFluyd -Dynamic engineer\r\nDesigner\r\nProgettista meccanico\r\nHR\r\nProgettista Meccanico\r\nControllista\r\nOperaio IDG\r\nHR\r\nSales\r\nSales\r\nJunior product specialist\r\nProgettista meccanico \r\nBusiness manager\r\nProgettista Meccanico\r\nConsulente tecnico\r\nHMI Specialist\r\nDisegnatore CAD/CAM\r\nBusiness manager\r\nDistinta base\r\nTest engineer\r\nhr/sale\r\nSviluppatore Front End\r\nVisual Designer\r\nAirbag manager\r\nProgettista Meccanico\r\nQuality Engineer\r\nDocumentazione tecnica\r\nCFD/Crash engineer\r\nElectronic engineer\r\nApplication engineer\r\nIngegnere dell\'Autoveicolo\r\nGD&T\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nTesting Engineer\r\nBI Specialist\r\nCAE Engineer\r\nIngegnere motore/DRE\r\nPerformance engineer\r\nProgettista Meccanico\r\nProgettista meccanico\r\nProgettista Meccanico\r\nNeolaureato\r\nPerito Elettronico - Elettrotecnico\r\nResponsabile R&D\r\nResponsabile ufficio tecnico finizioni\r\nProgettista Meccanico\r\nTest engineer\r\nModellatore\r\nProgettista meccanico\r\nHR\r\nDisegnatore meccanico\r\nProgettista Meccanico\r\nHR\r\nHelp desk IT\r\nCAE Engineer\r\nProgettista meccanico\r\nOperaio\r\nProgettista meccanico\r\ndistinte base\r\nProgettista di sospensioni\r\nModellatore\r\nProject Manager Junior\r\nDistinta base\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nVirtual Analysis\r\nLaureando\r\nProgettista meccanico\r\nNeolaureato\r\nDesigner\r\nProgettista meccanico \r\nHR\r\nWiring harness\r\nCategoria protetta\r\nTecnico informatico\r\nProgettista Meccanico\r\nProgettista meccanico\r\nProgettista meccanico\r\nCAE\r\nIngegnere Elettronico\r\nProgettista Meccanico\r\nCAD\r\nExecutive Assistant\r\nNeolaureato\r\nProgettista\r\nAlias designer\r\nProgettazione meccanica\r\nBack office\r\nCat.protetta\r\nSenior Application Engineer\r\nCAE Engineer\r\nProgettista meccanico\r\nProgettista Meccanico\r\nDB/HR\r\nPlant Manager\r\ncost engineer\r\ncost engineer\r\nCAE\r\nSegnalamento Ferroviario\r\nneolaureato ingegneria aerospaziale\r\nBusiness Manager\r\nProgettista Meccanico\r\nDistinta base\r\nProgettista Meccanico\r\nProject leader\r\nSafety e ADAS\r\nIT\r\nLodistico\r\nDE\r\nBack office\r\nTecnico informatico\r\nPerito Elettronico - Elettrotecnico\r\nDistinta Base\r\nProgettista meccanico\r\nCAE analyst\r\nAnalista funzionale/PM\r\nAnalista funzionale/PM\r\nIngegnere meccanico\r\nCAE analyst\r\nElectrical designer\r\nIngegneria Meccanica\r\nHR\r\nNeolaureato\r\nProgettista Meccanico\r\nLaureando\r\nlaureando Magistrale Ing. Mecc\r\nMaster thesis project\r\nPassive safety\r\nDistinta base\r\nFirmware Developer\r\nCAE Engineer\r\nHR\r\nCAE\r\nlaureando in Ingegneria meccanica\r\nTempi&metodi\r\nProcurement Engineer\r\nComposite Designer\r\nLaureando Ingegneria meccanica\r\nProgettista Meccanico\r\nhr\r\nCost Engineer\r\nAerospace Engineer\r\nProgettista meccanico\r\nProgettista Meccanico\r\nSviluppatore software \r\nCAE Engineer\r\nProgettista Meccanico\r\nProgettista meccanico\r\nHR\r\nIT\r\nhr\r\n\r\nPhD Complex Systems Engineer\r\nProcess Engineer\r\nProgettista meccanico\r\nProgettista meccanico\r\nIngegnere energetico\r\nSite manager\r\nTecnico informatico\r\nSurface Designer\r\nProgettista Meccanico\r\nCost Analyst\r\nProgettista Meccanico\r\nADAS\r\nTest Engineer\r\nCAE Engineer\r\nProgettista Meccanico\r\nAerospace Engineer\r\nProgettista Meccanico\r\nADAS\r\nCAE Engineer\r\nProgettista meccanico\r\nProgettista meccanico\r\nLogistic operator supplier\r\nModellatore\r\nSystem Engineer\r\nModellatore\r\nNVH Engineer\r\nDistinta base\r\nVehicle Engineer\r\nTempi e metodi\r\nCAE analyst\r\nPerformance engineer\r\nProgettista Meccanico\r\nImpiegata\r\nBiologa\r\nProgettista Meccanico\r\nTecnico di Laboratorio\r\nTest Engineer\r\nMechanical Design Engineer\r\nProgettista Meccanico\r\nDistinta base\r\nModellatore\r\nCAE Engineer\r\nCategoria protetta\r\nDistinta base\r\nDistinta base\r\nCAD designer\r\nIngegnere autoveicolo\r\nProgettista Meccanico\r\nlogistica\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nIcem surf Modeler\r\nProgettista meccanico\r\nProgettista Meccanico\r\nCost Engineering\r\nLaurenado\r\nCAE Engineer\r\nProgettista schemi elettrici\r\nCalcolista strutturale\r\nricercatrice e designer\r\nIngegnere chimico\r\nIngegnere meccanico\r\nIT\r\nCAE Jr\r\nNeolaureato\r\nConsulente Altran Italia SPA\r\nCAE Engineer\r\nDistinta base\r\nFattibilità\r\nProgram manager \r\nSoftware engineer\r\nNeolaureato\r\nProgettista Meccanico\r\nAmministrazione\r\nConsulente IT\r\nProgettista meccanico\r\nDistinta base\r\nTest Engineer\r\nIngegnere meccanico (ADAS)\r\nCalcolista strutturale\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nCost engineering\r\nHR\r\nElectronic engineer\r\nTesting Engineer\r\nsviluppatore software \r\nEngineering specialist\r\nDistinta base\r\nNeolaureato\r\nNeolaureato\r\nProgettista Meccanico\r\nProgettista meccanico\r\nCAE Engineer\r\nDisegnatore meccanico\r\nProcess Engineer\r\nNeolaureato\r\nHR\r\nDB/HR\r\nProgettista meccanico\r\nCost\r\nDistinta/ Cost\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nQuality Engineer\r\nLaureando\r\nHR\r\nProgettista Meccanico\r\nProgettista aeronautico/Automotive\r\nHR\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nHR\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nDistinta base\r\nAssistant manager \r\nSistemista IT/programmatore\r\nMetrologo\r\nProgettista Meccanico\r\nProgettista Meccanico \r\nCost Engineer\r\nBuyer\r\nBusiness Intelligence\r\nProgettista Meccanico\r\nTempi&metodi\r\nTest Engineer\r\nIndustrial designer\r\nHR\r\nPM\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nEngineering specialist\r\nLaureando\r\nField Application Engineer \r\nneolaureato\r\ningegnere elettrico\r\noperaia\r\nProgettista Meccanico\r\nPM/Progettista\r\nTempi&metodi\r\nDistinta\r\nCAD designer\r\nIngegnere Meccanico\r\nDistinta base\r\nComposite Designer\r\ndistinta base\r\nTest Engineer\r\nTest Engineer\r\nProgram Manager\r\nVehicle Engineer\r\nProgettista meccanico\r\nProgettista Meccanico\r\nHR\r\nField Engineer\r\nCollaboratore sportivo\r\nDistinta base\r\nProduct Engineer\r\nHR\r\nHR\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nDMU\r\nProgettista Meccanico\r\nDistinta base\r\nVisual Designer\r\nBusiness Manager\r\nProgettista Meccanico\r\nIngegnere gestionale\r\nTecnico-Road testing department\r\nVisual Designer\r\nAccount Manager\r\nTest&Validation \r\n68/99 \r\nProgettista meccanico\r\nAssistant manager \r\nIngegnere dell\'Autoveicolo\r\nNeolaureato ingegneria meccanica\r\nCalibration Engineer\r\nPM\r\nProgettista meccanico\r\nProgettista Meccanico \r\nApplication Engineer\r\nProgettista meccanico\r\nAssistant manager \r\nSpecialist di componente\r\nTempi&metodi\r\nProgettista Meccanico\r\nAnalista a fatica\r\nTransportation Designer\r\nProgettista meccanico\r\nHR\r\nBussiness Intelligence\r\nElectronic engineer\r\nManagement Engineering\r\nDistinta base\r\nProgettista Meccanico\r\nComposite Designer\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nIngegnere aerospaziale\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nQualità\r\nHR\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nLaureando\r\nCAD designer\r\nBusiness Analyst \r\nWiring harness specialist\r\nProgettista Meccanico\r\nDesign Responsible Engineer\r\nNeolaureato\r\nLaureando\r\nProgettista Elettrica\r\nProject manager\r\nProgettista Meccanico\r\nApplication Engineer in FCA\r\nProgettista Meccanico\r\nCAE Engineer\r\nProject manager\r\nCAE Engineer\r\nHR\r\nProgettista Meccanico\r\nLaureando\r\nTempi&metodi\r\nProgettista Meccanico\r\nCAE Engineer\r\nJunior HR\r\nTeam Leader \r\nField Engineer\r\nCAE Engineer\r\nDirettore tecnico\r\nProject engineer\r\nDRE\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nNeolaureata\r\nCAE Engineer\r\nHR\r\nProject engineer\r\nBOM\r\nProgettista meccanico\r\nProject engineer\r\nMetrologo\r\nIngegnere del veicolo\r\nDistinta base\r\nE/E Analyst\r\nInnovation & Product Designer\r\nProgettista Meccanico\r\nLaureando\r\nCAE Engineer\r\nNeolaureato\r\nInterior Designer\r\nComposite Designer\r\nMetrologo\r\nController\r\nHR\r\nDistinta base\r\nProject quality engineer\r\nDistinta base\r\ncost engineer\r\nBusiness Manager\r\nTecnico Informatico\r\nDistinta base\r\nNeolaureato\r\nProject Manager junior\r\nIngegnere civile\r\ntempi e metodi \r\nProject Leader\r\nIngegnere dell\'Autoveicolo\r\nProgettista Meccanico\r\nQualità\r\nProgettista Meccanico\r\nModellatore superfici\r\nPerformance Engineer\r\nTecnico Informatico\r\nVehicle Engineer\r\nTecnico Informatico\r\nTest Engineer\r\nHR\r\nCapocantiere\r\nUX Designer\r\nCAE Engineer\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nDesigner\r\nProgettista Meccanico\r\nDistinta base\r\nDistinta base\r\nProgettista Meccanico\r\nBusiness Manager\r\nProgettista meccanico\r\nProject Manager\r\nTecnico di Laboratorio\r\nAssistant manager \r\nInformation Technology\r\nCAE Engineer\r\nCAS Modeller\r\nwiring harness\r\nProgettista Meccanico\r\nWiring harness specialist\r\nHR\r\nAlias designer\r\nIngegnere delle telecomunicazioni\r\nHR\r\nProgettista Meccanico\r\nCAE Engineer\r\nDistinta base\r\nCAE Engineer\r\nSimulation Mechanical Engineer\r\nProgettista Meccanico\r\nFront office\r\nNeolaureato\r\nHR\r\nProgettazione meccanica\r\nJunior Business manager\r\nHR\r\nHR\r\nProgettista Meccanico\r\nBI\r\nProgettista Software e Firmware\r\nProgettista meccanico\r\nProgettista Meccanico\r\nProgettista meccanico\r\nProgettista Meccanico\r\nProgettista meccanico\r\nHR\r\nProgettista Meccanico\r\nIndustrial engineer\r\nPerformance Engineer\r\nProgettista meccanico\r\nPMO\r\nProgettista Meccanico\r\nStile\r\nSistemista IT/programmatore\r\nIngegnere meccanico\r\nNeolaureato\r\nSpace and aeronautical engineer\r\nComposite Designer\r\nTecnico informatico\r\nCategoria Protetta\r\nProgettista Meccanico\r\nProgettista  Meccanico\r\nProgettista Meccanico\r\nApplication Engineer\r\nDistinta base\r\nProject engineer\r\nProgettista meccanico\r\nHR\r\nIngegnere meccanico\r\nCAE Engineer\r\nProgettista Meccanico\r\nTransportation Car Designer\r\nCAE Engineer\r\ncost engineer\r\nProgettista Meccanico\r\nProgettista Meccanico \r\nImpiegata export\r\nOperatore Cad\r\nProgettista Meccanico \r\nLaureando\r\nIngegnere Meccatronico \r\nAssistente reparto informatico\r\nProgettista Meccanico\r\nTeam leader \r\nIngegnere meccanico\r\nProgettista meccanico\r\nHW/SW Codesign Engineer\r\nDistinta base\r\nHR\r\nProgettista meccanico\r\nCAE Engineer\r\nIngegnere meccanico\r\nLinux / Embedded Engineer\r\nIT\r\nProgram Manager\r\nDistinta base\r\nProgettista Meccanico\r\nCFD Engineer\r\nWiring harness specialist\r\nTecnico capo officina\r\nProgettista meccanico\r\nDistinta base\r\nCategoria Protetta\r\nNeolaureato\r\nTest&Validation \r\nneolaureato\r\nModellatore\r\nCAS Modeller\r\nCost Engineering\r\nQuality Engineer\r\nDistinta base\r\nProgettista Meccanico\r\nCategoria Protetta\r\nCost / Assistant manager\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nModellatore\r\nDistinta\r\nIngegnere meccanico\r\nProgettista meccanico\r\nProgettista Meccanico\r\nAerospace/Astronautical Engineer\r\nTeam leader\r\nProgettista Meccanico\r\nAerospace Engineer\r\nNVH Engineer\r\nDistinta base\r\nProgettista meccanico\r\nNeodiplomato\r\nProgettista Meccanico\r\nTest Engineer\r\nProgettista Meccanico\r\nProgettista meccanico\r\nDistinta base\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nStudente Ingegneria dell\'autoveicolo\r\nFirmware Developer\r\nHMI\r\nTirocinante\r\nProgettazione meccanica\r\nProgettista Meccanico\r\nIngegnere meccanico\r\nHR\r\nIngegnere aerospaziale\r\nOperaio/Provider\r\nDistinta base\r\nInsegnante\r\nTempi&metodi\r\nDistinta base\r\nCategoria Protetta\r\nTecnico di Laboratorio\r\nLaureando\r\nDistinta base\r\nProgettista meccanico\r\nProgettista Meccanico\r\nCAE Engineer\r\nProgettista Meccanico\r\nDistinta base\r\nProgettista Meccanico\r\nAero structure\r\n68/99\r\nProgettista meccanico\r\nCAE Engineer\r\nProgettista Meccanico\r\nIcem surf Modeler\r\nAutomotive testing\r\nIngegnere meccanico\r\nProgettista Meccanico\r\nModellatore\r\nAnalista strutturale\r\nIngegnere autoveicolo\r\nProgettista Meccanico\r\nAmministrazione\r\nImpiegata assicuarativa\r\nProgettista Meccanico\r\nIngegnere elettrico\r\nCAE Engineer\r\nHR\r\nHR\r\nHR\r\nHelp Desk IT\r\nTest Engineer\r\nProgettista Meccanico\r\nModellatore Stile\r\nProgettista finizioni\r\nAereospatial Engineer\r\nHR\r\nValidation Engineer\r\nProgettista Meccanico\r\nWiring harness specialist\r\nVehicle Dynamics\r\nAmministrazione\r\nWiring harness specialist\r\nProgettista Meccanico\r\nIngegnere Meccanico\r\nPerformance Engineer\r\nProgettista\r\nProgettista meccanico\r\nsviluppatore software \r\nProgettista Meccanico\r\ndistinta Base \r\nProgettista meccanico\r\nNeolaureata\r\nTest/validation engineer \r\nProgettista Meccanico\r\nStress Engineer\r\nElectronic engineer\r\nProgettista meccanico\r\nProgettista Meccanico\r\nQualità\r\nAmministrazione\r\nImpiantista elettrico\r\nHR\r\nDesigner\r\nDistinta base\r\nCommerciale\r\nAnalista costi\r\nNeolaureata\r\nModellatore\r\nProgettista Civile\r\nDistinta base\r\nDistinta base\r\nCommerciale\r\nTest Coordinator\r\nDistinta base\r\nNeolaureato\r\nProgettista Meccanico\r\nNeodiplomato\r\nhr\r\nIngegnere elettronico\r\nProgettista elettrico/elettronico\r\nHR\r\nLaureando\r\nProgettista meccanico\r\nLaureando\r\nProgettista\r\nProgettista Meccanico\r\nLaureando Ingegneria meccanica\r\nProgettista Meccanico\r\nTempi&metodi\r\nLogistico\r\nCatia/Pro E/Creo/Solidworks/Photoshop/Alias/InDesign/Illustrator\r\n\r\nHR\r\nTest Engineer\r\nProgettista Meccanico\r\nDistinta base\r\nBusiness Intelligence\r\nDB/BM\r\nProgram Manager\r\nApplication Team Leader\r\nProgettista Meccanico\r\nBuyer\r\nAssegnista di ricerca\r\nCAE Engineer\r\nAssistant manager \r\nIT\r\nNVH Engineer\r\nTechnical sales\r\nProgettista meccanico\r\nNeodiplomato\r\nProgettista Meccanico\r\nImpiegato\r\nMechanical Engineer\r\nSystem Engineer\r\nTest engineer \r\nProgettista Cad\r\nAlias designer\r\nTest Engineer\r\nDistinta base\r\nDistinta base\r\nAlias designer\r\nWiring harness specialist\r\nHR\r\nNeolaureato\r\nDMU Analyst\r\nProgettista Meccanico\r\nProject Manager \r\nVehicle Integration Engineer\r\nTempi e metodi\r\nIngegnere aereospaziale\r\nSoftware Developer\r\nDistinta base\r\nProgettista Meccanico\r\nTecnico di Laboratorio\r\nProgettista meccanico\r\nDistinta base\r\nProgettista meccanico\r\nNeolaureato \r\nDisegnatore meccanico\r\nProgettista Meccanico\r\nDesigners\r\nLaureando\r\nNeolaureato\r\nImpianti industriali\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nTest Engineer\r\nCAE Engineer\r\nDistinta base\r\nCategoria Protetta\r\nAutomotive Engineer\r\nProgettista Meccanico\r\nDistinta base\r\nProgettista Meccanico\r\nMechanical Engineer\r\nProgettista meccanico\r\nDRE\r\nAnalista strutturale\r\nNeolaureato\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nProgettista meccanico\r\nDesigner\r\n\r\nDistinta base\r\nIT\r\nProject engineer\r\nWiring harness specialist\r\nTecnico di Laboratorio\r\nAutomotive Engineer\r\nTecnico di laboratorio\r\nTest Elettrici\r\nProject Manager\r\nDottore di ricerca\r\nProgettista Meccanico\r\nAutomotive designer \r\nAereodynamic Ingeneer\r\nCAE Engineer\r\nDistinta base\r\nIngegnere meccanico\r\nHR\r\nProgettista meccanico\r\nProgettista Meccanico\r\nPerformance Engineer\r\nProgettista meccanico\r\nNeolaureato\r\nLaureando\r\nDistinta base\r\nProgettista Meccanico\r\nTecnico di laboratorio\r\nProgettista Meccanico\r\nProgettista meccanico\r\nProgettista meccanico\r\nProgettista elettrico\r\nProgettista meccanico\r\nNeolaureato\r\nProgettista Meccanico\r\nIngegnere delle telecomunicazioni\r\nValidation Engineer\r\nCAE Engineer\r\nProgettista Meccanico\r\nHR\r\nCategoria Protetta\r\nTempi e metodi - elettrico\r\nProgettista meccanico\r\nAssistant manager \r\nWeb stategist\r\nIngegnere dell\'Autoveicolo\r\nRelatore Manuali Tecnici\r\nHR\r\ncontract manager \r\nProgettista Meccanico\r\nIngegnere Elettrico\r\nIngegnere industriale\r\n\r\nHR\r\nCAE\r\nComfort sedili\r\nProgettista Meccanico\r\nCustomer service specialist\r\nCAS Modeller\r\nCategoria Protetta\r\nResponsabile tecnico / Project manager\r\nBack office\r\nHR\r\nEnergy Engineer\r\nProgettista Meccanico\r\nResponsabile di prova\r\nIngegnere Meccanico\r\nfattibilità\r\nBusiness Intelligence\r\nNeodiplomato\r\nHR\r\nBusiness Intelligence\r\nDistinta base\r\nCAE Engineer\r\nEsperto Motore\r\nIngegnere meccanico\r\nHR\r\nNeolaureato\r\nModellatore\r\nProgettista Meccanico\r\nmarketing\r\nPM\r\nNeolaureato\r\nModellatore\r\nProgettista Meccanico\r\nIngegnere aerospaziale\r\nProgettista meccanico/ CAE Analist\r\nIngegnere biomedico\r\nProgettista Meccanico\r\nAerospace Engineer\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nDistinta base\r\nAmministrazione\r\nCAE Engineer\r\nCAE Engineer\r\nAlias designer\r\nCAE Engineer\r\nBuyer\r\nProgrammatoreSoftware R&D\r\nDistinta base\r\nCAS Modeller\r\nProgettista Meccanico\r\nDRE\r\nModellatore \r\nHR\r\nAnalista CAE\r\nMotorsport Engineering\r\nPtoject engineer\r\nProgettista Meccanico\r\nIngegnere CFD\r\nDistinta base\r\nR&D Engineer\r\nCategoria Protetta\r\nHR\r\nVehicle Integration Engineer\r\nMechanical Engineer Progettista\r\nCAE Engineer\r\nProgettista meccanico\r\nProgettista Meccanico\r\nTest Engineer\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nTest/Validation Engineer\r\nIngegnere\r\nProgettista Meccanico\r\nDistinta base\r\nCAE Engineer\r\nProgettista meccanico\r\nProgettista Meccanico\r\nImpiegata amministrativa\r\nModellatore\r\nNeolaureato\r\nProgettista Meccanico\r\nDistinta base\r\nHr\r\nProgettista Meccanico\r\nQualità\r\nCost/CAE\r\nWiring harness specialist\r\nPM\r\nDesign Industriale\r\nProgettista Meccanico\r\nCAE Analyst\r\nTransportation Designer\r\nProgettista Meccanico\r\nIngegnere civile\r\nCAE Engineer\r\nResponsabile industrializzazione prodotto\r\nBack office\r\nCategoria Protetta\r\nProgettista Meccanico\r\nDMU\r\nPerito elettrotecnico\r\nDistinta base\r\nSAP/Access\r\nCAE Engineer\r\nDistinta base\r\nHR\r\nLogistico\r\nHR\r\nProgettista Meccanico\r\nIngegnere Elettronico\r\nAerospace Engineer\r\nIngegnere aerospaziale\r\nProgettista Meccanico\r\nProgettista meccanico\r\nDB/HR\r\nWiring harness specialist\r\nContabile\r\nPM\r\nProgettista Meccanico\r\nDirettore tecnico\r\nValidation Engineer\r\nProcess Engineer\r\nHR\r\nProgettista Meccanico\r\nConsulente\r\nCategoria Protetta\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nDistinta base\r\nAnalista strutturale\r\nProgram Manager\r\nCalcolista\r\nCAE Engineer\r\nPM\r\nProgettista meccanico\r\nDisegnazione CAD\r\nIngegnere Informatico\r\nTempi&metodi\r\nWiring harness specialist\r\nProcess Engineer\r\nProgettista Meccanico\r\nProduct Engineer\r\nNeolaureata\r\nIngegnere biomedico\r\nCAE Analyst\r\nDisegnatore modellista\r\nDisegnatore modellista\r\nBusiness Manager\r\nProgettista Meccanico\r\nImpianti elettrici\r\nProgettista meccanico\r\nAlias designer\r\ndigital mockup\r\nCAE Engineer\r\nPerito elettrotecnico\r\nResponsabile Qualità di produzione\r\nProgettista Meccanico\r\nStile\r\nBusinness intelligence\r\nProgettista Meccanico\r\nTecnologo di prodotto\r\nProgettazione meccanica Senior\r\nCAE Engineer\r\nConsulente\r\nDistinta base\r\nCAE Engineer\r\nProduct Engineer\r\n\r\nNeolaureato\r\nDistinta base\r\nCAE Engineer\r\nHR\r\nPerformance engineer\r\nAutomotive Engineer\r\nDirettore tecnico\r\nDisegnatore CAD\r\nTempi e metodi\r\nProgettista Meccanico\r\nProject Chief Interiors\r\nIngegnere meccanico\r\nProgettista Meccanico\r\nLaureando\r\nHR\r\nReceptionist\r\nDistinta base\r\nBusiness Intelligence\r\nProduct Engineer\r\nProgettista meccanico\r\nSystem and test engineer\r\nDiagnostic Specialist\r\nProgettista Meccanico\r\nDistinta base\r\nNeolaureato\r\nDistinta base\r\nImpiegato tecnico\r\nLaureanda \r\nSystem & test engineer\r\nHR\r\nDistinta base\r\nDistinta base\r\nTecnico di laboratorio\r\nHR\r\nDesigner\r\nCAE Engineer\r\nNeolaureato\r\nSviluppatore Software \r\nIngegnere meccanico\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nIngegnere Meccanico\r\nDirettore di stabilimento\r\nIngegnere Meccanico\r\nPM\r\nNeolaureato\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nModellatore\r\nSales Assistant\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nDistinta base\r\nDistinta base\r\nProgettista Meccanico\r\nHVAC Engineer\r\nHR\r\nProgettista Meccanico\r\nUX Researcher\r\nCAE Engineer\r\nTecnico di laboratorio\r\nDistinta base\r\nProgettista Meccanico\r\nSoftware Engineer\r\nProgettista Meccanico\r\nDesigner\r\nCAE Engineer\r\nCAE Engineer\r\nEngine Calibration Engineer\r\nJunior Business manager\r\nDistinta base\r\nDesigner\r\nProgettista meccanico\r\nProgettista Meccanico\r\nHR\r\nDistinta base\r\nCAE Engineer\r\nMechanical Design Engineer\r\nField Engineer\r\nProgettista meccanico\r\nCAE Engineer\r\nProgettista Meccanico \r\nIngegnere meccanico\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nTest Engineer\r\nProgettazione CAD/Fattibilità\r\nProgettista Meccanico\r\nProject Manager\r\nTempi&metodi\r\nNeolaureato\r\nCae Analyst\r\nImpiegato tecnco/elettrico/elettronico\r\nneolaureato\r\nPMO\r\nProgettista Meccanico\r\nProgrammatore Tecnico\r\nicem surf designer\r\nNeolaureato\r\nAutomation Engineer\r\nPM\r\nProgettista meccanico\r\nProgettista Meccanico\r\nCAE Analyst senior\r\nWiring harness specialist\r\nCAE Engineer\r\nProgettista Meccanico\r\nTest Engineer\r\nHR\r\nHR\r\nProgettista meccanico\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nCategoria Protetta\r\nRecruitment Specialist\r\nNeodiplomato\r\nDistinta base\r\nDistinta base\r\nIngegnere meccanico\r\nProgettista Meccanico\r\nProgettista Meccanico \r\nPerformance Engineer\r\nPMO\r\nCAE /Cost Engineering\r\nProgettista Meccanico\r\nIngegnere meccanico\r\nCost assistant manager\r\nLaureando ingegneria autoveicolo novembre2017\r\nModellatore\r\nFirmware and software Developer\r\nCAE Engineer\r\nProgettista Meccanico\r\nProgettista meccanico\r\nProject  Manager Junior\r\nTeam Leader\r\nDRE\r\nHR\r\nCategoria Protetta\r\nCAS Modeller\r\nJunior Project Manager\r\nAnalista CAE\r\nProject Manager\r\nProgettista Meccanico\r\nHVAC Manager\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nCAE Engineer\r\nProgettista meccanico\r\nDisegnatore meccanico\r\nDMU\r\nDistinta base\r\nCAE Engineer\r\nProgram Manager \r\nNeolaureato\r\nNeolaureato\r\nCAE\r\ndistinta base\r\nComposite Designer\r\nHR Junior\r\nHR\r\nWiring harness\r\nDistinta base\r\nProgettista meccanico (team leader)\r\nPerito meccanico\r\nDistinta base\r\nLaureando Ingegneria meccanica\r\nProgettista meccanico\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nNeolaureato\r\nProgettista Meccanico\r\nDistinta base\r\nProgettista Meccanico\r\nEditor Letterario\r\nCustomer care\r\nWiring harness specialist\r\nProgettista meccanico\r\nIngegnere meccanico\r\nIndustrial and Product Designer\r\nCAE Engineer\r\nProgettista Meccanico\r\nCategoria Protetta\r\nProgettista Meccanico\r\nModellatore\r\nProgettista Meccanico\r\nCountry Business Director\r\nProgram manager\r\nBusiness Intelligence\r\nProject Manager\r\nProgettista Meccanico\r\nTecnico Diagnosta CAN \r\nProgettista Meccanico\r\nProgettista meccanico\r\nTempi&metodi\r\nHR\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nTransportation Designer\r\nAmministrazione\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nprogettista meccanico\r\nProgettista Meccanico\r\nIngegnere Elettronico\r\nPerformance Engineer\r\nICEM SURF Modeler\r\nProject Manager\r\nIngegnere meccanico\r\nProgettista Meccanico\r\nModellatore\r\nTransportation Designer\r\nRAMS Engineer\r\nDistinta base \r\nDistinta base\r\nProgettista Meccanico\r\nCAE Engineer\r\nHR\r\nTempi&metodi\r\nProgettista Meccanico\r\nTempi e metodi\r\nDistinta base\r\nProgettista Meccanico\r\nIngegnere aerospaziale\r\nIngegnere meccanico\r\nProgettista meccanico\r\nDesign Engineer\r\nVisual Designer\r\nProgettista meccanico\r\nProgettista meccanico\r\nCommerciale\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nTecnico di laboratorio\r\nHardware Designer\r\nField Engineer\r\nSviluppatore IOS junior\r\nProgettista Meccanico\r\nProgettista meccanico\r\nVisual Designer\r\nDistinta base\r\nDMU\r\nNeolaureato\r\nDistinta base\r\ncost engineer\r\nNeolaureato\r\nNeolaureato\r\nPM Junior\r\nCAS Modeller\r\nCFD\r\nCAS Modeller\r\nProgettista Meccanico\r\nDB\r\nProgettista Meccanico\r\nDistinta base\r\nApplication Engineer\r\nHR\r\nProject Manager\r\nNeodiplomato\r\nProgettista meccanico\r\nElectrical PWT\r\nDistinta base\r\nAlias designer\r\nCAS\r\nProgettista Meccanico\r\nProgettista meccanico\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nTempi&metodi\r\nProgettista Meccanico\r\nConcept&Design Expert\r\nNeolaureata\r\nProgettista Meccanico\r\nModellatore\r\nIngegnere Aeronautico\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nProgettista Meccanico\r\nProgettista Meccanico\r\n','mansioni.txt',22,'text/plain');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funzionalita`
--

LOCK TABLES `funzionalita` WRITE;
/*!40000 ALTER TABLE `funzionalita` DISABLE KEYS */;
INSERT INTO `funzionalita` VALUES (5,'aggiorna candidato'),(2,'aggiunta candidati'),(3,'aggiunta feedback'),(4,'aggiunta mansione'),(6,'modifica anagrafica'),(12,'modifica costi'),(10,'modifica economics'),(14,'modifica feedback'),(8,'modifica profilo professionale'),(1,'visualizza anagrafica'),(15,'visualizza anagrafica completa'),(11,'visualizza costi'),(9,'visualizza economics'),(13,'visualizza feedback'),(7,'visualizza profilo professionale');
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
INSERT INTO `mansione` VALUES ('beb'),('CAD'),('Full Stack Developer'),('pp'),('Programmatore');
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
  `feedback` varchar(200) NOT NULL,
  `id_candidato` int NOT NULL,
  `cliente` varchar(45) NOT NULL,
  `user_insert` varchar(45) NOT NULL,
  `data_insert` date NOT NULL,
  `riferimento_gara` varchar(45) NOT NULL,
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
INSERT INTO `ruolo_funzionalita` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(1,2),(2,2),(3,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(1,3),(7,3),(11,3),(13,3);
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
INSERT INTO `seniority` VALUES ('Junior'),('Senior');
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
INSERT INTO `specializzazione` VALUES ('Hibernate'),('Java'),('Photoshop');
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

-- Dump completed on 2020-08-27 14:28:18
