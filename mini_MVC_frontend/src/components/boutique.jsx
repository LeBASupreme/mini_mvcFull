import { Link } from 'react-router-dom'

function Boutique() {
  return (
    <div className="min-h-screen flex items-center justify-center px-4">
      <div className="max-w-2xl text-center">
        <div className="text-8xl mb-8">🏪</div>

        <h1 className="text-4xl md:text-5xl font-bold text-gray-800 mb-4">
          Notre boutique arrive bientôt !
        </h1>

        <p className="text-xl text-gray-600 mb-8">
          Nous travaillons dur pour vous offrir une expérience shopping exceptionnelle.
          Restez connectés, de belles surprises vous attendent !
        </p>


        <Link
          to="/"
          className="inline-block bg-blue-600 text-white px-8 py-3 rounded-lg font-semibold hover:bg-blue-700 transition"
        >
          Retour à l'accueil
        </Link>
      </div>
    </div>
  )
}

export default Boutique
