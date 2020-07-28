package it.rt.corso.DAOImpl;

import java.util.List;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.CompetenzeDAO;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Competenza;
import it.rt.corso.utility.Utility;

public class CompetenzeDAOImpl extends BaseDAO implements CompetenzeDAO{

	public Competenza inserisci(Competenza competenza) {
		return (Competenza) super.inserisci(competenza);
	}

	
	public List<Competenza> getLista() {
		
		Utility.buildSession();
		
		List<Competenza> listacompetenze = Utility.getSession().createQuery(" FROM Competenza ").getResultList();
		return listacompetenze;
	}

}
