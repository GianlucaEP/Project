package it.rt.corso.DAOImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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
import it.rt.corso.beans.Mansione;
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

		Session session = Utility.getSession();

		Business bus = session.byId(Business.class).getReference(businessUnit);

		Set<Candidato> lista = bus.getCandidato();

		List<Candidato> listacandidatoByBusinessUnit = new ArrayList<>(lista);

		return listacandidatoByBusinessUnit;
	}

	@Override
	public List<Candidato> getListaByBusinessUnitFiltered(String businessUnit, Map<String, String> mappaFilter) {

		Utility.buildSession();

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

		// join tra candidato e mansione
		Join<Candidato, Mansione> mansione = root.join("mansione", JoinType.INNER);

		// crea una serie di condizioni, WHERE

		// della Map dei filtri
		List<Predicate> listaPredicates = new ArrayList<Predicate>();
		// Lista per gestire le mansioni da inserire nella or
		List<Predicate> listaPredicatesMansioni = new ArrayList<Predicate>();
		// aggiungi business unit nei predicates
		listaPredicates.add(criteriaBuilder.like(business.get("business"), "%" + businessUnit + "%"));

		for (Map.Entry<String, String> entry : mappaFilter.entrySet()) {

			if (entry.getKey().contains("mansione")) {

				listaPredicatesMansioni
						.add(criteriaBuilder.like(mansione.get("mansione"), "%" + entry.getValue() + "%"));

			} else {
				listaPredicates.add(criteriaBuilder.like(root.get(entry.getKey()), "%" + entry.getValue() + "%"));

			}

		} // ciclo per inserire nei predicati dei filtri nelle rispettive liste

		if (!listaPredicatesMansioni.isEmpty()) {
			// trasforma la lista in array per inserire i predicati delle mansioni nella or
			Predicate[] predicatesMansioni = listaPredicatesMansioni
					.toArray(new Predicate[listaPredicatesMansioni.size()]);
			// aggiunge alla lista di tutti i predicati la or delle mansioni
			listaPredicates.add(criteriaBuilder.or(predicatesMansioni));
		}

		// trasforma in array la lista di tutti i predicati
		Predicate[] predicates = listaPredicates.toArray(new Predicate[listaPredicates.size()]);
		// costruzione della query
		criteriaQuery.select(root).where(predicates);
		// esecuzione della query
		Query<Candidato> query = session.createQuery(criteriaQuery);

		List<Candidato> lista = (List<Candidato>) query.getResultList();
		return lista;
	}

	@Override
	public List<Candidato> getListaByBusinessUnitFilteredByStato(String businessUnit, String stato) {
		Utility.buildSession();

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
		return lista;
	}

}
