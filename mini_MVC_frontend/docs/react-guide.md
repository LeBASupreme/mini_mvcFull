# Guide React - useEffect et Fetch de Donnees

## useEffect - C'est quoi ?

`useEffect` est un **hook** React qui permet d'executer du code **apres** que le composant soit affiche a l'ecran.

### Quand utiliser useEffect ?

- Recuperer des donnees depuis une API
- Modifier le titre de la page
- Ecouter des evenements (scroll, resize, etc.)
- Tout ce qui est un "effet de bord" (side effect)

### Syntaxe de base

```jsx
useEffect(() => {
    // Code a executer
}, [dependencies])
```

### Le tableau de dependances `[]`

| Syntaxe | Comportement |
|---------|-------------|
| `useEffect(() => {}, [])` | Execute **une seule fois** au montage du composant |
| `useEffect(() => {}, [variable])` | Execute a chaque fois que `variable` change |
| `useEffect(() => {})` | Execute a **chaque rendu** (rarement voulu) |

### Exemple simple

```jsx
import { useState, useEffect } from 'react'

function MonComposant() {
    const [message, setMessage] = useState('')

    // S'execute une seule fois quand le composant apparait
    useEffect(() => {
        console.log('Le composant est affiche!')
        setMessage('Bonjour!')
    }, [])

    return <p>{message}</p>
}
```

---

## Recuperer des donnees par ID

### Le pattern classique

Quand tu veux recuperer un element specifique (par exemple un produit par son ID), voici le schema:

```jsx
import { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'

function DetailElement() {
    // 1. State pour stocker les donnees
    const [element, setElement] = useState(null)

    // 2. Recuperer l'ID depuis l'URL (ex: /element/5 -> id = 5)
    const { id } = useParams()

    // 3. useEffect pour fetch les donnees
    useEffect(() => {
        const fetchElement = async () => {
            const response = await fetch(`/api/ton-endpoint/${id}`)
            const data = await response.json()
            setElement(data)
        }
        fetchElement()
    }, [id])  // <-- Se re-execute si l'ID change

    // 4. Affichage conditionnel (en attendant les donnees)
    if (!element) {
        return <p>Chargement...</p>
    }

    // 5. Afficher les donnees
    return (
        <div>
            <h1>{element.nom}</h1>
            <img src={element.image} alt={element.nom} />
            <p>{element.description}</p>
        </div>
    )
}
```

---

## Les etapes cles a retenir

1. **Creer un state** avec `useState(null)` pour stocker les donnees
2. **Recuperer l'ID** avec `useParams()` si l'ID vient de l'URL
3. **Faire le fetch** dans un `useEffect` avec l'ID dans les dependances
4. **Gerer le chargement** car les donnees ne sont pas disponibles immediatement
5. **Afficher les donnees** une fois qu'elles sont chargees

---

## Astuce - Structure des donnees

Quand tu fais un `fetch`, la reponse JSON a la meme structure que ce que ton API PHP renvoie.

Si ton API renvoie:
```json
{
    "ID_Produit": 1,
    "Nom": "T-shirt",
    "Prix": 25.99,
    "Image": "tshirt.jpg"
}
```

Alors dans React tu accedes avec:
```jsx
element.ID_Produit
element.Nom
element.Prix
element.Image
```

---

## A toi de jouer !

Pour ton panier, reflechis a:
- Quelle API dois-tu appeler ? (`/api/panier/...`)
- Quel ID as-tu besoin ? (l'ID du client connecte)
- Comment recuperer l'ID du client ? (regarde comment fait `Profile.jsx`)