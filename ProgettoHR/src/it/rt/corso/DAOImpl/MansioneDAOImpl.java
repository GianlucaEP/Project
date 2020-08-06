package it.rt.corso.DAOImpl;

import java.util.List;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.MansioneDAO;
import it.rt.corso.beans.Mansione;
import it.rt.corso.utility.Utility;

public class MansioneDAOImpl extends BaseDAO implements MansioneDAO{

	public Mansione inserisci(Mansione mansione) {
		return (Mansione) super.inserisci(mansione);
	}

	public List<Mansione> getLista() {
		
		Utility.buildSession();
		
		List<Mansione> listaMansione = Utility.getSession().createQuery(" FROM Mansione ").getResultList();
		return listaMansione;
	}

	public Mansione get(String id) {
		return (Mansione)super.get(Mansione.class, id);
	}

}
