package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.CompetenzaLinguistica;



public interface CompetenzaLinguisticaDAO {
	/**
	 * Add the given CompetenzaLinguistica entity to competenza_linguistica table.
	 * 
	 * @param candidatoSpecializzazione given Candidato entity
	 * 
	 * @return the added Candidato entity
	 * */
	public CompetenzaLinguistica inserisci(CompetenzaLinguistica competenzaLinguistica);
	
	/**
	 * Delete a CompetenzaLinguistica entity corresponding to the given CompetenzaLinguistica Object.
	 * 
	 * @param competenzaLinguistica the given CompetenzaLinguistica object
	 * 
	 * @return the deleted CompetenzaLinguistica object
	 * */
	public CompetenzaLinguistica cancella(CompetenzaLinguistica competenzaLinguistica);
	
	/**
	 * Update a CompetenzaLinguistica entity corresponding to the given CompetenzaLinguistica Object.
	 * 
	 * @param competenzaLinguistica the given CompetenzaLinguistica object
	 * 
	 * @return the updated CompetenzaLinguistica object
	 * */
	public CompetenzaLinguistica aggiorna(CompetenzaLinguistica competenzaLinguistica);
	
	/**
	 * Get a CompetenzaLinguistica entity corresponding to the given CompetenzaLinguistica id.
	 * 
	 * @param id the given id
	 * 
	 * @return the CompetenzaLinguistica object that has been found.
	 * */
	public CompetenzaLinguistica get(int id);
	
	/**
	 * Get a CompetenzaLinguistica entity corresponding to the given CompetenzaLinguistica name.
	 * 
	 * @param name the given name
	 * 
	 * @return the CompetenzaLinguistica object that has been found.
	 * */
	public CompetenzaLinguistica getByName(String name);
	
	/**
	 * Get all CompetenzaLinguistica entities.
	 * 
	 * @return the CompetenzaLinguistica List of objects that has been found.
	 * */
	public List<CompetenzaLinguistica> getLista();
	
	
}
