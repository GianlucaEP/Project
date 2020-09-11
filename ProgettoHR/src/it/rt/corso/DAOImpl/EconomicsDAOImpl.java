package it.rt.corso.DAOImpl;

import java.util.List;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.EconomicsDAO;
import it.rt.corso.beans.Economics;
import it.rt.corso.utility.Utility;
@SuppressWarnings("unchecked")
public class EconomicsDAOImpl extends BaseDAO implements EconomicsDAO {

	@Override
	public Economics inserisci(Economics economics) {
		return (Economics) super.inserisci(economics);
	}

	@Override
	public Economics get(int id) {
		return (Economics) super.get(Economics.class, id);
	}

	@Override
	public Economics aggiorna(Economics economics) {
		return (Economics) super.aggiorna(economics);
	}

	@Override
	public List<Economics> getByIdCandidato(int id) {

		Utility.buildSession();

		List<Economics> listaEconomics = Utility.getSession().createQuery(" FROM Economics WHERE id_candidato=:id")
				.setParameter("id", id).getResultList();

		return listaEconomics;
	}

}
