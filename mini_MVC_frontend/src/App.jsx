import { Routes, Route, useParams } from 'react-router-dom'
import Navbar from './components/Navbar'
import LoginSetup from './components/connection/LoginSetup'
import SigninSetup from './components/connection/SigninSetup'
import Profile from './components/Page/Profile'
import Panier from './components/Shop/Panier'
import EditProfile from './components/Page/EditProfile'
import Boutique from './components/boutique'
import EditMDP from './components/Page/EditMDP'
import SuccessPage from './components/SuccessPage'
import HomePage from './components/HomePage'
import Contact from './Contact'
import ListProduit from './components/Products/ListProduit'
import DetailProduit from './components/Products/DetailProduit'
import CommanderPage from './components/commanderPage'
import Footer from './components/Footer'

function App() {
  return (
    <>
      <Navbar />


      <Routes>
        <Route path="/" element={<HomePage />} />



        <Route path="/connexion" element={<LoginSetup />} />
        <Route path="/edit-profile" element={<EditProfile />} />
        <Route path="/success" element={<SuccessPage />} />
        <Route path="/commande" element={<CommanderPage />} />
        <Route path="/change-password" element={<EditMDP />} />
        <Route path="/contact" element={<Contact />} />
        <Route path="/panier" element={<Panier />} />
        <Route path="/boutique" element={<Boutique />} />
        <Route path="/inscription" element={<SigninSetup />} />
        <Route path="/produits" element={<ListProduit />} />
        <Route path="/profile" element={<Profile />} />
        <Route path="/produit/:id" element={<DetailProduitWrapper />} />
      </Routes>

      <Footer />
    </>
  )
}

function DetailProduitWrapper() {
  const { id } = useParams();
  return <DetailProduit id={id} />;
}

export default App
