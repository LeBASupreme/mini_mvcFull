import { useState, useEffect, useRef } from 'react'
import personnesImg from '../assets/utilisateur.png'
import panier from '../assets/panier.png'

function Navbar() {
    const [user, setUser] = useState(null);
    const [menuOpen, setMenuOpen] = useState(false);
    const menuRef = useRef(null);
    const PanierCount = 0;

    useEffect(() => {
        fetch('/api/auth/me', { credentials: 'include' })
            .then(res => {
                if (res.ok) return res.json();
                throw new Error('Non connecté');
            })
            .then(data => {
                setUser(data);
                localStorage.setItem('user', JSON.stringify(data));
            })
            .catch(() => {
                setUser(null);
                localStorage.removeItem('user');
            });
    }, []);

    useEffect(() => {
        const handleClickOutside = (event) => {
            if (menuRef.current && !menuRef.current.contains(event.target)) {
                setMenuOpen(false);
            }
        };
        document.addEventListener('mousedown', handleClickOutside);
        return () => document.removeEventListener('mousedown', handleClickOutside);
    }, []);

    const handleLogout = () => {
        localStorage.removeItem('user');
        setUser(null);
        setMenuOpen(false);
    };

    return (
        <div className='flex fixed top-0 left-0 right-0 z-50 bg-white justify-between items-center p-4'>
            <h1 className='text-2xl font-semibold'><a href="/">MusicVerse</a></h1>
            <ul className='flex gap-x-4'>
                <li><a href="/produits">Produit</a></li>
                <li><a href="/boutique">Boutique</a></li>
                <li><a href="/contact">Contact</a></li>
            </ul>
            <ul className='flex gap-x-4 items-center'>
                {!user ? (
                    <li>
                        <a href="/connexion" className='bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded text-sm'>
                            Connexion
                        </a>
                    </li>
                ) : (
                    <>
                        <li className="relative" ref={menuRef}>
                            <button onClick={() => setMenuOpen(!menuOpen)}>
                                <img src={personnesImg} alt="Profil" className='w-6' />
                            </button>
                            {menuOpen && (
                                <div className="absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg py-1 z-50 border">
                                    <a href="/profile" className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">
                                        Mon profil
                                    </a>
                                    <a href="/commande" className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">
                                        Mes commandes
                                    </a>
                                    <hr className="my-1" />
                                    <button
                                        onClick={handleLogout}
                                        className="block w-full text-left px-4 py-2 text-sm text-red-600 hover:bg-gray-100"
                                    >
                                        Déconnexion
                                    </button>
                                </div>
                            )}
                        </li>
                        <li>
                            <a href="/panier" className='relative'>
                                <img src={panier} alt="Panier" className='w-6' />
                                {PanierCount > 0 && (
                                    <span className='absolute -top-2 -right-2 bg-red-500 text-white text-xs w-4 h-4 flex items-center justify-center rounded-full'>
                                        {PanierCount}
                                    </span>
                                )}
                            </a>
                        </li>
                    </>
                )}


            </ul>
        </div>
    )
}

export default Navbar