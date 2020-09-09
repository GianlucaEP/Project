package it.rt.corso.filter;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;

import it.rt.corso.beans.Candidato;
import it.rt.corso.utility.Utility;

public class CategoriaProtettaFilter extends CandidatoFilter{
	@Override
	public List<Predicate> checkFilter(List<Predicate> listaPredicati, Root<Candidato> root, String nomeFiltro,
			String valore) {

		if (nomeFiltro.contains("categoriaProtetta")) {

			Session session = Utility.getSession();

			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			
			if (valore.equalsIgnoreCase("on")) {
				listaPredicati.add(criteriaBuilder.equal(root.get("categoriaProtetta"), 1));
			} else if (valore.equalsIgnoreCase("off")) {
				listaPredicati.add(criteriaBuilder.equal(root.get("categoriaProtetta"), 0));
			}
			
			return listaPredicati;
		} else {
			return listaPredicati;
		}
		
	}
}
