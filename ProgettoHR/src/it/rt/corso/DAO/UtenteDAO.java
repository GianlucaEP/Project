package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Utente;

public interface UtenteDAO {

	/**
	 * Get a Utente entity corresponding to the given Utente id.
	 * 
	 * @param id the given id
	 * 
	 * @return the Utente object that has been found.
	 * */
	public Utente get(int id);
	
	/**
	 * Get all Utente entities.
	 * 
	 * @return the Utente List of objects that has been found.
	 * */
	public List<Utente> getLista();
	
	/**
	 * Get the Utente entity from database corresponding to the given username e password.
	 * 
	 * @param user the given username
	 * @param password the given password
	 * 
	 * @return the found User entity.
	 * */
	public Utente getByUsernamePassword(String user, String password);
	
	/**
	 * Get the Utente entity from database corresponding to the given username.
	 * 
	 * @param user the given username
	 * 
	 * @return the found User entity. 
	 * */
	public Utente getByUsername(String user); 
	
	/**
	 * Add the given Utente entity to utente table.
	 * 
	 * @param file given Utente entity
	 * 
	 * @return the added Utente entity
	 * */
	public Utente inserisci(Utente utente);
}
