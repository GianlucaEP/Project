package it.rt.corso.DAOImpl;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.BusinessDAO;
import it.rt.corso.beans.Business;

public class BusinessDAOImpl extends BaseDAO implements BusinessDAO{

	public Business inserisci(Business business) {
		return (Business) super.inserisci(business);
	}

}
