package it.rt.corso.DAOImpl;

import java.util.List;

import it.rt.corso.DAO.BaseDAO;

import it.rt.corso.DAO.RuoloDAO;
import it.rt.corso.beans.Ruolo;
import it.rt.corso.utility.Utility;

@SuppressWarnings("unchecked")
public class RuoloDAOImpl extends BaseDAO implements RuoloDAO {

	public Ruolo getRuolo(int id) {
		return (Ruolo) super.get(Ruolo.class, id);
	}

	public List<Ruolo> getLista() {
		List<Ruolo> listaRuolo = Utility.getSession().createQuery("FROM Ruolo ").getResultList();
		Utility.destroySession();
		return listaRuolo;
	}

}
