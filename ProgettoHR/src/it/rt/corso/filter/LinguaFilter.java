package it.rt.corso.filter;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.CandidatoCompetenzaLinguistica;
import it.rt.corso.beans.CompetenzaLinguistica;
import it.rt.corso.utility.Utility;

public class LinguaFilter extends CandidatoFilter{

	private static List<Predicate> listaPredicatesCompetenzaLinguistica = new ArrayList<Predicate>();
	
	public static List<Predicate> getListaPredicatesLingue() {
		return listaPredicatesCompetenzaLinguistica;
	}
	
	@Override
	public List<Predicate> checkFilter(List<Predicate> listaPredicati, Root<Candidato> root, String nomeFiltro,
			String valore) {

		if (nomeFiltro.contains("lingua")) {

			
			CriteriaBuilder criteriaBuilder = Utility.createCriteriaBuilder();
			
			Join<Candidato, CandidatoCompetenzaLinguistica> candidatoCompetenzaLinguistica = root.join("candidatoCompetenzaLingustica", JoinType.INNER);
			
			Join<CompetenzaLinguistica, CandidatoCompetenzaLinguistica> competenzaLinguistica = candidatoCompetenzaLinguistica.join("competenzaLinguistica", JoinType.INNER);

			
			listaPredicatesCompetenzaLinguistica
			.add(criteriaBuilder.like(competenzaLinguistica.get("lingua"), "%" + valore + "%"));
			CandidatoFilter.setAddedCriteria(true);
			
			return listaPredicati;
		} else {
			return listaPredicati;

		}
		
	}
	
	public static List<Predicate> buildCompetenzaLinguisticaPredicate(List<Predicate> listaPredicati) {
		Predicate[] predicatesCompetenzeLinguistica = listaPredicatesCompetenzaLinguistica
				.toArray(new Predicate[listaPredicatesCompetenzaLinguistica.size()]);
		CriteriaBuilder criteriaBuilder = Utility.createCriteriaBuilder();
		// aggiunge alla lista di tutti i predicati la or delle mansioni
		listaPredicati.add(criteriaBuilder.and(predicatesCompetenzeLinguistica));
		listaPredicatesCompetenzaLinguistica = new ArrayList<Predicate>();

		return listaPredicati;
	}
	
}
