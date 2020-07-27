package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Sinonimo;

public interface CompetenzaDAO {
	
	public Sinonimo inserisci(Sinonimo competenza); //metodo che inserisce una competenza nel db
	public List<Sinonimo> getLista(); //metodo che prende tutta la lista di competenze dal db
	
}
