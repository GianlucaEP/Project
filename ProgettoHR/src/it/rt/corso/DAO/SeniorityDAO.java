package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Seniority;

public interface SeniorityDAO {
	/**
	 * Add the given Seniority entity to seniority table.
	 * 
	 * @param seniority the given Seniority entity
	 * 
	 * @return the added Seniority entity
	 * */
	public Seniority inserisci(Seniority seniority);
	
	/**
	 * Get all Seniority entities.
	 * 
	 * @return the Seniority List of objects that has been found.
	 * */
	public List<Seniority> getLista();
	
	/**
	 * Get a Seniority entity corresponding to the given Seniority id.
	 * 
	 * @param id the given id
	 * 
	 * @return the Seniority object that has been found.
	 * */
	public Seniority get(String id);
}
