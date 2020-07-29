package it.rt.corso.DAO;

import java.util.List;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Sinonimo;

public interface CandidatoDAO {
	
	public Candidato inserisci(Candidato candidato); //metodo che inserisce il candidato nel db
	public Candidato get(String id);
	public List<Candidato> getLista(); //metodo che prende tutta la lista di candidati da db
	
	
}
