import React from 'react'

function Footer() {
  return (
    <footer className="bg-gray-900 text-white">

      {/* Liens */}
      <div className="max-w-6xl mx-auto py-8 px-4 grid grid-cols-1 md:grid-cols-3 gap-8">
        <div>
          <h3 className="font-bold mb-4">CONTACT</h3>
          <p className="text-gray-400 text-sm">Du lundi au vendredi de 9:00 à 18:00</p>
          <p className="text-gray-400 text-sm">Samedi de 10:00 à 18:00</p>
        </div>
        <div>
          <h3 className="font-bold mb-4">INFORMATIONS</h3>
          <ul className="text-gray-400 text-sm space-y-2">
            <li><a href="#" className="hover:text-white">Qui sommes-nous ?</a></li>
            <li><a href="#" className="hover:text-white">Frais de livraison</a></li>
            <li><a href="#" className="hover:text-white">F.A.Q.</a></li>
            <li><a href="#" className="hover:text-white">Mentions légales</a></li>
          </ul>
        </div>
        <div>
          <h3 className="font-bold mb-4">LIENS UTILES</h3>
          <ul className="text-gray-400 text-sm space-y-2">
            <li><a href="#" className="hover:text-white">Conditions Générales de Vente</a></li>
            <li><a href="#" className="hover:text-white">Politique de confidentialité</a></li>
            <li><a href="#" className="hover:text-white">Plan du site</a></li>
          </ul>
        </div>
      </div>

      <div className="border-t border-gray-700 py-4 text-center text-gray-400 text-sm">
        <p>&copy; {new Date().getFullYear()} Mini MVC. Tous droits réservés.</p>
      </div>
    </footer>
  )
}

export default Footer