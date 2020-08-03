package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Utente;

public interface UtenteDAO {

	public Utente get(String id);
	
	public List<Utente> getListaUtente();
	
	public Utente getByUsernamePassword(String user, String password);
	
}
