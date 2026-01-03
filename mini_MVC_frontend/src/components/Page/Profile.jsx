import { useState, useEffect } from 'react'

function Profile() {
  const [user, setUser] = useState(null)
  const [activeTab, setActiveTab] = useState('info')

  useEffect(() => {
    const fetchUser = async () => {
      try {
        const response = await fetch('/api/auth/me', {
          credentials: 'include'
        })
        if (response.ok) {
          const data = await response.json()
          setUser(data)
        }
      } catch (error) {
        console.error('Erreur lors de la récupération du profil:', error)
      }
    }
    fetchUser()
  }, [])

  if (!user) {
    return (
      <div className="flex items-center justify-center min-h-screen bg-gray-50">
        <div className="text-center p-8 bg-white rounded-lg shadow">
          <p className="text-gray-600">Veuillez vous connecter pour voir votre profil.</p>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50 py-20 px-4 flex items-center justify-center">
      <div className="max-w-4xl w-full rounded-lg shadow overflow-hidden">
        <div className="flex flex-col md:flex-row">

          <div className="w-full md:w-64 bg-gray-600 text-white p-6">
            <div className="text-center mb-6">
              <div className="w-20 h-20 bg-gray-500 rounded-full mx-auto mb-3 flex items-center justify-center text-2xl font-bold">
                {user.Prenom?.charAt(0) || 'U'}{user.Nom?.charAt(0) || ''}
              </div>
              <h2 className="text-lg font-semibold">{user.Prenom} {user.Nom}</h2>
              <p className="text-gray-400 text-sm">{user.Email}</p>
            </div>

            <nav className="space-y-2">
              <button
                onClick={() => setActiveTab('info')}
                className={`w-full text-left px-4 py-2 rounded transition ${activeTab === 'info' ? 'bg-blue-600' : 'hover:bg-gray-700'}`}
              >
                Informations
              </button>
              <button
                onClick={() => setActiveTab('security')}
                className={`w-full text-left px-4 py-2 rounded transition ${activeTab === 'security' ? 'bg-blue-600' : 'hover:bg-gray-700'}`}
              >
                Sécurité
              </button>
            </nav>
          </div>

          <div className="flex-1 p-8">
            {activeTab === 'info' && (
              <>
                <h3 className="text-xl font-bold mb-6 text-gray-800">Informations personnelles</h3>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div>
                    <label className="block text-sm text-gray-500 mb-1">Nom</label>
                    <p className="text-gray-800 font-medium">{user.Nom || 'Non renseigné'}</p>
                  </div>
                  <div>
                    <label className="block text-sm text-gray-500 mb-1">Prénom</label>
                    <p className="text-gray-800 font-medium">{user.Prenom || 'Non renseigné'}</p>
                  </div>
                  <div>
                    <label className="block text-sm text-gray-500 mb-1">Email</label>
                    <p className="text-gray-800 font-medium">{user.Email || 'Non renseigné'}</p>
                  </div>
                  <div>
                    <label className="block text-sm text-gray-500 mb-1">Adresse</label>
                    <p className="text-gray-800 font-medium">{user.Adresse || 'Non renseigné'}</p>
                  </div>
                  <div>
                    <label className="block text-sm text-gray-500 mb-1">Ville</label>
                    <p className="text-gray-800 font-medium">{user.Ville || 'Non renseigné'}</p>
                  </div>
                  <div>
                    <label className="block text-sm text-gray-500 mb-1">Code Postal</label>
                    <p className="text-gray-800 font-medium">{user.CodePostal || 'Non renseigné'}</p>
                  </div>
                </div>
                <a
                  href="/edit-profile"
                  className="inline-block mt-8 bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700 transition"
                >
                  Modifier le profil
                </a>
              </>
            )}

            {activeTab === 'security' && (
              <>
                <h3 className="text-xl font-bold mb-6 text-gray-800">Sécurité</h3>
                <div className="space-y-4">
                  <div className="p-4 border rounded-lg">
                    <h4 className="font-medium text-gray-800">Mot de passe</h4>
                    <p className="text-sm text-gray-500 mb-3">Dernière modification: jamais</p>
                    <a href="/change-password" className="text-blue-600 hover:underline text-sm">
                      Changer le mot de passe
                    </a>
                  </div>
                </div>
              </>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}

export default Profile