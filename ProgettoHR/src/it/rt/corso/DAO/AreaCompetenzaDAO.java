package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.AreaCompetenza;

public interface AreaCompetenzaDAO {
	
	public AreaCompetenza inserisci(AreaCompetenza area);
	public List<AreaCompetenza> getLista();
}
