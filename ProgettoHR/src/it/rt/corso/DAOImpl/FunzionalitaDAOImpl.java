package it.rt.corso.DAOImpl;

import java.util.List;

import it.rt.corso.DAO.BaseDAO;

import it.rt.corso.DAO.FunzionalitaDAO;
import it.rt.corso.beans.Funzionalita;
import it.rt.corso.utility.Utility;

public class FunzionalitaDAOImpl extends BaseDAO implements FunzionalitaDAO{

	public Funzionalita getFunzionalita(String id) {
		return (Funzionalita) super.get(Funzionalita.class, id);
	}

	public List<Funzionalita> getListaFunzionalita() {
		Utility.buildSession();
		 List<Funzionalita> listaFunzionalita= Utility.getSession().createQuery("FROM Funzionalita ").getResultList();
		return listaFunzionalita;
	}

}
