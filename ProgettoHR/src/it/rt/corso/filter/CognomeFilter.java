package it.rt.corso.filter;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;

import it.rt.corso.beans.Candidato;
import it.rt.corso.utility.Utility;

public class CognomeFilter extends CandidatoFilter{
	@Override
	public List<Predicate> checkFilter(List<Predicate> listaPredicati, Root<Candidato> root, String nomeFiltro,
			String valore) {

		if (nomeFiltro.equals("cognome")) {

			Session session = Utility.getSession();

			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			listaPredicati.add(criteriaBuilder.like(root.get("cognome"), "%" + valore + "%"));
			
			CandidatoFilter.setAddedCriteria(true);
			
			return listaPredicati;
		} else {
			return listaPredicati;
		}
		
	}
}
