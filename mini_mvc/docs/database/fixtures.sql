USE e-commerce;

INSERT INTO CLIENT (Nom, Prenom, Adresse, Ville, CodePostal, Email, MDP) VALUES
('Dupont', 'Jean', '12 Rue de la Paix', 'Paris', 75002, 'jean.dupont@example.com', 'password123');
('Martin', 'Sophie', '34 Avenue des Champs', 'Lyon', 69003, 'sophie.martin@example.com', 'password456');
('Bernard', 'Luc', '56 Boulevard Saint-Michel', 'Marseille', 13004, 'luc.bernard@example.com', 'password789');
('Durand', 'Claire', '78 Rue Victor Hugo', 'Toulouse', 31005, 'claire.durand@example.com', 'password012');
('Petit', 'Marc', '90 Avenue Jean Jaurès', 'Nice', 06006, 'marc.petit@example.com', 'password345');

INSERT INTO ADMIN (nom_utilisateur, email, mot_de_passe, role, date_creation) VALUES
('admin1', 'admin1@example.com', 'adminpass123', 'superadmin', '2024-01-01');
('admin2', 'admin2@example.com', 'adminpass456', 'admin', '2024-02-01');


INSERT INTO CATEGORIE (Nom, Description, Image) VALUES
('Électronique', 'Appareils électroniques et gadgets', 'electronique.jpg'),
('Vêtements', 'Mode pour hommes et femmes', 'vetements.jpg'),
('Livres', 'Livres de divers genres', 'livres.jpg'),
('Maison', 'Articles pour la maison et le jardin', 'maison.jpg'),
('Sports', 'Équipement et vêtements de sport', 'sports.jpg');

INSERT INTO PRODUIT (Nom, Description, Prix, Stock, Image, Actif, ID_categorie, ID_Admin) VALUES
('Smartphone XYZ', 'Un smartphone haut de gamme avec de nombreuses fonctionnalites.', 699.99, 50, 'smartphone_xyz.jpg', TRUE, 1, 1),
('T-shirt Cool', 'Un t-shirt confortable et style pour toutes les occasions.', 19.99, 200, 'tshirt_cool.jpg', TRUE, 2, 2),
('Roman Aventure', 'Un roman captivant plein d aventures et de mysteres.', 14.99, 100, 'roman_aventure.jpg', TRUE, 3, 1),
('Lampe de Table', 'Une lampe elegante pour illuminer votre espace de vie.', 39.99, 75, 'lampe_table.jpg', TRUE, 4, 2),
('Ballon de Football', 'Un ballon de football de haute qualite pour les matchs et l entrainement.', 29.99, 150, 'ballon_football.jpg', TRUE, 5, 1),
('Casque Audio Bluetooth', 'Casque sans fil avec reduction de bruit active et autonomie de 30 heures.', 149.99, 80, 'casque_audio.jpg', TRUE, 1, 1),
('Tablette Pro 10 pouces', 'Tablette performante avec ecran haute resolution et stylet inclus.', 499.99, 40, 'tablette_pro.jpg', TRUE, 1, 2),
('Montre Connectee Sport', 'Montre intelligente avec GPS integre et suivi de la condition physique.', 199.99, 60, 'montre_connectee.jpg', TRUE, 1, 1),
('Enceinte Portable', 'Enceinte Bluetooth etanche avec son puissant et basses profondes.', 79.99, 120, 'enceinte_portable.jpg', TRUE, 1, 2),
('Clavier Mecanique Gaming', 'Clavier retroeclaire RGB avec touches mecaniques ultra reactives.', 89.99, 90, 'clavier_gaming.jpg', TRUE, 1, 1),
('Jean Slim Homme', 'Jean coupe slim en denim stretch confortable et moderne.', 49.99, 180, 'jean_slim.jpg', TRUE, 2, 2),
('Robe Ete Fleurie', 'Robe legere a motifs floraux parfaite pour les journees ensoleillees.', 34.99, 150, 'robe_ete.jpg', TRUE, 2, 1),
('Veste en Cuir', 'Veste en cuir veritable avec doublure chaude et coupe ajustee.', 189.99, 45, 'veste_cuir.jpg', TRUE, 2, 2),
('Pull Laine Merinos', 'Pull doux en laine merinos ideal pour les saisons froides.', 69.99, 100, 'pull_laine.jpg', TRUE, 2, 1),
('Baskets Running', 'Chaussures de course legeres avec amorti optimal et semelle antiderapante.', 109.99, 130, 'baskets_running.jpg', TRUE, 2, 2),
('Guide de Cuisine', 'Livre de recettes faciles et delicieuses pour tous les jours.', 24.99, 200, 'guide_cuisine.jpg', TRUE, 3, 1),
('Thriller Policier', 'Roman policier haletant avec enquete et rebondissements inattendus.', 12.99, 180, 'thriller_policier.jpg', TRUE, 3, 2),
('Manuel de Programmation', 'Guide complet pour apprendre a coder en Python et JavaScript.', 39.99, 80, 'manuel_prog.jpg', TRUE, 3, 1),
('Bande Dessinee Aventure', 'BD coloree avec personnages attachants et histoires epiques.', 15.99, 250, 'bd_aventure.jpg', TRUE, 3, 2),
('Encyclopedie Nature', 'Ouvrage illustre sur la faune et la flore du monde entier.', 45.99, 60, 'encyclo_nature.jpg', TRUE, 3, 1),
('Canape 3 Places', 'Canape confortable en tissu avec coussins moelleux et structure solide.', 599.99, 20, 'canape_3places.jpg', TRUE, 4, 2),
('Aspirateur Robot', 'Robot aspirateur intelligent avec navigation automatique et application mobile.', 299.99, 50, 'aspirateur_robot.jpg', TRUE, 4, 1),
('Miroir Mural Design', 'Miroir decoratif avec cadre dore pour embellir votre interieur.', 79.99, 70, 'miroir_mural.jpg', TRUE, 4, 2),
('Tapis de Yoga', 'Tapis antiderapant epais et confortable pour vos seances de yoga.', 29.99, 200, 'tapis_yoga.jpg', TRUE, 5, 1),
('Velo VTT 26 pouces', 'Velo tout terrain avec suspension avant et freins a disque.', 349.99, 30, 'velo_vtt.jpg', TRUE, 5, 2);

INSERT INTO COMMANDE (Statut, Prix_total, ID_client) VALUES
('En cours', 149.99, 1),
('Livrée', 89.99, 3),
('Expédiée', 39.99, 2),
('Annulée', 0.00, 4),
('En cours', 299.99, 5),
('Expédiée', 199.99, 5),
('Livrée', 49.99, 4),
('Annulée', 0.00, 3),
('Expédiée', 79.99, 2),
('Expédiée', 79.99, 2),


INSERT INTO LIGNE_DE_COMMANDE (ID_Commande, ID_Produit, Quantite, Prix_unitaire) VALUES
(1, 6, 1, 149.99),
(2, 10, 1, 89.99),
(3, 4, 1, 39.99),
(5, 2, 3, 19.99),
(5, 12, 1, 49.99),
(6, 8, 1, 199.99),
(7, 11, 1, 49.99),
(9, 9, 1, 79.99),
(10, 9, 1, 79.99),
(4, 3, 2, 14.99);







