package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Seniority;

public interface SeniorityDAO {
	
	public Seniority inserisci(Seniority seniority);
	public List<Seniority> getLista();
	public Seniority get(String id);
}
