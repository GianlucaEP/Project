package it.rt.corso.DAOImpl;

import it.rt.corso.DAO.AreaCompetenzaDAO;
import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.beans.AreaCompetenza;

public class AreaCompetenzaDAOImpl extends BaseDAO implements AreaCompetenzaDAO{

	public AreaCompetenza inserisci(AreaCompetenza area) {
		return (AreaCompetenza) super.inserisci(area);
	}

}
