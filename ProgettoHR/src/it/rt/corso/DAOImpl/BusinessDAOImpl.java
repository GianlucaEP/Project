package it.rt.corso.DAOImpl;

import java.util.List;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.BusinessDAO;
import it.rt.corso.beans.AreaCompetenza;
import it.rt.corso.beans.Business;
import it.rt.corso.utility.Utility;

public class BusinessDAOImpl extends BaseDAO implements BusinessDAO{

	public Business inserisci(Business business) {
		return (Business) super.inserisci(business);
	}

	public List<Business> getLista() {
		
		Utility.buildSession();
		List<Business> listabusiness= Utility.getSession().createQuery("FROM Business").getResultList();
		
		return listabusiness;
	}

	public Business get(String id) {
		return (Business)super.get(Business.class, id);
	}

	

}
