-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 24 sep. 2025 à 19:23
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gsbextranet`
--

-- --------------------------------------------------------

--
-- Structure de la table `historiqueconnexion`
--

DROP TABLE IF EXISTS `historiqueconnexion`;
CREATE TABLE IF NOT EXISTS `historiqueconnexion` (
  `idMedecin` int NOT NULL,
  `dateDebutLog` datetime NOT NULL,
  `dateFinLog` datetime DEFAULT NULL,
  PRIMARY KEY (`idMedecin`,`dateDebutLog`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `historiqueconnexion`
--

INSERT INTO `historiqueconnexion` (`idMedecin`, `dateDebutLog`, `dateFinLog`) VALUES
(17, '2025-09-24 21:21:06', '2025-09-24 21:21:06');

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

DROP TABLE IF EXISTS `medecin`;
CREATE TABLE IF NOT EXISTS `medecin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prenom` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telephone` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mail` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `motDePasse` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dateCreation` datetime DEFAULT NULL,
  `rpps` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dateDiplome` date DEFAULT NULL,
  `sport` tinyint(1) DEFAULT NULL,
  `dateConsentement` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `medecin`
--

INSERT INTO `medecin` (`id`, `nom`, `prenom`, `telephone`, `mail`, `dateNaissance`, `motDePasse`, `dateCreation`, `rpps`, `token`, `dateDiplome`, `sport`, `dateConsentement`) VALUES
(17, NULL, NULL, NULL, 'bob@gmail.com', NULL, 'Flo1234!', '2025-09-24 21:21:06', NULL, NULL, NULL, NULL, '2025-09-24');

-- --------------------------------------------------------

--
-- Structure de la table `medecinproduit`
--

DROP TABLE IF EXISTS `medecinproduit`;
CREATE TABLE IF NOT EXISTS `medecinproduit` (
  `idMedecin` int NOT NULL,
  `idProduit` int NOT NULL,
  `Date` date NOT NULL,
  `Heure` time NOT NULL,
  PRIMARY KEY (`idMedecin`,`idProduit`,`Date`,`Heure`),
  KEY `idProduit` (`idProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `medecinvisio`
--

DROP TABLE IF EXISTS `medecinvisio`;
CREATE TABLE IF NOT EXISTS `medecinvisio` (
  `idMedecin` int NOT NULL,
  `idVisio` int NOT NULL,
  `dateInscription` date NOT NULL,
  PRIMARY KEY (`idMedecin`,`idVisio`),
  KEY `idVisio` (`idVisio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id` int NOT NULL,
  `nom` varchar(60) NOT NULL,
  `objectif` mediumtext NOT NULL,
  `information` mediumtext NOT NULL,
  `effetIndesirable` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `nom`, `objectif`, `information`, `effetIndesirable`) VALUES
(1, 'PharmaXyl', 'Réduction de la douleur chronique', 'PharmaXyl est utilisé pour traiter les douleurs musculaires sévères.', 'Maux de tête, somnolence'),
(2, 'CardioPlus', 'Stabilisation du rythme cardiaque', 'CardioPlus aide à maintenir un rythme cardiaque stable chez les patients souffrant d’arythmies.', 'Nausées, vertiges'),
(3, 'NeuroCure', 'Amélioration des fonctions cognitives', 'NeuroCure est prescrit pour les patients atteints de troubles neurologiques légers.', 'Insomnie, anxiété'),
(4, 'GastroHeal', 'Soulagement des troubles digestifs', 'GastroHeal aide à soulager les symptômes de reflux gastro-œsophagien.', 'Brûlures d’estomac, ballonnements'),
(5, 'RespiraMax', 'Amélioration de la respiration', 'RespiraMax est utilisé pour traiter les bronchospasmes chez les patients asthmatiques.', 'Tremblements, palpitations'),
(6, 'ImmunoGuard', 'Renforcement du système immunitaire', 'ImmunoGuard améliore la réponse immunitaire chez les patients immunodéprimés.', 'Fièvre, douleurs musculaires'),
(7, 'HepatoCare', 'Protection du foie', 'HepatoCare protège les cellules du foie contre les toxines et favorise la régénération.', 'Fatigue, nausées'),
(8, 'Dermasoft', 'Traitement des affections cutanées', 'Dermasoft est une crème utilisée pour traiter l’eczéma et les irritations cutanées.', 'Rougeur, irritation'),
(9, 'OptiVision', 'Amélioration de la vision', 'OptiVision est un complément alimentaire pour améliorer la vision nocturne.', 'Sécheresse oculaire, maux de tête'),
(10, 'VitaBoost', 'Supplémentation en vitamines', 'VitaBoost fournit un mélange équilibré de vitamines essentielles pour améliorer l’énergie.', 'Troubles digestifs, insomnie');

-- --------------------------------------------------------

--
-- Structure de la table `visioconference`
--

DROP TABLE IF EXISTS `visioconference`;
CREATE TABLE IF NOT EXISTS `visioconference` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomVisio` varchar(100) DEFAULT NULL,
  `objectif` text,
  `url` varchar(100) DEFAULT NULL,
  `dateVisio` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `visioconference`
--

INSERT INTO `visioconference` (`id`, `nomVisio`, `objectif`, `url`, `dateVisio`) VALUES
(1, 'Conference A', 'Objectif A', 'https://visio.conferenceA.com', '2024-09-12'),
(2, 'Conference B', 'Objectif B', 'https://visio.conferenceB.com', '2024-09-13'),
(3, 'Conference C', 'Objectif C', 'https://visio.conferenceC.com', '2024-09-14'),
(4, 'Conference D', 'Objectif D', 'https://visio.conferenceD.com', '2024-09-15'),
(5, 'Conference E', 'Objectif E', 'https://visio.conferenceE.com', '2024-09-16');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `historiqueconnexion`
--
ALTER TABLE `historiqueconnexion`
  ADD CONSTRAINT `historiqueconnexion_ibfk_1` FOREIGN KEY (`idMedecin`) REFERENCES `medecin` (`id`);

--
-- Contraintes pour la table `medecinproduit`
--
ALTER TABLE `medecinproduit`
  ADD CONSTRAINT `medecinproduit_ibfk_1` FOREIGN KEY (`idMedecin`) REFERENCES `medecin` (`id`),
  ADD CONSTRAINT `medecinproduit_ibfk_2` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `medecinvisio`
--
ALTER TABLE `medecinvisio`
  ADD CONSTRAINT `medecinvisio_ibfk_1` FOREIGN KEY (`idMedecin`) REFERENCES `medecin` (`id`),
  ADD CONSTRAINT `medecinvisio_ibfk_2` FOREIGN KEY (`idVisio`) REFERENCES `visioconference` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
