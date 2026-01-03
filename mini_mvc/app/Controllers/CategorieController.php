<?php

namespace Mini\Controllers;

use Mini\Core\Controller;
use Mini\Models\Categorie;

final class CategorieController extends Controller
{
    /**
     * Récupère toutes les catégories
     * GET /api/categories
     */
    public function index(): void
    {
        header('Content-Type: application/json');

        $categories = Categorie::getAll();

        http_response_code(200);
        echo json_encode($categories);
    }

    /**
     * Récupère une catégorie par son ID
     * GET /api/categories/{id}
     */
    public function show(int $id): void
    {
        header('Content-Type: application/json');

        $categorie = Categorie::findById($id);

        if (!$categorie) {
            http_response_code(404);
            echo json_encode(['error' => 'Catégorie non trouvée']);
            return;
        }

        http_response_code(200);
        echo json_encode($categorie);
    }

    /**
     * Récupère les catégories parentes (sans parent_id)
     * GET /api/categories/parents
     */
    public function parents(): void
    {
        header('Content-Type: application/json');

        $categories = Categorie::getParentCategories();

        http_response_code(200);
        echo json_encode($categories);
    }

    /**
     * Récupère les sous-catégories d'une catégorie
     * GET /api/categories/{id}/sub
     */
    public function subCategories(int $id): void
    {
        header('Content-Type: application/json');

        $categories = Categorie::getSubCategories($id);

        http_response_code(200);
        echo json_encode($categories);
    }
}
