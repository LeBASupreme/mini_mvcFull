<?php

namespace Mini\Controllers;

use Mini\Core\Controller;

use Mini\Models\Client;


final class ClientController extends Controller
{

   public function login(): void
   {
      header('Content-Type: application/json');

      $data = json_decode(file_get_contents('php://input'), true);

      if (empty($data['email']) || empty($data['mdp'])) {
         http_response_code(400);
         echo json_encode(['error' => 'Email et mot de passe requis']);
         return;
      }

      $client = Client::findByEmail($data['email']);

      if (!$client) {
         http_response_code(401);
         echo json_encode(['error' => 'Email ou mot de passe incorrect']);
         return;
      }

      if (!password_verify($data['mdp'], $client['MDP'])) {
         http_response_code(401);
         echo json_encode(['error' => 'Email ou mot de passe incorrect']);
         return;
      }

      session_start();
      $_SESSION['client_id'] = $client['ID_client'];

      unset($client['MDP']);

      http_response_code(200);
      echo json_encode([
         'success' => true,
         'message' => 'Connexion réussie',
         'client' => $client
      ]);


   }
   public function register(): void
   {
      header('Content-Type: application/json');

      $data = json_decode(file_get_contents('php://input'), true);

      $requiredFields = ['nom', 'prenom', 'adresse', 'ville', 'codePostal', 'email', 'mdp'];
      foreach ($requiredFields as $field) {
         if (empty($data[$field])) {
            http_response_code(400);
            echo json_encode(['error' => "Le champ $field est requis"]);
            return;
         }
      }

      if (Client::findByEmail($data['email'])) {
         http_response_code(409);
         echo json_encode(['error' => 'Email déjà utilisé']);
         return;
      }

      $client = new Client();
      $client->setNom($data['nom']);
      $client->setPrenom($data['prenom']);
      $client->setAdresse($data['adresse']);
      $client->setVille($data['ville']);
      $client->setCodePostal($data['codePostal']);
      $client->setEmail($data['email']);
      $client->setMdp($data['mdp']);

      $client->save();

      http_response_code(201);
      echo json_encode(['success' => true, 'message' => 'Inscription réussie']);
   }


   public function me(): void
   {
      header('Content-Type: application/json');
      session_start();

      if (empty($_SESSION['client_id'])) {
         http_response_code(401);
         echo json_encode(['error' => 'Non authentifié']);
         return;
      }

      $client = Client::findById($_SESSION['client_id']);

      if (!$client) {
         http_response_code(404);
         echo json_encode(['error' => 'Client non trouvé']);
         return;
      }

      unset($client['MDP']);

      http_response_code(200);
      echo json_encode($client);
   }

   public function modifierProfil(): void
   {
      header('Content-Type: application/json');
      session_start();

      if (empty($_SESSION['client_id'])) {
         http_response_code(401);
         echo json_encode(['error' => 'Non authentifié']);
         return;
      }

      $data = json_decode(file_get_contents('php://input'), true);

      $client = new Client();
      $client->setIdClient($_SESSION['client_id']);
      $client->setNom($data['nom'] ?? '');
      $client->setPrenom($data['prenom'] ?? '');
      $client->setAdresse($data['adresse'] ?? '');

      $existingClient = Client::findById($_SESSION['client_id']);
      $client->setVille($existingClient['Ville']);
      $client->setCodePostal($existingClient['CodePostal']);
      $client->setEmail($existingClient['Email']);

      if ($client->update()) {
         http_response_code(200);
         echo json_encode(['success' => true, 'message' => 'Profil mis à jour']);
      } else {
         http_response_code(500);
         echo json_encode(['error' => 'Erreur lors de la mise à jour']);
      }
   }

   public function modifierEmail(): void
   {
      header('Content-Type: application/json');
      session_start();

      if (empty($_SESSION['client_id'])) {
         http_response_code(401);
         echo json_encode(['error' => 'Non authentifié']);
         return;
      }

      $data = json_decode(file_get_contents('php://input'), true);

      if (empty($data['email'])) {
         http_response_code(400);
         echo json_encode(['error' => 'Email requis']);
         return;
      }

      $existingEmail = Client::findByEmail($data['email']);
      if ($existingEmail && $existingEmail['ID_client'] != $_SESSION['client_id']) {
         http_response_code(409);
         echo json_encode(['error' => 'Email déjà utilisé']);
         return;
      }

      $existingClient = Client::findById($_SESSION['client_id']);

      $client = new Client();
      $client->setIdClient($_SESSION['client_id']);
      $client->setNom($existingClient['Nom']);
      $client->setPrenom($existingClient['Prenom']);
      $client->setAdresse($existingClient['Adresse']);
      $client->setVille($existingClient['Ville']);
      $client->setCodePostal($existingClient['CodePostal']);
      $client->setEmail($data['email']);

      if ($client->update()) {
         http_response_code(200);
         echo json_encode(['success' => true, 'message' => 'Email mis à jour']);
      } else {
         http_response_code(500);
         echo json_encode(['error' => 'Erreur lors de la mise à jour']);
      }
   }

   public function modifierMotDePasse(): void
   {
      header('Content-Type: application/json');
      session_start();

      if (empty($_SESSION['client_id'])) {
         http_response_code(401);
         echo json_encode(['error' => 'Non authentifié']);
         return;
      }

      $data = json_decode(file_get_contents('php://input'), true);

      if (empty($data['ancien_mot_de_passe']) || empty($data['nouveau_mot_de_passe'])) {
         http_response_code(400);
         echo json_encode(['error' => 'Ancien et nouveau mot de passe requis']);
         return;
      }

      $existingClient = Client::findById($_SESSION['client_id']);

      if (!password_verify($data['ancien_mot_de_passe'], $existingClient['MDP'])) {
         http_response_code(401);
         echo json_encode(['message' => 'Ancien mot de passe incorrect']);
         return;
      }

      $client = new Client();
      $client->setIdClient($_SESSION['client_id']);
      $client->setMdp($data['nouveau_mot_de_passe']);

      if ($client->updatePassword()) {
         http_response_code(200);
         echo json_encode(['success' => true, 'message' => 'Mot de passe mis à jour']);
      } else {
         http_response_code(500);
         echo json_encode(['message' => 'Erreur lors de la mise à jour']);
      }
   }
}