package it.rt.corso.DAO;

import it.rt.corso.beans.Costo;

public interface CostoDAO {
	
	public Costo inserisci(Costo costo);
	public Costo get(int id);
}
