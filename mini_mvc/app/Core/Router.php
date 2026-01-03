<?php
// Active le mode strict pour les types
declare(strict_types=1);
// Espace de noms du noyau
namespace Mini\Core;
// Déclare le routeur HTTP minimaliste
final class Router
{
    // Tableau des routes : [méthode, chemin, [ClasseContrôleur, action]]
    /** @var array<int, array{0:string,1:string,2:array{0:class-string,1:string}} > */
    private array $routes;

    /**
     * Initialise le routeur avec les routes configurées
     * @param array<int, array{0:string,1:string,2:array{0:class-string,1:string}} > $routes
     */
    public function __construct(array $routes)
    {
        // Mémorise les routes fournies
        $this->routes = $routes;
    }

    // Dirige la requête vers le bon contrôleur en fonction méthode/URI
    public function dispatch(string $method, string $uri): void
    {
        // Extrait uniquement le chemin de l'URI
        $path = parse_url($uri, PHP_URL_PATH) ?? '/';

        // Parcourt chaque route enregistrée
        foreach ($this->routes as [$routeMethod, $routePath, $handler]) {
            // Vérifie correspondance de méthode
            if ($method !== $routeMethod) {
                continue;
            }

            // Convertit le pattern de route en regex
            // Ex: /api/produits/{id} devient /api/produits/([^/]+)
            $pattern = preg_replace('/\{[^}]+\}/', '([^/]+)', $routePath);
            $pattern = '#^' . $pattern . '$#';

            // Vérifie si le path correspond au pattern
            if (preg_match($pattern, $path, $matches)) {
                // Déstructure le gestionnaire en [classe, action]
                [$class, $action] = $handler;
                // Instancie le contrôleur cible
                $controller = new $class();

                // Récupère les paramètres (enlève le premier match qui est le path complet)
                array_shift($matches);

                // Convertit les paramètres numériques en int
                $params = array_map(function($param) {
                    return is_numeric($param) ? (int)$param : $param;
                }, $matches);

                // Appelle l'action sur le contrôleur avec les paramètres
                $controller->$action(...$params);
                return;
            }
        }

        // Si aucune route ne correspond, renvoie un 404 minimaliste
        http_response_code(404);
        echo '404 Not Found';
    }
}
