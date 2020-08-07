package it.rt.corso.DAOImpl;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.CostoDAO;
import it.rt.corso.beans.Costo;

public class CostoDAOImpl extends BaseDAO implements CostoDAO{

	@Override
	public Costo inserisci(Costo costo) {
		return (Costo) super.inserisci(costo);
	}

	@Override
	public Costo get(int id) {
		return (Costo) super.get(Costo.class, id);
	}

}
