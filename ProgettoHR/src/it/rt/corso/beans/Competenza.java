package it.rt.corso.beans;

import java.util.List;

public class Competenza implements Bean{
	
	//Attributi
	private int id;
	private String specializzazione;
	private List<Candidato> candidato;
	
	//Getter & Setter
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
	public List<Candidato> getCandidato() {
		return candidato;
	}
	public void setCandidato(List<Candidato> candidato) {
		this.candidato = candidato;
	}
	
	
}
