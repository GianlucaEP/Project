package it.rt.corso.DAOImpl;

import java.util.List;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.CandidatoSpecializzazioneDAO;
import it.rt.corso.beans.CandidatoSpecializzazione;

public class CandidatoSpecializzazioneDAOImpl extends BaseDAO implements CandidatoSpecializzazioneDAO{

	public CandidatoSpecializzazione inserisci(CandidatoSpecializzazione candidatoSpecializzazione) {
		return (CandidatoSpecializzazione)super.inserisci(candidatoSpecializzazione);
	}

	public CandidatoSpecializzazione get(String id) {
		return (CandidatoSpecializzazione)super.get(CandidatoSpecializzazione.class, id);
	}

	public List<CandidatoSpecializzazione> getLista() {
		return null;
	}

}
