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
-- Structure de la table `CATEGORIE`
--

CREATE TABLE `CATEGORIE` (
  `ID_categories` int NOT NULL,
  `Nom` varchar(25) NOT NULL,
  `Description` text,
  `Image` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `parent_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `CATEGORIE`
--

INSERT INTO `CATEGORIE` (`ID_categories`, `Nom`, `Description`, `Image`, `created_at`, `updated_at`, `parent_id`) VALUES
(1, 'Casques & Audio', 'Tout le matériel audio et monitoring', NULL, '2025-12-29 23:51:05', '2025-12-29 23:51:17', NULL),
(2, 'Claviers & Pianos', 'Pianos et claviers de musique', NULL, '2025-12-29 23:51:05', '2025-12-29 23:51:21', NULL),
(3, 'DJ & Mixage', 'Matériel DJ et tables de mixage', NULL, '2025-12-29 23:51:05', '2025-12-29 23:51:23', NULL),
(4, 'Instruments', 'Instruments de musique', NULL, '2025-12-29 23:51:05', '2025-12-29 23:51:25', NULL),
(5, 'Production musicale', 'Logiciels et matériel de production', NULL, '2025-12-29 23:51:05', '2025-12-29 23:51:30', NULL),
(6, 'Accessoires', 'Accessoires et équipements', NULL, '2025-12-29 23:51:05', '2025-12-29 23:51:32', NULL),
(7, 'Casques studio', 'Casques pour studio', NULL, '2025-12-29 23:52:17', '2025-12-29 23:52:27', 1),
(8, 'Casques DJ', 'Casques pour DJ', NULL, '2025-12-29 23:52:17', '2025-12-29 23:52:31', 1),
(9, 'Enceintes', 'Moniteurs et enceintes', NULL, '2025-12-29 23:52:17', '2025-12-29 23:52:33', 1),
(10, 'Interfaces audio', 'Cartes son et interfaces', NULL, '2025-12-29 23:52:17', '2025-12-29 23:52:36', 1),
(11, 'Pianos numériques', 'Pianos électroniques', NULL, '2025-12-29 23:53:54', '2025-12-29 23:55:07', 2),
(12, 'Claviers MIDI', 'Contrôleurs MIDI', NULL, '2025-12-29 23:53:54', '2025-12-29 23:55:18', 2),
(13, 'Synthétiseurs', 'Synthés analogiques et numériques', NULL, '2025-12-29 23:53:54', '2025-12-29 23:55:22', 2),
(14, 'Tables de mixage', 'Mixeurs DJ', NULL, '2025-12-29 23:55:01', '2025-12-29 23:55:24', 3),
(15, 'Contrôleurs DJ', 'Contrôleurs USB', NULL, '2025-12-29 23:55:01', '2025-12-29 23:55:27', 3),
(16, 'Platines vinyles', 'Platines DJ', NULL, '2025-12-29 23:55:01', '2025-12-29 23:55:31', 3),
(17, 'Guitares', 'Guitares électriques, acoustiques et basses', NULL, '2025-12-29 23:56:47', '2025-12-29 23:56:55', 4),
(18, 'Batteries', 'Batteries acoustiques et électroniques', NULL, '2025-12-29 23:56:47', '2025-12-29 23:57:00', 4),
(19, 'Instruments à vent', 'Saxophones, trompettes, flûtes', NULL, '2025-12-29 23:56:47', '2025-12-29 23:57:03', 4),
(20, 'Instruments à cordes', 'Violons, altos, violoncelles', NULL, '2025-12-29 23:56:47', '2025-12-29 23:57:06', 4),
(21, 'Percussions', 'Djembés, congas, cajón', NULL, '2025-12-29 23:56:47', '2025-12-29 23:57:09', 4),
(22, 'Logiciels DAW', 'Logiciels de production musicale', NULL, '2025-12-29 23:56:47', '2025-12-29 23:57:12', 5),
(23, 'Plugins & Effets', 'VST, effets audio', NULL, '2025-12-29 23:56:47', '2025-12-29 23:57:14', 5),
(24, 'Samples & Packs', 'Drum kits, loops, samples', NULL, '2025-12-29 23:56:47', '2025-12-29 23:57:18', 5),
(25, 'Contrôleurs MIDI', 'Pads et surfaces de contrôle', NULL, '2025-12-29 23:56:47', '2025-12-29 23:57:22', 5),
(35, 'Micros studio', 'Microphones pour enregistrement', NULL, '2025-12-29 23:56:47', '2025-12-29 23:56:47', 5);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `CATEGORIE`
--
ALTER TABLE `CATEGORIE`
  ADD PRIMARY KEY (`ID_categories`),
  ADD KEY `categorie_nom` (`Nom`),
  ADD KEY `fk_parent_category` (`parent_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `CATEGORIE`
--
ALTER TABLE `CATEGORIE`
  MODIFY `ID_categories` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `CATEGORIE`
--
ALTER TABLE `CATEGORIE`
  ADD CONSTRAINT `fk_parent_category` FOREIGN KEY (`parent_id`) REFERENCES `CATEGORIE` (`ID_categories`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
