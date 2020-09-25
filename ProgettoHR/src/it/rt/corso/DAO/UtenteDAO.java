package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Utente;

public interface UtenteDAO {

	public Utente get(int id);
	public List<Utente> getLista();
	public Utente getByUsernamePassword(String user, String password);
	public Utente getByUsername(String user); 
	public Utente inserisci(Utente utente);
}
