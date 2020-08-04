package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Ruolo;

public interface RuoloDAO {

	public Ruolo getRuolo(String id);
	public List<Ruolo> getLista();
}
