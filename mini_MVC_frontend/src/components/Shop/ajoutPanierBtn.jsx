import { useState } from 'react'

function AjoutPanierBtn({ idProduit, prix }) {
    const [isAdded, setIsAdded] = useState(false);
    const [quantite, setQuantite] = useState(1);
    
    // Récupérer l'utilisateur depuis localStorage
    const user = JSON.parse(localStorage.getItem('user') || 'null');

    const ajouterAuPanier = async () => {
        if (!user?.ID_client) {
            console.error('Utilisateur non connecté');
            return;
        }
        try {
            const response = await fetch('/api/paniers', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                credentials: 'include',
                body: JSON.stringify({
                    id_produit: idProduit,
                    id_client: user.ID_client,
                    quantite: quantite
                }),
            });
            if (response.ok) {
                setIsAdded(true);
                setTimeout(() => setIsAdded(false), 2000);
            } else {
                console.error('Erreur lors de l\'ajout au panier');
            }
        } catch (error) {
            console.error('Erreur lors de l\'ajout au panier:', error);
        }
    };

    const diminuer = () => {
        if (quantite > 1) setQuantite(quantite - 1);
    };

    const augmenter = () => {
        setQuantite(quantite + 1);
    };

    return (
        <div className="flex items-center gap-4">
            <div className="flex items-center gap-2">
                <button
                    onClick={diminuer}
                    className="bg-gray-200 hover:bg-gray-300 px-3 py-1 rounded text-lg"
                >
                    -
                </button>
                <span className="w-8 text-center">{quantite}</span>
                <button
                    onClick={augmenter}
                    className="bg-gray-200 hover:bg-gray-300 px-3 py-1 rounded text-lg"
                >
                    +
                </button>
            </div>
            <button
                className={`${isAdded ? 'bg-green-600' : 'bg-blue-600 hover:bg-blue-700'} text-white px-4 py-2 rounded`}
                onClick={ajouterAuPanier}
            >
                {isAdded ? 'Ajouté !' : 'Ajouter au panier'}
            </button>
        </div>
    )
}

export default AjoutPanierBtn
