package it.rt.corso.DAOImpl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;

import org.hibernate.query.Query;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.beans.*;
import it.rt.corso.filter.CandidatoFilter;
import it.rt.corso.utility.Utility;
@SuppressWarnings("unchecked")
public class CandidatoDAOImpl extends BaseDAO implements CandidatoDAO {

	@Override
	public Candidato inserisci(Candidato candidato) {
		return (Candidato) super.inserisci(candidato);
	}

	@Override
	public List<Candidato> getLista() {

		List<Candidato> listacandidato = Utility.getSession().createQuery("FROM Candidato ").getResultList();
		Utility.destroySession();
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


		Session session = Utility.getSession();
		
		//---------------------------------------------------------------------
		
		String hql = "FROM Candidato C WHERE C.business.business = : businessUnit ORDER BY C.id DESC";
		Query<Candidato> query = session.createQuery(hql);
		query.setParameter("businessUnit", businessUnit);
		List<Candidato> results = query.getResultList();

		//---------------------------------------------------------------------
		//SOLUZIONE PRECEDENTE FUNZIONANTE
		//
		//Business bus = session.byId(Business.class).getReference(businessUnit);
		//Set<Candidato> lista = bus.getCandidato();
		//List<Candidato> listacandidatoByBusinessUnit = new ArrayList<>(lista);
		//return listacandidatoByBusinessUnit;
		//---------------------------------------------------------------------
		Utility.destroySession();
		return results;
	}

	@Override
	public List<Candidato> getListaByBusinessUnitFiltered(Map<String, String> mappaFilter) throws ParseException {

		
		Session session = Utility.getSession();

		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();

		CriteriaQuery<Candidato> criteriaQuery = criteriaBuilder.createQuery(Candidato.class);

		Root<Candidato> root = criteriaQuery.from(Candidato.class);
		
		List<Predicate> listaPredicates = new ArrayList<Predicate>();
		
		CandidatoFilter candidatoFilter = new CandidatoFilter();
		
		for (Map.Entry<String, String> entry : mappaFilter.entrySet()) {
			listaPredicates = candidatoFilter.checkFilter(listaPredicates, root, entry.getKey(), entry.getValue());
		}
		
		listaPredicates = candidatoFilter.buildCompundPredicate(listaPredicates);
		
		// trasforma in array la lista di tutti i predicati
		Predicate[] predicates = listaPredicates.toArray(new Predicate[listaPredicates.size()]);
		// costruzione della query

		criteriaQuery.select(root).where(predicates);
		criteriaQuery.groupBy(root.get("id"));
		// esecuzione della query
		Query<Candidato> query = session.createQuery(criteriaQuery);

		List<Candidato> lista = query.getResultList();
		Utility.destroySession();
		return lista;
	}

	@Override
	public List<Candidato> getListaByBusinessUnitFilteredByStato(String businessUnit, String stato) {

		Session session = Utility.getSession();

		// creo builder di criteria
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();

		// Crea a CriteriaQuery object with the specified resulttype. (classe candidato)
		CriteriaQuery<Candidato> criteriaQuery = criteriaBuilder.createQuery(Candidato.class);

		// Create and add a query root corresponding to the given entity,forming a
		// cartesian product with any existing roots.
		Root<Candidato> root = criteriaQuery.from(Candidato.class);

		// join tra candidato e business
		Join<Candidato, Business> business = root.join("business", JoinType.INNER);

		// join tra candidato e statoCandidato
		Join<Candidato, Business> statoCandidato = root.join("stato", JoinType.INNER);

		List<Predicate> listaPredicates = new ArrayList<Predicate>();

		listaPredicates.add(criteriaBuilder.like(business.get("business"), "%" + businessUnit + "%"));

		listaPredicates.add(criteriaBuilder.like(statoCandidato.get("descrizione"), "%" + stato + "%"));

		Predicate[] predicates = listaPredicates.toArray(new Predicate[listaPredicates.size()]);
		// costruzione della query
		criteriaQuery.select(root).where(predicates);
		// esecuzione della query
		Query<Candidato> query = session.createQuery(criteriaQuery);

		List<Candidato> lista = (List<Candidato>) query.getResultList();
		Utility.destroySession();
		return lista;
	}

}
