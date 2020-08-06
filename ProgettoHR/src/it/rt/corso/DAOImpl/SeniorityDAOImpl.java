package it.rt.corso.DAOImpl;

import java.util.List;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.SeniorityDAO;
import it.rt.corso.beans.Seniority;
import it.rt.corso.utility.Utility;

public class SeniorityDAOImpl extends BaseDAO implements SeniorityDAO {

	public Seniority inserisci(Seniority seniority) {
		return (Seniority) super.inserisci(seniority);
	}

	public List<Seniority> getLista() {
		
		Utility.buildSession();
		List<Seniority> listaSeniority= Utility.getSession().createQuery("FROM Seniority").getResultList();
		
		return listaSeniority;
	}

	public Seniority get(String id) {
		return (Seniority) super.get(Seniority.class, id);
	}

}
