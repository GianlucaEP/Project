package it.rt.corso.DAOImpl;

import java.util.List;
import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.CostoDAO;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Costo;
import it.rt.corso.utility.Utility;

public class CostoDAOImpl extends BaseDAO implements CostoDAO{

	@Override
	public Costo inserisci(Costo costo) {
		return (Costo) super.inserisci(costo);
	}

	@Override
	public Costo get(int id) {
		return (Costo) super.get(Costo.class, id);
	}
	
	@Override
	public Costo aggiorna(Costo costo) {
		return (Costo) super.aggiorna(costo);
	}

	@Override
	public List<Costo> getByIdCandidato(int id) {

		Utility.buildSession();

		List<Costo> listaCosto = Utility.getSession().createQuery(" FROM Costo WHERE id_candidato=:id")
				.setParameter("id", id).getResultList();

		return listaCosto;
	}

}
