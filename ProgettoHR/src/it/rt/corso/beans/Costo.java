package it.rt.corso.beans;


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "costo")
public class Costo implements Bean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_costo")
	private int id;
	@Column(name = "costo_orario")
	private double orario;
	@Column(name = "costo_giornaliero")
	private double giornaliero;
	@Column(name = "commento")
	private String commento;

	// ONE-TO-MANY con Candidato
	@OneToOne(cascade = { CascadeType.ALL }, mappedBy = "costo")
	private Candidato candidato;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getOrario() {
		return orario;
	}

	public void setOrario(double orario) {
		this.orario = orario;
	}

	public double getGiornaliero() {
		return giornaliero;
	}

	public void setGiornaliero(double giornaliero) {
		this.giornaliero = giornaliero;
	}

	public String getCommento() {
		return commento;
	}

	public void setCommento(String commento) {
		this.commento = commento;
	}

	public Candidato getCandidato() {
		return candidato;
	}

	public void setCandidato(Candidato candidato) {
		this.candidato = candidato;
	}

}
