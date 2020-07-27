package it.rt.corso.DAOImpl;

import java.util.List;
import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.CompetenzaDAO;
import it.rt.corso.beans.Sinonimo;
import it.rt.corso.utility.Utility;

public class CompetenzaDAOImpl extends BaseDAO implements CompetenzaDAO {

	public Sinonimo inserisci(Sinonimo competenza) {
		return (Sinonimo) super.inserisci(competenza);
	}

	public List<Sinonimo> getLista() {
		
		Utility.buildSession();

		List<Sinonimo> listacompetenze = Utility.getSession().createQuery(" FROM competenza ").getResultList();
		return listacompetenze;
	}

}
