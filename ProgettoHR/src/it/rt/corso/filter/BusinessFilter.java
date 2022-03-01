package it.rt.corso.filter;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;

import it.rt.corso.beans.Business;
import it.rt.corso.beans.Candidato;
import it.rt.corso.utility.Utility;

public class BusinessFilter extends CandidatoFilter {
	
	//
	//
	
	private static List<Predicate> listaPredicatesBusiness = new ArrayList<Predicate>();
	
	public static List<Predicate> getListaPredicatesBusiness() {
		return listaPredicatesBusiness;
	}
	
	public static void setListaPredicatesBusiness(List<Predicate> listaPredicatesBusiness) {
		BusinessFilter.listaPredicatesBusiness = listaPredicatesBusiness;
	}
	
	//
	//
	
	@Override
	public List<Predicate> checkFilter(List<Predicate> listaPredicati, Root<Candidato> root, String nomeFiltro,
			String valore) {

		if (nomeFiltro.contains("business")) {

			
			Session session = Utility.getSession();
			Join<Candidato, Business> business = root.join("business", JoinType.INNER);

			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			listaPredicati.add(criteriaBuilder.like(business.get("business"), "%" + valore + "%"));
			CandidatoFilter.setAddedCriteria(true);
			return listaPredicati;
			
		} else {
			
			return listaPredicati;

		}
		
	}
	
	//
	//
	
	public static List<Predicate> buildBusinessPredicate(List<Predicate> listaPredicati) {
		Predicate[] predicatesBusiness = listaPredicatesBusiness
				.toArray(new Predicate[listaPredicatesBusiness.size()]);
		CriteriaBuilder criterialBuilder = Utility.createCriteriaBuilder();
		listaPredicati.add(criterialBuilder.and(predicatesBusiness));
		listaPredicatesBusiness = new ArrayList<Predicate>();
		return listaPredicati;
	}
	
	//
	//
	
}
