package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Economics;

public interface EconomicsDAO {
	/**
	 * Add the given Economics entity to economics table.
	 * 
	 * @param economics given Economics entity
	 * 
	 * @return the added Economics entity
	 * */
	public Economics inserisci(Economics economics);
	
	/**
	 * Get a Economics entity corresponding to the given Economics id.
	 * 
	 * @param id the given id
	 * 
	 * @return the Economics object that has been found.
	 * */
	public Economics get(int id);
	
	/**
	 * Update a Economics entity corresponding to the given Economics Object.
	 * 
	 * @param economics the given Economics object
	 * 
	 * @return the updated Economics object
	 * */
	public Economics aggiorna(Economics economics);
	
	/**
	 * Get the List of all the Economics entities referenced to the given Candidato id
	 * 
	 * @param id the given Candidato id
	 * 
	 * @return the Economics object that has been found.
	 * */
	public List<Economics> getByIdCandidato(int id);
}
