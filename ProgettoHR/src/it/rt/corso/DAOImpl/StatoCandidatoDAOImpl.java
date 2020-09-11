package it.rt.corso.DAOImpl;

import java.util.List;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.StatoCandidatoDAO;
import it.rt.corso.beans.StatoCandidato;
import it.rt.corso.utility.Utility;
@SuppressWarnings("unchecked")
public class StatoCandidatoDAOImpl extends BaseDAO implements StatoCandidatoDAO{

	public StatoCandidato get(String id) {
		return (StatoCandidato) super.get(StatoCandidato.class, id);
	}

	@Override
	public List<StatoCandidato> getAllFromStato() {
		Utility.buildSession();
		List<StatoCandidato> listaCandidato= Utility.getSession().createQuery("FROM StatoCandidato").getResultList();
		
		return listaCandidato;
	}




}
