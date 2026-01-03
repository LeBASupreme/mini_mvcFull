<?php

namespace Mini\Models;

use Mini\Core\Database;
use PDO;

class Categorie
{
    private $id_categories;
    private $nom;
    private $description;
    private $image;
    private $parent_id;
    private $created_at;
    private $updated_at;

    // =====================
    // Getters / Setters
    // =====================

    public function getIdCategories()
    {
        return $this->id_categories;
    }

    public function setIdCategories($id_categories)
    {
        $this->id_categories = $id_categories;
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

    public function getImage()
    {
        return $this->image;
    }

    public function setImage($image)
    {
        $this->image = $image;
    }

    public function getParentId()
    {
        return $this->parent_id;
    }

    public function setParentId($parent_id)
    {
        $this->parent_id = $parent_id;
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
        $stmt = $pdo->query("SELECT * FROM CATEGORIE ORDER BY ID_categories ASC");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function findById($id)
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("SELECT * FROM CATEGORIE WHERE ID_categories = ?");
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public static function getParentCategories()
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->query("SELECT * FROM CATEGORIE WHERE parent_id IS NULL ORDER BY ID_categories ASC");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function getSubCategories($parent_id)
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("SELECT * FROM CATEGORIE WHERE parent_id = ? ORDER BY ID_categories ASC");
        $stmt->execute([$parent_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function save()
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("INSERT INTO CATEGORIE (Nom, Description, Image, parent_id, created_at) VALUES (?, ?, ?, ?, NOW())");
        return $stmt->execute([
            $this->nom,
            $this->description,
            $this->image,
            $this->parent_id
        ]);
    }

    public function update()
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("UPDATE CATEGORIE SET Nom = ?, Description = ?, Image = ?, parent_id = ?, updated_at = NOW() WHERE ID_categories = ?");
        return $stmt->execute([
            $this->nom,
            $this->description,
            $this->image,
            $this->parent_id,
            $this->id_categories
        ]);
    }

    public function delete()
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("DELETE FROM CATEGORIE WHERE ID_categories = ?");
        return $stmt->execute([$this->id_categories]);
    }
}
