package it.rt.corso.DAOImpl;

import java.util.List;

import it.rt.corso.DAO.BaseDAO;

import it.rt.corso.DAO.RuoloDAO;
import it.rt.corso.beans.Ruolo;
import it.rt.corso.utility.Utility;

public class RuoloDAOImpl extends BaseDAO implements RuoloDAO{

	public Ruolo getRuolo(String id) {
		return (Ruolo) super.get(Ruolo.class, id);
	}

	public List<Ruolo> getListaRuolo() {
		Utility.buildSession();
		 List<Ruolo> listaRuolo= Utility.getSession().createQuery("FROM Ruolo ").getResultList();
		return listaRuolo;
	}

}
