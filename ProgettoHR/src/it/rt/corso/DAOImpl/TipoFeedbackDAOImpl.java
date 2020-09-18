package it.rt.corso.DAOImpl;

import java.util.List;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.TipoFeedbackDAO;
import it.rt.corso.beans.TipoFeedback;
import it.rt.corso.utility.Utility;
@SuppressWarnings("unchecked")
public class TipoFeedbackDAOImpl extends BaseDAO implements TipoFeedbackDAO {

	public TipoFeedback get(String id) {
		return (TipoFeedback) super.get(TipoFeedback.class, id);
	}
	
	public List<TipoFeedback> getLista() {

		
		List<TipoFeedback> listaTipoFeedback = Utility.getSession().createQuery(" FROM TipoFeedback ").getResultList();
		Utility.destroySession();
		return listaTipoFeedback;
	}

}
