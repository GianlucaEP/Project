package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Competenza;

public interface CompetenzeDAO {
	
	public Competenza inserisci(Competenza competenza); //metodo che inserisce una nuova competenza base nel db
	public List<Competenza> getLista(); //metodo che prende tutta la lista di competenze base dal db
}
