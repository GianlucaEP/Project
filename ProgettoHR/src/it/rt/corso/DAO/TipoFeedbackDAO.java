package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.TipoFeedback;

public interface TipoFeedbackDAO {
	
	public TipoFeedback get(String id);
	public List<TipoFeedback> getLista();
}
