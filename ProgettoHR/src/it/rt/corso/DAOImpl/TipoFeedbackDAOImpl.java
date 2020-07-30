package it.rt.corso.DAOImpl;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.TipoFeedbackDAO;
import it.rt.corso.beans.TipoFeedback;

public class TipoFeedbackDAOImpl extends BaseDAO implements TipoFeedbackDAO {

	public TipoFeedback get(String id) {
		return (TipoFeedback) super.get(TipoFeedback.class, id);
	}

}
