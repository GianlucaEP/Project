package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.CandidatoSpecializzazione;

public interface CandidatoSpecializzazioneDAO {

	public CandidatoSpecializzazione inserisci(CandidatoSpecializzazione candidatoSpecializzazione); 
	public CandidatoSpecializzazione aggiorna(CandidatoSpecializzazione candidatoSpecializzazione);
	public CandidatoSpecializzazione cancella(CandidatoSpecializzazione candidatoSpecializzazione);
	public CandidatoSpecializzazione get(String id);
	public List<CandidatoSpecializzazione> getLista();
}
