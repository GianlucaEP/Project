package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.TipoFeedback;

public interface TipoFeedbackDAO {
	/**
	 * Get a TipoFeedback entity corresponding to the given TipoFeedback id.
	 * 
	 * @param id the given id
	 * 
	 * @return the TipoFeedback object that has been found.
	 * */
	public TipoFeedback get(String id);
	
	/**
	 * Get all TipoFeedback entities.
	 * 
	 * @return the TipoFeedback List of objects that has been found.
	 * */
	public List<TipoFeedback> getLista();
}
