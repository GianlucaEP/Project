package it.rt.corso.DAOImpl;

import java.util.List;
import java.util.Set;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.FeedbackDAO;
import it.rt.corso.beans.Feedback;
import it.rt.corso.beans.Mansione;
import it.rt.corso.utility.Utility;

public class FeedbackDAOImpl extends BaseDAO implements FeedbackDAO{

	public Feedback inserisci(Feedback feedback) {
		return (Feedback) super.inserisci(feedback);
	}


	@Override
	public List<Feedback> getByIdCandidato(int id) {
		Utility.buildSession();
		
		List<Feedback> listaFeedback = Utility.getSession().createQuery(" FROM Feedback F WHERE F.candidato=:id").getResultList();
		return listaFeedback;
	}

}
