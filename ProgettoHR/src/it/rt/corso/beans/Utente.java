package it.rt.corso.beans;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "utente")
public class Utente implements Bean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_utente")
	private int id;
	@Column(name = "username")
	private String username;
	@Column(name = "password")
	private String password;

	// MANY-TO-ONE con Ruolo
	@ManyToOne
	@JoinColumn(name = "id_ruolo")
	Ruolo ruolo;

	// ONE-TO-MANY con Candidato
	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "inseritoDa")
	Set<Candidato> candidatiInseriti;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Ruolo getRuolo() {
		return ruolo;
	}

	public void setRuolo(Ruolo ruolo) {
		this.ruolo = ruolo;
	}

	public Set<Candidato> getCandidatiInseriti() {
		return candidatiInseriti;
	}

	public void setCandidatiInseriti(Set<Candidato> candidatiInseriti) {
		this.candidatiInseriti = candidatiInseriti;
	}

}
