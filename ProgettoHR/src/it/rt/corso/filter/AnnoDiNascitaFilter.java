package it.rt.corso.filter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;

import it.rt.corso.beans.Candidato;
import it.rt.corso.utility.Utility;

public class AnnoDiNascitaFilter extends CandidatoFilter {
	@Override
	public List<Predicate> checkFilter(List<Predicate> listaPredicati, Root<Candidato> root, String nomeFiltro,
			String valore) {

		if (nomeFiltro.contains("anno")) {
			try {
				Session session = Utility.getSession();

				CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();

				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

				Date date = formatter.parse(valore);
				
				listaPredicati.add(criteriaBuilder.greaterThanOrEqualTo(root.get("dataNascita"), date));
				
				CandidatoFilter.setAddedCriteria(true);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return listaPredicati;
		} else {
			return listaPredicati;
		}

	}
}
