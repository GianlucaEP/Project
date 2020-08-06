package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Business;

public interface BusinessDAO {
	
	public Business inserisci(Business business);
	public List<Business> getLista();
	public Business get(String id);
	}
