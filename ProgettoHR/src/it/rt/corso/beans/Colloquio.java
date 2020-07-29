package it.rt.corso.beans;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "colloquio")
public class Colloquio implements Bean{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_colloquio")
	private int id;
//	@Column(name = "id_candidato")
//	private int idCandidato; // TODO id del candidato di riferimento
	@Column(name = "data")
	private Date data;
	@Column(name = "operatore")
	private String operatore;
	@Column(name = "commento")
	private String commento;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
//	public int getIdCandidato() {
//		return idCandidato;
//	}
//	public void setIdCandidato(int idCandidato) {
//		this.idCandidato = idCandidato;
//	}
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
