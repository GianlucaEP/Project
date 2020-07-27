package it.rt.corso.DAOImpl;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.TelefonataDAO;
import it.rt.corso.beans.Telefonata;

public class TelefonataDAOImpl extends BaseDAO implements TelefonataDAO{

	public Telefonata inserisci(Telefonata telefonata) {
		return (Telefonata) super.inserisci(telefonata);
	}

}
