package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Mansione;

public interface MansioneDAO {
	
	public Mansione inserisci(Mansione mansione); 
	public List<Mansione> getLista(); 
}
