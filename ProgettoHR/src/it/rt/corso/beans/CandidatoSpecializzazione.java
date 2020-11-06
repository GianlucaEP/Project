package it.rt.corso.beans;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "candidato_specializzazione")
public class CandidatoSpecializzazione implements Bean,  Serializable{
	
	private static final long serialVersionUID = 1L;

	@Column(name = "anni_esperienza")
	private int anni;
	
	// ================================== //
	// MANY-TO-ONE con CANDIDATO
	@Id
	@ManyToOne
	@JoinColumn(name = "id_candidato_fk")
	private Candidato candidato;
	// ================================== //
	
	// ======================================= //
	// MANY-TO-ONE con SPECIALIZZAZIONE
	@Id
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "specializzazione_fk")
	private Specializzazione specializzazione;
	// ======================================= //

	public int getAnni() {
		return anni;
	}

	public void setAnni(int anni) {
		this.anni = anni;
	}

	public Candidato getCandidato() {
		return candidato;
	}

	public void setCandidato(Candidato candidato) {
		this.candidato = candidato;
	}

	public Specializzazione getSpecializzazione() {
		return specializzazione;
	}

	public void setSpecializzazione(Specializzazione specializzazione) {
		this.specializzazione = specializzazione;
	}
	
	
	
}
