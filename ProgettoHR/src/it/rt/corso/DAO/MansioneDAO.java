package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Mansione;

public interface MansioneDAO {
	
	/**
	 * Add the given Mansione object to mansione table
	 * 
	 * @param costo given Mansione entity
	 * 
	 * @return the added Mansione entity
	 * */
	public Mansione inserisci(Mansione mansione); 
	
	/**
	 * Get all Mansione entities.
	 * 
	 * @return the Mansione List of objects found
	 * */
	public List<Mansione> getLista(); 
	
	/**
	 * Get a Mansione entity corresponding to the given Mansione id
	 * 
	 * @param id the given id
	 * 
	 * @return the Mansione object found.
	 * */
	public Mansione get(String id);
	
	/**
	 * Get the List of all the Mansione entities referenced to the given Candidato id
	 * 
	 * @param id the given Mansione id
	 * 
	 * @return the Mansione object that has been found
	 * */
	public List<Mansione> getIdByCandidato(int id);
	
	/**
	 * Delete a Mansione entity corresponding to the given Mansione Object
	 * 
	 * @param Mansione the given Mansione object
	 * 
	 * @return the deleted Mansione object
	 * */
	public Mansione cancella(Mansione mansione);
	
	/**
	 * Update a Mansione entity corresponding to the given Mansione name value
	 * 
	 * @param oldMansione the Mansione name that will be searched in order to update it
	 * @param newMansione the new Mansione name that will be assigned in place of the old Mansione value.
	 * 
	 * @return the number of updated Mansione Objects
	 * */
	public int update(String oldMansione, String newMansione);
	
}
