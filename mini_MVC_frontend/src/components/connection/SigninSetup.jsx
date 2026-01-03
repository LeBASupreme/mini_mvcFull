import video_bg from '../../assets/bg-video.mp4';
import { useState } from 'react'
import { useNavigate } from 'react-router-dom'


function SigninSetup() {
    const [error, setError] = useState(null);
    const [nom, setNom] = useState('');
    const [prenom, setPrenom] = useState('');
    const [adresse, setAdresse] = useState('');
    const [ville, setVille] = useState('');
    const [codePostal, setCodePostal] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');

    const handleSubmit = async (e) => {
        e.preventDefault();
        setError(null);
        try {
            const response = await fetch('/api/auth/register', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ nom, prenom, adresse, ville, codePostal, email, mdp: password })
            });

            if (!response.ok) {
                const data = await response.json().catch(() => ({}));
                setError(data.message || 'Erreur lors de l\'inscription');
                return;
            }
            window.location.href = '/connexion';
        } catch (err) {
            setError('Erreur lors de l\'inscription');
        }
        
    }



    return (
        <div className='flex h-screen'>
            <div className='relative w-1/2 overflow-hidden bg-black'>
                <div className='absolute inset-0 bg-cover bg-center blur-[3px]' >
                    <video
                        className="absolute top-0 left-0 w-full h-full object-cover"
                        autoPlay
                        loop
                        muted
                        playsInline
                    >
                        <source src={video_bg} type="video/mp4" />
                        Your browser does not support the video tag.
                    </video>
                </div>
                <div className='absolute bottom-4 right-4 text-white text-right z-10'>
                    <h3 className='font-bold'>Martin Garrix</h3>
                    <p className='text-sm'>Vive la musique</p>
                </div>
            </div>
            <div className='flex flex-col justify-center items-center w-1/2 p-8'>
                <h1 className='text-4xl font-bold text-gray-800 mb-6'>Inscription</h1>
                {error && <p className="text-red-500 text-xs italic mb-4">{error}</p>}
                <form onSubmit={handleSubmit}>
                    <div className='mb-2'>
                        <label className='block text-gray-700 text-sm font-bold mb-2' htmlFor='nom'>
                            Nom
                        </label>
                        <input
                            className='shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline'
                            id='nom'
                            type='text'
                            value={nom}
                            onChange={(e)=>setNom(e.target.value)}
                            placeholder='Entrez votre nom'
                            required
                        />
                    </div>
                    <div className='mb-2'>
                        <label className='block text-gray-700 text-sm font-bold mb-2' htmlFor='prenom'>
                            Prenom
                        </label>
                        <input
                            className='shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline'
                            id='prenom'
                            type='text'
                            value={prenom}
                            onChange={(e)=>setPrenom(e.target.value)}
                            placeholder='Entrez votre prenom'
                            required
                        />
                    </div>
                    <div className='mb-2'>
                        <label className='block text-gray-700 text-sm font-bold mb-2' htmlFor='adresse'>
                            Adresse
                        </label>
                        <input
                            className='shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline'
                            id='adresse'
                            type='text'
                            value={adresse}
                            onChange={(e)=>setAdresse(e.target.value)}
                            placeholder='Entrez votre adresse'
                            required
                        />
                    </div>
                    <div className='mb-3 flex justify-between gap-4'>
                        <div>
                            <label className='block text-gray-700 text-sm font-bold mb-2' htmlFor='ville'>
                                Ville
                            </label>
                            <select
                                className='shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline'
                                id='ville'
                                value={ville}
                                onChange={(e)=>setVille(e.target.value)}
                                required
                            >
                                <option value=''>Sélectionnez une ville</option>
                                <option value='Paris'>Paris</option>
                                <option value='Lyon'>Lyon</option>
                                <option value='Marseille'>Marseille</option>
                            </select>

                        </div>
                        <div>
                            <label className='block text-gray-700 text-sm font-bold mb-2' htmlFor='code_postal'>
                                Code Postal
                            </label>
                            <input
                                className='shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline'
                                id='code_postal'
                                value={codePostal}
                                onChange={(e)=>setCodePostal(e.target.value)}
                                type='text'
                                placeholder='Entrez votre code postal'
                                required
                            />

                        </div>
                    </div>
                    <div className='mb-2'>
                        <label className='block text-gray-700 text-sm font-bold mb-2' htmlFor='email'>
                            Email
                        </label>
                        <input
                            className='shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline'
                            id='email'
                            type='email'
                            value={email}
                            onChange={(e)=>setEmail(e.target.value)}
                            placeholder='Entrez votre email'
                            required
                        />
                    </div>
                    <div className='mb-6'>
                        <label className='block text-gray-700 text-sm font-bold mb-2' htmlFor='password'>
                            Mot de passe
                        </label>
                        <input
                            className='shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline'
                            id='password'
                            type='password'
                            value={password}
                            onChange={(e)=>setPassword(e.target.value)}
                            placeholder='Entrez votre mot de passe'
                            required
                        />
                    </div>
                    <div className='flex flex-col gap-2'>
                        <a href="/connexion" className='text-gray-600 hover:underline mb-2 gap-4 inline-block'>
                            Vous avez déjà un compte ? Connectez-vous ici.
                        </a>
                        <button
                            type='submit'
                            className='bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline'
                        >
                            S'inscrire
                        </button>
                    </div>



                </form>
            </div>
        </div>
    )
}

export default SigninSetup
