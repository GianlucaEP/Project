package it.rt.corso.filter;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;

import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Costo;
import it.rt.corso.utility.Utility;

public class CostoMinimoFilter extends CandidatoFilter {
	@Override
	public List<Predicate> checkFilter(List<Predicate> listaPredicati, Root<Candidato> root, String nomeFiltro,
			String valore) {

		if (nomeFiltro.contains("costoMin")) {

			Session session = Utility.getSession();

			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			Join<Candidato, Costo> costo = root.join("costo", JoinType.INNER);
			
			listaPredicati.add(criteriaBuilder.greaterThanOrEqualTo(costo.get("orario"), Integer.parseInt(valore)));
			
			CandidatoFilter.setAddedCriteria(true);

			return listaPredicati;
		} else {
			return listaPredicati;
		}

	}

}
