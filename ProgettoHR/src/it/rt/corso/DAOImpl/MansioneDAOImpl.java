package it.rt.corso.DAOImpl;

import java.util.List;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.MansioneDAO;
import it.rt.corso.beans.Mansione;
import it.rt.corso.utility.Utility;
@SuppressWarnings("unchecked")
public class MansioneDAOImpl extends BaseDAO implements MansioneDAO {

	public Mansione inserisci(Mansione mansione) {
		return (Mansione) super.inserisci(mansione);
	}

	public List<Mansione> getLista() {

		Utility.buildSession();

		List<Mansione> listaMansione = Utility.getSession().createQuery(" FROM Mansione ").getResultList();
		return listaMansione;
	}

	public Mansione get(String id) {
		return (Mansione) super.get(Mansione.class, id);
	}

	@Override
	public List<Mansione> getIdByCandidato(int id) {
		
		Utility.buildSession();

		List<Mansione> listaMansione = Utility.getSession().createQuery("SELECT m FROM Mansione m JOIN m.candidato c WHERE c.id = :id")
				.setParameter("id", id).getResultList();

		return listaMansione;
	}

	@Override
	public Mansione cancella(Mansione mansione) {
		return (Mansione) super.cancella(mansione);
	}

}
