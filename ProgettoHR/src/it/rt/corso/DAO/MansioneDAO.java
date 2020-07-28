package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Mansione;

public interface MansioneDAO {
	
	public Mansione inserisci(Mansione mansione); //metodo che inserisce una nuova competenza base nel db
	public List<Mansione> getLista(); //metodo che prende tutta la lista di competenze base dal db
}
