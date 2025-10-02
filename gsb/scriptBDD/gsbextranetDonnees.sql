-- MySQL dump 10.19  Distrib 10.3.39-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: gsbextranet
-- ------------------------------------------------------
-- Server version	10.3.39-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `historiqueconnexion`
--

DROP TABLE IF EXISTS `historiqueconnexion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historiqueconnexion` (
  `idMedecin` int(11) NOT NULL,
  `dateDebutLog` datetime NOT NULL,
  `dateFinLog` datetime DEFAULT NULL,
  PRIMARY KEY (`idMedecin`,`dateDebutLog`) USING BTREE,
  CONSTRAINT `historiqueconnexion_ibfk_1` FOREIGN KEY (`idMedecin`) REFERENCES `medecin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historiqueconnexion`
--

LOCK TABLES `historiqueconnexion` WRITE;
/*!40000 ALTER TABLE `historiqueconnexion` DISABLE KEYS */;
INSERT INTO `historiqueconnexion` VALUES (1,'2024-09-01 14:00:00','2024-09-01 14:35:00'),(2,'2024-09-03 07:30:00','2024-09-03 08:10:00'),(3,'2024-09-01 10:15:00','2024-09-01 11:00:00'),(4,'2024-09-01 11:30:00','2024-09-01 12:00:00'),(5,'2024-09-02 09:00:00','2024-09-02 09:35:00'),(6,'2024-09-03 08:30:00','2024-09-03 09:15:00'),(7,'2024-09-03 15:10:00','2024-09-03 15:45:00'),(8,'2024-09-02 12:45:00','2024-09-02 13:30:00'),(9,'2024-09-04 18:00:00','2024-09-04 18:40:00'),(10,'2024-09-04 17:00:00','2024-09-04 17:30:00'),(11,'2024-09-05 22:39:03','2024-09-05 22:39:03');
/*!40000 ALTER TABLE `historiqueconnexion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medecin`
--

DROP TABLE IF EXISTS `medecin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medecin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `motDePasse` varchar(30) DEFAULT NULL,
  `dateCreation` datetime DEFAULT NULL,
  `rpps` varchar(10) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `dateDiplome` date DEFAULT NULL,
  `sport` tinyint(1) DEFAULT NULL,
  `dateConsentement` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medecin`
--

LOCK TABLES `medecin` WRITE;
/*!40000 ALTER TABLE `medecin` DISABLE KEYS */;
INSERT INTO `medecin` VALUES (1,'Lemoine','Claire','0612349876','claire.lemoine@example.com','1984-04-21','$2y$10$hash1','2024-09-05 22:25:38','4561237890','tokenA','2012-05-30',1,'2024-09-02'),(2,'Benoit','Antoine','0612341357','antoine.benoit@example.com','1990-12-15','$2y$10$hash2','2024-09-05 22:25:38','3216549871','tokenB','2008-11-17',0,'2024-09-04'),(3,'Girard','Sophie','0612349632','sophie.girard@example.com','1978-07-19','$2y$10$hash3','2024-09-05 22:25:38','9512634870','tokenC','2006-03-24',1,'2024-09-05'),(4,'Dufour','Julien','0612348745','julien.dufour@example.com','1981-09-28','$2y$10$hash4','2024-09-05 22:25:38','7986541234','tokenD','2009-08-14',0,'2024-09-06'),(5,'Lambert','Nathalie','0612349852','nathalie.lambert@example.com','1987-11-03','$2y$10$hash5','2024-09-05 22:25:38','8529637412','tokenE','2011-02-05',1,'2024-09-07'),(6,'Dubois','Marc','0612342587','marc.dubois@example.com','1992-03-22','$2y$10$hash6','2024-09-05 22:25:38','1237894562','tokenF','2015-06-12',0,'2024-09-01'),(7,'Morel','Julie','0612344563','julie.morel@example.com','1976-08-10','$2y$10$hash7','2024-09-05 22:25:38','7896542135','tokenG','2001-07-25',1,'2024-09-08'),(8,'Roux','Olivier','0612341256','olivier.roux@example.com','1994-12-09','$2y$10$hash8','2024-09-05 22:25:38','1324657890','tokenH','2016-04-29',1,'2024-09-03'),(9,'Legrand','Marie','0612347593','marie.legrand@example.com','1989-05-14','$2y$10$hash9','2024-09-05 22:25:38','4879512364','tokenI','2013-10-18',1,'2024-09-09'),(10,'Petit','Thomas','0612348529','thomas.petit@example.com','1982-01-05','$2y$10$hash10','2024-09-05 22:25:38','9512368745','tokenJ','2007-12-02',0,'2024-09-10'),(11,NULL,NULL,NULL,'floduf1108@gmail.com',NULL,'FloDuf110805!','2024-09-05 22:39:03',NULL,NULL,NULL,NULL,'2024-09-05');
/*!40000 ALTER TABLE `medecin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medecinproduit`
--

DROP TABLE IF EXISTS `medecinproduit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medecinproduit` (
  `idMedecin` int(11) NOT NULL,
  `idProduit` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Heure` time NOT NULL,
  PRIMARY KEY (`idMedecin`,`idProduit`,`Date`,`Heure`),
  KEY `idProduit` (`idProduit`),
  CONSTRAINT `medecinproduit_ibfk_1` FOREIGN KEY (`idMedecin`) REFERENCES `medecin` (`id`),
  CONSTRAINT `medecinproduit_ibfk_2` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medecinproduit`
--

LOCK TABLES `medecinproduit` WRITE;
/*!40000 ALTER TABLE `medecinproduit` DISABLE KEYS */;
INSERT INTO `medecinproduit` VALUES (1,6,'2024-09-04','09:45:00'),(2,5,'2024-09-01','08:00:00'),(3,10,'2024-09-03','18:15:00'),(4,2,'2024-09-03','13:10:00'),(5,3,'2024-09-02','12:30:00'),(6,9,'2024-09-02','07:00:00'),(7,1,'2024-09-03','11:45:00'),(8,4,'2024-09-04','16:00:00'),(9,7,'2024-09-02','10:15:00'),(10,8,'2024-09-01','17:30:00');
/*!40000 ALTER TABLE `medecinproduit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medecinvisio`
--

DROP TABLE IF EXISTS `medecinvisio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medecinvisio` (
  `idMedecin` int(11) NOT NULL,
  `idVisio` int(11) NOT NULL,
  `dateInscription` date NOT NULL,
  PRIMARY KEY (`idMedecin`,`idVisio`),
  KEY `idVisio` (`idVisio`),
  CONSTRAINT `medecinvisio_ibfk_1` FOREIGN KEY (`idMedecin`) REFERENCES `medecin` (`id`),
  CONSTRAINT `medecinvisio_ibfk_2` FOREIGN KEY (`idVisio`) REFERENCES `visioconference` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medecinvisio`
--

LOCK TABLES `medecinvisio` WRITE;
/*!40000 ALTER TABLE `medecinvisio` DISABLE KEYS */;
INSERT INTO `medecinvisio` VALUES (1,4,'2024-09-01'),(2,2,'2024-09-03'),(3,3,'2024-09-05'),(4,5,'2024-09-02'),(5,1,'2024-09-04'),(6,4,'2024-09-06'),(7,2,'2024-09-07'),(8,3,'2024-09-08'),(9,5,'2024-09-09'),(10,1,'2024-09-10');
/*!40000 ALTER TABLE `medecinvisio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `nom` varchar(60) NOT NULL,
  `objectif` mediumtext NOT NULL,
  `information` mediumtext NOT NULL,
  `effetIndesirable` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (1,'PharmaXyl','Réduction de la douleur chronique','PharmaXyl est utilisé pour traiter les douleurs musculaires sévères.','Maux de tête, somnolence'),(2,'CardioPlus','Stabilisation du rythme cardiaque','CardioPlus aide à maintenir un rythme cardiaque stable chez les patients souffrant d’arythmies.','Nausées, vertiges'),(3,'NeuroCure','Amélioration des fonctions cognitives','NeuroCure est prescrit pour les patients atteints de troubles neurologiques légers.','Insomnie, anxiété'),(4,'GastroHeal','Soulagement des troubles digestifs','GastroHeal aide à soulager les symptômes de reflux gastro-œsophagien.','Brûlures d’estomac, ballonnements'),(5,'RespiraMax','Amélioration de la respiration','RespiraMax est utilisé pour traiter les bronchospasmes chez les patients asthmatiques.','Tremblements, palpitations'),(6,'ImmunoGuard','Renforcement du système immunitaire','ImmunoGuard améliore la réponse immunitaire chez les patients immunodéprimés.','Fièvre, douleurs musculaires'),(7,'HepatoCare','Protection du foie','HepatoCare protège les cellules du foie contre les toxines et favorise la régénération.','Fatigue, nausées'),(8,'Dermasoft','Traitement des affections cutanées','Dermasoft est une crème utilisée pour traiter l’eczéma et les irritations cutanées.','Rougeur, irritation'),(9,'OptiVision','Amélioration de la vision','OptiVision est un complément alimentaire pour améliorer la vision nocturne.','Sécheresse oculaire, maux de tête'),(10,'VitaBoost','Supplémentation en vitamines','VitaBoost fournit un mélange équilibré de vitamines essentielles pour améliorer l’énergie.','Troubles digestifs, insomnie');
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visioconference`
--

DROP TABLE IF EXISTS `visioconference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visioconference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomVisio` varchar(100) DEFAULT NULL,
  `objectif` text DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `dateVisio` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visioconference`
--

LOCK TABLES `visioconference` WRITE;
/*!40000 ALTER TABLE `visioconference` DISABLE KEYS */;
INSERT INTO `visioconference` VALUES (1,'Conference A','Objectif A','https://visio.conferenceA.com','2024-09-12'),(2,'Conference B','Objectif B','https://visio.conferenceB.com','2024-09-13'),(3,'Conference C','Objectif C','https://visio.conferenceC.com','2024-09-14'),(4,'Conference D','Objectif D','https://visio.conferenceD.com','2024-09-15'),(5,'Conference E','Objectif E','https://visio.conferenceE.com','2024-09-16');
/*!40000 ALTER TABLE `visioconference` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-05 22:44:44
