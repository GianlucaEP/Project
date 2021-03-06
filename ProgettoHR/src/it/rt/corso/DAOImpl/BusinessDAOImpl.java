package it.rt.corso.DAOImpl;

import java.util.List;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.BusinessDAO;
import it.rt.corso.beans.Business;
import it.rt.corso.utility.Utility;
@SuppressWarnings("unchecked")
public class BusinessDAOImpl extends BaseDAO implements BusinessDAO{


	public Business inserisci(Business business) {
		return (Business) super.inserisci(business);
	}

	
	public List<Business> getLista() {
		
		
		List<Business> listabusiness= Utility.getSession().createQuery("FROM Business").getResultList();
		Utility.destroySession();
		return listabusiness;
	}


	public Business get(String id) {
		return (Business)super.get(Business.class, id);
	}

	

}
