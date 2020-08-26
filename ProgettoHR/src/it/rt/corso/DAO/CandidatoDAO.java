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

	List<Candidato> getListaByBusinessUnitFiltered(String businessUnit, Map<String, String> mappaFilter);
	
	
	
}
