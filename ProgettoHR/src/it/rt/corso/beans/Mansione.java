package it.rt.corso.beans;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "mansione")
public class Mansione implements Bean{
	
	@Id
	@Column(name = "mansione")
	private String mansione;
	
	// ========================================================== //
	//MANY-TO-MANY Con CANDIDATO
	@ManyToMany(mappedBy = "mansione")
	private Set<Candidato> candidato = new HashSet<>();
	// ========================================================== //

	public String getMansione() {
		return mansione;
	}

	public void setMansione(String mansione) {
		this.mansione = mansione;
	}

	public Set<Candidato> getCandidato() {
		return candidato;
	}

	public void setCandidato(Set<Candidato> candidato) {
		this.candidato = candidato;
	}
	
	
}
