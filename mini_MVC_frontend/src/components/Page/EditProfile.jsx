import { useState, useEffect } from 'react'

function EditProfile() {
  const [user, setUser] = useState({
    Nom: '',
    Prenom: '',
    Email: '',
    Adresse: ''
  })
  const [message, setMessage] = useState('')

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
        console.error('Erreur:', error)
      }
    }
    fetchUser()
  }, [])

  const handleChange = (e) => {
    setUser({ ...user, [e.target.name]: e.target.value })
  }

  const handleSubmitProfil = async (e) => {
    e.preventDefault()
    try {
      const response = await fetch('/api/user/modifier-profil', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        credentials: 'include',
        body: JSON.stringify({
          nom: user.Nom,
          prenom: user.Prenom,
          adresse: user.Adresse
        })
      })
      const text = await response.text()
      try {
        const data = JSON.parse(text)
        setMessage(data.message)
        if (response.ok) {
          setTimeout(() => window.location.href = '/profile', 1500)
        }
      } catch {
        console.error('Réponse non-JSON:', text)
        setMessage('Erreur serveur')
      }
    } catch (error) {
      console.error('Erreur:', error)
      setMessage('Erreur de connexion')
    }
  }

  const handleSubmitEmail = async (e) => {
    e.preventDefault()
    try {
      const response = await fetch('/api/user/modifier-email', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        credentials: 'include',
        body: JSON.stringify({ email: user.Email })
      })
      const text = await response.text()
      try {
        const data = JSON.parse(text)
        setMessage(data.message)
      } catch {
        console.error('Réponse non-JSON:', text)
        setMessage('Erreur serveur')
      }
    } catch (error) {
      console.error('Erreur:', error)
      setMessage('Erreur de connexion')
    }
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
              <a href="/profile" className="block px-4 py-2 rounded hover:bg-gray-700">
                Retour au profil
              </a>
            </nav>
          </div>

          <div className="flex-1 p-8 bg-white">
            {message && (
              <div className="mb-4 p-3 bg-green-100 text-green-700 rounded">
                {message}
              </div>
            )}

            {/* Modifier Profil */}
            <h3 className="text-xl font-bold mb-4 text-gray-800">Informations personnelles</h3>
            <form onSubmit={handleSubmitProfil} className="space-y-4 mb-8">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                  <label className="block text-sm text-gray-500 mb-1">Nom</label>
                  <input
                    type="text"
                    name="Nom"
                    value={user.Nom || ''}
                    onChange={handleChange}
                    className="w-full border rounded px-3 py-2"
                  />
                </div>
                <div>
                  <label className="block text-sm text-gray-500 mb-1">Prénom</label>
                  <input
                    type="text"
                    name="Prenom"
                    value={user.Prenom || ''}
                    onChange={handleChange}
                    className="w-full border rounded px-3 py-2"
                  />
                </div>
                <div className="md:col-span-2">
                  <label className="block text-sm text-gray-500 mb-1">Adresse</label>
                  <input
                    type="text"
                    name="Adresse"
                    value={user.Adresse || ''}
                    onChange={handleChange}
                    className="w-full border rounded px-3 py-2"
                  />
                </div>
              </div>
              <button
                type="submit"
                className="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700"
              >
                Enregistrer
              </button>
            </form>

            {/* Modifier Email */}
            <h3 className="text-xl font-bold mb-4 text-gray-800">Changer l'email</h3>
            <form onSubmit={handleSubmitEmail} className="space-y-4">
              <div>
                <label className="block text-sm text-gray-500 mb-1">Nouvel email</label>
                <input
                  type="email"
                  name="Email"
                  value={user.Email || ''}
                  onChange={handleChange}
                  className="w-full border rounded px-3 py-2 max-w-md"
                />
              </div>
              <button
                type="submit"
                className="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700"
              >
                Modifier l'email
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  )
}

export default EditProfile
