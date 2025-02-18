-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 18 fév. 2025 à 21:09
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tifosi`
--
CREATE DATABASE IF NOT EXISTS `tifosi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `tifosi`;

-- --------------------------------------------------------



--
-- Structure de la table `achete`
--

DROP TABLE IF EXISTS `achete`;
CREATE TABLE IF NOT EXISTS `achete` (
  `date_achat` datetime NOT NULL,
  `id_focaccia` int NOT NULL,
  `id_client` int NOT NULL,
  KEY `id_focaccia` (`id_focaccia`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `boisson`
--

DROP TABLE IF EXISTS `boisson`;
CREATE TABLE IF NOT EXISTS `boisson` (
  `id_boisson` int NOT NULL AUTO_INCREMENT,
  `nom_boisson` varchar(45) NOT NULL,
  `id_marque` int NOT NULL,
  PRIMARY KEY (`id_boisson`),
  KEY `id_marque` (`id_marque`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `boisson`
--

INSERT INTO `boisson` (`id_boisson`, `nom_boisson`, `id_marque`) VALUES
(1, 'Coca-cola zéro', 1),
(2, 'Coca-cola original', 1),
(3, 'Fanta citron', 1),
(4, 'Fanta orange', 1),
(5, 'Capri-sun', 1),
(6, 'Pepsi', 4),
(7, 'Pepsi Max Zéro', 4),
(8, 'Lipton zéro citron', 4),
(9, 'Lipton Peach', 4),
(10, 'Monster energy ultra gold', 3),
(11, 'Monster energy ultra blue', 3),
(12, 'Eau de source', 2);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(45) NOT NULL,
  `age` int NOT NULL,
  `cp_client` int NOT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `comprend`
--

DROP TABLE IF EXISTS `comprend`;
CREATE TABLE IF NOT EXISTS `comprend` (
  `id_focaccia` int NOT NULL,
  `id_ingredient` int NOT NULL,
  KEY `id_focaccia` (`id_focaccia`),
  KEY `id_ingredient` (`id_ingredient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contient`
--

DROP TABLE IF EXISTS `contient`;
CREATE TABLE IF NOT EXISTS `contient` (
  `id_menu` int NOT NULL,
  `id_boisson` int NOT NULL,
  KEY `id_menu` (`id_menu`),
  KEY `id_boisson` (`id_boisson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `focaccia`
--

DROP TABLE IF EXISTS `focaccia`;
CREATE TABLE IF NOT EXISTS `focaccia` (
  `id_focaccia` int NOT NULL AUTO_INCREMENT,
  `nom_focaccia` varchar(45) NOT NULL,
  `prix_focaccia` float NOT NULL,
  `ingredients` varchar(250) NOT NULL,
  PRIMARY KEY (`id_focaccia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `focaccia`
--

INSERT INTO `focaccia` (`id_focaccia`, `nom_focaccia`, `prix_focaccia`, `ingredients`) VALUES
(1, 'Mozaccia', 9.8, 'Base tomate, Mozarella, cresson, jambon fumé, ail, artichaut, champignon, parmesan, poivre, olive noire'),
(2, 'Gorgonzollaccia', 10.8, 'Base tomate, Gorgonzola, cresson, ail, champignon, parmesan, poivre, olive noire\r\n'),
(3, 'Raclaccia', 8.9, 'Base tomate, raclette, cresson, ail, champignon, parmesan, poivre\r\n'),
(4, 'Emmentalaccia', 9.8, 'Base crème, Emmental, cresson, champignon, parmesan, poivre, oignon\r\n'),
(5, 'Tradizione', 8.9, 'Base tomate, Mozarella, cresson, jambon cuit, champignon, parmesan, poivre, olive noire, olive verte\r\n'),
(6, 'Hawaienne', 11.2, 'Base tomate, Mozarella, cresson, bacon, ananas, piment, parmesan, poivre, olive noire\r\n'),
(7, 'Américaine', 10.8, 'Base tomate, Mozarella, cresson, bacon, pomme de terre, parmesan, poivre, olive noire\r\n'),
(8, 'Paysanne', 12.8, 'Base crème, Chèvre, cresson, pomme de terre, jambon fumé, ail, artichaut, champignon, parmesan, poivre, olive noire, œuf\r\n');

-- --------------------------------------------------------

--
-- Structure de la table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE IF NOT EXISTS `ingredients` (
  `id_ingredient` int NOT NULL AUTO_INCREMENT,
  `nom_ingredient` varchar(45) NOT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ingredients`
--

INSERT INTO `ingredients` (`id_ingredient`, `nom_ingredient`) VALUES
(1, 'Ail'),
(2, 'Ananas'),
(3, 'Artichaut'),
(4, 'Bacon'),
(5, 'Base Tomate'),
(6, 'Base crème'),
(7, 'Champignon'),
(8, 'Chevre'),
(9, 'Cresson'),
(10, 'Emmental'),
(11, 'Gorgonzola'),
(12, 'Jambon cuit'),
(13, 'Jambon fumé'),
(14, 'Oeuf'),
(15, 'Oignon'),
(16, 'Olive noire'),
(17, 'Olive verte'),
(18, 'Parmesan'),
(19, 'Piment'),
(20, 'Poivre'),
(21, 'Pomme de terre'),
(22, 'Raclette'),
(23, 'Salami'),
(24, 'Tomate cerise');

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

DROP TABLE IF EXISTS `marque`;
CREATE TABLE IF NOT EXISTS `marque` (
  `id_marque` int NOT NULL AUTO_INCREMENT,
  `nom_marque` varchar(45) NOT NULL,
  PRIMARY KEY (`id_marque`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`id_marque`, `nom_marque`) VALUES
(1, 'Coca-cola'),
(2, 'Cristalline'),
(3, 'Monster'),
(4, 'Pepsico');

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `nom_menu` varchar(45) NOT NULL,
  `prix_menu` float NOT NULL,
  `id_focaccia` int NOT NULL,
  PRIMARY KEY (`id_menu`),
  UNIQUE KEY `id_focaccia` (`id_focaccia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `paye`
--

DROP TABLE IF EXISTS `paye`;
CREATE TABLE IF NOT EXISTS `paye` (
  `jour` datetime NOT NULL,
  `id_client` int NOT NULL,
  `id_menu` int NOT NULL,
  KEY `id_client` (`id_client`),
  KEY `id_menu` (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `achete`
--
ALTER TABLE `achete`
  ADD CONSTRAINT `client_achete` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `focaccia_achete` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `boisson`
--
ALTER TABLE `boisson`
  ADD CONSTRAINT `marque` FOREIGN KEY (`id_marque`) REFERENCES `marque` (`id_marque`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `comprend`
--
ALTER TABLE `comprend`
  ADD CONSTRAINT `focaccia_comprend` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ingredients_compris` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredients` (`id_ingredient`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `contient`
--
ALTER TABLE `contient`
  ADD CONSTRAINT `boisson_contenue` FOREIGN KEY (`id_boisson`) REFERENCES `boisson` (`id_boisson`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_contient` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_focaccia` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `paye`
--
ALTER TABLE `paye`
  ADD CONSTRAINT `client_paye` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_paye` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
