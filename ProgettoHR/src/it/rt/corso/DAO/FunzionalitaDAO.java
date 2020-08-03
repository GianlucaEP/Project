package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Funzionalita;

public interface FunzionalitaDAO {

	public Funzionalita getFunzionalita(String id);
	
	public List<Funzionalita> getListaFunzionalita();
}
