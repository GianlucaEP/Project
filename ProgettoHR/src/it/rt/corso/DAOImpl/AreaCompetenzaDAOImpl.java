package it.rt.corso.DAOImpl;

import java.util.List;

import it.rt.corso.DAO.AreaCompetenzaDAO;
import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.beans.AreaCompetenza;
import it.rt.corso.utility.Utility;
@SuppressWarnings("unchecked")
public class AreaCompetenzaDAOImpl extends BaseDAO implements AreaCompetenzaDAO{

	public AreaCompetenza inserisci(AreaCompetenza area) {
		return (AreaCompetenza) super.inserisci(area);
	}

	public List<AreaCompetenza> getLista() {

		
		
		List<AreaCompetenza> listaArea= Utility.getSession().createQuery("FROM AreaCompetenza").getResultList();
		Utility.destroySession();
		return listaArea;
	}

	public AreaCompetenza get(String id) {
		return (AreaCompetenza) super.get(AreaCompetenza.class, id); 
	}

	@Override
	public List<AreaCompetenza> getIdByCandidato(int id) {
		
		

		List<AreaCompetenza> listaAreaCompetenza = Utility.getSession().createQuery("SELECT a FROM AreaCompetenza a JOIN a.candidato c WHERE c.id = :id")
				.setParameter("id", id).getResultList();
		Utility.destroySession();
		return listaAreaCompetenza;
	}

	@Override
	public AreaCompetenza cancella(AreaCompetenza area) {
		return (AreaCompetenza) super.cancella(area);
	}
	
}
