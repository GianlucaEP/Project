package it.rt.corso.beans;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 * {@link Bean Bean} type Object that represents area_competenza table.
 * */
@Entity
@Table(name = "area_competenza")
public class AreaCompetenza implements Bean{

	@Id
	@Column(name = "area")
	private String area;
	
	// ======================================================= //
	//MANY-TO-MANY con CANDIDATO
	@ManyToMany( mappedBy = "area")
	private Set<Candidato> candidato = new HashSet<>();
	// ======================================================= //
	
	public String getArea() {
		return area;
	}
	
	public void setArea(String area) {
		this.area = area;
	}
	
	public Set<Candidato> getCandidato() {
		return candidato;
	}
	
	public void setCandidato(Set<Candidato> candidato) {
		this.candidato = candidato;
	}
	
}
