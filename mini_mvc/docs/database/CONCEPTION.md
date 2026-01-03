# Reponses au question


#### Pourquoi stocker le prix unitaire dans la table des lignes de commande plutôt que d'utiliser directement le prix du produit ?

<ol>
    <li>
    Si le prix changent entre temps temporairement avec des promo par exemple et donc on a une trace
    </li>
    <li>Cohérence en cas de suppression/modification du produit </li>
</ol>


#### Quelle stratégie avez-vous choisie pour gérer les suppressions ?

J’ai utilisé ON DELETE CASCADE parce que quand tu supprimes un élément parent, ça supprime automatiquement tout ce qui est lié derrière.
Ça évite de laisser traîner des données inutiles, ça garde la base propre, et ça m’évite de devoir tout supprimer moi-même à la main

#### Comment gérez-vous les stocks ?

- **Rupture de stock** : lorsqu'un produit n'est plus disponible, le système empêche la commande ou signale l'indisponibilité.

- **Décrémentation du stock** : le stock est mis à jour uniquement lors de la validation ou du paiement de la commande, et non lors de l'ajout au panier, afin d'éviter les réservations non abouties.

#### Avez-vous prévu des index ? Lesquels et pourquoi ?


Oui, j'ai prévu plusieurs index pour optimiser les performances :

- **client_email** : Recherche rapide lors de la connexion et vérification d'unicité
- **client_adresse** : Optimisation des recherches par localisation pour la livraison
- **admin_email** : Authentification rapide des administrateurs
- **admin_role** : Filtrage par rôle (superadmin, admin)
- **categorie_nom** : Recherche et affichage des catégories par nom
- **produit_nom** : Recherche de produits par nom via la barre de recherche
- **produit_categorie** : Affichage des produits par catégorie (jointure fréquente)
- **produit_actif** : Filtrage rapide des produits disponibles à la vente
- **produit_prix** : Tri et filtrage par prix
- **commande_client** : Affichage de l'historique des commandes d'un client
- **commande_statut** : Filtrage des commandes par statut dans le tableau de bord admin
- **commande_date** : Tri chronologique et rapports de ventes
- **ligne_commande** : Récupération des lignes d'une commande
- **ligne_produit** : Statistiques de ventes par produit

#### Comment assurez-vous l'unicité du numéro de commande ?
- Le SGBD gère lui-même la génération des identifiants
- Aucune intervention manuelle n'est nécessaire
- Même en cas d'insertions simultanées, SQL garantit l'unicité grâce au verrouillage interne

#### Quelles sont les extensions possibles de votre modèle ?

Plusieurs extensions peuvent être ajoutées pour enrichir le modèle :

- **Gestion de plusieurs adresses par client** : Créer une table ADRESSE séparée avec une clé étrangère vers CLIENT, permettant d'avoir une adresse de livraison et une adresse de facturation différentes

- **Avis clients** : Créer une table AVIS avec une note, un commentaire, une date et des clés étrangères vers CLIENT et PRODUIT

- **Images multiples par produit** : Remplacer le champ Image unique par une table IMAGE_PRODUIT permettant de stocker plusieurs images par produit

- **Système de promotions** : Ajouter une table PROMOTION avec des codes promo, des pourcentages de réduction et des dates de validité

- **Gestion des tailles et couleurs** : Créer une table VARIANTE_PRODUIT pour gérer les déclinaisons d'un même produit

- **Liste de souhaits** : Ajouter une table WISHLIST pour permettre aux clients de sauvegarder des produits favoris
