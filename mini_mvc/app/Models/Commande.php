<?php

namespace Mini\Models;

use Mini\Core\Database;
use PDO;

class Commande
{
    private $id_commande;
    private $statut;
    private $prix_total;
    private $id_client;
    private $created_at;

    public function getIdCommande()
    {
        return $this->id_commande;
    }

    public function setIdCommande($id_commande)
    {
        $this->id_commande = $id_commande;
    }

    public function getStatut()
    {
        return $this->statut;
    }

    public function setStatut($statut)
    {
        $this->statut = $statut;
    }

    public function getPrixTotal()
    {
        return $this->prix_total;
    }

    public function setPrixTotal($prix_total)
    {
        $this->prix_total = $prix_total;
    }

    public function getIdClient()
    {
        return $this->id_client;
    }

    public function setIdClient($id_client)
    {
        $this->id_client = $id_client;
    }

    public static function getAll()
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->query("SELECT * FROM COMMANDE ORDER BY created_at DESC");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function findById($id)
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("SELECT * FROM COMMANDE WHERE ID_Commande = ?");
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public static function findByClient($id_client)
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("SELECT * FROM COMMANDE WHERE ID_client = ? ORDER BY created_at DESC");
        $stmt->execute([$id_client]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function findByClientWithDetails($id_client)
    {
        $pdo = Database::getPDO();

        // Récupérer les commandes
        $stmt = $pdo->prepare("SELECT * FROM COMMANDE WHERE ID_client = ? ORDER BY created_at DESC");
        $stmt->execute([$id_client]);
        $commandes = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Pour chaque commande, récupérer les lignes avec les noms des produits
        foreach ($commandes as &$commande) {
            $stmtLignes = $pdo->prepare("
                SELECT l.*, p.Nom as nom_produit
                FROM LIGNE_DE_COMMANDE l
                LEFT JOIN PRODUIT p ON l.ID_Produit = p.ID_Produit
                WHERE l.ID_Commande = ?
            ");
            $stmtLignes->execute([$commande['ID_Commande']]);
            $commande['produits'] = $stmtLignes->fetchAll(PDO::FETCH_ASSOC);
        }

        return $commandes;
    }

    public function save()
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("INSERT INTO COMMANDE (Statut, Prix_total, ID_client) VALUES (?, ?, ?)");
        $result = $stmt->execute([
            $this->statut,
            $this->prix_total,
            $this->id_client
        ]);

        if ($result) {
            $this->id_commande = $pdo->lastInsertId();
        }

        return $result;
    }

    public function update()
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("UPDATE COMMANDE SET Statut = ?, Prix_total = ? WHERE ID_Commande = ?");
        return $stmt->execute([
            $this->statut,
            $this->prix_total,
            $this->id_commande
        ]);
    }

    public function delete()
    {
        $pdo = Database::getPDO();
        $stmt = $pdo->prepare("DELETE FROM COMMANDE WHERE ID_Commande = ?");
        return $stmt->execute([$this->id_commande]);
    }

    public static function createFromCart($id_client)
    {
        $pdo = Database::getPDO();

        // Récupérer les items du panier (sans ID_Commande)
        $stmt = $pdo->prepare("
            SELECT * FROM LIGNE_DE_COMMANDE
            WHERE ID_client = ? AND ID_Commande IS NULL
        ");
        $stmt->execute([$id_client]);
        $cartItems = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (empty($cartItems)) {
            return null;
        }

        // Calculer le total
        $total = array_reduce($cartItems, function($acc, $item) {
            return $acc + $item['Sous_total'];
        }, 0);

        // Créer la commande
        $commande = new Commande();
        $commande->setStatut('Payée');
        $commande->setPrixTotal($total);
        $commande->setIdClient($id_client);

        if ($commande->save()) {
            // Mettre à jour les lignes du panier avec l'ID de la commande
            $stmtUpdate = $pdo->prepare("
                UPDATE LIGNE_DE_COMMANDE
                SET ID_Commande = ?
                WHERE ID_client = ? AND ID_Commande IS NULL
            ");
            $stmtUpdate->execute([$commande->getIdCommande(), $id_client]);

            return $commande;
        }

        return null;
    }
}
