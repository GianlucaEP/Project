package it.rt.corso.DAOImpl;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.ColloquioDAO;
import it.rt.corso.beans.Colloquio;

public class ColloquioDAOImpl extends BaseDAO implements ColloquioDAO{

	public Colloquio inserisci(Colloquio colloquio) {
		return (Colloquio) super.inserisci(colloquio);
	}

}
