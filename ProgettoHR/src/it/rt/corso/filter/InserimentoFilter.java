package it.rt.corso.filter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;

import it.rt.corso.beans.Candidato;
import it.rt.corso.utility.Utility;

public class InserimentoFilter extends CandidatoFilter {

	private static Root<Candidato> rootCriteria;

	@Override
	public List<Predicate> checkFilter(List<Predicate> listaPredicati, Root<Candidato> root, String nomeFiltro,
			String valore) {

		if (nomeFiltro.contains("data")) {
			setRoot(root);
			try {
				SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");

				if (nomeFiltro.contains("dataInserimentoFrom")) {

					InserimentoFromFilter.setInserimentoFrom(date.parse(valore));

				} else if (nomeFiltro.contains("dataInserimentoTo")) {

					InserimentoToFilter.setInserimentoTo(date.parse(valore));

				}
//			Date dataFrom = date.parse(valore);
//			listaPredicati.add(criteriaBuilder.lessThanOrEqualTo(root.get("dateCreated").as(Date.class), valore));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return listaPredicati;

		} else {
			return listaPredicati;
		}

	}

	public static List<Predicate> buildInserimentoPredicate(List<Predicate> listaPredicati) {

		if (InserimentoFromFilter.getInserimentoFrom() != null && InserimentoFromFilter.getInserimentoFrom() != null) {
			Session session = Utility.getSession();
			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();

			listaPredicati.add(criteriaBuilder.between(getRoot().<Date>get("inserimentoAzienda"),
					InserimentoFromFilter.getInserimentoFrom(), InserimentoFromFilter.getInserimentoFrom()));
		} else if (InserimentoFromFilter.getInserimentoFrom() != null
				&& InserimentoFromFilter.getInserimentoFrom() == null) {
			Session session = Utility.getSession();
			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();

			listaPredicati.add(criteriaBuilder.greaterThanOrEqualTo(getRoot().<Date>get("inserimentoAzienda"),
					criteriaBuilder.currentDate()));
		}

		return listaPredicati;

	}

	private static Root<Candidato> getRoot() {
		return rootCriteria;
	}

	private static void setRoot(Root<Candidato> root) {
		InserimentoFilter.rootCriteria = root;
	}
}
