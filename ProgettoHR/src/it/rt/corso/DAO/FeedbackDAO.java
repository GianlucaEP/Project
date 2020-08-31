package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.Feedback;

public interface FeedbackDAO {

	public Feedback inserisci(Feedback feedback);
	
	public Feedback aggiorna(Feedback feedback);

	public Feedback get(int id);

	public List<Feedback> getByIdCandidato(int id);
}
