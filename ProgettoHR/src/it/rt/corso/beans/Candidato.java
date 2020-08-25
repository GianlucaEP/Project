package it.rt.corso.beans;

import java.util.ArrayList;
//import java.io.File;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "candidato")
public class Candidato implements Bean {

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
	@Column(name = "inserimento_azienda")
	private Date inserimentoAzienda;
	@Column(name = "provenienza")
	private String provenienza;
	@Column(name = "categoria_protetta")
	private boolean categoriaProtetta;
	@Column(name = "codice_fiscale")
	private String codiceFiscale;
//	private File allegato; TODO aggiungere successivamente il file allegato
	
	// MANY-TO-ONE con Business
	@ManyToOne
	@JoinColumn(name = "business")
	private Business business;
	
	// MANY-TO-ONE con Seniority
	@ManyToOne
	@JoinColumn(name = "seniority")
	private Seniority seniority;

	// MANY-TO-ONE con la classe StatoCandidato
	@ManyToOne
	@JoinColumn(name = "stato")
	private StatoCandidato stato;
	
	// ONE-TO-MANY con la classe Costi
	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "candidato")
	Set<Costo> costi;
	
	// ONE-TO-MANY con la classe economics
	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "candidato")
	Set<Economics> economics;

	// ONE-TO-MANY con la classe feedback
	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "candidato", fetch = FetchType.EAGER)
	Set<Feedback> feedback;

	// ONE-TO-MANY con la classe QualificationMetting
	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "candidato")
	Set<QualificationMeeting> qm;
	
	// ONE-TO-MANY con la classe CandidatoSpecializzazione
	@OneToMany(cascade = CascadeType.ALL,  mappedBy = "candidato")
	List<CandidatoSpecializzazione> candidatoSpecializzazione;

	// MANY-TO-MANY Con Mansione
	@ManyToMany(cascade = { CascadeType.ALL }, fetch = FetchType.EAGER)
	/*
	 * JoinTable specifica la tabella di mezzo JoinColumn = inzialmente si specifica
	 * la foreignKey della classe in cui mi trovo InverseJoinColumn = foreignKey
	 * dell' altra entità
	 */
	@JoinTable(name = "candidato_mansione", joinColumns = {
			@JoinColumn(name = "id_candidato_fk") }, inverseJoinColumns = { @JoinColumn(name = "mansione") })
	List<Mansione> mansione = new ArrayList<Mansione>();
	
	// MANY-TO-MANY Con Area
	@ManyToMany(cascade = { CascadeType.ALL })
	@JoinTable(name = "candidato_area", joinColumns = {
			@JoinColumn(name = "candidato") }, inverseJoinColumns = { @JoinColumn(name = "area") })
	List<AreaCompetenza> area = new ArrayList<AreaCompetenza>();

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

	public Date getInserimentoAzienda() {
		return inserimentoAzienda;
	}

	public void setInserimentoAzienda(Date inserimentoAzienda) {
		this.inserimentoAzienda = inserimentoAzienda;
	}

	public String getProvenienza() {
		return provenienza;
	}

	public void setProvenienza(String provenienza) {
		this.provenienza = provenienza;
	}

	public boolean isCategoriaProtetta() {
		return categoriaProtetta;
	}

	public void setCategoriaProtetta(boolean categoriaProtetta) {
		this.categoriaProtetta = categoriaProtetta;
	}

	public String getCodiceFiscale() {
		return codiceFiscale;
	}

	public void setCodiceFiscale(String codiceFiscale) {
		this.codiceFiscale = codiceFiscale;
	}

	public Business getBusiness() {
		return business;
	}

	public void setBusiness(Business business) {
		this.business = business;
	}

	public Seniority getSeniority() {
		return seniority;
	}

	public void setSeniority(Seniority seniority) {
		this.seniority = seniority;
	}

	public StatoCandidato getStato() {
		return stato;
	}

	public void setStato(StatoCandidato stato) {
		this.stato = stato;
	}

	public Set<Costo> getCosti() {
		return costi;
	}

	public void setCosti(Set<Costo> costi) {
		this.costi = costi;
	}

	public Set<Economics> getEconomics() {
		return economics;
	}

	public void setEconomics(Set<Economics> economics) {
		this.economics = economics;
	}

	public Set<Feedback> getFeedback() {
		return feedback;
	}

	public void setFeedback(Set<Feedback> feedback) {
		this.feedback = feedback;
	}

	public Set<QualificationMeeting> getQm() {
		return qm;
	}

	public void setQm(Set<QualificationMeeting> qm) {
		this.qm = qm;
	}

	public List<CandidatoSpecializzazione> getCandidatoSpecializzazione() {
		return candidatoSpecializzazione;
	}

	public void setCandidatoSpecializzazione(List<CandidatoSpecializzazione> candidatoSpecializzazione) {
		this.candidatoSpecializzazione = candidatoSpecializzazione;
	}

	public List<Mansione> getMansione() {
		return mansione;
	}

	public void setMansione(List<Mansione> mansione) {
		this.mansione = mansione;
	}

	public List<AreaCompetenza> getArea() {
		return area;
	}

	public void setArea(List<AreaCompetenza> area) {
		this.area = area;
	}

	
	
}
