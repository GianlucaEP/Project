package it.rt.corso.filter;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;

import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Seniority;
import it.rt.corso.utility.Utility;

public class SeniorityFilter extends CandidatoFilter {
	@Override
	public List<Predicate> checkFilter(List<Predicate> listaPredicati, Root<Candidato> root, String nomeFiltro,
			String valore) {

		if (nomeFiltro.contains("seniority")) {

			Session session = Utility.getSession();
			Join<Candidato, Seniority> seniority = root.join("seniority", JoinType.INNER);

			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			listaPredicati.add(criteriaBuilder.like(seniority.get("seniority"), "%" + valore + "%"));
			CandidatoFilter.setAddedCriteria(true);
			return listaPredicati;
		} else {
			return listaPredicati;

		}

	}
}
