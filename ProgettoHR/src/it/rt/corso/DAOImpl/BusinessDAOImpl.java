package it.rt.corso.DAOImpl;

import java.util.List;

import org.hibernate.Transaction;
import org.hibernate.query.Query;
import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.BusinessDAO;
import it.rt.corso.beans.Business;
import it.rt.corso.utility.Utility;

@SuppressWarnings("unchecked")
public class BusinessDAOImpl extends BaseDAO implements BusinessDAO{


	public Business inserisci(Business business) {
		return (Business) super.inserisci(business);
	}

	
	public List<Business> getLista() {
		
		
		List<Business> listabusiness= Utility.getSession().createQuery("FROM Business").getResultList();
		Utility.destroySession();
		return listabusiness;
	}


	public Business get(String id) {
		return (Business)super.get(Business.class, id);
	}


	//
	//
	
	@Override
	public List<Business> getIdByCandidato(int id) {
		List<Business> listaBusiness = Utility.getSession()
				.createQuery("SELECT b FROM Business b JOIN b.candidato b WHERE b.id = :id").setParameter("id", id)
				.getResultList();
		Utility.destroySession();
		return listaBusiness;
	}


	@Override
	public Business cancella(Business business) {
		return (Business) super.cancella(business);
	}


	@Override
	public int update(String oldBusiness, String newBusiness) {
		
		Transaction t = Utility.getSession().beginTransaction();
		Query<Business> query = Utility.getSession()
				.createQuery("UPDATE Business set business = :newBusiness WHERE Business = :oldBusiness");
		query.setParameter("oldBusiness", oldBusiness);
		query.setParameter("newBusiness", newBusiness);
		int result = query.executeUpdate();
		t.commit();
		Utility.destroySession();
		return result;
	}

	//
	//
}
