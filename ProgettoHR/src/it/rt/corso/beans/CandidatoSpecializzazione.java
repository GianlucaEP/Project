package it.rt.corso.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "candidato_specializzazione")
public class CandidatoSpecializzazione implements Bean{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "anni_esperienza")
	private int anni;
	
	// MANY-TO-ONE con Candidato
	@ManyToOne
	@JoinColumn(name = "candidato")
	private Candidato candidato;
	
	// MANY-TO-ONE con Specializzazione
	@ManyToOne
	@JoinColumn(name = "specializzazione")
	private Specializzazione specializzazione;

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
