package it.rt.corso.beans;

import java.util.Date;

public class Telefonata implements Bean{
	
	//Attributi
	private int id;
	private int idCandidato; //id del candidato di riferimento
	private Date data;
	private String operatore;
	private String commento;
	
	//Get & Set
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdCandidato() {
		return idCandidato;
	}
	public void setIdCandidato(int idCandidato) {
		this.idCandidato = idCandidato;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public String getOperatore() {
		return operatore;
	}
	public void setOperatore(String operatore) {
		this.operatore = operatore;
	}
	public String getCommento() {
		return commento;
	}
	public void setCommento(String commento) {
		this.commento = commento;
	}
	
}
