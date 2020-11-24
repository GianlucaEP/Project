package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.StatoCandidato;

public interface StatoCandidatoDAO {
	
	/**
	 * Get a StatoCandidato entity corresponding to the given StatoCandidato id.
	 * 
	 * @param id the given id
	 * 
	 * @return the StatoCandidato object that has been found.
	 * */
	public StatoCandidato get(String id);
	
	/**
	 * Get all StatoCandidato entities.
	 * 
	 * @return the StatoCandidato List of objects that has been found.
	 * */
	public List<StatoCandidato> getAllFromStato();
}
