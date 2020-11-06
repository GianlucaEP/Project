package it.rt.corso.DAOImpl;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.TitoloStudioDAO;
import it.rt.corso.beans.TitoloStudio;

public class TitoloStudioDAOImpl extends BaseDAO implements TitoloStudioDAO{

	@Override
	public TitoloStudio inserisci(TitoloStudio titoloStudio) {
		return (TitoloStudio) super.inserisci(titoloStudio);
	}

	@Override
	public TitoloStudio cancella(TitoloStudio titoloStudio) {
		return (TitoloStudio) super.cancella(titoloStudio);
	}

	@Override
	public TitoloStudio get(String id) {
		return (TitoloStudio) super.get(TitoloStudio.class, id);
	}

	@Override
	public TitoloStudio aggiorna(TitoloStudio titoloStudio) {
		return (TitoloStudio) super.aggiorna(titoloStudio);
	}

}
