package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Mansione;

public interface MansioneDAO {
	
	public Mansione inserisci(Mansione mansione); 
	public List<Mansione> getLista(); 
	public Mansione get(String id);
	public List<Mansione> getIdByCandidato(int id);
	public Mansione cancella(Mansione mansione);
	public Mansione aggiorna(Mansione mansione);
}
