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
					InserimentoFromFilter.setFromIsSelected(true);

				} else if (nomeFiltro.contains("dataInserimentoTo")) {

					InserimentoToFilter.setInserimentoTo(date.parse(valore));
					InserimentoToFilter.setToSelected(true);

				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return listaPredicati;

		} else {
			return listaPredicati;
		}

	}

	public static List<Predicate> buildInserimentoPredicate(List<Predicate> listaPredicati) {

		if (InserimentoFromFilter.isFromIsSelected() && InserimentoToFilter.isToSelected()) {
			Session session = Utility.getSession();
			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();

			listaPredicati.add(criteriaBuilder.between(getRoot().<Date>get("inserimentoAzienda"),
					InserimentoFromFilter.getInserimentoFrom(), InserimentoToFilter.getInserimentoTo()));

		} else if (InserimentoFromFilter.isFromIsSelected() && !InserimentoToFilter.isToSelected()) {
			Session session = Utility.getSession();
			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();

			listaPredicati.add(criteriaBuilder.greaterThanOrEqualTo(getRoot().<Date>get("inserimentoAzienda"),
					InserimentoFromFilter.getInserimentoFrom()));
		} else if (!InserimentoFromFilter.isFromIsSelected() && InserimentoToFilter.isToSelected()) {
			Session session = Utility.getSession();
			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();

			listaPredicati.add(criteriaBuilder.lessThanOrEqualTo(getRoot().<Date>get("inserimentoAzienda"),
					InserimentoToFilter.getInserimentoTo()));
		}

		InserimentoFromFilter.setFromIsSelected(false);
		InserimentoToFilter.setToSelected(false);

		return listaPredicati;

	}

	private static Root<Candidato> getRoot() {
		return rootCriteria;
	}

	private static void setRoot(Root<Candidato> root) {
		InserimentoFilter.rootCriteria = root;
	}
}
