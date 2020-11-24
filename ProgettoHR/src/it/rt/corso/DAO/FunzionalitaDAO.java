package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Funzionalita;

public interface FunzionalitaDAO {

	/**
	 * Get a Funzionalita entity corresponding to the given Funzionalita id.
	 * 
	 * @param id the given id
	 * 
	 * @return the Funzionalita object that has been found.
	 * */
	public Funzionalita getFunzionalita(int id);
	
	/**
	 * Get all Funzionalita entities.
	 * 
	 * @return the Funzionalita List of objects that has been found.
	 * */
	public List<Funzionalita> getLista();
	
	/**
	 * Update a Funzionalita entity corresponding to the given Funzionalita Object.
	 * 
	 * @param funzionalita the given Feedback object
	 * 
	 * @return the updated Funzionalita object
	 * */
	public Funzionalita aggiorna(Funzionalita funzionalita);
}
