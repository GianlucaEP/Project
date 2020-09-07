package it.rt.corso.filter;

import javax.persistence.criteria.Join;
import javax.persistence.criteria.Root;

import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Mansione;

public abstract class MansioneFilter extends CandidatoFilter implements CandidatoFilterInterface{
	
	private Root<Candidato> root;
	
	private Join<Candidato, Mansione> mansione;

	@Override
	public void nextFilter(Root<Candidato> root) {
		
	};


}
