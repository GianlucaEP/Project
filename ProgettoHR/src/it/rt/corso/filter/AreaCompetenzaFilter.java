package it.rt.corso.filter;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import it.rt.corso.beans.AreaCompetenza;
import it.rt.corso.beans.Candidato;
import it.rt.corso.utility.Utility;

public class AreaCompetenzaFilter extends CandidatoFilter{
	private static List<Predicate> listaPredicatesAreaCompetenza = new ArrayList<Predicate>();

	public static List<Predicate> getListaPredicatesAreaCompetenza() {
		return listaPredicatesAreaCompetenza;
	}

	public static void setListaPredicatesAreaCompetenza(List<Predicate> listaPredicatesAreaCompetenza) {
		AreaCompetenzaFilter.listaPredicatesAreaCompetenza = listaPredicatesAreaCompetenza;
	}
	
	@Override
	public List<Predicate> checkFilter(List<Predicate> listaPredicati, Root<Candidato> root, String nomeFiltro,
			String valore) {

		if (nomeFiltro.contains("area")) {

			
			CriteriaBuilder criteriaBuilder = Utility.createCriteriaBuilder();
			Join<Candidato, AreaCompetenza> areaCompetenza = root.join("area", JoinType.INNER);

			
			listaPredicatesAreaCompetenza
			.add(criteriaBuilder.like(areaCompetenza.get("area"), "%" + valore + "%"));
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
	public static List<Predicate> buildAreaCompetenzaPredicate(List<Predicate> listaPredicati){
		Predicate[] predicatesAreaCompetenza = listaPredicatesAreaCompetenza
				.toArray(new Predicate[listaPredicatesAreaCompetenza.size()]);
		CriteriaBuilder criteriaBuilder = Utility.createCriteriaBuilder();
		// aggiunge alla lista di tutti i predicati la or delle mansioni
		listaPredicati.add(criteriaBuilder.or(predicatesAreaCompetenza));
		listaPredicatesAreaCompetenza = new ArrayList<Predicate>();
		return listaPredicati;
	}
}
