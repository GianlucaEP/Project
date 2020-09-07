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
@Table(name = "economics")
public class Economics implements Bean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_economics")
	private int id;
	@Column(name = "inquadramento")
	private String inquadramento; // TODO modificare nel database Inquadramento
	@Column(name = "RAL")
	private double ral;
	@Column(name = "benefit")
	private String benefit;
	@Column(name = "preavviso")
	private String preavviso;
	@Column(name = "desiderata")
	private String desiderata;

	// ONE-TO-ONE con Candidato
	@OneToOne(cascade = { CascadeType.ALL }, mappedBy = "economics")
	private Candidato candidato;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getInquadramento() {
		return inquadramento;
	}

	public void setInquadramento(String inquadramento) {
		this.inquadramento = inquadramento;
	}

	public double getRal() {
		return ral;
	}

	public void setRal(double ral) {
		this.ral = ral;
	}

	public String getBenefit() {
		return benefit;
	}

	public void setBenefit(String benefit) {
		this.benefit = benefit;
	}

	public String getPreavviso() {
		return preavviso;
	}

	public void setPreavviso(String preavviso) {
		this.preavviso = preavviso;
	}

	public String getDesiderata() {
		return desiderata;
	}

	public void setDesiderata(String desiderata) {
		this.desiderata = desiderata;
	}

	public Candidato getCandidato() {
		return candidato;
	}

	public void setCandidato(Candidato candidato) {
		this.candidato = candidato;
	}

}
