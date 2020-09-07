package it.rt.corso.filter;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;

import it.rt.corso.beans.Candidato;
import it.rt.corso.utility.Utility;

public class CandidatoFilter implements CandidatoFilterInterface{
	
	public static Root<Candidato> biulRootCriteria(){
		
		Utility.buildSession();

		// bean di candidatofilter nel argomento
		// controllo i campi not null e ne faccio predicati

		Session session = Utility.getSession();

		// creo builder di criteria
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();

		// Crea a CriteriaQuery object with the specified resulttype. (classe candidato)
		CriteriaQuery<Candidato> criteriaQuery = criteriaBuilder.createQuery(Candidato.class);

		// Create and add a query root corresponding to the given entity,forming a
		// cartesian product with any existing roots.
		Root<Candidato> root = criteriaQuery.from(Candidato.class);
		
		return root;
	}
	
	public static List<CandidatoFilter> buildFilterList(){
		List<CandidatoFilter> filterList = new ArrayList<>();
		CandidatoFilter filter = new CandidatoFilter();
		
		filterList.add((MansioneFilter)filter);
		
		return filterList;
	}
	

	@Override
	public void nextFilter(Root<Candidato> root) {
		root = biulRootCriteria();
		List<CandidatoFilter> cand = new ArrayList<>();
		CandidatoFilter mansione = new CandidatoFilter();
		
	};
}
