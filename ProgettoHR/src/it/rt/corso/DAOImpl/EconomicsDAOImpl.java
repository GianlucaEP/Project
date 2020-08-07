package it.rt.corso.DAOImpl;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.EconomicsDAO;
import it.rt.corso.beans.Economics;

public class EconomicsDAOImpl extends BaseDAO implements EconomicsDAO {

	@Override
	public Economics inserisci(Economics economics) {
		return (Economics)super.inserisci(economics);
	}

	@Override
	public Economics get(int id) {
		return (Economics)super.get(Economics.class, id);
	}

}
