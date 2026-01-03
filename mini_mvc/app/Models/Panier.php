<?php

namespace Mini\Models;

use Mini\Core\Database;
use PDO;

class Panier
{
    private $id_Ligne;
    private $quantite;
    private $prix_Unitaire;
    private $sous_total;
    private $id_Produit;
    private $id_client;
    private $id_Commande;
    private $created_at;
    private $updated_at;



    public function getIdLigne()
    {
        return $this->id_Ligne;
    }

    public function setIdLigne($id_Ligne)
    {
        $this->id_Ligne = $id_Ligne;
    }

    public function getQuantite()
    {
        return $this->quantite;
    }

    public function setQuantite($quantite)
    {
        $this->quantite = $quantite;
    }

    public function getPrixUnitaire()
    {
        return $this->prix_Unitaire;
    }

    public function setPrixUnitaire($prix_Unitaire)
    {
        $this->prix_Unitaire = $prix_Unitaire;
    }

    public function getSousTotal()
    {
        return $this->sous_total;
    }

    public function setSousTotal($sous_total)
    {
        $this->sous_total = $sous_total;
    }

    public function getIdProduit()
    {
        return $this->id_Produit;
    }

    public function setIdProduit($id_Produit)
    {
        $this->id_Produit = $id_Produit;
    }

    public function getIdClient()
    {
        return $this->id_client;
    }

    public function setIdClient($id_client)
    {
        $this->id_client = $id_client;
    }

    public function getIdCommande()
    {
        return $this->id_Commande;
    }

    public function setIdCommande($id_Commande)
    {
        $this->id_Commande = $id_Commande;
    }

    public function getCreatedAt()
    {
        return $this->created_at;
    }

    public function setCreatedAt($created_at)
    {
        $this->created_at = $created_at;
    }

    public function getUpdatedAt()
    {
        return $this->updated_at;
    }

    public function setUpdatedAt($updated_at)
    {
        $this->updated_at = $updated_at;
    }

    // =====================
    // Méthodes CRUD
    // =====================

    public static function getAll()
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->query("SELECT * FROM LIGNE_DE_COMMANDE ORDER BY ID_Ligne DESC");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function findById($id)
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("SELECT * FROM LIGNE_DE_COMMANDE WHERE ID_Ligne = ?");
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public static function findByClient($id_client)
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("SELECT * FROM LIGNE_DE_COMMANDE WHERE ID_client = ? ORDER BY ID_Ligne DESC");
        $stmt->execute([$id_client]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function findByCommande($id_Commande)
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("SELECT * FROM LIGNE_DE_COMMANDE WHERE ID_Commande = ? ORDER BY ID_Ligne DESC");
        $stmt->execute([$id_Commande]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function findByClientAndProduit($id_client, $id_Produit)
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("SELECT * FROM LIGNE_DE_COMMANDE WHERE ID_client = ? AND ID_Produit = ? AND ID_Commande IS NULL");
        $stmt->execute([$id_client, $id_Produit]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public static function getCartByClient($id_client)
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("SELECT * FROM LIGNE_DE_COMMANDE WHERE ID_client = ? AND ID_Commande IS NULL ORDER BY ID_Ligne DESC");
        $stmt->execute([$id_client]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function save()
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("INSERT INTO LIGNE_DE_COMMANDE (Quantite, Prix_Unitaire, Sous_total, ID_Produit, ID_client, ID_Commande, created_at) VALUES (?, ?, ?, ?, ?, ?, NOW())");
        return $stmt->execute([
            $this->quantite,
            $this->prix_Unitaire,
            $this->sous_total,
            $this->id_Produit,
            $this->id_client,
            $this->id_Commande
        ]);
    }

    public function update()
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("UPDATE LIGNE_DE_COMMANDE SET Quantite = ?, Prix_Unitaire = ?, Sous_total = ?, ID_Produit = ?, ID_client = ?, ID_Commande = ?, updated_at = NOW() WHERE ID_Ligne = ?");
        return $stmt->execute([
            $this->quantite,
            $this->prix_Unitaire,
            $this->sous_total,
            $this->id_Produit,
            $this->id_client,
            $this->id_Commande,
            $this->id_Ligne
        ]);
    }

    public function delete()
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("DELETE FROM LIGNE_DE_COMMANDE WHERE ID_Ligne = ?");
        return $stmt->execute([$this->id_Ligne]);
    }

    public static function deleteByClient($id_client)
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("DELETE FROM LIGNE_DE_COMMANDE WHERE ID_client = ? AND ID_Commande IS NULL");
        return $stmt->execute([$id_client]);
    }

    public static function getTotalByClient($id_client)
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("SELECT SUM(Sous_total) as total FROM LIGNE_DE_COMMANDE WHERE ID_client = ? AND ID_Commande IS NULL");
        $stmt->execute([$id_client]);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        return $result['total'] ?? 0;
    }
}


