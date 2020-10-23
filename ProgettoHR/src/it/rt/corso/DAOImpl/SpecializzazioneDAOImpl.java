package it.rt.corso.DAOImpl;

import java.util.List;

import org.hibernate.Transaction;
import org.hibernate.query.Query;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.SpecializzazioneDAO;
import it.rt.corso.beans.Specializzazione;
import it.rt.corso.utility.Utility;
@SuppressWarnings("unchecked")
public class SpecializzazioneDAOImpl extends BaseDAO implements SpecializzazioneDAO {

	public Specializzazione inserisci(Specializzazione specializzazione) {
		return (Specializzazione) super.inserisci(specializzazione);
	}

	public Specializzazione get(String id) {
		return (Specializzazione) super.get(Specializzazione.class, id);
	}

	public List<Specializzazione> getLista() {

	

		List<Specializzazione> listaSpecilazzazione = Utility.getSession().createQuery(" FROM Specializzazione ").getResultList();
		Utility.destroySession();
		return listaSpecilazzazione;
	}

	@Override
	public Specializzazione cancella(Specializzazione specializzazione) {
		return (Specializzazione) super.cancella(specializzazione);
	}
	
	
	public int updade(String oldSpecializzazione, String newSpecializzazione) {

		Transaction t = Utility.getSession().beginTransaction();	
		Query<Specializzazione> query = Utility.getSession()
				.createQuery("UPDATE Specializzazione set specializzazione = :newSpecializzazione WHERE specializzazione = :oldSpecializzazione");
		query.setParameter("oldSpecializzazione", oldSpecializzazione);
		query.setParameter("newSpecializzazione", newSpecializzazione);
		int result = query.executeUpdate();
		t.commit();
		Utility.destroySession();
		return result;
	}

}
