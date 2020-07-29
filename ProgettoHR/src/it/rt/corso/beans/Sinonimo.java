package it.rt.corso.beans;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name = "sinonimo")
public class Sinonimo implements Bean {

	// Attributi
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_sinonimo")
	private int id;
	@Column(name = "sinonimo")
	private String sinonimo;
	
//	private Mansione mansione; //TODO Spr2 = fare many to one con la mansione base
	
	// competenze rappresenta il SET associato alla classe candidato
	@ManyToMany(mappedBy = "sinonimo")
	private Set<Candidato> candidato = new HashSet<>();

	// Getter & Setter
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSinonimo() {
		return sinonimo;
	}

	public void setSinonimo(String sinonimo) {
		this.sinonimo = sinonimo;
	}

	public Set<Candidato> getCandidato() {
		return candidato;
	}

	public void setCandidato(Set<Candidato> candidato) {
		this.candidato = candidato;
	}

//	public Mansione getMansione() {
//		return mansione;
//	}
//
//	public void setMansione(Mansione mansione) {
//		this.mansione = mansione;
//	}


}
