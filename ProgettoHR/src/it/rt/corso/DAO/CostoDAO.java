package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Costo;

public interface CostoDAO {
	
	/**
	 * Add the given Costo entity to costo table.
	 * 
	 * @param costo given Costo entity
	 * 
	 * @return the added Costo entity
	 * */
	public Costo inserisci(Costo costo);
	
	/**
	 * Get a Costo entity corresponding to the given Costo id.
	 * 
	 * @param id the given id
	 * 
	 * @return the Costo object that has been found.
	 * */
	public Costo get(int id);
	
	/**
	 * Update a Costo entity corresponding to the given Costo Object.
	 * 
	 * @param costo the given Costo object
	 * 
	 * @return the updated Costo object
	 * */
	public Costo aggiorna(Costo costo); 
	
	/**
	 * Get the List of all the Costo entities referenced to the given Candidato id
	 * 
	 * @param id the given Candidato id
	 * 
	 * @return the Costo object that has been found.
	 * */
	public List<Costo> getByIdCandidato(int id);
}
