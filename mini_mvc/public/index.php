<?php

declare(strict_types=1);

require dirname(__DIR__) . '/vendor/autoload.php';

use Mini\Core\Router;

// Table des routes minimaliste
$routes = [
    ['GET', '/', [Mini\Controllers\HomeController::class, 'index']],
    ['GET', '/users', [Mini\Controllers\HomeController::class, 'users']],
    ['POST', '/api/auth/login', [Mini\Controllers\ClientController::class, 'login']],
    ['POST', '/api/auth/register', [Mini\Controllers\ClientController::class, 'register']],
    ['GET', '/api/auth/me', [Mini\Controllers\ClientController::class, 'me']],
    ['POST', '/api/user/modifier-profil', [Mini\Controllers\ClientController::class, 'modifierProfil']],
    ['POST', '/api/user/modifier-email', [Mini\Controllers\ClientController::class, 'modifierEmail']],
    ['POST', '/api/user/modifier-mot-de-passe', [Mini\Controllers\ClientController::class, 'modifierMotDePasse']],
    ['GET', '/api/produits', [Mini\Controllers\ProduitController::class, 'index']],
    ['GET', '/api/produits/{id}', [Mini\Controllers\ProduitController::class, 'show']],
    ['GET', '/api/produits/categorie/{id}', [Mini\Controllers\ProduitController::class, 'byCategorie']],
    ['POST', '/api/produits', [Mini\Controllers\ProduitController::class, 'store']],
    //['PUT', '/api/produits/{id}', [Mini\Controllers\ProduitController::class, 'update']],
    ['DELETE', '/api/produits/{id}', [Mini\Controllers\ProduitController::class, 'delete']],
    ['GET', '/api/categories', [Mini\Controllers\CategorieController::class, 'index']],
    ['GET', '/api/categories/{id}', [Mini\Controllers\CategorieController::class, 'show']],
    ['GET', '/api/categories/{id}/sub', [Mini\Controllers\CategorieController::class, 'subCategories']],
    ['GET', '/api/paniers', [Mini\Controllers\PanierController::class, 'index']],
    ['GET', '/api/paniers/{id}', [Mini\Controllers\PanierController::class, 'show']],
    ['GET', '/api/paniers/client/{id_client}', [Mini\Controllers\PanierController::class, 'byClient']],
    ['GET', '/api/paniers/client/{id_client}/cart', [Mini\Controllers\PanierController::class, 'getCart']],
    ['POST', '/api/paniers', [Mini\Controllers\PanierController::class, 'store']],
    ['PUT', '/api/paniers/{id}', [Mini\Controllers\PanierController::class, 'update']],
    ['DELETE', '/api/paniers/{id}', [Mini\Controllers\PanierController::class, 'delete']],
    ['POST', '/api/checkout', [Mini\Controllers\CheckoutController::class, 'createSession']],
    ['POST', '/api/checkout/success', [Mini\Controllers\CheckoutController::class, 'success']],
    ['GET', '/api/commandes', [Mini\Controllers\CommandeController::class, 'index']],
    ['GET', '/api/commandes/{id}', [Mini\Controllers\CommandeController::class, 'show']],
];

// Bootstrap du router
$router = new Router($routes);
$router->dispatch($_SERVER['REQUEST_METHOD'], $_SERVER['REQUEST_URI']);


