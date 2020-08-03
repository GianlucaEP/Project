package it.rt.corso.DAOImpl;

import java.util.List;

import javax.persistence.Query;

import it.rt.corso.DAO.BaseDAO;

import it.rt.corso.DAO.UtenteDAO;
import it.rt.corso.beans.Utente;
import it.rt.corso.utility.Utility;

public class UtenteDAOImpl extends BaseDAO implements UtenteDAO {

	@Override
	public Utente get(String id) {

		return (Utente) super.get(Utente.class, id);
	}

	@Override
	public List<Utente> getListaUtente() {
		Utility.buildSession();
		List<Utente> listaUtente = Utility.getSession().createQuery("FROM Utente ").getResultList();
		return listaUtente;
	}


	@Override
	public Utente getByUsernamePassword(String user, String password) {
		Utility.buildSession();
		String hql = "SELECT FROM Utente U WHERE U.username=:user AND U.password=:password";

		Query query = Utility.getSession().createQuery(hql);
		query.setParameter("user", user);
		query.setParameter("password", password);

		Utente utente = (Utente) query.getResultList().get(0);
		return utente;

	}

}
