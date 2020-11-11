package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.CandidatoCompetenzaLinguistica;

public interface CandidatoCompetenzaLinguisticaDAO {

	public CandidatoCompetenzaLinguistica inserisci(CandidatoCompetenzaLinguistica candidatoCompetenzaLinguistica); 
	public CandidatoCompetenzaLinguistica aggiorna(CandidatoCompetenzaLinguistica candidatoCompetenzaLinguistica);
	public CandidatoCompetenzaLinguistica cancella(CandidatoCompetenzaLinguistica candidatoCompetenzaLinguistica);
	public CandidatoCompetenzaLinguistica get(String id);
	public List<CandidatoCompetenzaLinguistica> getLista();
}
