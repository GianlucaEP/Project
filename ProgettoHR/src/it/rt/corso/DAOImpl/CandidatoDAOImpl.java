package it.rt.corso.DAOImpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Funzionalita;
import it.rt.corso.utility.Utility;

public class CandidatoDAOImpl extends BaseDAO implements CandidatoDAO{

	public Candidato inserisci(Candidato candidato) {
		return (Candidato) super.inserisci(candidato);
	}

	public List<Candidato> getLista() {
		
		Utility.buildSession();
		List<Candidato> listacandidato= Utility.getSession().createQuery("FROM Candidato ").getResultList();
		
		return listacandidato;
	}

	public Candidato get(int id) {
		return (Candidato) super.get(Candidato.class, id);
	}

	public Candidato cancella(Candidato candidato) {
		return (Candidato) super.cancella(candidato);
	}

	public Candidato aggiorna(Candidato candidato) {
		return (Candidato) super.aggiorna(candidato);
	}

	@Override
	public List<Candidato> getListaByBusinessUnit(String businessUnit) {
		
		Utility.buildSession();
//		Query q =Utility.getSession().createQuery("FROM Candidato WHERE business LIKE '%':businessUnit:'%'");
//		q.setParameter("businessUnit", businessUnit);
//		List<Candidato> listacandidatoByBusinessUnit= q.getResultList();
		Criteria cr = Utility.getSession().createCriteria(Candidato.class);
		cr.add(Restrictions.eq("business", businessUnit));
		List results = cr.list();
		
		return results;
	}

}
