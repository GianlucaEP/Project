package it.rt.corso.DAOImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.ParameterExpression;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.cache.spi.support.AbstractReadWriteAccess.Item;
import org.hibernate.criterion.Restrictions;

import org.hibernate.query.Query;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.beans.Business;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Funzionalita;
import it.rt.corso.utility.Utility;

public class CandidatoDAOImpl extends BaseDAO implements CandidatoDAO {

	@Override
	public Candidato inserisci(Candidato candidato) {
		return (Candidato) super.inserisci(candidato);
	}

	@Override
	public List<Candidato> getLista() {

		Utility.buildSession();
		List<Candidato> listacandidato = Utility.getSession().createQuery("FROM Candidato ").getResultList();

		return listacandidato;
	}

	@Override
	public Candidato get(int id) {
		return (Candidato) super.get(Candidato.class, id);
	}

	@Override
	public Candidato cancella(Candidato candidato) {
		return (Candidato) super.cancella(candidato);
	}

	@Override
	public Candidato aggiorna(Candidato candidato) {
		return (Candidato) super.aggiorna(candidato);
	}

	@Override
	public List<Candidato> getListaByBusinessUnit(String businessUnit) {

		Utility.buildSession();
		
		
		Session session=Utility.getSession();
		
		Business bus=session.byId(Business.class).getReference(businessUnit);
		
		Set<Candidato> lista = bus.getCandidato();
		
		List<Candidato> listacandidatoByBusinessUnit = new ArrayList<>(lista);
		
		return listacandidatoByBusinessUnit;
	}
	
	@Override
	public List<Candidato> getListaByBusinessUnitFilteredBySurname(String businessUnit, String cognome) {

		Utility.buildSession();
		
		
		Session session=Utility.getSession();

		
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
		CriteriaQuery<Candidato> criteriaQuery = criteriaBuilder.createQuery(Candidato.class);
		Root<Candidato> root = criteriaQuery.from(Candidato.class);
		Join<Candidato, Business> business = root.join("business", JoinType.INNER);
			
		Predicate[] predicates = new Predicate[2];
		predicates[0] = criteriaBuilder.like(root.get("cognome"), "%"+cognome+"%");
		predicates[1] = criteriaBuilder.like(business.get("business"), "%"+businessUnit+"%");
		criteriaQuery.select(root).where(predicates);

		Query<Candidato> query = session.createQuery(criteriaQuery);
		
		List<Candidato> lista = (List<Candidato>) query.getResultList();
		return lista;
	}

}
