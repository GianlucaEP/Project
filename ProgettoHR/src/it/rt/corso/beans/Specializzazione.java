package it.rt.corso.beans;

import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "specializzazione")
public class Specializzazione implements Bean {

	// Attributi
	@Id
	
	@Column(name = "specializzazione")
	private String specializzazione;
	
	//ONE-TO-MANY con la classe CandidatoSpecializzazione
	@OneToMany(cascade = CascadeType.ALL,  mappedBy = "specializzazione")
	Set<CandidatoSpecializzazione> candidatoSpecializzazione;
	

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
