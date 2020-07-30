package it.rt.corso.DAOImpl;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.StatoCandidatoDAO;
import it.rt.corso.beans.StatoCandidato;

public class StatoCandidatoDAOImpl extends BaseDAO implements StatoCandidatoDAO{

	public StatoCandidato get(String id) {
		return (StatoCandidato) super.get(StatoCandidato.class, id);
	}

}
