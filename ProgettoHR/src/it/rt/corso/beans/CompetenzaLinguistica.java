package it.rt.corso.beans;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "competenza_linguistica")
public class CompetenzaLinguistica implements Bean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_competenza_linguistica")
	private int id;
	@Column(name = "lingua")
	private String lingua;

	// ================================================================ //
	// ONE-TO-MANY con CANDIDATO COMPETENZA LINGUISTICA
	@OneToMany(mappedBy = "competenzaLinguistica")
	Set<CandidatoCompetenzaLinguistica> candidatoCompetenzaLinguistica;
	// ================================================================ //

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLingua() {
		return lingua;
	}

	public void setLingua(String lingua) {
		this.lingua = lingua;
	}

	public Set<CandidatoCompetenzaLinguistica> getCandidatoCompetenzaLinguistica() {
		return candidatoCompetenzaLinguistica;
	}

	public void setCandidatoCompetenzaLinguistica(Set<CandidatoCompetenzaLinguistica> candidatoCompetenzaLinguistica) {
		this.candidatoCompetenzaLinguistica = candidatoCompetenzaLinguistica;
	}
	

}
