package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Business;

public interface BusinessDAO {
	/**
	 * Add the given Business object to database.
	 * 
	 * @param business object that will be added to database.
	 * 
	 * @return the added Business object.
	 * */
	public Business inserisci(Business business);
	/**
	 * Return all the Business entity that are saved in database.
	 * 
	 * @return all the Business object found
	 * 
	 * */
	public List<Business> getLista();
	/**
	 * Return Business object with the id corrisponding to the given id.
	 * 
	 * @param id the given id.
	 * 
	 * @return the Business object found.
	 * 
	 * */
	public Business get(String id);
	
	//
	//
	
	public List<Business> getIdByCandidato(int id);
	
	public Business cancella(Business business);
	
	public int update(String oldBusiness, String newBusiness);
	
	//
	//
}
