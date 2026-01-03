<?php

namespace Mini\Controllers;

use Mini\Core\Controller;
use Mini\Models\Panier;
use Mini\Models\Produit;

class PanierController extends Controller
{

    public function index(): void
    {
        header('Content-Type: application/json');

        $paniers = Panier::getAll();

        http_response_code(200);
        echo json_encode($paniers);
    }


    public function show(int $id): void
    {
        header('Content-Type: application/json');

        $panier = Panier::findById($id);

        if (!$panier) {
            http_response_code(404);
            echo json_encode(['error' => 'Ligne panier non trouvée']);
            return;
        }

        http_response_code(200);
        echo json_encode($panier);
    }


    public function byClient(int $id_client): void
    {
        header('Content-Type: application/json');

        $paniers = Panier::findByClient($id_client);

        http_response_code(200);
        echo json_encode($paniers);
    }


    public function getCart(int $id_client): void
    {
        header('Content-Type: application/json');

        $paniers = Panier::getCartByClient($id_client);

        http_response_code(200);
        echo json_encode($paniers);
    }


    public function byCommande(int $id_commande): void
    {
        header('Content-Type: application/json');

        $paniers = Panier::findByCommande($id_commande);

        http_response_code(200);
        echo json_encode($paniers);
    }


    public function getTotal(int $id_client): void
    {
        header('Content-Type: application/json');

        $total = Panier::getTotalByClient($id_client);

        http_response_code(200);
        echo json_encode(['total' => $total]);
    }


    public function store(): void
    {
        header('Content-Type: application/json');

        $data = json_decode(file_get_contents('php://input'), true);

        if (!$data) {
            http_response_code(400);
            echo json_encode(['error' => 'Données invalides']);
            return;
        }

        // Vérifier si le produit existe
        $produit = Produit::findById($data['id_produit'] ?? 0);
        if (!$produit) {
            http_response_code(404);
            echo json_encode(['error' => 'Produit non trouvé']);
            return;
        }

        $existingItem = Panier::findByClientAndProduit($data['id_client'] ?? 0, $data['id_produit'] ?? 0);
        if ($existingItem) {
            $panier = new Panier();
            $panier->setIdLigne($existingItem['ID_Ligne']);
            $newQuantite = $existingItem['Quantite'] + ($data['quantite'] ?? 1);
            $panier->setQuantite($newQuantite);
            $panier->setPrixUnitaire($existingItem['Prix_Unitaire']);
            $panier->setSousTotal($newQuantite * $existingItem['Prix_Unitaire']);
            $panier->setIdProduit($existingItem['ID_Produit']);
            $panier->setIdClient($existingItem['ID_client']);
            $panier->setIdCommande($existingItem['ID_Commande']);

            if ($panier->update()) {
                http_response_code(200);
                echo json_encode(['success' => true, 'message' => 'Quantité mise à jour dans le panier']);
            } else {
                http_response_code(500);
                echo json_encode(['error' => 'Erreur lors de la mise à jour']);
            }
            return;
        }

        $quantite = $data['quantite'] ?? 1;
        $prixUnitaire = $produit['Prix'];
        $sousTotal = $quantite * $prixUnitaire;

        $panier = new Panier();
        $panier->setQuantite($quantite);
        $panier->setPrixUnitaire($prixUnitaire);
        $panier->setSousTotal($sousTotal);
        $panier->setIdProduit($data['id_produit'] ?? null);
        $panier->setIdClient($data['id_client'] ?? null);
        $panier->setIdCommande($data['id_commande'] ?? null);

        if ($panier->save()) {
            http_response_code(201);
            echo json_encode(['success' => true, 'message' => 'Produit ajouté au panier']);
        } else {
            http_response_code(500);
            echo json_encode(['error' => 'Erreur lors de l\'ajout au panier']);
        }
    }

  
    public function update(int $id): void
    {
        header('Content-Type: application/json');

        $data = json_decode(file_get_contents('php://input'), true);

        if (!$data) {
            http_response_code(400);
            echo json_encode(['error' => 'Données invalides']);
            return;
        }

        $existingPanier = Panier::findById($id);
        if (!$existingPanier) {
            http_response_code(404);
            echo json_encode(['error' => 'Ligne panier non trouvée']);
            return;
        }

        $quantite = $data['quantite'] ?? $existingPanier['Quantite'];
        $prixUnitaire = $data['prix_unitaire'] ?? $existingPanier['Prix_Unitaire'];
        $sousTotal = $quantite * $prixUnitaire;

        $panier = new Panier();
        $panier->setIdLigne($id);
        $panier->setQuantite($quantite);
        $panier->setPrixUnitaire($prixUnitaire);
        $panier->setSousTotal($sousTotal);
        $panier->setIdProduit($data['id_produit'] ?? $existingPanier['ID_Produit']);
        $panier->setIdClient($data['id_client'] ?? $existingPanier['ID_client']);
        $panier->setIdCommande($data['id_commande'] ?? $existingPanier['ID_Commande']);

        if ($panier->update()) {
            http_response_code(200);
            echo json_encode(['success' => true, 'message' => 'Panier mis à jour']);
        } else {
            http_response_code(500);
            echo json_encode(['error' => 'Erreur lors de la mise à jour']);
        }
    }


    public function delete(int $id): void
    {
        header('Content-Type: application/json');

        $existingPanier = Panier::findById($id);
        if (!$existingPanier) {
            http_response_code(404);
            echo json_encode(['error' => 'Ligne panier non trouvée']);
            return;
        }

        $panier = new Panier();
        $panier->setIdLigne($id);

        if ($panier->delete()) {
            http_response_code(200);
            echo json_encode(['success' => true, 'message' => 'Ligne panier supprimée']);
        } else {
            http_response_code(500);
            echo json_encode(['error' => 'Erreur lors de la suppression']);
        }
    }


    public function clearCart(int $id_client): void
    {
        header('Content-Type: application/json');

        if (Panier::deleteByClient($id_client)) {
            http_response_code(200);
            echo json_encode(['success' => true, 'message' => 'Panier vidé']);
        } else {
            http_response_code(500);
            echo json_encode(['error' => 'Erreur lors du vidage du panier']);
        }
    }
}
