package it.rt.corso.DAOImpl;

import java.util.List;

import org.hibernate.Transaction;
import org.hibernate.query.Query;
import it.rt.corso.DAO.AreaCompetenzaDAO;
import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.beans.AreaCompetenza;
import it.rt.corso.utility.Utility;

@SuppressWarnings("unchecked")
public class AreaCompetenzaDAOImpl extends BaseDAO implements AreaCompetenzaDAO{

	public AreaCompetenza inserisci(AreaCompetenza area) {
		return (AreaCompetenza) super.inserisci(area);
	}

	public List<AreaCompetenza> getLista() {
		List<AreaCompetenza> listaArea= Utility.getSession()
				.createQuery("FROM AreaCompetenza")
				.getResultList();
		Utility.destroySession();
		return listaArea;
	}

	public AreaCompetenza get(String id) {
		return (AreaCompetenza) super.get(AreaCompetenza.class, id); 
	}
	
	@Override
	public List<AreaCompetenza> getIdByCandidato(int id) {
		List<AreaCompetenza> listaAreaCompetenza = Utility.getSession()
				.createQuery("SELECT a FROM AreaCompetenza a JOIN a.candidato c WHERE c.id = :id")
				.setParameter("id", id)
				.getResultList();
		Utility.destroySession();
		return listaAreaCompetenza;
	}
	
	@Override
	public AreaCompetenza cancella(AreaCompetenza area) {
		return (AreaCompetenza) super.cancella(area);
	}
	
	@Override
	public int update(String oldArea, String newArea) {

		Transaction t = Utility.getSession().beginTransaction();	
		Query<AreaCompetenza> query = Utility.getSession()
				.createQuery("UPDATE AreaCompetenza set area = :newArea WHERE area = :oldArea");
		query.setParameter("oldArea", oldArea);
		query.setParameter("newArea", newArea);
		int result = query.executeUpdate();
		t.commit();
		Utility.destroySession();
		return result;
	}
	
}
