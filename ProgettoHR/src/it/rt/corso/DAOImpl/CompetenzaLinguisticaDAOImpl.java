package it.rt.corso.DAOImpl;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.CompetenzaLinguisticaDAO;
import it.rt.corso.beans.CompetenzaLinguistica;

public class CompetenzaLinguisticaDAOImpl extends BaseDAO implements CompetenzaLinguisticaDAO {

	@Override
	public CompetenzaLinguistica inserisci(CompetenzaLinguistica competenzaLinguistica) {
		return (CompetenzaLinguistica) super.inserisci(competenzaLinguistica) ;
	}

	@Override
	public CompetenzaLinguistica cancella(CompetenzaLinguistica competenzaLinguistica) {
		return (CompetenzaLinguistica) super.cancella(competenzaLinguistica);
	}

}
