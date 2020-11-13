package it.rt.corso.filter;

import java.util.List;

import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import it.rt.corso.beans.Candidato;

@SuppressWarnings("unchecked")
public class CandidatoFilter implements CandidatoFilterInterface {

	/**
	 * 
	 * Flag used to specify wether the cycled filter has been used in order to stop
	 * the used filter research.
	 * 
	 */
	private static boolean addedCriteria = false;
	
	@Override
	public List<Predicate> checkFilter(List<Predicate> listaPredicati, Root<Candidato> root, String nomeFiltro,
			String valore) {
		ConfigurableApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");
		List<CandidatoFilter> filterList = (List<CandidatoFilter>) factory.getBean("filterList");
		for (CandidatoFilter filter : filterList) {
			if (!addedCriteria) {
				listaPredicati = filter.checkFilter(listaPredicati, root, nomeFiltro, valore);
			} else {
				CandidatoFilter.setAddedCriteria(false);
				break;
			}

		}

		CandidatoFilter.setAddedCriteria(false);
		factory.close();
		return listaPredicati;

	}

	/**
	 * 
	 * Call build methods to create compound predicates that will be added to the
	 * given list in case they exist.
	 *
	 * @param a list of predicates to which compound predicates will be added.
	 *
	 * @return the list of predicate with the added compound predicates or the
	 *         unaltered given list in case none of the compound predicates exists.
	 * 
	 */
	public List<Predicate> buildCompundPredicate(List<Predicate> listaPredicati) {

		if (!MansioneFilter.getListaPredicatesMansioni().isEmpty()) {
			MansioneFilter.buildMansionePredicate(listaPredicati);
		}

		if (!AreaCompetenzaFilter.getListaPredicatesAreaCompetenza().isEmpty()) {
			AreaCompetenzaFilter.buildAreaCompetenzaPredicate(listaPredicati);
		}

		if (!SpecializzazioneFilter.getListaPredicatesSpecializzazione().isEmpty()) {
			SpecializzazioneFilter.buildSpecializzazionePredicate(listaPredicati);
		}
		
		if(!LinguaFilter.getListaPredicatesLingue().isEmpty()) {
			LinguaFilter.buildCompetenzaLinguisticaPredicate(listaPredicati);
		}

		if (InserimentoFromFilter.isFromIsSelected() || InserimentoToFilter.isToSelected()) {
			InserimentoFilter.buildInserimentoPredicate(listaPredicati);
		}

		return listaPredicati;

	}


	/**
	 * 
	 * Sets the given <code>boolean</code> value to the addedCriteria flag.
	 * 
	 */
	public static void setAddedCriteria(boolean addedCriteria) {
		CandidatoFilter.addedCriteria = addedCriteria;
	}

}
