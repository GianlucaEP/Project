package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.AreaCompetenza;

public interface AreaCompetenzaDAO {
	
	/**
	 * Insert a new AreaCompetenza object in database.
	 * 
	 * @param area the AreaCompetenza Object that will be added.
	 * 
	 * @return the added AreaCompetenza Object.
	 * */
	public AreaCompetenza inserisci(AreaCompetenza area);

	/**
	 * Get all AreaCompetenza object from area_competenza table
	 * 
	 * @return a list of AreaCompetenza Objects.
	 * 
	 * */
	public List<AreaCompetenza> getLista();
	
	/**
	 * Get AreaCompetenza object from area_competenza table selected by the given id
	 * 
	 * @param the given id
	 * 
	 * @return a list of AreaCompetenza Objects.
	 * 
	 * */
	public AreaCompetenza get(String id);
	
	/**
	 * Get all AreaCompetenza belonging to a Candidato selected by the given id
	 * 
	 * @param id the given id used to search the corresponding Candidato.
	 * 
	 * @return a list of all the AreaCompetenza corresponding to the Candidato ID.
	 * */
	public List<AreaCompetenza> getIdByCandidato(int id);
	
	/**
	 * Delete from database the AreaCompetenza corresponding to the given AreaCompetenza Object.
	 * 
	 * @param area AreaCompetenza object that have to be deleted.
	 * 
	 * @return the deleted AreaCompetenza object.
	 * */
	public AreaCompetenza cancella(AreaCompetenza area);
	
	/**
	 * Update an AreaCompetenza value selected by the old value with the new given value.
	 * 
	 * @param oldArea old AreaCompetenza value that has to be updated.
	 * @param newArea new AreaCompetenza value that will be assigned.
	 * 
	 * @return number of entities updated or deleted.
	 * */
	public int update(String oldArea, String newArea);
	
}
