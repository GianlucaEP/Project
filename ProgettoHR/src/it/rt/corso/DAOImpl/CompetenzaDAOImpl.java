package it.rt.corso.DAOImpl;

import java.util.List;
import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.CompetenzaDAO;
import it.rt.corso.beans.Competenza;
import it.rt.corso.utility.Utility;

public class CompetenzaDAOImpl extends BaseDAO implements CompetenzaDAO {

	public Competenza inserisci(Competenza competenza) {
		return (Competenza) super.inserisci(competenza);
	}

	public List<Competenza> getLista() {
		
		Utility.buildSession();

		List<Competenza> listacompetenze = Utility.getSession().createQuery(" FROM competenza ").getResultList();
		return listacompetenze;
	}

}
