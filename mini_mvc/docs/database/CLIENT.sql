-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : dim. 04 jan. 2026 à 12:08
-- Version du serveur : 8.0.44-0ubuntu0.24.04.1
-- Version de PHP : 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mini_mvc`
--

-- --------------------------------------------------------

--
-- Structure de la table `CLIENT`
--

CREATE TABLE `CLIENT` (
  `ID_client` int NOT NULL,
  `Nom` varchar(25) NOT NULL,
  `Prenom` varchar(25) NOT NULL,
  `Adresse` varchar(50) DEFAULT NULL,
  `Ville` varchar(25) DEFAULT NULL,
  `CodePostal` varchar(5) DEFAULT NULL,
  `Email` varchar(25) NOT NULL,
  `MDP` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `CLIENT`
--

INSERT INTO `CLIENT` (`ID_client`, `Nom`, `Prenom`, `Adresse`, `Ville`, `CodePostal`, `Email`, `MDP`, `created_at`, `updated_at`) VALUES
(42, 'Dupont', 'Jean', '123 Rue de Paris', 'Lyon', '69000', 'jean.dupont@test.com', '$2y$10$0OimDzwu7N6GVhFzZ8qiWumuZX65CCXZ8/EHQpNAnxMeOER7oBf1G', '2025-12-10 14:31:40', '2025-12-10 14:31:40'),
(44, 'Martin', 'Pierre', '456 Avenue de Lyon', 'Paris', '75001', 'pierre.martin@test.com', '$2y$10$DsCW3BmDCNmXdTtexHFQBut2NrhtNran.umbVUHED3ua/OI.lp2o.', '2025-12-10 15:19:54', '2025-12-10 15:19:54'),
(45, 'Ben Amor', 'Aziz', '104 avenue de paris', 'Paris', NULL, 'aziz.benamor@test.com', '$2y$10$1EfXw852h9T8Hc8ZIpVSve72Wur6H4KkPcmyBhpSPXqxwfxoidC1m', '2025-12-26 15:56:06', '2025-12-26 15:56:06'),
(46, 'Ben ', 'Az', '104 avenue de js', 'Paris', '94800', 'azizbenamor@gmail.com', '$2y$10$l135gKGSGLZJMBZot8aTO.3QVgU8FMctbe8SthG6AzP2qIXihhg2e', '2025-12-27 14:27:35', '2026-01-03 20:05:57');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `CLIENT`
--
ALTER TABLE `CLIENT`
  ADD PRIMARY KEY (`ID_client`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `client_email` (`Email`),
  ADD KEY `client_adresse` (`Adresse`,`CodePostal`,`Ville`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `CLIENT`
--
ALTER TABLE `CLIENT`
  MODIFY `ID_client` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
