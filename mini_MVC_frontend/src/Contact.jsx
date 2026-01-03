import React from 'react'

function Contact() {
  return (
    <div className="min-h-screen flex flex-col justify-center items-center p-6">
      <h1 className="text-2xl font-bold mb-4">Contact</h1>
      <p className="text-gray-600 mb-6">Contactez-nous pour toute question.</p>

      <form className="space-y-4 w-full max-w-lg">
        <div>
          <label className="block text-sm font-medium mb-1">Nom:</label>
          <input type="text" name="nom" className="w-full border rounded px-3 py-2" />
        </div>
        <div>
          <label className="block text-sm font-medium mb-1">Email:</label>
          <input type="email" name="email" className="w-full border rounded px-3 py-2" />
        </div>
        <div>
          <label className="block text-sm font-medium mb-1">Message:</label>
          <textarea name="message" rows="4" className="w-full border rounded px-3 py-2"></textarea>
        </div>
        <button type="submit" className="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
          Envoyer
        </button>
      </form>
    </div>
  )
}

export default Contact