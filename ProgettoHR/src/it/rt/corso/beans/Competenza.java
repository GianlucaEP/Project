package it.rt.corso.beans;

public class Competenza implements Bean{
	
	//Attributi
	private int id;
	private String specializzazione;
	
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
	
	
}
