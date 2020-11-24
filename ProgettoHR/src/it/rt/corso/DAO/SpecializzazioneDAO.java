package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Specializzazione;

public interface SpecializzazioneDAO {
	/**
	 * Add the given Specializzazione entity to specializzazione table
	 * 
	 * @param specializzazione given Specializzazione entity
	 * 
	 * @return the added Specializzazione entity
	 * */
	public Specializzazione inserisci(Specializzazione specializzazione);
	
	/**
	 * Get a Specializzazione entity corresponding to the given Specializzazione id.
	 * 
	 * @param id the given id
	 * 
	 * @return the Specializzazione object that has been found.
	 * */
	public Specializzazione get(String id); 
	
	/**
	 * Get all Specializzazione entities.
	 * 
	 * 
	 * @return the Specializzazione List of objects that has been found.
	 * */
	public List<Specializzazione> getLista();
	
	/**
	 * Delete a Specializzazione entity corresponding to the given Specializzazione Object.
	 * 
	 * @param specializzazione the given Specializzazione object
	 * 
	 * @return the deleted Specializzazione object
	 * */
	public Specializzazione cancella(Specializzazione specializzazione);
	
	/**
	 * Update a Specializzazione entity corresponding to the given Specializzazione name value.
	 * 
	 * @param oldSpecializzazione the Specializzazione name that will be searched in order to update it
	 * @param newSpecializzazione the new Specializzazione name that will be assigned in place of the old Specializzazione value.
	 * 
	 * @return the number of updated Specializzazione Objects
	 * */
	public int updade(String oldSpecializzazione, String newSpecializzazione);
	
}
