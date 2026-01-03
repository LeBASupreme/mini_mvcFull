<?php

namespace Mini\Models;

use Mini\Core\Database;
use PDO;

class Client
{
    private $id_client;
    private $nom;
    private $prenom;
    private $adresse;
    private $ville;
    private $codePostal;
    private $email;
    private $mdp;
    private $created_at;
    private $updated_at;



    public function getIdClient()
    {
        return $this->id_client;
    }

    public function setIdClient($id_client)
    {
        $this->id_client = $id_client;
    }

    public function getNom()
    {
        return $this->nom;
    }

    public function setNom($nom)
    {
        $this->nom = $nom;
    }

    public function getPrenom()
    {
        return $this->prenom;
    }

    public function setPrenom($prenom)
    {
        $this->prenom = $prenom;
    }

    public function getAdresse()
    {
        return $this->adresse;
    }

    public function setAdresse($adresse)
    {
        $this->adresse = $adresse;
    }

    public function getVille()
    {
        return $this->ville;
    }

    public function setVille($ville)
    {
        $this->ville = $ville;
    }

    public function getCodePostal()
    {
        return $this->codePostal;
    }

    public function setCodePostal($codePostal)
    {
        $this->codePostal = $codePostal;
    }

    public function getEmail()
    {
        return $this->email;
    }

    public function setEmail($email)
    {
        $this->email = $email;
    }

    public function getMdp()
    {
        return $this->mdp;
    }

    public function setMdp($mdp)
    {
        $this->mdp = $mdp;
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


    public static function getAll()
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->query("SELECT * FROM CLIENT ORDER BY ID_client DESC");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function findById($id)
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("SELECT * FROM CLIENT WHERE ID_client = ?");
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }


    public static function findByEmail($email)
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("SELECT * FROM CLIENT WHERE Email = ?");
        $stmt->execute([$email]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function save()
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("INSERT INTO CLIENT (Nom, Prenom, Adresse, Ville, CodePostal, Email, MDP, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, NOW())");
        return $stmt->execute([
            $this->nom,
            $this->prenom,
            $this->adresse,
            $this->ville,
            $this->codePostal,
            $this->email,
            password_hash($this->mdp, PASSWORD_DEFAULT)
        ]);
    }


    public function update()
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("UPDATE CLIENT SET Nom = ?, Prenom = ?, Adresse = ?, Ville = ?, CodePostal = ?, Email = ?, updated_at = NOW() WHERE ID_client = ?");
        return $stmt->execute([
            $this->nom,
            $this->prenom,
            $this->adresse,
            $this->ville,
            $this->codePostal,
            $this->email,
            $this->id_client
        ]);
    }


    public function updatePassword()
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("UPDATE CLIENT SET MDP = ?, updated_at = NOW() WHERE ID_client = ?");
        return $stmt->execute([password_hash($this->mdp, PASSWORD_DEFAULT), $this->id_client]);
    }

    public function delete()
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("DELETE FROM CLIENT WHERE ID_client = ?");
        return $stmt->execute([$this->id_client]);
    }
}
