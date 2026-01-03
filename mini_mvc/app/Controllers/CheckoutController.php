<?php

namespace Mini\Controllers;

use Mini\Core\Controller;
use Mini\Models\Panier;
use Mini\Models\Produit;
use Mini\Models\Commande;
use Mini\Core\Database;

class CheckoutController extends Controller
{
    private string $stripeSecretKey;
    private string $frontendUrl;

    public function __construct()
    {
        $this->loadEnv();
        $this->stripeSecretKey = $_ENV['STRIPE_SECRET_KEY'] ?? '';
        $this->frontendUrl = $_ENV['FRONTEND_URL'] ?? 'http://localhost:5173';
    }

    private function loadEnv(): void
    {
        $envFile = dirname(__DIR__, 2) . '/.env.local';
        if (file_exists($envFile)) {
            $lines = file($envFile, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
            foreach ($lines as $line) {
                if (strpos($line, '#') === 0) continue;
                if (strpos($line, '=') === false) continue;
                [$key, $value] = explode('=', $line, 2);
                $key = trim($key);
                $value = trim($value);
                $_ENV[$key] = $value;
            }
        }
    }

    public function createSession(): void
    {
        header('Content-Type: application/json');
        session_start();

        if (empty($_SESSION['client_id'])) {
            http_response_code(401);
            echo json_encode(['error' => 'Non authentifié']);
            return;
        }

        if (empty($this->stripeSecretKey)) {
            http_response_code(500);
            echo json_encode(['error' => 'Stripe non configuré']);
            return;
        }

        $panierItems = Panier::getCartByClient($_SESSION['client_id']);

        if (empty($panierItems)) {
            http_response_code(400);
            echo json_encode(['error' => 'Panier vide']);
            return;
        }

        \Stripe\Stripe::setApiKey($this->stripeSecretKey);

        $lineItems = [];
        foreach ($panierItems as $item) {
            $lineItems[] = [
                'price_data' => [
                    'currency' => 'eur',
                    'product_data' => [
                        'name' => $item['Nom'] ?? 'Produit #' . $item['ID_Produit'],
                    ],
                    'unit_amount' => (int)($item['Prix_Unitaire'] * 100),
                ],
                'quantity' => $item['Quantite'],
            ];
        }

        try {
            $session = \Stripe\Checkout\Session::create([
                'payment_method_types' => ['card'],
                'line_items' => $lineItems,
                'mode' => 'payment',
                'success_url' => $this->frontendUrl . '/success?session_id={CHECKOUT_SESSION_ID}',
                'cancel_url' => $this->frontendUrl . '/panier',
                'metadata' => [
                    'client_id' => $_SESSION['client_id'],
                ],
            ]);

            http_response_code(200);
            echo json_encode(['url' => $session->url]);
        } catch (\Exception $e) {
            http_response_code(500);
            echo json_encode(['error' => 'Erreur Stripe: ' . $e->getMessage()]);
        }
    }

    public function success(): void
    {
        header('Content-Type: application/json');
        session_start();

        if (empty($_SESSION['client_id'])) {
            http_response_code(401);
            echo json_encode(['error' => 'Non authentifié']);
            return;
        }

        $data = json_decode(file_get_contents('php://input'), true);
        $sessionId = $data['session_id'] ?? null;

        if (empty($sessionId)) {
            http_response_code(400);
            echo json_encode(['error' => 'Session ID manquant']);
            return;
        }

        try {
            \Stripe\Stripe::setApiKey($this->stripeSecretKey);
            $session = \Stripe\Checkout\Session::retrieve($sessionId);

            if ($session->payment_status === 'paid') {
                // Créer la commande et lier les lignes du panier
                $this->createCommandeFromCart($_SESSION['client_id']);

                http_response_code(200);
                echo json_encode([
                    'success' => true,
                    'message' => 'Commande créée avec succès !',
                    'payment_status' => $session->payment_status
                ]);
            } else {
                http_response_code(400);
                echo json_encode(['error' => 'Paiement non complété']);
            }
        } catch (\Exception $e) {
            http_response_code(500);
            echo json_encode(['error' => 'Erreur: ' . $e->getMessage()]);
        }
    }

    private function createCommandeFromCart(int $clientId): ?Commande
    {
        $pdo = Database::getPDO();

        $panierItems = Panier::getCartByClient($clientId);

        if (empty($panierItems)) {
            return null;
        }

        $total = array_reduce($panierItems, function($acc, $item) {
            return $acc + $item['Sous_total'];
        }, 0);

        $commande = new Commande();
        $commande->setStatut('Payée');
        $commande->setPrixTotal($total);
        $commande->setIdClient($clientId);

        if ($commande->save()) {
            $stmt = $pdo->prepare("
                UPDATE LIGNE_DE_COMMANDE
                SET ID_Commande = ?
                WHERE ID_client = ? AND ID_Commande IS NULL
            ");
            $stmt->execute([$commande->getIdCommande(), $clientId]);

            return $commande;
        }

        return null;
    }
}
