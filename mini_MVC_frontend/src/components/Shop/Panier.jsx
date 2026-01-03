import { useState, useEffect } from 'react'

function Panier() {
  const [panierItems, setPanierItems] = useState([])
  const [isLoading, setIsLoading] = useState(false)
  
  const user = JSON.parse(localStorage.getItem('user') || 'null')
  const userId = user?.ID_client

  const total = panierItems.reduce((acc, item) => acc + parseFloat(item.Sous_total || 0), 0)

  const fetchPanier = async () => {
    if (!userId) return
    try {
      const response = await fetch(`/api/paniers/client/${userId}/cart`, {
        method: 'GET',
        headers: { 'Content-Type': 'application/json' },
        credentials: 'include',
      })
      const data = await response.json()
      setPanierItems(Array.isArray(data) ? data : [])
    } catch (error) {
      console.error('Erreur lors de la récupération du panier:', error)
    }
  }

  useEffect(() => {
    fetchPanier()
  }, [userId])

  const handleSupprimer = async (id_ligne) => {
    try {
      const response = await fetch(`/api/paniers/${id_ligne}`, {
        method: 'DELETE',
        headers: { 'Content-Type': 'application/json' },
        credentials: 'include',
      })
      if (response.ok) {
        fetchPanier()
      }
    } catch (error) {
      console.error('Erreur lors de la suppression de l\'article:', error)
    }
  }

  const handleModifierQuantite = async (id_ligne, nouvelleQuantite) => {
    if (nouvelleQuantite < 1) return
    try {
      const response = await fetch(`/api/paniers/${id_ligne}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        credentials: 'include',
        body: JSON.stringify({ quantite: nouvelleQuantite }),
      })
      if (response.ok) {
        fetchPanier()
      }
    } catch (error) {
      console.error('Erreur lors de la modification:', error)
    }
  }



  const handleCheckout = async () => {
    setIsLoading(true)
    try {
      const response = await fetch('/api/checkout', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        credentials: 'include',
      })
      const data = await response.json()
      if (data.url) {
        window.location.href = data.url
      }
    } catch (error) {
      console.error('Erreur checkout:', error)
    } finally {
      setIsLoading(false)
    }
  }

  return (
    <div className="flex flex-col p-5 justify-center min-h-screen">
        <h1 className="text-4xl font-bold mb-8">Panier</h1>

        {panierItems.length === 0 ? (
            <p className="text-lg">Votre panier est vide.</p>
        ) : (
            <>
                <table className="table-auto border-collapse border border-gray-300">
                    <thead>
                        <tr>
                            <th className="border border-gray-300 px-4 py-2">Produit</th>
                            <th className="border border-gray-300 px-4 py-2">Quantité</th>
                            <th className="border border-gray-300 px-4 py-2">Prix Unitaire</th>
                            <th className="border border-gray-300 px-4 py-2">Sous-total</th>
                            <th className="border border-gray-300 px-4 py-2">Supprimer</th>
                        </tr>
                    </thead>
                    <tbody>
                        {panierItems.map((item) => (
                            <tr key={item.ID_Ligne}>
                                <td className="border border-gray-300 px-4 py-2">{item.Nom || `Produit #${item.ID_Produit}`}</td>
                                <td className="border border-gray-300 px-4 py-2">
                                    <div className="flex items-center justify-center gap-2">
                                        <button
                                            onClick={() => handleModifierQuantite(item.ID_Ligne, item.Quantite - 1)}
                                            className="bg-gray-200 hover:bg-gray-300 px-2 py-1 rounded"
                                        >
                                            -
                                        </button>
                                        <span>{item.Quantite}</span>
                                        <button
                                            onClick={() => handleModifierQuantite(item.ID_Ligne, item.Quantite + 1)}
                                            className="bg-gray-200 hover:bg-gray-300 px-2 py-1 rounded"
                                        >
                                            +
                                        </button>
                                    </div>
                                </td>
                                <td className="border border-gray-300 px-4 py-2">{item.Prix_Unitaire} €</td>
                                <td className="border border-gray-300 px-4 py-2">{item.Sous_total} €</td>
                                <td className="border border-gray-300 px-4 py-2"> <button onClick={() => handleSupprimer(item.ID_Ligne)}>Supprimer</button></td>
                            </tr>
                        ))}
                    </tbody>
                </table>

                <div className="mt-6 flex justify-between items-center">
                    <p className="text-2xl font-bold">Total: {total.toFixed(2)} €</p>
                    <button
                        onClick={handleCheckout}
                        disabled={isLoading}
                        className="bg-green-600 hover:bg-green-700 disabled:bg-gray-400 text-white px-6 py-3 rounded-lg text-lg font-semibold"
                    >
                        {isLoading ? 'Chargement...' : 'Continuer vers le paiement'}
                    </button>
                </div>
            </>
        )}
    </div>
  )
}

export default Panier