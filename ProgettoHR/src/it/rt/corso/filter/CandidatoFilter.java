package it.rt.corso.filter;

import java.util.List;

import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import it.rt.corso.DAO.FeedbackDAO;
import it.rt.corso.beans.Candidato;

public class CandidatoFilter implements CandidatoFilterInterface {
	
	private static boolean addedCriteria = false;

	@Override
	public List<Predicate> checkFilter(List<Predicate> listaPredicati, Root<Candidato> root, String nomeFiltro,
			String valore) {
		ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");
		List<CandidatoFilter> filterList = (List<CandidatoFilter>) factory.getBean("filterList");
		for (CandidatoFilter filter : filterList) {
			if(!addedCriteria) {
				listaPredicati = filter.checkFilter(listaPredicati, root, nomeFiltro,valore);	
			} else {
				CandidatoFilter.setAddedCriteria(false);
				break;
			}
			
		}

		if (!MansioneFilter.getListaPredicatesMansioni().isEmpty()) {
			MansioneFilter.buildMansionePredicate(listaPredicati);
		}
		
		if(!AreaCompetenzaFilter.getListaPredicatesAreaCompetenza().isEmpty()) {
			AreaCompetenzaFilter.buildAreaCompetenzaPredicate(listaPredicati);
		}
		
		if(!SpecializzazioneFilter.getListaPredicatesSpecializzazione().isEmpty()) {
			SpecializzazioneFilter.buildSpecializzazionePredicate(listaPredicati);
		}
		
		CandidatoFilter.setAddedCriteria(false);

		return listaPredicati;

	}

	public static boolean isAddedCriteria() {
		return addedCriteria;
	}

	public static void setAddedCriteria(boolean addedCriteria) {
		CandidatoFilter.addedCriteria = addedCriteria;
	}

}
