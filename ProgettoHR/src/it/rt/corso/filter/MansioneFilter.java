package it.rt.corso.filter;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Mansione;
import it.rt.corso.utility.Utility;

public class MansioneFilter extends CandidatoFilter{

	private static List<Predicate> listaPredicatesMansione = new ArrayList<Predicate>();

	public static List<Predicate> getListaPredicatesMansioni() {
		return listaPredicatesMansione;
	}
	
	public static void setListaPredicatesMansioni(List<Predicate> listaPredicatesMansione) {
		MansioneFilter.listaPredicatesMansione = listaPredicatesMansione;
	}
	
	@Override
	public List<Predicate> checkFilter(List<Predicate> listaPredicati, Root<Candidato> root, String nomeFiltro,
			String valore) {

		if (nomeFiltro.contains("mansione")) {

			
			CriteriaBuilder criteriaBuilder = Utility.createCriteriaBuilder();
			Join<Candidato, Mansione> mansione = root.join("mansione", JoinType.INNER);

			
			listaPredicatesMansione
			.add(criteriaBuilder.like(mansione.get("mansione"), "%" + valore + "%"));
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
	public static List<Predicate> buildMansionePredicate(List<Predicate> listaPredicati) {
		Predicate[] predicatesMansioni = listaPredicatesMansione
				.toArray(new Predicate[listaPredicatesMansione.size()]);
		CriteriaBuilder criteriaBuilder = Utility.createCriteriaBuilder();
		// aggiunge alla lista di tutti i predicati la or delle mansioni
		listaPredicati.add(criteriaBuilder.and(predicatesMansioni));
		listaPredicatesMansione = new ArrayList<Predicate>();
		
		return listaPredicati;
	}
	
}
