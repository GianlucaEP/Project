package it.rt.corso.DAO;

import java.util.List;
import it.rt.corso.beans.Candidato;

public interface CandidatoDAO {
	
	public Candidato inserisci(Candidato candidato); //metodo che inserisce il candidato nel db
	public List<Candidato> getLista(); //metodo che prende tutta la lista di candidati da db
	public List<Candidato> getListaHome(); //metodo che prende cognome,nome,mansione e seniority dal db
	
}
