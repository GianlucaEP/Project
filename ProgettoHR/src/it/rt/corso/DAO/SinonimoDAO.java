package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Sinonimo;

public interface SinonimoDAO {
	
	public Sinonimo inserisci(Sinonimo sinonimo); //metodo che inserisce una competenza nel db
	public Sinonimo get(String id); //metodo che prende l'id del sinonimo dal db
	public List<Sinonimo> getSinonimoBySinonimo(String input); //metodo che serve a EqualdsDB per controllare ogni singolo sinonimo dal db
	public List<Sinonimo> getLista(); //metodo che prende tutta la lista di sinonimi dal db
	
}
