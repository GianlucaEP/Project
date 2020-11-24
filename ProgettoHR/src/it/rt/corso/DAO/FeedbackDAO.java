package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Feedback;

public interface FeedbackDAO {

	/**
	 * Add the given Feedback entity to costo table.
	 * 
	 * @param feedback given Feedback entity
	 * 
	 * @return the added Feedback entity
	 * */
	public Feedback inserisci(Feedback feedback);
	
	/**
	 * Update a Feedback entity corresponding to the given Feedback Object.
	 * 
	 * @param feedback the given Feedback object
	 * 
	 * @return the updated Feedback object
	 * */
	public Feedback aggiorna(Feedback feedback);
	
	/**
	 * Get a Feedback entity corresponding to the given Feedback id.
	 * 
	 * @param id the given id
	 * 
	 * @return the Feedback object that has been found.
	 * */
	public Feedback get(int id);
	
	
	/**
	 * Get the List of all the Feedback entities referenced to the given Candidato id
	 * 
	 * @param id the given Candidato id
	 * 
	 * @return the Feedback object that has been found.
	 * */
	public List<Feedback> getByIdCandidato(int id);
	
	/**
	 * Delete a Feedback entity corresponding to the given Feedback Object.
	 * 
	 * @param feedback the given Feedback object
	 * 
	 * @return the updated Feedback object
	 * */
	public Feedback cancella(Feedback feedback);
}
