package it.rt.corso.filter;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.CandidatoSpecializzazione;
import it.rt.corso.beans.Specializzazione;
import it.rt.corso.utility.Utility;

public class SpecializzazioneFilter extends CandidatoFilter {
	private static List<Predicate> listaPredicatesSpecializzazione = new ArrayList<Predicate>();

	public static List<Predicate> getListaPredicatesSpecializzazione() {
		return listaPredicatesSpecializzazione;
	}

	public static void setListaPredicatesSpecializzazione(List<Predicate> listaPredicatesSpecializzazione) {
		SpecializzazioneFilter.listaPredicatesSpecializzazione = listaPredicatesSpecializzazione;
	}

	// TODO gestione della stringa dividere anni e specializzazione, fare query con
	// greater than. se anni "" query solo specializzazioni

	@Override
	public List<Predicate> checkFilter(List<Predicate> listaPredicati, Root<Candidato> root, String nomeFiltro,
			String valore) {

		if (nomeFiltro.contains("specializzazione")) {
			System.out.println("sas");
			CriteriaBuilder criteriaBuilder = Utility.createCriteriaBuilder();
			// join tra candidato e candidatoSpecializzazione
			Join<Candidato, CandidatoSpecializzazione> candidatoSpecializzazione = root
					.join("candidatoSpecializzazione", JoinType.INNER);

			// join tra candidato e candidatoSpecializzazione
			Join<Specializzazione, CandidatoSpecializzazione> specializzazione = candidatoSpecializzazione
					.join("specializzazione", JoinType.INNER);
			if (Character.isDigit(valore.charAt(valore.length() - 1))) {
				int anniSpecializzazione = getAnniSpecializzazione(valore);
				valore = valore.substring(0, valore.lastIndexOf(" "));
				listaPredicatesSpecializzazione
						.add(criteriaBuilder.like(specializzazione.get("specializzazione"), "%" + valore + "%"));
				listaPredicatesSpecializzazione.add(criteriaBuilder
						.greaterThanOrEqualTo(candidatoSpecializzazione.get("anni"), +anniSpecializzazione));
				CandidatoFilter.setAddedCriteria(true);

				return listaPredicati;
			}

			listaPredicatesSpecializzazione
					.add(criteriaBuilder.like(specializzazione.get("specializzazione"), "%" + valore.trim() + "%"));
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
	 * @param listaPredicati the list of predicates to which the or predicate will
	 *                       be added
	 * 
	 * @return the given list of predicates with the added predicate
	 * 
	 */
	public static List<Predicate> buildSpecializzazionePredicate(List<Predicate> listaPredicati) {
		Predicate[] predicatesSpecializzazioni = listaPredicatesSpecializzazione
				.toArray(new Predicate[listaPredicatesSpecializzazione.size()]);
		CriteriaBuilder criteriaBuilder = Utility.createCriteriaBuilder();
		// aggiunge alla lista di tutti i predicati la or delle mansioni
		listaPredicati.add(criteriaBuilder.and(predicatesSpecializzazioni));
		listaPredicatesSpecializzazione = new ArrayList<Predicate>();

		return listaPredicati;
	}

	private static int getAnniSpecializzazione(String specializzazione) {
		return Integer.parseInt(specializzazione.substring(specializzazione.lastIndexOf(" ") + 1, specializzazione.length()));

	}
}
