package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Costo;

public interface CostoDAO {
	
	public Costo inserisci(Costo costo);
	public Costo get(int id);
	public Costo aggiorna(Costo costo); 
	public List<Costo> getByIdCandidato(int id);
}
