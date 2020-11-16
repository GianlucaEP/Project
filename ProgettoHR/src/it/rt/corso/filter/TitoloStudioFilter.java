package it.rt.corso.filter;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.TitoloStudio;
import it.rt.corso.utility.Utility;

public class TitoloStudioFilter extends CandidatoFilter {
	private static List<Predicate> listaPredicatesTitoloStudio = new ArrayList<Predicate>();

	public static List<Predicate> getListaPredicatesTitoloStudio() {
		return listaPredicatesTitoloStudio;
	}

	@Override
	public List<Predicate> checkFilter(List<Predicate> listaPredicati, Root<Candidato> root, String nomeFiltro,
			String valore) {

		if (nomeFiltro.contains("titoloStudio")) {

			CriteriaBuilder criteriaBuilder = Utility.createCriteriaBuilder();
			Join<Candidato, TitoloStudio> mansione = root.join("titoloStudio", JoinType.INNER);

			listaPredicatesTitoloStudio.add(criteriaBuilder.like(mansione.get("titoloStudio"), "%" + valore + "%"));
			CandidatoFilter.setAddedCriteria(true);

			return listaPredicati;
		} else {
			return listaPredicati;

		}

	}
	
	/** 
	 * 
	 * add an or predicate to the given List of predicates
	 * 
	 * @param listaPredicati the list of predicates to which the or predicate will be added
	 * 
	 * @return the given list of predicates with the added predicate
	 * 
	 * */
	public static List<Predicate> buildTitoloStudioPredicate(List<Predicate> listaPredicati){
		Predicate[] predicatesTitoloStudio = listaPredicatesTitoloStudio
				.toArray(new Predicate[listaPredicatesTitoloStudio.size()]);
		CriteriaBuilder criteriaBuilder = Utility.createCriteriaBuilder();
		
		listaPredicati.add(criteriaBuilder.and(predicatesTitoloStudio));
		listaPredicatesTitoloStudio = new ArrayList<Predicate>();
		
		return listaPredicati;
	}
}
