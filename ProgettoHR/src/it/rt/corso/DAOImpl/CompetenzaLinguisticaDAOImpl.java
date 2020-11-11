package it.rt.corso.DAOImpl;

import java.util.List;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.CompetenzaLinguisticaDAO;
import it.rt.corso.beans.CompetenzaLinguistica;
import it.rt.corso.utility.Utility;

public class CompetenzaLinguisticaDAOImpl extends BaseDAO implements CompetenzaLinguisticaDAO {

	@Override
	public CompetenzaLinguistica inserisci(CompetenzaLinguistica competenzaLinguistica) {
		return (CompetenzaLinguistica) super.inserisci(competenzaLinguistica) ;
	}

	@Override
	public CompetenzaLinguistica cancella(CompetenzaLinguistica competenzaLinguistica) {
		return (CompetenzaLinguistica) super.cancella(competenzaLinguistica);
	}
	
	@Override
	public CompetenzaLinguistica aggiorna(CompetenzaLinguistica competenzaLinguistica) {
		return (CompetenzaLinguistica) super.aggiorna(competenzaLinguistica);
	}
	
	@Override
	public CompetenzaLinguistica get(int id) {
		return (CompetenzaLinguistica) super.get(CompetenzaLinguistica.class, id);
	}
	
	public List<CompetenzaLinguistica> getLista() {

		

		List<CompetenzaLinguistica> listaCompetenzaLinguistica = Utility.getSession().createQuery(" FROM CompetenzaLinguistica ").getResultList();
		Utility.destroySession();
		return listaCompetenzaLinguistica;
	}
	
	@Override
	public CompetenzaLinguistica getByName(String name) {
		List<CompetenzaLinguistica> competenzaLinguistica = Utility.getSession().createQuery(" FROM CompetenzaLinguistica C WHERE C.lingua=:name")
				.setParameter("name", name).getResultList();
		Utility.destroySession();
		if(competenzaLinguistica.isEmpty()) {
			return null;
		}
		return competenzaLinguistica.get(0);
	}



}
