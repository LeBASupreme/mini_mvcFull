<?php

namespace Mini\Models;

use Mini\Core\Database;
use PDO;

class Produit
{
    private $id_PRODUIT;
    private $nom;
    private $description;
    private $prix;
    private $stock;
    private $image;
    private $actif;
    private $id_categorie;
    private $created_at;
    private $updated_at;

    // =====================
    // Getters / Setters
    // =====================

    public function getIdProduit()
    {
        return $this->id_PRODUIT;
    }

    public function setIdProduit($id_PRODUIT)
    {
        $this->id_PRODUIT = $id_PRODUIT;
    }

    public function getNom()
    {
        return $this->nom;
    }

    public function setNom($nom)
    {
        $this->nom = $nom;
    }

    public function getDescription()
    {
        return $this->description;
    }

    public function setDescription($description)
    {
        $this->description = $description;
    }

    public function getPrix()
    {
        return $this->prix;
    }

    public function setPrix($prix)
    {
        $this->prix = $prix;
    }

    public function getStock()
    {
        return $this->stock;
    }

    public function setStock($stock)
    {
        $this->stock = $stock;
    }

    public function getImage()
    {
        return $this->image;
    }

    public function setImage($image)
    {
        $this->image = $image;
    }

    public function getActif()
    {
        return $this->actif;
    }

    public function setActif($actif)
    {
        $this->actif = $actif;
    }

    public function getIdCategorie()
    {
        return $this->id_categorie;
    }

    public function setIdCategorie($id_categorie)
    {
        $this->id_categorie = $id_categorie;
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
        $stmt = $pdo->query("SELECT * FROM PRODUIT WHERE Actif = 1 ORDER BY ID_Produit DESC");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function findById($id)
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("SELECT * FROM PRODUIT WHERE ID_Produit = ?");
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public static function findByCategorie($id_categorie)
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("SELECT * FROM PRODUIT WHERE ID_categorie = ? AND Actif = 1 ORDER BY ID_Produit DESC");
        $stmt->execute([$id_categorie]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function save()
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("INSERT INTO PRODUIT (Nom, Description, Prix, Stock, Image, Actif, ID_categorie, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, NOW())");
        return $stmt->execute([
            $this->nom,
            $this->description,
            $this->prix,
            $this->stock,
            $this->image,
            $this->actif,
            $this->id_categorie
        ]);
    }

    public function update()
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("UPDATE PRODUIT SET Nom = ?, Description = ?, Prix = ?, Stock = ?, Image = ?, Actif = ?, ID_categorie = ?, updated_at = NOW() WHERE ID_Produit = ?");
        return $stmt->execute([
            $this->nom,
            $this->description,
            $this->prix,
            $this->stock,
            $this->image,
            $this->actif,
            $this->id_categorie,
            $this->id_PRODUIT
        ]);
    }

    public function delete()
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("DELETE FROM PRODUIT WHERE ID_Produit = ?");
        return $stmt->execute([$this->id_PRODUIT]);
    }
}
