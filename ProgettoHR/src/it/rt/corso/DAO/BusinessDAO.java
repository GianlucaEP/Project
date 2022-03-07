package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Business;

public interface BusinessDAO {
	
	/**
	 * Add the given Business object to business table.
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
	 * */
	public List<Business> getLista();
	
	/**
	 * Return Business object with the id corresponding to the given id
	 * 
	 * @param id the given id
	 * 
	 * @return the Business object found
	 * */
	public Business get(String id);
	
	
	
	
	
	
	//
	/**
	 * Get the list of all the Business entities referenced to the given Business id
	 * 
	 * @param id the given id
	 * 
	 * @return the Business object that has been found
	 * */
	public List<Business> getIdByCandidato(int id);
	
	/**
	 * Delete a Business entity corresponding to the given Business object
	 * 
	 * @param Business the given Business object
	 * 
	 * @return the deleted Business object
	 * */
	public Business cancella(Business business);
	
	/**
	 * Update a Business entity corresponding to the given Business name value
	 * 
	 * @param oldBusiness the Business name that will be searched in order to update it
	 * @param newBusiness the new Business name that will be assigned in place of the old Business value.
	 * 
	 * @return the number of updated Business Objects
	 * */
	public int update(String oldBusiness, String newBusiness);
	//
	
	
	
	
}
