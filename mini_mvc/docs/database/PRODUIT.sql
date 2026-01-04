-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 01 jan. 2026 à 21:48
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
-- Structure de la table `PRODUIT`
--

CREATE TABLE `PRODUIT` (
  `ID_Produit` int NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Description` text,
  `Prix` decimal(10,2) NOT NULL,
  `Stock` int NOT NULL DEFAULT '0',
  `Image` varchar(50) DEFAULT NULL,
  `Actif` tinyint(1) DEFAULT NULL,
  `ID_categorie` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ;

--
-- Déchargement des données de la table `PRODUIT`
--

INSERT INTO `PRODUIT` (`ID_Produit`, `Nom`, `Description`, `Prix`, `Stock`, `Image`, `Actif`, `ID_categorie`, `created_at`, `updated_at`) VALUES
(241, 'Palatino VB-004 Contrebasse 3/4', 'Contrebasse étudiante d\'orchestre', 1299.00, 3, NULL, 1, 20, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(249, 'Schlagwerk CP404 Cajón 2inOne', 'Cajón allemand avec deux surfaces de jeu', 249.00, 10, NULL, 1, 21, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(248, 'Meinl Percussion Cajón Artisan', 'Cajón haut de gamme fait main', 299.00, 8, NULL, 1, 21, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(247, 'Cordoba 15CM Ukulélé Concert', 'Ukulélé acajou Cordoba, excellent son', 99.00, 35, NULL, 1, 20, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(246, 'Kala KA-C Ukulélé Concert', 'Ukulélé acajou, son chaud', 79.00, 40, NULL, 1, 20, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(245, 'Yamaha FG-TA TransAcoustic', 'Guitare avec effets intégrés', 799.00, 6, NULL, 1, 20, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(244, 'Eastman MD315 Mandoline', 'Mandoline F-style de qualité', 699.00, 5, NULL, 1, 20, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(243, 'Deering Goodtime Banjo', 'Banjo 5 cordes américain de qualité', 599.00, 6, NULL, 1, 20, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(242, 'Harley Benton HBO-850 Banjo', 'Banjo 5 cordes abordable', 149.00, 12, NULL, 1, 20, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(250, 'LP Classic II Congas', 'Paire de congas professionnelles', 999.00, 4, NULL, 1, 21, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(240, 'Stagg EDB-3/4 Contrebasse électrique', 'Contrebasse électrique compacte', 699.00, 5, NULL, 1, 20, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(239, 'Yamaha SVC-110 Violoncelle silent', 'Violoncelle électrique pour pratique silencieuse', 2499.00, 2, NULL, 1, 20, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(238, 'Eastman VC100 Violoncelle 4/4', 'Violoncelle étudiant de qualité', 999.00, 4, NULL, 1, 20, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(237, 'Stentor Conservatoire Alto', 'Alto pour étudiants avancés', 599.00, 6, NULL, 1, 20, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(236, 'Yamaha SV-255 Violon électrique', 'Violon électrique silent 5 cordes', 1899.00, 3, NULL, 1, 20, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(235, 'NS Design WAV5 Violon électrique', 'Violon électrique 5 cordes design', 999.00, 4, NULL, 1, 20, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(234, 'Eastman VL80 Violon', 'Violon d\'atelier fait main', 499.00, 10, NULL, 1, 20, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(233, 'Cremona SV-500 Violon', 'Violon artisanal européen', 899.00, 5, NULL, 1, 20, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(259, 'Zildjian K Custom Dark Set', 'Pack cymbales jazz/fusion premium', 1499.00, 3, NULL, 1, 21, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(267, 'Ableton Live 12 Suite', 'Version complète avec tous les instruments', 749.00, 100, NULL, 1, 22, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(266, 'ProMark TX5AW Baguettes', 'Baguettes hickory American Classic', 10.99, 80, NULL, 1, 21, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(265, 'Vic Firth 5A Baguettes', 'Baguettes hickory standard', 9.99, 100, NULL, 1, 21, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(264, 'Evans G2 Coated 14\"', 'Peau de caisse claire sablée', 24.99, 40, NULL, 1, 21, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(263, 'Remo Emperor Clear 12\"', 'Peau de tom claire 12 pouces', 19.99, 50, NULL, 1, 21, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(262, 'Gibraltar 9608MB Rack', 'Rack batterie modulaire', 499.00, 4, NULL, 1, 21, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(261, 'DW 5000 Single Pedal', 'Pédale de grosse caisse légendaire', 299.00, 10, NULL, 1, 21, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(260, 'Pearl Demon Drive P3002D', 'Double pédale de grosse caisse professionnelle', 599.00, 6, NULL, 1, 21, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(232, 'Yamaha V5SA Violon 4/4', 'Violon intermédiaire avec étui et archet', 599.00, 8, NULL, 1, 20, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(258, 'Meinl HCS Pack cymbales', 'Set cymbales laiton abordable', 199.00, 20, NULL, 1, 21, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(257, 'Sabian SBR Performance Set', 'Pack cymbales d\'entrée de gamme', 299.00, 12, NULL, 1, 21, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(256, 'Zildjian A Custom Box Set', 'Pack cymbales Hi-Hat 14\", Crash 16\", Ride 20\"', 899.00, 6, NULL, 1, 21, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(255, 'LP Matador Timbales', 'Timbales 14\" et 15\" avec pied', 449.00, 5, NULL, 1, 21, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(254, 'Meinl PADJ1-L-G Djembé', 'Djembé bois pro avec peau de chèvre', 299.00, 8, NULL, 1, 21, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(253, 'Remo Mondo Djembé 12\"', 'Djembé synthétique résistant', 149.00, 12, NULL, 1, 21, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(252, 'Meinl HB100VSB Bongos', 'Bongos en bois vintage sunburst', 99.00, 18, NULL, 1, 21, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(251, 'Toca Synergy Bongos', 'Bongos en fibre de verre, son puissant', 149.00, 15, NULL, 1, 21, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(205, 'Yamaha DTX402K', 'Batterie électronique compacte pour débuter', 449.00, 15, NULL, 1, 18, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(213, 'Ludwig Breakbeats by Questlove', 'Batterie compacte pour petits espaces', 499.00, 8, NULL, 1, 18, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(212, 'Gretsch Catalina Maple 5 fûts', 'Batterie érable américain au son chaud', 1299.00, 3, NULL, 1, 18, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(211, 'Tama Superstar Classic 5 fûts', 'Batterie érable, hardware robuste', 1099.00, 5, NULL, 1, 18, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(210, 'Pearl Decade Maple 5 fûts', 'Batterie acoustique érable, son pro', 1199.00, 4, NULL, 1, 18, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(209, 'ATV EXS-5', 'Batterie électronique compacte premium', 2999.00, 2, NULL, 1, 18, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(208, 'Efnote 3', 'Batterie électronique design moderne', 2499.00, 2, NULL, 1, 18, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(207, 'Alesis Turbo Mesh Kit', 'Batterie mesh ultra-abordable', 299.00, 20, NULL, 1, 18, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(206, 'Alesis Strike Pro SE', 'Batterie électronique 6 fûts mesh', 1999.00, 3, NULL, 1, 18, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(214, 'Mapex Mars Birch 5 fûts', 'Batterie bouleau, excellent rapport qualité-prix', 799.00, 6, NULL, 1, 18, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(204, 'Yamaha DTX6K-X', 'Batterie électronique avec module DTX-PRO', 1999.00, 4, NULL, 1, 18, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(203, 'Roland VAD506', 'Batterie électronique aspect acoustique', 4999.00, 1, NULL, 1, 18, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(202, 'Roland TD-07KV', 'Batterie V-Drums compacte, peaux mesh', 899.00, 8, NULL, 1, 18, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(201, 'Roland TD-27KV2', 'Batterie électronique V-Drums flagship', 3499.00, 2, NULL, 1, 18, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(200, 'Squier Affinity Jazz Bass', 'Jazz Bass d\'entrée de gamme', 279.00, 20, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(199, 'Ibanez SR505E', 'Basse 5 cordes active, manche fin', 699.00, 6, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(198, 'Music Man StingRay Special', 'Basse active USA, son claquant', 2399.00, 3, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(197, 'Fender Player Precision Bass', 'P-Bass made in Mexico', 849.00, 8, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(223, 'Bach Stradivarius 180ML37', 'Trompette professionnelle légendaire', 3499.00, 2, NULL, 1, 19, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(231, 'Akai EWI 5000', 'Contrôleur à vent sans fil', 899.00, 5, NULL, 1, 19, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(230, 'Roland Aerophone AE-10', 'Instrument à vent électronique', 749.00, 6, NULL, 1, 19, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(229, 'Fox Renard 220 Basson', 'Basson intermédiaire', 8999.00, 1, NULL, 1, 19, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(228, 'Yamaha YOB-241', 'Hautbois pour étudiants', 1999.00, 3, NULL, 1, 19, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(227, 'Muramatsu DS Flûte', 'Flûte traversière professionnelle japonaise', 2999.00, 2, NULL, 1, 19, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(226, 'Pearl PFP-105E Piccolo', 'Piccolo flûte argenté', 899.00, 5, NULL, 1, 19, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(225, 'Conn 88H Trombone', 'Trombone symphonique professionnel', 2999.00, 2, NULL, 1, 19, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(224, 'Yamaha YSL-354', 'Trombone ténor pour étudiants', 899.00, 6, NULL, 1, 19, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(268, 'Ableton Live 12 Intro', 'Version d\'entrée de gamme', 99.00, 100, NULL, 1, 22, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(222, 'Yamaha YTR-2330', 'Trompette Sib pour étudiants', 599.00, 8, NULL, 1, 19, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(221, 'Yamaha YCL-255', 'Clarinette Sib pour étudiants', 599.00, 10, NULL, 1, 19, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(220, 'Buffet Crampon E11 Clarinette', 'Clarinette Sib intermédiaire bois', 1199.00, 5, NULL, 1, 19, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(219, 'Yanagisawa AWO1', 'Saxophone alto pro, son riche', 3499.00, 2, NULL, 1, 19, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(218, 'Selmer Paris Série III Alto', 'Saxophone alto professionnel français', 5999.00, 1, NULL, 1, 19, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(217, 'Yamaha YSS-475II', 'Saxophone soprano intermédiaire', 1999.00, 3, NULL, 1, 19, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(216, 'Yamaha YTS-280', 'Saxophone ténor étudiant, laqué doré', 1499.00, 4, NULL, 1, 19, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(215, 'Sonor AQ2 Stage', 'Batterie érable canadien 5 fûts', 1499.00, 3, NULL, 1, 18, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(312, 'Loopmasters Deep Tech House', 'Pack de samples deep tech', 34.99, 100, NULL, 1, 24, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(320, 'Native Instruments Maschine MK3', 'Groovebox hybride hardware/software', 599.00, 8, NULL, 1, 25, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(319, 'Novation Launchpad Mini MK3', 'Contrôleur compact 64 pads', 99.00, 25, NULL, 1, 25, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(318, 'Novation Launchpad Pro MK3', 'Contrôleur à pads professionnel', 299.00, 10, NULL, 1, 25, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(317, 'Ableton Push 3 Standalone', 'Push 3 version autonome', 1999.00, 3, NULL, 1, 25, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(316, 'Black Octopus Leviathan', 'Mega pack multi-genre', 99.99, 100, NULL, 1, 24, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(315, 'Vengeance Essential House', 'Pack house essentiel', 69.99, 100, NULL, 1, 24, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(314, 'KSHMR Sounds Vol. 3', 'Pack signature KSHMR', 49.99, 100, NULL, 1, 24, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(313, 'Cymatics Diamonds Vol. 2', 'Pack de samples trap/hip-hop', 49.99, 100, NULL, 1, 24, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(321, 'Native Instruments Maschine+', 'Maschine standalone', 1399.00, 4, NULL, 1, 25, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(311, 'Loopmasters Bass House Pack', 'Pack de samples bass house', 29.99, 100, NULL, 1, 24, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(310, 'Output Arcade', 'Abonnement loops et samples créatifs', 9.99, 999, NULL, 1, 24, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(309, 'Spitfire Audio LABS', 'Collection gratuite d\'instruments', 0.00, 999, NULL, 1, 24, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(308, 'Spitfire Audio BBC Symphony Orchestra', 'Orchestre BBC échantillonné', 499.00, 100, NULL, 1, 24, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(307, 'EastWest Hollywood Strings', 'Cordes orchestrales premium', 299.00, 100, NULL, 1, 24, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(306, 'EastWest Hollywood Orchestra', 'Orchestre symphonique complet', 499.00, 100, NULL, 1, 24, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(305, 'Native Instruments Komplete 14 Collector\'s Edition', 'Version collector avec tout', 1799.00, 100, NULL, 1, 24, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(304, 'Native Instruments Komplete 14 Ultimate', 'Collection complète NI', 1299.00, 100, NULL, 1, 24, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(330, 'Novation Circuit Rhythm', 'Sampler groovebox portable', 399.00, 8, NULL, 1, 25, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(338, 'Korg Electribe 2', 'Groovebox classique Korg', 449.00, 8, NULL, 1, 25, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(337, 'Teenage Engineering OP-Z', 'Séquenceur portable multimédia', 599.00, 7, NULL, 1, 25, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(336, 'Polyend Tracker', 'Groovebox tracker style rétro', 599.00, 6, NULL, 1, 25, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(335, 'Roland MC-707', 'Groovebox 8 pistes professionnelle', 899.00, 5, NULL, 1, 25, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(334, 'Roland SP-404 MK2', 'Sampler légendaire nouvelle génération', 499.00, 10, NULL, 1, 25, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(333, 'Elektron Model:Cycles', 'Groovebox FM 6 pistes', 399.00, 8, NULL, 1, 25, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(332, 'Elektron Model:Samples', 'Groovebox 6 pistes abordable', 399.00, 10, NULL, 1, 25, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(331, 'Elektron Digitakt', 'Sampler 8 pistes avec séquenceur Elektron', 849.00, 6, NULL, 1, 25, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(303, 'Native Instruments Komplete 14 Standard', 'Collection d\'instruments NI', 599.00, 100, NULL, 1, 24, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(329, 'Novation Circuit Tracks', 'Groovebox portable avec synthés et samples', 399.00, 10, NULL, 1, 25, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(328, 'Arturia KeyStep Pro', 'Clavier avec séquenceur polyphonique', 449.00, 8, NULL, 1, 25, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(327, 'Arturia BeatStep Pro', 'Séquenceur et contrôleur analogique', 299.00, 12, NULL, 1, 25, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(326, 'Akai Fire', 'Contrôleur dédié FL Studio', 199.00, 15, NULL, 1, 25, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(325, 'Akai MPC Key 61', 'MPC avec clavier 61 touches', 1499.00, 3, NULL, 1, 25, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(324, 'Akai MPC One+', 'MPC compact standalone avec WiFi', 849.00, 8, NULL, 1, 25, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(323, 'Akai MPC Live II', 'MPC standalone avec écran tactile', 1199.00, 5, NULL, 1, 25, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(322, 'Native Instruments Maschine Mikro MK3', 'Maschine compact', 269.00, 15, NULL, 1, 25, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(277, 'Bitwig Studio 5', 'DAW innovant avec modulation avancée', 399.00, 100, NULL, 1, 22, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(285, 'iZotope Ozone 11 Advanced', 'Suite de mastering complète avec AI', 499.00, 100, NULL, 1, 23, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(284, 'FabFilter Total Bundle', 'Tous les plugins FabFilter', 999.00, 100, NULL, 1, 23, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(283, 'FabFilter Pro-C 2', 'Compresseur polyvalent', 179.00, 100, NULL, 1, 23, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(282, 'FabFilter Pro-R 2', 'Reverb algorithmique premium', 199.00, 100, NULL, 1, 23, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(281, 'FabFilter Pro-L 2', 'Limiteur mastering de référence', 169.00, 100, NULL, 1, 23, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(280, 'Avid Pro Tools Ultimate', 'Version complète pour studios pro', 599.00, 100, NULL, 1, 22, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(279, 'Avid Pro Tools', 'Standard de l\'industrie audio', 299.00, 100, NULL, 1, 22, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(278, 'Cockos Reaper', 'DAW puissant à prix mini', 60.00, 100, NULL, 1, 22, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(286, 'iZotope RX 11 Advanced', 'Réparation audio professionnelle', 1199.00, 100, NULL, 1, 23, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(276, 'Reason Studios Reason 12', 'DAW avec rack virtuel iconique', 499.00, 100, NULL, 1, 22, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(275, 'PreSonus Studio One 6 Artist', 'Version intermédiaire', 99.00, 100, NULL, 1, 22, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(274, 'PreSonus Studio One 6 Pro', 'DAW moderne et intuitif', 399.00, 100, NULL, 1, 22, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(273, 'Steinberg Cubase Elements 13', 'Version d\'entrée de gamme', 99.00, 100, NULL, 1, 22, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(272, 'Steinberg Cubase Artist 13', 'Version intermédiaire de Cubase', 329.00, 100, NULL, 1, 22, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(271, 'Steinberg Cubase Pro 13', 'DAW professionnel complet', 579.00, 100, NULL, 1, 22, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(270, 'FL Studio All Plugins Bundle', 'Toutes les versions de FL Studio', 499.00, 100, NULL, 1, 22, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(269, 'FL Studio Signature Bundle', 'Version avec tous les plugins FL', 299.00, 100, NULL, 1, 22, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(294, 'Valhalla Room', 'Reverb de room algorithmique', 50.00, 100, NULL, 1, 23, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(302, 'Kilohearts Multipass', 'Effet multi-bande modulaire', 99.00, 100, NULL, 1, 23, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(301, 'Cableguys ShaperBox 3', 'Suite d\'effets rythmiques', 99.00, 100, NULL, 1, 23, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(300, 'Output Portal', 'Effet granulaire créatif', 149.00, 100, NULL, 1, 23, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(299, 'Spectrasonics Trilian', 'Basses virtuelles complètes', 299.00, 100, NULL, 1, 23, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(298, 'Spectrasonics Keyscape', 'Pianos et claviers échantillonnés', 399.00, 100, NULL, 1, 23, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(297, 'Spectrasonics Omnisphere 2', 'Synthé logiciel massif', 479.00, 100, NULL, 1, 23, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(296, 'Arturia FX Collection 4', 'Collection d\'effets vintage', 399.00, 100, NULL, 1, 23, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(295, 'Arturia V Collection 9', 'Collection de synthés et claviers vintage', 599.00, 100, NULL, 1, 23, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(196, 'Fender Player Jazz Bass', 'Jazz Bass made in Mexico', 849.00, 8, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(293, 'Valhalla VintageVerb', 'Reverb vintage polyvalente', 50.00, 100, NULL, 1, 23, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(292, 'Universal Audio LA-2A', 'Émulation du compresseur optique', 299.00, 100, NULL, 1, 23, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(291, 'Universal Audio Neve 1073', 'Émulation du préampli légendaire', 299.00, 100, NULL, 1, 23, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(290, 'Waves Abbey Road Collection', 'Plugins inspirés d\'Abbey Road Studios', 299.00, 100, NULL, 1, 23, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(289, 'Waves Platinum Bundle', 'Collection étendue de plugins', 249.00, 100, NULL, 1, 23, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(288, 'Waves Gold Bundle', 'Collection de plugins essentiels', 149.00, 100, NULL, 1, 23, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(287, 'iZotope Neutron 4', 'Mixage intelligent avec AI', 399.00, 100, NULL, 1, 23, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(98, 'Yamaha P-515', 'Piano portable haut de gamme, mécanique NWX', 1499.00, 4, NULL, 1, 11, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(106, 'Arturia KeyLab 49 MkII', 'Clavier MIDI 49 touches avec aftertouch', 399.00, 12, NULL, 1, 12, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(105, 'Dexibell Vivo S7', 'Piano de scène italien, échantillonnage holophonique', 2499.00, 2, NULL, 1, 11, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(104, 'Nord Piano 5 88', 'Piano de scène premium, sons de piano légendaires', 3499.00, 2, NULL, 1, 11, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(103, 'Casio GP-510', 'Piano hybride avec mécanique Bechstein', 6999.00, 1, NULL, 1, 11, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(102, 'Casio PX-S3100', 'Piano compact avec sons variés et rythmes', 799.00, 12, NULL, 1, 11, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(101, 'Kawai CN39', 'Piano meuble avec mécanique RHIII', 1999.00, 3, NULL, 1, 11, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(100, 'Kawai ES120', 'Piano portable 88 touches, toucher réaliste', 699.00, 10, NULL, 1, 11, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(99, 'Yamaha CLP-745', 'Piano meuble Clavinova, mécanique GrandTouch', 2499.00, 2, NULL, 1, 11, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(107, 'Arturia KeyLab 88 MkII', 'Clavier MIDI 88 touches lestées', 799.00, 5, NULL, 1, 12, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(97, 'Roland FP-90X', 'Piano flagship portable, mécanique PHA-50', 1999.00, 3, NULL, 1, 11, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(96, 'Roland FP-60X', 'Piano portable premium, mécanique PHA-4 Professional', 1199.00, 5, NULL, 1, 11, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(95, 'Arturia MiniFuse 2', 'Interface compacte et colorée, USB-C', 119.00, 30, NULL, 1, 10, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(94, 'SSL 2+', 'Interface 2 canaux avec préamplis SSL', 279.00, 14, NULL, 1, 10, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(93, 'Universal Audio Volt 476', 'Interface 4 entrées avec compresseur 76', 399.00, 8, NULL, 1, 10, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(92, 'Universal Audio Volt 2', 'Interface 2 canaux avec mode vintage', 189.00, 20, NULL, 1, 10, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(91, 'RME Babyface Pro FS', 'Interface portable ultra-premium, pilotes légendaires', 899.00, 4, NULL, 1, 10, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(90, 'Steinberg UR44C', 'Interface 6 entrées avec DSP intégré', 299.00, 12, NULL, 1, 10, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(116, 'Studiologic SL88 Studio', 'Clavier maître 88 touches mécanique Fatar', 699.00, 4, NULL, 1, 12, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(124, 'Roland JD-08', 'Boutique JD-800, synthé iconique des 90s', 399.00, 8, NULL, 1, 13, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(123, 'Roland Jupiter-Xm', 'Synthé compact avec sons Jupiter/Juno', 1499.00, 4, NULL, 1, 13, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(122, 'Roland Juno-X', 'Synthé numérique inspiré des Juno classiques', 1799.00, 3, NULL, 1, 13, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(121, 'Korg Opsix', 'Synthé FM moderne 6 opérateurs', 699.00, 5, NULL, 1, 13, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(120, 'Korg Modwave', 'Synthé wavetable avec modulation avancée', 699.00, 5, NULL, 1, 13, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(119, 'Korg Wavestate', 'Synthé à synthèse Wave Sequencing 2.0', 699.00, 6, NULL, 1, 13, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(118, 'Korg Prologue 16', 'Synthé analogique 16 voix flagship', 1699.00, 2, NULL, 1, 13, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(117, 'Roli Seaboard Block', 'Clavier expressif 5D, surface en silicone', 299.00, 8, NULL, 1, 12, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(89, 'Steinberg UR22C', 'Interface USB-C Yamaha/Steinberg, fiable', 149.00, 22, NULL, 1, 10, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(115, 'Nektar Impact LX49+', 'Clavier 49 touches avec intégration DAW', 149.00, 20, NULL, 1, 12, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(114, 'M-Audio Hammer 88 Pro', 'Clavier 88 touches lestées marteau gradué', 449.00, 8, NULL, 1, 12, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(113, 'M-Audio Keystation 61 MK3', 'Clavier 61 touches simple et efficace', 119.00, 30, NULL, 1, 12, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(112, 'Novation Launchkey 61 MK3', 'Clavier 61 touches avec pads RGB', 249.00, 12, NULL, 1, 12, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(111, 'Novation Launchkey 49 MK3', 'Clavier 49 touches optimisé Ableton', 199.00, 18, NULL, 1, 12, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(110, 'Native Instruments Komplete Kontrol M32', 'Clavier compact 32 mini-touches', 119.00, 25, NULL, 1, 12, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(109, 'Native Instruments Komplete Kontrol S61', 'Clavier 61 touches Fatar avec écrans', 799.00, 6, NULL, 1, 12, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(108, 'Arturia MiniLab 3', 'Clavier compact 25 touches avec pads et encodeurs', 99.00, 40, NULL, 1, 12, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(62, 'V-Moda Crossfade M-100', 'Casque DJ stylé et robuste, basses puissantes', 249.00, 12, NULL, 1, 8, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(70, 'Focal Shape 65', 'Moniteur premium avec radiateur passif', 649.00, 6, NULL, 1, 9, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(69, 'Focal Alpha 65 Evo', 'Moniteur 6.5 pouces, tweeter inversé Focal', 399.00, 12, NULL, 1, 9, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(68, 'Genelec 8040B', 'Moniteur nearfield professionnel 6.5 pouces', 1099.00, 4, NULL, 1, 9, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(67, 'Genelec 8010A', 'Moniteur compact ultra-précis, idéal petits espaces', 399.00, 10, NULL, 1, 9, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(66, 'Yamaha HS7', 'Moniteur 6.5 pouces, équilibre parfait taille/puissance', 249.00, 25, NULL, 1, 9, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(65, 'Yamaha HS8', 'Moniteur 8 pouces bi-amplifié, grave profond', 349.00, 18, NULL, 1, 9, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(64, 'AIAIAI TMA-2 DJ', 'Casque modulaire personnalisable pour DJ', 229.00, 10, NULL, 1, 8, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(63, 'Audio-Technica ATH-M50xBT2', 'Version Bluetooth du M50x, polyvalent', 199.00, 20, NULL, 1, 8, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(71, 'Presonus Eris E5 XT', 'Moniteur 5.25 pouces avec guide d\'onde', 149.00, 30, NULL, 1, 9, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(61, 'Pioneer HDJ-X10', 'Casque DJ flagship, qualité audiophile', 349.00, 8, NULL, 1, 8, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(60, 'Pioneer HDJ-X7', 'Casque DJ professionnel avec drivers 50mm', 199.00, 15, NULL, 1, 8, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(59, 'Focal Listen Professional', 'Casque fermé circum-aural, conçu en France', 299.00, 8, NULL, 1, 7, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(58, 'AKG K371', 'Casque fermé compact et pliable, son neutre', 129.00, 25, NULL, 1, 7, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(57, 'Beyerdynamic DT 990 Pro', 'Casque ouvert 250 Ohms, scène sonore large', 159.00, 20, NULL, 1, 7, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(56, 'Austrian Audio Hi-X65', 'Casque ouvert haut de gamme, fabrication autrichienne', 399.00, 6, NULL, 1, 7, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(55, 'Shure SRH840', 'Casque studio fermé, réponse en fréquence précise', 149.00, 15, NULL, 1, 7, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(54, 'Sony MDR-7506', 'Casque de monitoring fermé, standard de l\'industrie depuis 30 ans', 99.00, 35, NULL, 1, 7, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(80, 'Focusrite Scarlett 4i4 4ème Gen', 'Interface 4 entrées/4 sorties avec MIDI', 229.00, 20, NULL, 1, 10, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(88, 'PreSonus Studio 1810c', 'Interface 18x8 avec mixeur DSP intégré', 399.00, 10, NULL, 1, 10, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(87, 'PreSonus Studio 24c', 'Interface USB-C 2 canaux, préamplis XMAX', 129.00, 28, NULL, 1, 10, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(86, 'MOTU M4', 'Interface 4 canaux avec monitoring flexible', 249.00, 15, NULL, 1, 10, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(85, 'MOTU M2', 'Interface 2 canaux avec écran LCD, latence ultra-faible', 179.00, 25, NULL, 1, 10, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(84, 'Audient iD44 MkII', 'Interface 20 entrées/24 sorties, flagship', 699.00, 5, NULL, 1, 10, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(83, 'Audient iD14 MkII', 'Interface 10 entrées/6 sorties, qualité studio', 299.00, 12, NULL, 1, 10, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(82, 'Audient iD4 MkII', 'Interface 2 canaux avec préampli classe A', 199.00, 18, NULL, 1, 10, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(81, 'Focusrite Scarlett 18i20 3ème Gen', 'Interface rack 18 entrées/20 sorties', 499.00, 8, NULL, 1, 10, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(125, 'Roland SH-4d', 'Synthé desktop avec séquenceur', 699.00, 6, NULL, 1, 13, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(79, 'Focusrite Scarlett Solo 4ème Gen', 'Interface USB-C compacte 1 entrée', 99.00, 40, NULL, 1, 10, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(78, 'KRK 10s2', 'Subwoofer 10 pouces pour home studio', 399.00, 6, NULL, 1, 9, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(77, 'Yamaha HS8S', 'Subwoofer 8 pouces pour systèmes HS', 449.00, 8, NULL, 1, 9, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(76, 'IK Multimedia iLoud MTM', 'Moniteur compact avec calibration automatique', 349.00, 14, NULL, 1, 9, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(75, 'Neumann KH 120 II', 'Moniteur compact de référence absolue', 799.00, 5, NULL, 1, 9, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(74, 'JBL 308P MkII', 'Moniteur 8 pouces, grave généreux', 299.00, 18, NULL, 1, 9, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(73, 'JBL 305P MkII', 'Moniteur 5 pouces avec guide d\'onde Image Control', 149.00, 35, NULL, 1, 9, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(72, 'Presonus Eris E8 XT', 'Moniteur 8 pouces, excellent rapport qualité-prix', 299.00, 15, NULL, 1, 9, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(169, 'Audio-Technica AT-LP140XP', 'Platine DJ professionnelle', 449.00, 10, NULL, 1, 16, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(177, 'Gibson SG Standard', 'SG USA, double humbucker, légère', 1699.00, 4, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(176, 'Gibson Les Paul Standard 50s', 'Les Paul USA, profil de manche vintage', 2699.00, 3, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(175, 'Fender Vintera 60s Jazzmaster', 'Jazzmaster vintage modified', 1099.00, 4, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(174, 'Fender Player Telecaster', 'Tele made in Mexico, son twang classique', 799.00, 10, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(173, 'Fender American Professional II Stratocaster', 'Strat USA, micros V-Mod II', 1799.00, 5, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(172, 'Rega Planar 1', 'Platine hi-fi britannique légendaire', 399.00, 7, NULL, 1, 16, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(171, 'Pro-Ject Debut Carbon Evo', 'Platine audiophile avec bras carbone', 499.00, 8, NULL, 1, 16, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(170, 'Stanton ST.150 M2', 'Platine DJ robuste à couple ultra-élevé', 599.00, 6, NULL, 1, 16, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(178, 'Gibson ES-335', 'Semi-hollow légendaire, polyvalente', 3499.00, 2, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(168, 'Denon DJ VL12 Prime', 'Platine DJ haut de gamme avec éclairage RGB', 899.00, 5, NULL, 1, 16, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(167, 'Reloop RP-8000 MK2', 'Platine avec pads et contrôle MIDI', 799.00, 4, NULL, 1, 16, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(166, 'Reloop RP-7000 MK2', 'Platine DJ à couple élevé', 599.00, 6, NULL, 1, 16, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(165, 'Pioneer PLX-500', 'Platine DJ d\'entrée de gamme', 299.00, 15, NULL, 1, 16, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(164, 'Pioneer PLX-1000', 'Platine à entraînement direct professionnelle', 699.00, 8, NULL, 1, 16, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(163, 'Reloop Mixon 8 Pro', 'Contrôleur 4 voies standalone', 1499.00, 3, NULL, 1, 15, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(162, 'Roland DJ-707M', 'Contrôleur 4 voies avec entrées micro', 999.00, 4, NULL, 1, 15, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(161, 'Hercules DJControl Inpulse 500', 'Contrôleur 2 voies avec guides lumineux', 299.00, 18, NULL, 1, 15, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(187, 'Gretsch G5420T', 'Hollowbody avec Bigsby, son rockabilly', 899.00, 5, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(195, 'Takamine GN93CE', 'Électro-acoustique NEX avec cutaway', 699.00, 8, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(194, 'Yamaha FG800', 'Guitare acoustique d\'entrée de gamme de qualité', 199.00, 30, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(193, 'Martin 000-15M', 'Guitare acoustique tout acajou', 1499.00, 4, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(192, 'Gibson J-45 Standard', 'Dreadnought acoustique USA légendaire', 2699.00, 2, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(191, 'Taylor 324ce', 'Grand Auditorium mahogany haut de gamme', 1999.00, 3, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(190, 'Taylor 114ce', 'Guitare électro-acoustique Grand Auditorium', 899.00, 6, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(189, 'Harley Benton SC-550 Deluxe', 'Les Paul style à prix mini', 199.00, 25, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(188, 'Squier Classic Vibe 50s Telecaster', 'Tele vintage abordable, qualité surprenante', 399.00, 18, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(160, 'Numark Party Mix II', 'Contrôleur DJ d\'entrée de gamme avec LEDs', 99.00, 40, NULL, 1, 15, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(186, 'Schecter C-1 Hellraiser', 'Guitare metal avec EMG actifs', 899.00, 7, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(185, 'Jackson Soloist SL2', 'Superstrat metal made in USA', 1899.00, 3, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(184, 'Ibanez JEM JR', 'Signature Steve Vai abordable', 499.00, 10, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(183, 'Ibanez RG550', 'Superstrat shred avec Floyd Rose', 999.00, 5, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(182, 'PRS Silver Sky SE', 'Signature John Mayer abordable', 899.00, 6, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(181, 'PRS SE Custom 24', 'Double cut avec Floyd, très polyvalente', 799.00, 8, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(180, 'Epiphone Casino', 'Hollowbody P90, son Beatles', 599.00, 6, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(179, 'Epiphone SG Standard', 'SG abordable, excellent rapport qualité-prix', 399.00, 15, NULL, 1, 17, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(134, 'Behringer DeepMind 12', 'Synthé analogique 12 voix, prix imbattable', 899.00, 10, NULL, 1, 13, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(142, 'Pioneer DJM-S11', 'Table de mixage scratch 2 voies, flagship', 1999.00, 3, NULL, 1, 14, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(141, 'Pioneer DJM-750MK2', 'Table de mixage DJ 4 voies avec Rekordbox DVS', 1399.00, 5, NULL, 1, 14, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(140, 'Pioneer DJM-900NXS2', 'Table de mixage DJ 4 voies, standard club', 2199.00, 3, NULL, 1, 14, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(139, 'Elektron Analog Four MkII', 'Synthé analogique 4 voix avec séquenceur', 1449.00, 3, NULL, 1, 13, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(138, 'Elektron Digitone', 'Synthé FM 8 voix avec séquenceur Elektron', 799.00, 6, NULL, 1, 13, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(137, 'Teenage Engineering OP-1 Field', 'Workstation portable culte, nouvelle génération', 1999.00, 4, NULL, 1, 13, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(136, 'Behringer Model D', 'Clone du Minimoog, le son analogique à petit prix', 299.00, 15, NULL, 1, 13, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(135, 'Behringer Poly D', 'Clone du Minimoog avec paraphonie 4 voix', 699.00, 8, NULL, 1, 13, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(143, 'Allen & Heath Xone:96', 'Table de mixage analogique 6 voies, filtres légendaires', 2299.00, 2, NULL, 1, 14, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(133, 'Waldorf Iridium', 'Synthé wavetable flagship avec écran tactile', 2499.00, 2, NULL, 1, 13, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(132, 'Waldorf Blofeld Keyboard', 'Synthé wavetable compact blanc', 899.00, 5, NULL, 1, 13, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(131, 'ASM Hydrasynth Keyboard', 'Synthé wavetable avec ruban polyphonique', 1299.00, 3, NULL, 1, 13, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(130, 'Novation Summit', 'Double Peak, 16 voix bi-timbral', 2499.00, 2, NULL, 1, 13, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(129, 'Novation Peak', 'Synthé hybride 8 voix, oscillateurs FPGA', 1399.00, 4, NULL, 1, 13, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(128, 'Sequential Prophet Rev2 16', 'Synthé analogique 16 voix, très polyvalent', 1999.00, 2, NULL, 1, 13, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(127, 'Sequential Take 5', 'Synthé analogique 5 voix compact', 1499.00, 3, NULL, 1, 13, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(126, 'Sequential Prophet-5', 'Le synthé analogique légendaire, réédition', 3999.00, 1, NULL, 1, 13, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(151, 'Pioneer DDJ-REV7', 'Contrôleur scratch avec platines motorisées', 1999.00, 3, NULL, 1, 15, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(159, 'Native Instruments Traktor S2 MK3', 'Contrôleur 2 voies compact pour Traktor', 299.00, 15, NULL, 1, 15, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(158, 'Native Instruments Traktor S4 MK3', 'Contrôleur 4 voies avec jogs motorisés', 999.00, 6, NULL, 1, 15, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(157, 'Denon DJ MC6000MK2', 'Contrôleur 4 voies professionnel', 899.00, 5, NULL, 1, 15, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(156, 'Denon DJ SC Live 2', 'Contrôleur standalone 2 voies compact', 899.00, 8, NULL, 1, 15, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(155, 'Denon DJ SC Live 4', 'Contrôleur standalone 4 voies avec écran', 1399.00, 4, NULL, 1, 15, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(154, 'Pioneer DDJ-200', 'Contrôleur compact pour smartphone/tablette', 149.00, 30, NULL, 1, 15, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(153, 'Pioneer DDJ-FLX6', 'Contrôleur 4 voies pour Rekordbox et Serato', 549.00, 12, NULL, 1, 15, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(152, 'Pioneer DDJ-FLX10', 'Contrôleur 4 voies multi-plateforme', 1299.00, 5, NULL, 1, 15, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(53, 'AKG K712 Pro', 'Casque ouvert de référence pour le mixage, coussinets velours', 299.00, 12, NULL, 1, 7, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(150, 'Numark Scratch', 'Table scratch 2 voies abordable avec Serato DJ Pro', 499.00, 10, NULL, 1, 14, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(149, 'Denon DJ X1850 Prime', 'Mixeur 4 voies standalone, rival du DJM-900', 1699.00, 4, NULL, 1, 14, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(148, 'Reloop RMX-95', 'Table DJ 4 voies avec effets numériques', 899.00, 6, NULL, 1, 14, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(147, 'Native Instruments Traktor Z2', 'Mixeur 2 voies pour Traktor avec stems', 799.00, 4, NULL, 1, 14, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(146, 'Rane Seventy', 'Table scratch 2 voies avec MAG FOUR faders', 1199.00, 5, NULL, 1, 14, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(145, 'Rane Seventy-Two MkII', 'Table de mixage scratch avec écran tactile', 1899.00, 3, NULL, 1, 14, '2025-12-30 01:45:33', '2025-12-30 01:45:33'),
(144, 'Allen & Heath Xone:43C', 'Table DJ 4 voies avec carte son intégrée', 899.00, 6, NULL, 1, 14, '2025-12-30 01:45:33', '2025-12-30 01:45:33');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `PRODUIT`
--
ALTER TABLE `PRODUIT`
  ADD PRIMARY KEY (`ID_Produit`),
  ADD KEY `produit_nom` (`Nom`),
  ADD KEY `produit_categorie` (`ID_categorie`),
  ADD KEY `produit_actif` (`Actif`),
  ADD KEY `produit_prix` (`Prix`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `PRODUIT`
--
ALTER TABLE `PRODUIT`
  MODIFY `ID_Produit` int NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `PRODUIT`
--
ALTER TABLE `PRODUIT`
  ADD CONSTRAINT `PRODUIT_ibfk_1` FOREIGN KEY (`ID_categorie`) REFERENCES `CATEGORIE` (`ID_categories`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
