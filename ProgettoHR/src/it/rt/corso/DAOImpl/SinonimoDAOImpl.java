package it.rt.corso.DAOImpl;

import java.util.List;
import org.hibernate.query.Query;
import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.SinonimoDAO;
import it.rt.corso.beans.Sinonimo;
import it.rt.corso.utility.Utility;

public class SinonimoDAOImpl extends BaseDAO implements SinonimoDAO {

	public Sinonimo inserisci(Sinonimo sinonimo) {
		return (Sinonimo) super.inserisci(sinonimo);
	}
	
	public Sinonimo get(String id) {
		return (Sinonimo) super.get(Sinonimo.class, id);
	}
	
	public List<Sinonimo> getSinonimoBySinonimo(String input) {
		
		Utility.buildSession();
		
		Query q = Utility.getSession().createQuery(" FROM Sinonimo WHERE sinonimo = :input ");
		q.setParameter("input", input);
		List<Sinonimo> sinonimo = q.getResultList();
		
		return sinonimo;
	}

	public List<Sinonimo> getLista() {
		
		Utility.buildSession();

		List<Sinonimo> listasinonimi = Utility.getSession().createQuery(" FROM Sinonimo ").getResultList();
		return listasinonimi;
	}
	
}
