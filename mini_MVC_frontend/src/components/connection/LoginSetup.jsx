import { useState } from 'react'
import video_bg from '../../assets/bg-video2.mp4';


function LoginSetup() {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState(null);

    const handleSubmit = async (e) => {
        e.preventDefault();
        setError(null);

        try {
            const response = await fetch('/api/auth/login', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ email, mdp: password })
            });

            if (!response.ok) {
                setError('Email ou mot de passe incorrect');
                return;
            }

            const user = await response.json();
            localStorage.setItem('user', JSON.stringify(user));
            window.location.href = '/';
        } catch (err) {
            setError('Erreur de connexion');
        }
    };

    return (
        <div className='flex h-screen'>
            <div className='relative w-1/2 overflow-hidden bg-black'>
                <div className='absolute inset-0 bg-cover bg-center blur-[3px]'>
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
                <h2 className='text-3xl font-bold mb-6'>Connexion</h2>
                {error && <p className='text-red-600 mb-4'>{error}</p>}
                <form onSubmit={handleSubmit} className='w-full max-w-sm'>
                    <div className='mb-4'>
                        <label className='block text-gray-700 text-sm font-bold mb-2' htmlFor='email'>
                            Email
                        </label>
                        <input
                            className='shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline'
                            id='email'
                            type='email'
                            value={email}
                            onChange={(e) => setEmail(e.target.value)}
                            placeholder='Entrez votre email'
                            required
                        />
                    </div>
                    <div className='mb-2'>
                        <label className='block text-gray-700 text-sm font-bold mb-2' htmlFor='password'>
                            Mot de passe
                        </label>
                        <input
                            className='shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline'
                            id='password'
                            type='password'
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                            placeholder='Entrez votre mot de passe'
                            required
                        />
                    </div>
                    <a href="/inscription" className='text-gray-600 hover:underline mb-2 gap-4 inline-block'>
                        Vous n'avez pas de compte ? Inscrivez-vous ici.
                    </a>
                    <div className='flex items-center justify-between'>
                        <button
                            type='submit'
                            className='bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline'
                        >
                            Se connecter
                        </button>
                    </div>
                </form>
            </div>
        </div>
    )
}

export default LoginSetup