import { useState, useEffect } from 'react'

function EditMDP() {
  const [user, setUser] = useState(null)
  const [formData, setFormData] = useState({
    ancien_mot_de_passe: '',
    nouveau_mot_de_passe: '',
    confirmer_mot_de_passe: ''
  })
  const [message, setMessage] = useState('')
  const [error, setError] = useState('')

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
    setFormData({ ...formData, [e.target.name]: e.target.value })
  }

  const handleSubmit = async (e) => {
    e.preventDefault()
    setMessage('')
    setError('')

    if (formData.nouveau_mot_de_passe !== formData.confirmer_mot_de_passe) {
      setError('Les mots de passe ne correspondent pas')
      return
    }

    if (formData.nouveau_mot_de_passe.length < 6) {
      setError('Le mot de passe doit contenir au moins 6 caractères')
      return
    }

    try {
      const response = await fetch('/api/user/modifier-mot-de-passe', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        credentials: 'include',
        body: JSON.stringify({
          ancien_mot_de_passe: formData.ancien_mot_de_passe,
          nouveau_mot_de_passe: formData.nouveau_mot_de_passe
        })
      })
      const text = await response.text()
      try {
        const data = JSON.parse(text)
        if (response.ok) {
          setMessage(data.message)
          setFormData({
            ancien_mot_de_passe: '',
            nouveau_mot_de_passe: '',
            confirmer_mot_de_passe: ''
          })
          setTimeout(() => window.location.href = '/profile', 1500)
        } else {
          setError(data.message)
        }
      } catch {
        console.error('Réponse non-JSON:', text)
        setError('Erreur serveur')
      }
    } catch (error) {
      console.error('Erreur:', error)
      setError('Erreur de connexion')
    }
  }

  if (!user) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <p className="text-gray-600">Chargement...</p>
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
              <a href="/profile" className="block px-4 py-2 rounded hover:bg-gray-700">
                Retour au profil
              </a>
            </nav>
          </div>

          <div className="flex-1 p-8 bg-white">
            <h3 className="text-xl font-bold mb-6 text-gray-800">Changer le mot de passe</h3>

            {message && (
              <div className="mb-4 p-3 bg-green-100 text-green-700 rounded">
                {message}
              </div>
            )}

            {error && (
              <div className="mb-4 p-3 bg-red-100 text-red-700 rounded">
                {error}
              </div>
            )}

            <form onSubmit={handleSubmit} className="space-y-4 max-w-md">
              <div>
                <label className="block text-sm text-gray-500 mb-1">Ancien mot de passe</label>
                <input
                  type="password"
                  name="ancien_mot_de_passe"
                  value={formData.ancien_mot_de_passe}
                  onChange={handleChange}
                  required
                  className="w-full border rounded px-3 py-2"
                />
              </div>
              <div>
                <label className="block text-sm text-gray-500 mb-1">Nouveau mot de passe</label>
                <input
                  type="password"
                  name="nouveau_mot_de_passe"
                  value={formData.nouveau_mot_de_passe}
                  onChange={handleChange}
                  required
                  className="w-full border rounded px-3 py-2"
                />
              </div>
              <div>
                <label className="block text-sm text-gray-500 mb-1">Confirmer le mot de passe</label>
                <input
                  type="password"
                  name="confirmer_mot_de_passe"
                  value={formData.confirmer_mot_de_passe}
                  onChange={handleChange}
                  required
                  className="w-full border rounded px-3 py-2"
                />
              </div>

              <div className="flex gap-4 mt-6">
                <button
                  type="submit"
                  className="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700"
                >
                  Modifier
                </button>
                <a
                  href="/profile"
                  className="bg-gray-300 text-gray-700 px-6 py-2 rounded hover:bg-gray-400"
                >
                  Annuler
                </a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  )
}

export default EditMDP
