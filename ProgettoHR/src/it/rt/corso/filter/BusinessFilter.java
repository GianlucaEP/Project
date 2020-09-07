package it.rt.corso.filter;

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

	public List<Predicate> checkFilter(List<Predicate> listaPredicati, Root<Candidato> root, String nomeFiltro, String valore) {

		if (nomeFiltro.contains("business")) {

			Utility.buildSession();
			Session session = Utility.getSession();
			Join<Candidato, Business> business = root.join("business", JoinType.INNER);

			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			listaPredicati.add(criteriaBuilder.like(business.get("business"), "%" + valore + "%"));
		} else {
			
			
			
		}
			return listaPredicati;

	}
}
