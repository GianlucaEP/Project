package it.rt.corso.DAO;

import java.util.List;
import java.util.Map;

import it.rt.corso.beans.Business;
import it.rt.corso.beans.Candidato;

public interface CandidatoDAO {
	
	public Candidato inserisci(Candidato candidato); 
	public Candidato get(int id);
	public Candidato cancella(Candidato candidato); 
	public Candidato aggiorna(Candidato candidato); 
	public List<Candidato> getLista();
	public List<Candidato> getListaByBusinessUnit(String businessUnit);

	/** Create and execute query to Candidato table, joining Business unit specified by the String businessUnit, to get 
	 * a List of type Candidato using the parameters contained in the Map mappaFilter as where clauses
	 * 
	 * @param businessUnit String that specifies the business unit wich the Candidato is part of
	 * 
	 * @param mappaFilter Map containing the filters names and the value of the filter wich has to be used to create the query
	 * 
	 * @return the List of Candidato, wich has to be printed inside the table, filtered by the user
	 * 
	 * */
	public List<Candidato> getListaByBusinessUnitFiltered(String businessUnit, Map<String, String> mappaFilter);
	
	
	
}
