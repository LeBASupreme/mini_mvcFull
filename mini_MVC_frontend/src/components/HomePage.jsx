import { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'

function HomePage() {
  const [produits, setProduits] = useState([])

  useEffect(() => {
    const fetchProduits = async () => {
      try {
        const response = await fetch('/api/produits')
        if (response.ok) {
          const data = await response.json()
          const shuffled = data.sort(() => Math.random() - 0.5)
          setProduits(shuffled.slice(0, 5))
        }
      } catch (error) {
        console.error('Erreur:', error)
      }
    }
    fetchProduits()
  }, [])

  return (
    <div className="min-h-screen py-15">
      <div className="bg-gradient-to-r from-blue-600 to-blue-800 text-white py-20 px-4">
        <div className="max-w-4xl mx-auto text-center">
          <h1 className="text-4xl md:text-5xl font-bold mb-4">Bienvenue sur Mini MVC</h1>
          <p className="text-xl mb-8 text-blue-100">Découvrez notre sélection de produits de qualité</p>
          <Link to="/produits" className="bg-white text-blue-600 px-8 py-3 rounded-lg font-semibold hover:bg-blue-50 transition">
            Voir tous les produits
          </Link>
        </div>
      </div>


      <div className="py-16 px-4 bg-gray-50">
        <div className="max-w-6xl mx-auto">
          <h2 className="text-3xl font-bold text-center mb-10">Nouveautés</h2>

          {produits.length > 0 ? (
            <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-6">
              {produits.map((produit) => (
                <Link
                  key={produit.ID_Produit}
                  to={`/produit/${produit.ID_Produit}`}
                  className="bg-white rounded-lg shadow hover:shadow-lg transition overflow-hidden"
                >
                  <img
                    src={produit.Image || "https://placehold.co/300x300?text=Produit"}
                    alt={produit.Nom}
                    className="w-full h-48 object-cover"
                  />
                  <div className="p-4">
                    <h3 className="font-semibold text-gray-800 truncate">{produit.Nom}</h3>
                    <p className="text-blue-600 font-bold mt-2">{produit.Prix} €</p>
                  </div>
                </Link>
              ))}
            </div>
          ) : (
            <p className="text-center text-gray-500">Chargement des produits...</p>
          )}

          <div className="text-center mt-10">
            <Link to="/produits" className="bg-blue-600 text-white px-6 py-3 rounded hover:bg-blue-700 transition">
              Voir tous les produits
            </Link>
          </div>
        </div>
      </div>

      <div className="py-16 px-4">
        <div className="max-w-4xl mx-auto grid grid-cols-1 md:grid-cols-3 gap-8 text-center">
          <div>
            <div className="text-4xl mb-4">🚚</div>
            <h3 className="font-bold mb-2">Livraison gratuite</h3>
            <p className="text-gray-600 text-sm">Dès 50€ d'achat</p>
          </div>
          <div>
            <div className="text-4xl mb-4">🔒</div>
            <h3 className="font-bold mb-2">Paiement sécurisé</h3>
            <p className="text-gray-600 text-sm">Transactions 100% sécurisées</p>
          </div>
          <div>
            <div className="text-4xl mb-4">↩️</div>
            <h3 className="font-bold mb-2">Retours faciles</h3>
            <p className="text-gray-600 text-sm">30 jours pour changer d'avis</p>
          </div>
        </div>
      </div>
    </div>
  )
}

export default HomePage
