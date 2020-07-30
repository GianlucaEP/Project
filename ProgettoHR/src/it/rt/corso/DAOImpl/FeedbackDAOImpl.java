package it.rt.corso.DAOImpl;

import java.util.List;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.FeedbackDAO;
import it.rt.corso.beans.Feedback;

public class FeedbackDAOImpl extends BaseDAO implements FeedbackDAO{

	public Feedback inserisci(Feedback feedback) {
		return (Feedback) super.inserisci(feedback);
	}

	public List<Feedback> getLista() {
		return null;
	}

}
