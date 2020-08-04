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
@Table(name = "stato")
public class StatoCandidato implements Bean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "descrizione")
	private String descrizione;

	//ONE-TO-MANY con la classe Candidato
	@OneToMany(cascade = CascadeType.ALL,  mappedBy = "stato")
	Set<Candidato>  candidato;

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public Set<Candidato> getCandidato() {
		return candidato;
	}

	public void setCandidato(Set<Candidato> candidato) {
		this.candidato = candidato;
	}



}
