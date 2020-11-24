package it.rt.corso.beans;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * {@link Bean Bean} type Object that rapresents specializzazione table.
 * */
@Entity
@Table(name = "specializzazione")
public class Specializzazione implements Bean {

	@Id
	@Column(name = "specializzazione")
	private String specializzazione;
	
	// ====================================================== //
	//ONE-TO-MANY con CANDIDATO SPECIALIZZAZIONE
	@OneToMany(mappedBy = "specializzazione")
	Set<CandidatoSpecializzazione> candidatoSpecializzazione;
	// ====================================================== //
	

	public String getSpecializzazione() {
		return specializzazione;
	}

	public void setSpecializzazione(String specializzazione) {
		this.specializzazione = specializzazione;
	}

	public Set<CandidatoSpecializzazione> getCandidatoSpecializzazione() {
		return candidatoSpecializzazione;
	}

	public void setCandidatoSpecializzazione(Set<CandidatoSpecializzazione> candidatoSpecializzazione) {
		this.candidatoSpecializzazione = candidatoSpecializzazione;
	}


}
