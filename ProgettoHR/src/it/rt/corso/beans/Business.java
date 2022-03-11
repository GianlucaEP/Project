package it.rt.corso.beans;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * {@link Bean Bean} type Object that represents business table.
 * */
@Entity
@Table(name = "business")
public class Business implements Bean {
	
	@Id
	@Column(name = "business")
	private String business;
	
	// ============================================================= //
	//ONE-TO-MANY con CANDIDATO
	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "business")
	Set<Candidato> candidato;
	// ============================================================= //

	public String getBusiness() {
		return business;
	}

	public void setBusiness(String business) {
		this.business = business;
	}

	public Set<Candidato> getCandidato() {
		return candidato;
	}

	public void setCandidato(Set<Candidato> candidato) {
		this.candidato = candidato;
	}
	
}
