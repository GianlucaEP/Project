package it.rt.corso.DAO;

import it.rt.corso.beans.Economics;

public interface EconomicsDAO {
	
	public Economics inserisci(Economics economics);
	public Economics get(int id);
}
