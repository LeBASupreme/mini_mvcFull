import { useState, useEffect } from 'react'
import AjoutPanierBtn from '../Shop/ajoutPanierBtn';
function DetailProduit({ id }) {
  const [produit, setProduit] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    if (!id) return;

    const fetchProduit = async () => {
      try {
        const response = await fetch(`/api/produits/${id}`);
        if (!response.ok) {
          setError('Produit non trouvé');
          return;
        }
        const data = await response.json();
        if (!data) {
          setError('Produit non trouvé');
          return;
        }
        setProduit(data);
      } catch (err) {
        setError('Produit non trouvé');
      }
    };

    fetchProduit();
  }, [id]);

  if (error) {
    return <div className="text-center mt-8 text-red-600">{error}</div>;
  }

  if (!produit) {
    return <div className="text-center mt-8">Aucun produit trouvé</div>;
  }

  return (
    <div className='flex max-w-4xl mx-auto items-center min-h-[calc(100vh-100px)] space-around'>
      <div className='w-1/2 p-8'>
        <img src={produit.Image || 'https://via.placeholder.com/400'} alt={produit.Nom} className='w-full h-auto rounded' />
      </div>
      <div className='w-1/2 p-8'>
        <h1 className='text-3xl font-bold mb-4'>{produit.Nom}</h1>
        <p className='text-gray-700 mb-6'>{produit.Description}</p>
        <p className='text-green-600 text-2xl font-bold mb-6'>{produit.Prix} €</p>
        <div>
          <AjoutPanierBtn idProduit={produit.ID_Produit} prix={produit.Prix} />
        </div>
        
      </div>

    </div>
  );
}

export default DetailProduit