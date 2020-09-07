package it.rt.corso.filter;

import javax.persistence.criteria.Root;

import it.rt.corso.beans.Candidato;

public interface CandidatoFilterInterface {
	public void nextFilter(Root<Candidato> root);
}
