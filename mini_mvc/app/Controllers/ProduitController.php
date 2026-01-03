<?php

namespace Mini\Controllers;

use Mini\Core\Controller;
use Mini\Models\Produit;

class ProduitController extends Controller
{

    public function index(): void
    {
        header('Content-Type: application/json');

        $produits = Produit::getAll();

        http_response_code(200);
        echo json_encode($produits);
    }


    public function show(int $id): void
    {
        header('Content-Type: application/json');

        $produit = Produit::findById($id);

        if (!$produit) {
            http_response_code(404);
            echo json_encode(['error' => 'Produit non trouvé']);
            return;
        }

        http_response_code(200);
        echo json_encode($produit);
    }


    public function byCategorie(int $id_categorie): void
    {
        header('Content-Type: application/json');

        $produits = Produit::findByCategorie($id_categorie);

        http_response_code(200);
        echo json_encode($produits);
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

        $produit = new Produit();
        $produit->setNom($data['nom'] ?? '');
        $produit->setDescription($data['description'] ?? '');
        $produit->setPrix($data['prix'] ?? 0);
        $produit->setStock($data['stock'] ?? 0);
        $produit->setImage($data['image'] ?? '');
        $produit->setActif($data['actif'] ?? 1);
        $produit->setIdCategorie($data['id_categorie'] ?? null);

        if ($produit->save()) {
            http_response_code(201);
            echo json_encode(['success' => true, 'message' => 'Produit créé avec succès']);
        } else {
            http_response_code(500);
            echo json_encode(['error' => 'Erreur lors de la création']);
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

        $existingProduit = Produit::findById($id);
        if (!$existingProduit) {
            http_response_code(404);
            echo json_encode(['error' => 'Produit non trouvé']);
            return;
        }

        $produit = new Produit();
        $produit->setIdProduit($id);
        $produit->setNom($data['nom'] ?? '');
        $produit->setDescription($data['description'] ?? '');
        $produit->setPrix($data['prix'] ?? 0);
        $produit->setStock($data['stock'] ?? 0);
        $produit->setImage($data['image'] ?? '');
        $produit->setActif($data['actif'] ?? 1);
        $produit->setIdCategorie($data['id_categorie'] ?? null);

        if ($produit->update()) {
            http_response_code(200);
            echo json_encode(['success' => true, 'message' => 'Produit mis à jour']);
        } else {
            http_response_code(500);
            echo json_encode(['error' => 'Erreur lors de la mise à jour']);
        }
    }


    public function delete(int $id): void
    {
        header('Content-Type: application/json');

        $existingProduit = Produit::findById($id);
        if (!$existingProduit) {
            http_response_code(404);
            echo json_encode(['error' => 'Produit non trouvé']);
            return;
        }

        $produit = new Produit();
        $produit->setIdProduit($id);

        if ($produit->delete()) {
            http_response_code(200);
            echo json_encode(['success' => true, 'message' => 'Produit supprimé']);
        } else {
            http_response_code(500);
            echo json_encode(['error' => 'Erreur lors de la suppression']);
        }
    }
}
