-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : dim. 04 jan. 2026 à 12:09
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
-- Structure de la table `LIGNE_DE_COMMANDE`
--

CREATE TABLE `LIGNE_DE_COMMANDE` (
  `ID_Ligne` int NOT NULL,
  `Quantite` int NOT NULL,
  `Prix_Unitaire` decimal(10,2) NOT NULL,
  `Sous_total` decimal(10,2) NOT NULL,
  `ID_Produit` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ID_client` int DEFAULT NULL,
  `ID_Commande` int DEFAULT NULL
) ;

--
-- Déchargement des données de la table `LIGNE_DE_COMMANDE`
--

INSERT INTO `LIGNE_DE_COMMANDE` (`ID_Ligne`, `Quantite`, `Prix_Unitaire`, `Sous_total`, `ID_Produit`, `created_at`, `updated_at`, `ID_client`, `ID_Commande`) VALUES
(57, 1, 299.00, 299.00, 318, '2026-01-03 01:46:51', '2026-01-03 01:47:19', 46, 22),
(61, 1, 299.00, 299.00, 318, '2026-01-03 19:22:35', '2026-01-03 19:22:35', 46, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `LIGNE_DE_COMMANDE`
--
ALTER TABLE `LIGNE_DE_COMMANDE`
  ADD PRIMARY KEY (`ID_Ligne`),
  ADD KEY `ligne_produit` (`ID_Produit`),
  ADD KEY `FK_ID_CLIENT` (`ID_client`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `LIGNE_DE_COMMANDE`
--
ALTER TABLE `LIGNE_DE_COMMANDE`
  MODIFY `ID_Ligne` int NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `LIGNE_DE_COMMANDE`
--
ALTER TABLE `LIGNE_DE_COMMANDE`
  ADD CONSTRAINT `FK_ID_CLIENT` FOREIGN KEY (`ID_client`) REFERENCES `CLIENT` (`ID_client`),
  ADD CONSTRAINT `LIGNE_DE_COMMANDE_ibfk_2` FOREIGN KEY (`ID_Produit`) REFERENCES `PRODUIT` (`ID_Produit`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
