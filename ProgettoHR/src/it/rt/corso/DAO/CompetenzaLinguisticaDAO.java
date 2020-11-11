package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.CompetenzaLinguistica;



public interface CompetenzaLinguisticaDAO {

	public CompetenzaLinguistica inserisci(CompetenzaLinguistica competenzaLinguistica);
	public CompetenzaLinguistica cancella(CompetenzaLinguistica competenzaLinguistica);
	public CompetenzaLinguistica aggiorna(CompetenzaLinguistica competenzaLinguistica);
	public CompetenzaLinguistica get(int id);
	public CompetenzaLinguistica getByName(String name);
	public List<CompetenzaLinguistica> getLista();
	
	
}
