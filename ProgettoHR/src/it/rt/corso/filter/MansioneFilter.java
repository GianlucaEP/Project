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

	private static List<Predicate> listaPredicatesMansioni = new ArrayList<Predicate>();

	public static List<Predicate> getListaPredicatesMansioni() {
		return listaPredicatesMansioni;
	}

	public static void setListaPredicatesMansioni(List<Predicate> listaPredicatesMansioni) {
		MansioneFilter.listaPredicatesMansioni = listaPredicatesMansioni;
	}
	
	@Override
	public List<Predicate> checkFilter(List<Predicate> listaPredicati, Root<Candidato> root, String nomeFiltro,
			String valore) {

		if (nomeFiltro.contains("mansione")) {

			
			CriteriaBuilder criteriaBuilder = Utility.createCriteriaBuilder();
			Join<Candidato, Mansione> mansione = root.join("mansione", JoinType.INNER);

			
			listaPredicatesMansioni
			.add(criteriaBuilder.like(mansione.get("mansione"), "%" + valore + "%"));
			return listaPredicati;
		} else {
			return listaPredicati;

		}
		
	}
	
	public static List<Predicate> buildMansionePredicate(List<Predicate> listaPredicati){
		Predicate[] predicatesMansioni = listaPredicatesMansioni
				.toArray(new Predicate[listaPredicatesMansioni.size()]);
		CriteriaBuilder criteriaBuilder = Utility.createCriteriaBuilder();
		// aggiunge alla lista di tutti i predicati la or delle mansioni
		listaPredicati.add(criteriaBuilder.or(predicatesMansioni));
		
		return listaPredicati;
	}
	
}
