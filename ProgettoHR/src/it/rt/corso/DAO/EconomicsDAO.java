package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Economics;

public interface EconomicsDAO {
	
	public Economics inserisci(Economics economics);
	public Economics get(int id);
	public Economics aggiorna(Economics economics);
	public List<Economics> getByIdCandidato(int id);
}
