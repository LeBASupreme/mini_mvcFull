<?php

namespace Mini\Controllers;

use Mini\Core\Controller;
use Mini\Models\Commande;

class CommandeController extends Controller
{
    public function index(): void
    {
        header('Content-Type: application/json');
        session_start();

        if (empty($_SESSION['client_id'])) {
            http_response_code(401);
            echo json_encode(['error' => 'Non authentifié']);
            return;
        }

        $commandes = Commande::findByClientWithDetails($_SESSION['client_id']);

        // Formater les données pour le frontend
        $result = array_map(function($commande) {
            return [
                'id_commande' => $commande['ID_Commande'],
                'statut' => $commande['Statut'],
                'total' => $commande['Prix_total'],
                'date_commande' => $commande['created_at'],
                'produits' => array_map(function($produit) {
                    return [
                        'nom_produit' => $produit['nom_produit'] ?? 'Produit',
                        'quantite' => $produit['Quantite'],
                        'prix_unitaire' => $produit['Prix_Unitaire'],
                        'sous_total' => $produit['Sous_total']
                    ];
                }, $commande['produits'] ?? [])
            ];
        }, $commandes);

        http_response_code(200);
        echo json_encode($result);
    }

    public function show(int $id): void
    {
        header('Content-Type: application/json');
        session_start();

        if (empty($_SESSION['client_id'])) {
            http_response_code(401);
            echo json_encode(['error' => 'Non authentifié']);
            return;
        }

        $commande = Commande::findById($id);

        if (!$commande) {
            http_response_code(404);
            echo json_encode(['error' => 'Commande non trouvée']);
            return;
        }

        // Vérifier que la commande appartient au client
        if ($commande['ID_client'] != $_SESSION['client_id']) {
            http_response_code(403);
            echo json_encode(['error' => 'Accès non autorisé']);
            return;
        }

        http_response_code(200);
        echo json_encode($commande);
    }
}
