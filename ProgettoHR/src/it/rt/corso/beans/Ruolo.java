package it.rt.corso.beans;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

public class Ruolo implements Bean{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_ruolo")
	private int id;
	@Column(name = "ruolo")
	private String ruolo;
	@ManyToMany(mappedBy = "ruolo")
	private Set<Utente> utente = new HashSet<>();
	@JoinTable(name = "ruolo_funzionalita", joinColumns = { @JoinColumn(name = "id_ruolo_fk") }, inverseJoinColumns = {
			@JoinColumn(name = "id_funzionalita_fk") })
	Set<Funzionalita> funzionalita = new HashSet<>();
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRuolo() {
		return ruolo;
	}
	public void setRuolo(String ruolo) {
		this.ruolo = ruolo;
	}
	public Set<Utente> getUtente() {
		return utente;
	}
	public void setUtente(Set<Utente> utente) {
		this.utente = utente;
	}
	public Set<Funzionalita> getFunzionalita() {
		return funzionalita;
	}
	public void setFunzionalita(Set<Funzionalita> funzionalita) {
		this.funzionalita = funzionalita;
	}
	
	
}
