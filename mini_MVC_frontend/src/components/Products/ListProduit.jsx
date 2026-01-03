import { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import AjoutPanierBtn from '../Shop/ajoutPanierBtn';

function ListProduit() {
    const [produits, setProduits] = useState([]);
    const [categories, setCategories] = useState([]);
    const [categorieFilter, setCategorieFilter] = useState('');

    useEffect(() => {
        const fetchProduits = async () => {
            const response = await fetch('/api/produits');
            const data = await response.json();
            setProduits(data);
        };
        const fetchCategories = async () => {
            const response = await fetch('/api/categories');
            const data = await response.json();
            setCategories(data);
        };
        fetchProduits();
        fetchCategories();
    }, []);

    const produitsFiltres = categorieFilter
        ? produits.filter(p => p.ID_categorie == categorieFilter)
        : produits;

    return (
        <div className='pt-24 flex flex-col items-center text-center'>
            <h1 className='text-2xl font-bold mb-4'>Liste des Produits</h1>
            <div className='mb-4'>
                <select
                    className='border border-gray-300 rounded px-4 py-2'
                    value={categorieFilter}
                    onChange={(e) => setCategorieFilter(e.target.value)}
                >
                    <option value=''>Toutes les catégories</option>
                    {categories.filter(categorie => categorie.parent_id !== null).map(categorie => (
                        <option key={categorie.ID_categories} value={categorie.ID_categories}>
                            {categorie.Nom}
                        </option>
                    ))}
                </select>
            </div>
            <div className='grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 p-4'>
                {produitsFiltres.map(produit => (
                    <div className='border border-gray-300 rounded p-4' key={produit.ID_Produit}>
                        <img src={produit.Image || "https://placehold.co/300x300?text=Produit"} alt={produit.Nom} className='w-full h-48 object-cover mb-2' />
                        <h3 className='text-lg font-semibold mb-2'>{produit.Nom}</h3>
                        <p className='text-gray-600 text-sm mb-3'>{produit.Description}</p>
                        <p className='text-green-600 font-bold mb-3'>{produit.Prix} €</p>
                        <div className='flex gap-2'>
                            <AjoutPanierBtn idProduit={produit.ID_Produit} prix={produit.Prix} />
                            <Link className="border border-gray-400 hover:bg-gray-100 px-3 py-1 rounded text-sm" to={`/produit/${produit.ID_Produit}`}>
                                Détails
                            </Link>
                        </div>
                    </div>
                ))}
            </div>
        </div>
    );
}

export default ListProduit  