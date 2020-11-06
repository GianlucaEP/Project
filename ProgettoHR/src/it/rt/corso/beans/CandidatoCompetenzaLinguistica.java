package it.rt.corso.beans;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "candidato_competenza_linguistica")
public class CandidatoCompetenzaLinguistica implements Bean,  Serializable {
	
	private static final long serialVersionUID = 1L;
	@Column(name = "letto")
	private String letto;
	@Column(name = "parlato")
	private String parlato;
	@Column(name = "scritto")
	private String scritto;
	@Column(name = "madre_lingua")
	private boolean madreLingua;

	// ================================== //
	// MANY-TO-ONE con CANDIDATO
	@Id
	@ManyToOne
	@JoinColumn(name = "id_candidato_fk")
	private Candidato candidato;
	// ================================== //

	// ================================================= //
	// MANY-TO-ONE con COMPETENZA LINGUISTICA
	@Id
	@ManyToOne
	@JoinColumn(name = "id_competenza_linguistica_fk")
	private CompetenzaLinguistica competenzaLinguistica;
	// ================================================= //

	public String getLetto() {
		return letto;
	}

	public void setLetto(String letto) {
		this.letto = letto;
	}

	public String getParlato() {
		return parlato;
	}

	public void setParlato(String parlato) {
		this.parlato = parlato;
	}

	public String getScritto() {
		return scritto;
	}

	public void setScritto(String scritto) {
		this.scritto = scritto;
	}

	public boolean isMadreLingua() {
		return madreLingua;
	}

	public void setMadreLingua(boolean madreLingua) {
		this.madreLingua = madreLingua;
	}

	public Candidato getCandidato() {
		return candidato;
	}

	public void setCandidato(Candidato candidato) {
		this.candidato = candidato;
	}

	public CompetenzaLinguistica getCompetenzaLinguistica() {
		return competenzaLinguistica;
	}

	public void setCompetenzaLinguistica(CompetenzaLinguistica competenzaLinguistica) {
		this.competenzaLinguistica = competenzaLinguistica;
	}
	
	
}
