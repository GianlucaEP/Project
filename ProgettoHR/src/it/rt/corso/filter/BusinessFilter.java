package it.rt.corso.filter;

import javax.persistence.criteria.Join;
import javax.persistence.criteria.Root;

import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Business;

public abstract class BusinessFilter extends CandidatoFilter implements CandidatoFilterInterface{
	private Root<Candidato> root;
	
	private Join<Candidato, Business> business;

	@Override
	public void nextFilter(Root<Candidato> root) {
		
	};
}
