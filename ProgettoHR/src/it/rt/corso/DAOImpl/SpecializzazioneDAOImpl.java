package it.rt.corso.DAOImpl;

import java.util.List;
import org.hibernate.query.Query;
import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.SpecializzazioneDAO;
import it.rt.corso.beans.Specializzazione;
import it.rt.corso.utility.Utility;

public class SpecializzazioneDAOImpl extends BaseDAO implements SpecializzazioneDAO {

	public Specializzazione inserisci(Specializzazione specializzazione) {
		return (Specializzazione) super.inserisci(specializzazione);
	}
	
	public Specializzazione get(String id) {
		return (Specializzazione) super.get(Specializzazione.class, id);
	}
	
	public List<Specializzazione> getSinonimoBySinonimo(String input) {
		
		Utility.buildSession();
		
		Query q = Utility.getSession().createQuery(" FROM Specializzazione WHERE specializzazione = :input ");
		q.setParameter("input", input);
		List<Specializzazione> specializzazione = q.getResultList();
		
		return specializzazione;
	}

	public List<Specializzazione> getLista() {
		
		Utility.buildSession();

		List<Specializzazione> listasinonimi = Utility.getSession().createQuery(" FROM Sinonimo ").getResultList();
		return listasinonimi;
	}
	
}
