package it.rt.corso.filter;

import java.util.List;

import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import it.rt.corso.beans.Candidato;

public interface CandidatoFilterInterface {
	/**
	 * 	Select the filter to use depending on the filter name received via parameter nomeFiltro.
	 *  Once the filter is selected an add on the received predicate list will be performed, adding a like predicate on
	 *  the column specified by nomeFiltro for the table Candidato 
	 *  
	 *  @param listaPredicati a list containing the predicates that will be used in the criteria query based on the used filter
	 *  
	 *  @param root used to build the the criteria query on candidato table
	 *  
	 *  @param nomeFiltro the name of the selected filter
	 *  
	 *  @param valore the value that is used in the like predicate
	 *  
	 *  */
	public List<Predicate> checkFilter(List<Predicate> listaPredicati, Root<Candidato> root, String valore, String nomeFiltro);
}
