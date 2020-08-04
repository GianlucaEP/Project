package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Candidato;

public interface CandidatoDAO {
	
	public Candidato inserisci(Candidato candidato); //metodo che inserisce il candidato nel db
	public Candidato get(int id);
	public Candidato cancella(Candidato candidato); //cancella il candidato dal db
	public Candidato aggiorna(Candidato candidato); //aggiorna il candidato dal db
	public List<Candidato> getLista(); //metodo che prende tutta la lista di candidati da db
	
	
}
