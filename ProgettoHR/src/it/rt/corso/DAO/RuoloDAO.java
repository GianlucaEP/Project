package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Ruolo;

public interface RuoloDAO {
	/**
	 * Get a Ruolo entity corresponding to the given Ruolo id.
	 * 
	 * @param id the given id
	 * 
	 * @return the Ruolo object that has been found.
	 * */
	public Ruolo getRuolo(int id);
	
	/**
	 * Get all Ruolo entities.
	 * 
	 * @return the Ruolo List of objects that has been found.
	 * */
	public List<Ruolo> getLista();
}
