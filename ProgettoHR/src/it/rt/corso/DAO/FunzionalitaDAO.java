package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Funzionalita;

public interface FunzionalitaDAO {

	public Funzionalita getFunzionalita(int id);
	public List<Funzionalita> getLista();
	public Funzionalita aggiorna(Funzionalita funzionalita);
}
