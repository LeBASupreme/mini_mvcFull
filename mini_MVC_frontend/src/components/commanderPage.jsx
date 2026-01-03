import { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'

function CommanderPage() {
  const [commandes, setCommandes] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    fetchCommandes()
  }, [])

  const fetchCommandes = async () => {
    try {
      const response = await fetch('/api/commandes', {
        credentials: 'include'
      })
      if (response.ok) {
        const data = await response.json()
        setCommandes(data)
      }
    } catch (error) {
      console.error('Erreur:', error)
    } finally {
      setLoading(false)
    }
  }

  const getStatutColor = (statut) => {
    switch (statut?.toLowerCase()) {
      case 'payée':
        return 'bg-green-100 text-green-800'
      case 'en cours':
        return 'bg-blue-100 text-blue-800'
      case 'livrée':
        return 'bg-purple-100 text-purple-800'
      case 'annulée':
        return 'bg-red-100 text-red-800'
      default:
        return 'bg-gray-100 text-gray-800'
    }
  }

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <p className="text-gray-500">Chargement...</p>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-100 py-8">
      <div className="max-w-4xl mx-auto px-4">
        <h1 className="text-3xl font-bold text-gray-800 mb-8">Mes commandes</h1>

        {commandes.length === 0 ? (
          <div className="bg-white rounded-lg shadow-md p-8 text-center">
            <p className="text-gray-500 text-xl mb-4">Aucune commande pour le moment</p>
            <Link
              to="/produits"
              className="inline-block bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700"
            >
              Découvrir nos produits
            </Link>
          </div>
        ) : (
          <div className="space-y-4">
            {commandes.map((commande) => (
              <div key={commande.id_commande} className="bg-white rounded-lg shadow-md p-6">
                <div className="flex justify-between items-start mb-4">
                  <div>
                    <p className="text-sm text-gray-500">Commande #{commande.id_commande}</p>
                    <p className="text-sm text-gray-500">
                      {new Date(commande.date_commande).toLocaleDateString('fr-FR', {
                        day: 'numeric',
                        month: 'long',
                        year: 'numeric',
                        hour: '2-digit',
                        minute: '2-digit'
                      })}
                    </p>
                  </div>
                  <span className={`px-3 py-1 rounded-full text-sm font-medium ${getStatutColor(commande.statut)}`}>
                    {commande.statut}
                  </span>
                </div>

                {commande.produits && commande.produits.length > 0 && (
                  <div className="border-t pt-4 mb-4">
                    <p className="text-sm font-medium text-gray-700 mb-2">Produits :</p>
                    <div className="space-y-2">
                      {commande.produits.map((produit, index) => (
                        <div key={index} className="flex justify-between text-sm">
                          <span className="text-gray-600">
                            {produit.nom_produit} x{produit.quantite}
                          </span>
                          <span className="text-gray-800">
                            {parseFloat(produit.sous_total).toFixed(2)} €
                          </span>
                        </div>
                      ))}
                    </div>
                  </div>
                )}

                <div className="border-t pt-4">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-600 font-medium">Total</span>
                    <span className="text-xl font-bold text-green-600">
                      {parseFloat(commande.total).toFixed(2)} €
                    </span>
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  )
}

export default CommanderPage
