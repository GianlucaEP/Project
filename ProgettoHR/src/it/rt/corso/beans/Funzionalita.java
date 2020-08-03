package it.rt.corso.beans;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

public class Funzionalita implements Bean{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_funzionalita")
	private int id;
	@Column(name = "funzionalita")
	private String funzionalita;
	
	//MANY-TO-MANY con Ruolo
	@ManyToMany(mappedBy = "funzionalita")
	private Set<Ruolo> ruolo = new HashSet<>();
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFunzionalita() {
		return funzionalita;
	}
	public void setFunzionalita(String funzionalita) {
		this.funzionalita = funzionalita;
	}
	public Set<Ruolo> getRuolo() {
		return ruolo;
	}
	public void setRuolo(Set<Ruolo> ruolo) {
		this.ruolo = ruolo;
	}
	
}
