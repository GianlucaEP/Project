package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Specializzazione;

public interface SpecializzazioneDAO {
	
	public Specializzazione inserisci(Specializzazione specializzazione);
	public Specializzazione get(String id); 
	public List<Specializzazione> getLista();
	public Specializzazione cancella(Specializzazione specializzazione);
	public int updade(String oldSpecializzazione, String newSpecializzazione);
	
}
