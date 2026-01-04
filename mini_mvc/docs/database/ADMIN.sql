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
-- Structure de la table `ADMIN`
--

CREATE TABLE `ADMIN` (
  `ID_Admin` int NOT NULL,
  `nom_utilisateur` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `mot_de_passe` varchar(25) NOT NULL,
  `role` varchar(25) NOT NULL,
  `date_creation` date NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ADMIN`
--

INSERT INTO `ADMIN` (`ID_Admin`, `nom_utilisateur`, `email`, `mot_de_passe`, `role`, `date_creation`, `created_at`, `updated_at`) VALUES
(1, 'admin1', 'admin1@example.com', 'adminpass123', 'superadmin', '2024-01-01', '2025-12-09 11:07:06', '2025-12-09 11:07:06'),
(2, 'admin2', 'admin2@example.com', 'adminpass456', 'admin', '2024-02-01', '2025-12-09 11:07:06', '2025-12-09 11:07:06');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ADMIN`
--
ALTER TABLE `ADMIN`
  ADD PRIMARY KEY (`ID_Admin`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `admin_email` (`email`),
  ADD KEY `admin_role` (`role`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `ADMIN`
--
ALTER TABLE `ADMIN`
  MODIFY `ID_Admin` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
