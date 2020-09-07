package it.rt.corso.DAOImpl;

import java.util.List;


import it.rt.corso.DAO.AreaCompetenzaDAO;
import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.beans.AreaCompetenza;
import it.rt.corso.utility.Utility;

public class AreaCompetenzaDAOImpl extends BaseDAO implements AreaCompetenzaDAO{

	public AreaCompetenza inserisci(AreaCompetenza area) {
		return (AreaCompetenza) super.inserisci(area);
	}

	public List<AreaCompetenza> getLista() {

		Utility.buildSession();
		List<AreaCompetenza> listaArea= Utility.getSession().createQuery("FROM AreaCompetenza").getResultList();
		
		return listaArea;
	}

	public AreaCompetenza get(String id) {
		return (AreaCompetenza) super.get(AreaCompetenza.class, id); 
	}

	@Override
	public List<AreaCompetenza> getIdByCandidato(int id) {
		
		Utility.buildSession();

		List<AreaCompetenza> listaAreaCompetenza = Utility.getSession().createQuery("SELECT a FROM AreaCompetenza a JOIN a.candidato c WHERE c.id = :id")
				.setParameter("id", id).getResultList();

		return listaAreaCompetenza;
	}
	
}
