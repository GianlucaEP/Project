package it.rt.corso.DAOImpl;

import java.util.List;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.TitoloStudioDAO;
import it.rt.corso.beans.TitoloStudio;
import it.rt.corso.beans.UploadFile;
import it.rt.corso.utility.Utility;

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
	public TitoloStudio get(int id) {
		return (TitoloStudio) super.get(TitoloStudio.class, id);
	}
	
	@Override
	public TitoloStudio getByName(String name) {
		List<TitoloStudio> titoloStudio = Utility.getSession().createQuery(" FROM TitoloStudio T WHERE T.titoloStudio=:name")
				.setParameter("name", name).getResultList();
		Utility.destroySession();
		if(titoloStudio.isEmpty()) {
			return null;
		}
		return titoloStudio.get(0);
	}

	@Override
	public TitoloStudio aggiorna(TitoloStudio titoloStudio) {
		return (TitoloStudio) super.aggiorna(titoloStudio);
	}



}
