package it.rt.corso.filter;

import java.util.List;

import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import it.rt.corso.beans.Candidato;
import it.rt.corso.utility.Utility;

public class CandidatoFilter implements CandidatoFilterInterface{
	
	public List<Predicate> checkFilter(List<Predicate> listaPredicati, Root<Candidato> root, String nomeFiltro, String valore){
		
		root = Utility.buildRootCriteriaForCandidato();
		NomeFilter nomeFilter = new NomeFilter();
		listaPredicati = nomeFilter.checkFilter(listaPredicati, root, nomeFiltro, valore);
		return listaPredicati;
		
	}

}
