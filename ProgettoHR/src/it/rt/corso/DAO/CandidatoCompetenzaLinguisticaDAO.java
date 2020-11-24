package it.rt.corso.DAO;


import it.rt.corso.beans.CandidatoCompetenzaLinguistica;

public interface CandidatoCompetenzaLinguisticaDAO {
	/**
	 * Add the given CompetenzaLinguistica entity to candidato_competenza_linguistica table
	 * 
	 * @param c given CompetenzaLinguistica entity
	 * 
	 * @return te added CompetenzaLinguistica entity
	 * */
	public CandidatoCompetenzaLinguistica inserisci(CandidatoCompetenzaLinguistica candidatoCompetenzaLinguistica); 
	/**
	 * Update a CandidatoCompetenzaLinguistica entity corresponding to the given CandidatoCompetenzaLinguistica Object.
	 * 
	 * @param c the given CandidatoCompetenzaLinguistica object
	 * 
	 * @return the updated CandidatoCompetenzaLinguistica object
	 * */
	public CandidatoCompetenzaLinguistica aggiorna(CandidatoCompetenzaLinguistica candidatoCompetenzaLinguistica);
	/**
	 * Delete a CandidatoCompetenzaLinguistica entity corresponding to the given CandidatoCompetenzaLinguistica Object.
	 * 
	 * @param c the given CandidatoCompetenzaLinguistica object
	 * 
	 * @return the deleted CandidatoCompetenzaLinguistica object
	 * */
	public CandidatoCompetenzaLinguistica cancella(CandidatoCompetenzaLinguistica candidatoCompetenzaLinguistica);
	/**
	 * Get a CandidatoCompetenzaLinguistica entity corresponding to the given CandidatoCompetenzaLinguistica id.
	 * 
	 * @param c the given id
	 * 
	 * @return the CandidatoCompetenzaLinguistica object that has been found.
	 * */
	public CandidatoCompetenzaLinguistica get(String id);
}
