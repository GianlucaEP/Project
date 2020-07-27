package it.rt.corso.beans;

//import java.io.File;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name = "candidato")
public class Candidato implements Bean {

	// Attributi
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_candidato")
	private int id;
	@Column(name = "nome")
	private String nome;
	@Column(name = "cognome")
	private String cognome;
	@Column(name = "anno_di_nascita")
	private int anno;
	@Column(name = "num_tel")
	private String telefono;
	@Column(name = "email")
	private String email;
	@Column(name = "mansione")
	private String mansione;
	@Column(name = "seniority")
	private String seniority;
	@Column(name = "contatto")
	private Boolean contatto;
	@Column(name = "commmenti_contatto")
	private String commmenti_contatto;
	@Column(name = "colloquio")
	private Date colloquio;
	@Column(name = "commenti_colloquio")
	private String commenti_colloquio;
	@Column(name = "da_ricontattare")
	private String ricontatto;
	@Column(name = "qualification_meeting")
	private String qualification_meeting;
	@Column(name = "azienda_qm")
	private String azienda_qm;
	@Column(name = "commenti_qm")
	private String commenti_qm;
	@Column(name = "in")
	private Date in;
//	private File allegato;
	@ManyToMany(cascade = { CascadeType.ALL })
	@JoinTable(name = "candidato_competenza", joinColumns = {
			@JoinColumn(name = "id_candidato_fk") }, inverseJoinColumns = { @JoinColumn(name = "id_competenza_fk") })
	Set<Competenza> competenze = new HashSet<>();

	// Getter & Setter
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public int getAnno() {
		return anno;
	}

	public void setAnno(int anno) {
		this.anno = anno;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMansione() {
		return mansione;
	}

	public void setMansione(String mansione) {
		this.mansione = mansione;
	}

	public String getSeniority() {
		return seniority;
	}

	public void setSeniority(String seniority) {
		this.seniority = seniority;
	}

	public Boolean getContatto() {
		return contatto;
	}

	public void setContatto(Boolean contatto) {
		this.contatto = contatto;
	}

	public String getCommmenti_contatto() {
		return commmenti_contatto;
	}

	public void setCommmenti_contatto(String commmenti_contatto) {
		this.commmenti_contatto = commmenti_contatto;
	}

	public Date getColloquio() {
		return colloquio;
	}

	public void setColloquio(Date colloquio) {
		this.colloquio = colloquio;
	}

	public String getCommenti_colloquio() {
		return commenti_colloquio;
	}

	public void setCommenti_colloquio(String commenti_colloquio) {
		this.commenti_colloquio = commenti_colloquio;
	}

	public String getRicontatto() {
		return ricontatto;
	}

	public void setRicontatto(String ricontatto) {
		this.ricontatto = ricontatto;
	}

	public String getQualification_meeting() {
		return qualification_meeting;
	}

	public void setQualification_meeting(String qualification_meeting) {
		this.qualification_meeting = qualification_meeting;
	}

	public String getAzienda_qm() {
		return azienda_qm;
	}

	public void setAzienda_qm(String azienda_qm) {
		this.azienda_qm = azienda_qm;
	}

	public String getCommenti_qm() {
		return commenti_qm;
	}

	public void setCommenti_qm(String commenti_qm) {
		this.commenti_qm = commenti_qm;
	}

	public Date getIn() {
		return in;
	}

	public void setIn(Date in) {
		this.in = in;
	}

//	public File getAllegato() {
//		return allegato;
//	}
//	public void setAllegato(File allegato) {
//		this.allegato = allegato;
//	}
	public Set<Competenza> getCompetenze() {
		return competenze;
	}

	public void setCompetenze(Set<Competenza> competenze) {
		this.competenze = competenze;
	}

}
