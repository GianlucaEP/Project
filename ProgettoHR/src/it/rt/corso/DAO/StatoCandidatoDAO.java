package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.StatoCandidato;

public interface StatoCandidatoDAO {
	
	public StatoCandidato get(String id);
	
	public List<StatoCandidato> getAllFromStato();
}
