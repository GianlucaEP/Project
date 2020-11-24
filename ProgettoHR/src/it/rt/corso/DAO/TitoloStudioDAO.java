package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.TitoloStudio;

public interface TitoloStudioDAO {

	/**
	 * Add the given TitoloStudio entity to titolo_studio table.
	 * 
	 * @param costo given TitoloStudio entity
	 * 
	 * @return the added TitoloStudio entity
	 * */
	public TitoloStudio inserisci(TitoloStudio titoloStudio);
	
	/**
	 * Delete a TitoloStudio entity corresponding to the given TitoloStudio Object.
	 * 
	 * @param titoloStudio the given TitoloStudio object
	 * 
	 * @return the deleted TitoloStudio object
	 * */
	public TitoloStudio cancella(TitoloStudio titoloStudio);
	
	/**
	 * Get a TitoloStudio entity corresponding to the given TitoloStudio id.
	 * 
	 * @param id the given id
	 * 
	 * @return the TitoloStudio object that has been found.
	 * */
	public TitoloStudio get(int id);
	
	/**
	 * Get a TitoloStudio entity corresponding to the given TitoloStudio name.
	 * 
	 * @param name the given name
	 * 
	 * @return the TitoloStudio object that has been found.
	 * */
	public TitoloStudio getByName(String name);
	
	/**
	 * Update a TitoloStudio entity corresponding to the given TitoloStudio Object.
	 * 
	 * @param titoloStudio the given TitoloStudio object
	 * 
	 * @return the updated TitoloStudio object
	 * */
	public TitoloStudio aggiorna(TitoloStudio titoloStudio);
	
	/**
	 * Get all TitoloStudio entities.
	 * 
	 * @return the TitoloStudio List of objects that has been found.
	 * */
	public List<TitoloStudio> getLista();
}
