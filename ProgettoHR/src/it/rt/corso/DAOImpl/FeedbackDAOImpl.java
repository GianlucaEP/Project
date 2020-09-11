package it.rt.corso.DAOImpl;

import java.util.List;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.FeedbackDAO;
import it.rt.corso.beans.Feedback;
import it.rt.corso.utility.Utility;
@SuppressWarnings("unchecked")
public class FeedbackDAOImpl extends BaseDAO implements FeedbackDAO {

	public Feedback inserisci(Feedback feedback) {
		return (Feedback) super.inserisci(feedback);
	}
	
	@Override
	public Feedback get(int id) {
		return (Feedback) super.get(Feedback.class, id);
	}
	
	@Override
	public Feedback aggiorna(Feedback feedback) {
		return (Feedback) super.aggiorna(feedback);
	}

	public List<Feedback> getByIdCandidato(int id) {

		Utility.buildSession();

		List<Feedback> listaFeedback = Utility.getSession().createQuery(" FROM Feedback WHERE id_candidato=:id")
				.setParameter("id", id).getResultList();

//		Criteria cr = Utility.getSession().createCriteria(Feedback.class);
//		cr.add(Restrictions.eq("candidato", id));
//		List results = cr.list();
		return listaFeedback;
	}

}
