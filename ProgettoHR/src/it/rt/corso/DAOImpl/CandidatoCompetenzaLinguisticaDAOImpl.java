package it.rt.corso.DAOImpl;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.CandidatoCompetenzaLinguisticaDAO;
import it.rt.corso.beans.CandidatoCompetenzaLinguistica;

public class CandidatoCompetenzaLinguisticaDAOImpl extends BaseDAO implements CandidatoCompetenzaLinguisticaDAO {

	public CandidatoCompetenzaLinguistica inserisci(CandidatoCompetenzaLinguistica c) {
		return (CandidatoCompetenzaLinguistica) super.inserisci(c);
	}

	
	public CandidatoCompetenzaLinguistica aggiorna(CandidatoCompetenzaLinguistica c) {
		return (CandidatoCompetenzaLinguistica) super.aggiorna(c);
	}

	
	public CandidatoCompetenzaLinguistica cancella(CandidatoCompetenzaLinguistica c) {
		return (CandidatoCompetenzaLinguistica) super.cancella(c);
	}


	public CandidatoCompetenzaLinguistica get(String id) {
		return (CandidatoCompetenzaLinguistica) super.get(CandidatoCompetenzaLinguistica.class, id);
	}

}
