package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.CandidatoSpecializzazione;

public interface CandidatoSpecializzazioneDAO {
	/**
	 * Add the given candidatoSpecializzazione entity to candidato_specializzazione table
	 * 
	 * @param candidatoSpecializzazione given candidatoSpecializzazione entity
	 * 
	 * @return the added candidatoSpecializzazione entity
	 * */
	public CandidatoSpecializzazione inserisci(CandidatoSpecializzazione candidatoSpecializzazione); 
	
	/**
	 * Update a CandidatoSpecializzazione entity corresponding to the given CandidatoSpecializzazione Object.
	 * 
	 * @param candidatoSpecializzazione the given CandidatoSpecializzazione object
	 * 
	 * @return the updated CandidatoSpecializzazione object
	 * */
	public CandidatoSpecializzazione aggiorna(CandidatoSpecializzazione candidatoSpecializzazione);
	
	/**
	 * Delete a CandidatoSpecializzazione entity corresponding to the given CandidatoSpecializzazione Object.
	 * 
	 * @param candidatoSpecializzazione the given CandidatoSpecializzazione object
	 * 
	 * @return the deleted CandidatoSpecializzazione object
	 * */
	public CandidatoSpecializzazione cancella(CandidatoSpecializzazione candidatoSpecializzazione);
	
	/**
	 * Get a CandidatoSpecializzazione entity corresponding to the given CandidatoSpecializzazione id.
	 * 
	 * @param id the given id
	 * 
	 * @return the candidatoSpecializzazione object that has been found.
	 * */
	public CandidatoSpecializzazione get(String id);
	
	/**
	 * Get all CandidatoSpecializzazione entities.
	 * 
	 * @return the CandidatoSpecializzazione List of objects that has been found.
	 * */
	public List<CandidatoSpecializzazione> getLista();
}
