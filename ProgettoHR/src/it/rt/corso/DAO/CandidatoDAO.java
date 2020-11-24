package it.rt.corso.DAO;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import it.rt.corso.beans.Candidato;

public interface CandidatoDAO {
	/**
	 * Add the given Candidato entity to candidato table
	 * 
	 * @param candidato given Candidato entity
	 * 
	 * @return the added Candidato entity
	 * */
	public Candidato inserisci(Candidato candidato); 
	
	/**
	 * Get a Candidato entity corresponding to the given Candidato id.
	 * 
	 * @param id the given id
	 * 
	 * @return the Candidato object that has been found.
	 * */
	public Candidato get(int id);
	
	/**
	 * Delete a Candidato entity corresponding to the given Candidato Object.
	 * 
	 * @param candidato the given Candidato object
	 * 
	 * @return the deleted Candidato object
	 * */
	public Candidato cancella(Candidato candidato); 
	
	/**
	 * Update a Candidato entity corresponding to the given Candidato Object.
	 * 
	 * @param candidato the given Candidato object
	 * 
	 * @return the updated Candidato object
	 * */
	public Candidato aggiorna(Candidato candidato); 
	
	/**
	 * Get all Candidato entities.
	 * 
	 * 
	 * @return the Candidato List of objects that has been found.
	 * */
	public List<Candidato> getLista();
	
	/**
	 * Get all Candidato entities filtered by the given business unit.
	 * 
	 * @param businessUnit the given businessUnit.
	 * 
	 * @return the Candidato List of objects that has been found.
	 * */
	public List<Candidato> getListaByBusinessUnit(String businessUnit);

	/** Create and execute query to Candidato table, joining Business unit specified by the String businessUnit, to get 
	 * a List of type Candidato using the parameters contained in the Map mappaFilter as where clauses
	 * 
	 * 
	 * @param mappaFilter Map containing the filters names and the value of the filter wich has to be used to create the query
	 * 
	 * @return the List of Candidato, wich has to be printed inside the table, filtered by the user
	 * @throws ParseException 
	 * 
	 * */
	public List<Candidato> getListaByBusinessUnitFiltered(Map<String, String> mappaFilter);
	
	/** Create and execute query to Candidato table, joining Business unit specified by the String businessUnit, to get 
	 * a List of type Candidato filtered by stato specified by the stato attribute.
	 * 
	 * @param businessUnit String that specifies the business unit wich the Candidato is part of
	 * 
	 * @param stato String that specifies the stato which is going to be used in the where clause.
	 * 
	 * @return the List of Candidato, wich has to be printed inside the table, filtered by the selected stato.
	 * 
	 * */
	public List<Candidato> getListaByBusinessUnitFilteredByStato(String businessUnit, String stato);
	
	/** Create and execute query to Candidato table to get 
	 * a List of type Candidato filtered by stato specified by the stato attribute.
	 * 
	 * @param stato String that specifies the stato which is going to be used in the where clause.
	 * 
	 * @return the List of Candidato, wich has to be printed inside the table, filtered by the selected stato.
	 * 
	 * */
	public List<Candidato> getListaFilteredByStato(String stato);
	
	
	
}
