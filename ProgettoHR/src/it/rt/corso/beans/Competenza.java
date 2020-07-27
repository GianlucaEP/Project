package it.rt.corso.beans;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.*;

@Entity
@Table(name = "competenza")
public class Competenza implements Bean {

	// Attributi
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_competenza")
	private int id;
	@Column(name = "specializzazione")
	private String specializzazione;
	
	//competenze rappresenta il SET associato alla classe candidato
	@ManyToMany(mappedBy = "competenze")
	private Set<Candidato> candidato = new HashSet<>();

	// Getter & Setter
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSpecializzazione() {
		return specializzazione;
	}

	public void setSpecializzazione(String specializzazione) {
		this.specializzazione = specializzazione;
	}

	public Set<Candidato> getCandidato() {
		return candidato;
	}

	public void setCandidato(Set<Candidato> candidato) {
		this.candidato = candidato;
	}

}
