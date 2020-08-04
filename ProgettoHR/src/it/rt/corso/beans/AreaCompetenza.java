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

@Entity
@Table(name = "area_competenza")
public class AreaCompetenza implements Bean{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_area")
	private int id;
	@Column(name = "area")
	private String area;
	
	//ONE-TO-MANY con Candidato
	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "area_competenza")
	Set<Candidato> candidato;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
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
