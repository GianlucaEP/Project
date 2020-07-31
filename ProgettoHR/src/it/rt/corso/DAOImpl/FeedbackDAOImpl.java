package it.rt.corso.DAOImpl;

import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

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
		
//		List<Feedback> listaFeedback = Utility.getSession().createQuery(" FROM Feedback F WHERE F.candidato=:id").setParameter("id", id).getResultList();
		
		Criteria cr = Utility.getSession().createCriteria(Feedback.class);
		cr.add(Restrictions.eq("candidato", id));
		List results = cr.list();
		return results;
	}

}
