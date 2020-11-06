package it.rt.corso.beans;

import java.util.ArrayList;
//import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.transaction.Transactional;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name = "candidato")
@Transactional
public class Candidato implements Bean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_candidato")
	private int id;
	@Column(name = "nome")
	private String nome;
	@Column(name = "cognome")
	private String cognome;
	@Temporal(TemporalType.DATE)
	@Column(name = "data_nascita")
	private Date dataNascita;
	@Column(name = "num_tel")
	private String telefono;
	@Column(name = "email")
	private String email;
	@Column(name = "residenza")
	private String residenza;
	@Column(name = "domicilio")
	private String domicilio;
	@Temporal(TemporalType.DATE)
	@Column(name = "inserimento_azienda")
	private Date inserimentoAzienda;
	@Column(name = "provenienza")
	private String provenienza;
	@Column(name = "categoria_protetta")
	private boolean categoriaProtetta;
	@Column(name = "codice_fiscale")
	private String codiceFiscale;

	// ============================== //
	// MANY-TO-ONE con InseritoDa
	@ManyToOne
	@JoinColumn(name = "inserito_da")
	private Utente inseritoDa;
	// ============================== //

	// =========================== //
	// MANY-TO-ONE con BUSINESS
	@ManyToOne
	@JoinColumn(name = "business")
	private Business business;
	// =========================== //

	// ============================ //
	// MANY-TO-ONE con SENIORITY
	@ManyToOne
	@JoinColumn(name = "seniority")
	private Seniority seniority;
	// ============================ //

	// ========================== //
	// MANY-TO-ONE con StatoCandidato
	@ManyToOne
	@JoinColumn(name = "stato")
	private StatoCandidato stato;
	// ========================== //

	// ===================================== //
	// ONE-TO-ONE con COSTO
	@OneToOne(cascade = { CascadeType.ALL })
	@JoinColumn(name = "costo")
	private Costo costo;
	// ===================================== //

	// ===================================== //
	// ONE-TO-ONE con ECONOMICS
	@OneToOne(cascade = { CascadeType.ALL })
	@JoinColumn(name = "economics")
	private Economics economics;
	// ===================================== //

	// ============================================================== //
	// ONE-TO-MANY con FEEDBACK
	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "candidato")
	Set<Feedback> feedback;
	// ============================================================== //

	// ============================================================== //
	// ONE-TO-MANY con UploadFile
	@LazyCollection(LazyCollectionOption.FALSE)
	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "candidato")
	Set<UploadFile> file;
	// ============================================================== //

	// ============================================================= //
	// ONE-TO-MANY con QUALIFICATION MEETING
	@LazyCollection(LazyCollectionOption.FALSE)
	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "candidato")
	Set<QualificationMeeting> qm;
	// ============================================================== //

	// ========================================================== //
	// ONE-TO-MANY con CandidatoSpecializzazione
	@LazyCollection(LazyCollectionOption.FALSE)
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "candidato")
	List<CandidatoSpecializzazione> candidatoSpecializzazione;
	// ========================================================== //

	// ========================================================== //
	// ONE-TO-MANY con CANDIDATO COMPETENZA LINGUISTICA
	@LazyCollection(LazyCollectionOption.FALSE)
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "candidato")
	List<CandidatoCompetenzaLinguistica> candidatoCompetenzaLingustica;
	// ========================================================== //

	// ===================================================================================================== //
	// MANY-TO-MANY Con MANSIONE
	@LazyCollection(LazyCollectionOption.FALSE)
	@ManyToMany(cascade = { CascadeType.PERSIST })
	/*
	 * JoinTable specifica la tabella di mezzo JoinColumn = inzialmente si specifica
	 * la foreignKey della classe in cui mi trovo InverseJoinColumn = foreignKey
	 * dell' altra entità
	 */
	@JoinTable(name = "candidato_mansione", joinColumns = {
			@JoinColumn(name = "id_candidato_fk") }, inverseJoinColumns = { @JoinColumn(name = "mansione") })
	List<Mansione> mansione;
	// ====================================================================================================== //

	// ========================================================================================================= //
	// MANY-TO-MANY Con AREA
	@LazyCollection(LazyCollectionOption.FALSE)
	@ManyToMany(cascade = { CascadeType.PERSIST })
	@JoinTable(name = "candidato_area", joinColumns = { @JoinColumn(name = "candidato") }, inverseJoinColumns = {
			@JoinColumn(name = "area") })
	List<AreaCompetenza> area = new ArrayList<AreaCompetenza>();
	// ========================================================================================================== //

	// ================================================================================================================ //
	// MANY-TO-MANY Con TITOLO DI STUDIO
	@LazyCollection(LazyCollectionOption.FALSE)
	@ManyToMany(cascade = { CascadeType.PERSIST })
	@JoinTable(name = "candidato_titolo_studio", joinColumns = {
			@JoinColumn(name = "id_candidato_fk") }, inverseJoinColumns = { @JoinColumn(name = "id_titolo_studio_fk") })
	List<TitoloStudio> titoloStudio = new ArrayList<TitoloStudio>();
	// ================================================================================================================= //

	// ================================================================================================================= //
	// GETTER E SETTER //

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

	public Date getDataNascita() {
		return dataNascita;
	}

	public void setDataNascita(Date dataNascita) {
		this.dataNascita = dataNascita;
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

	public Costo getCosto() {
		return costo;
	}

	public void setCosto(Costo costo) {
		this.costo = costo;
	}

	public Economics getEconomics() {
		return economics;
	}

	public void setEconomics(Economics economics) {
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

	public Set<UploadFile> getFile() {
		return file;
	}

	public void setFile(Set<UploadFile> file) {
		this.file = file;
	}

	public Utente getInseritoDa() {
		return inseritoDa;
	}

	public void setInseritoDa(Utente inseritoDa) {
		this.inseritoDa = inseritoDa;
	}

	public List<TitoloStudio> getTitoloStudio() {
		return titoloStudio;
	}

	public void setTitoloStudio(List<TitoloStudio> titoloStudio) {
		this.titoloStudio = titoloStudio;
	}

	public List<CandidatoCompetenzaLinguistica> getCandidatoCompetenzaLingustica() {
		return candidatoCompetenzaLingustica;
	}

	public void setCandidatoCompetenzaLingustica(List<CandidatoCompetenzaLinguistica> candidatoCompetenzaLingustica) {
		this.candidatoCompetenzaLingustica = candidatoCompetenzaLingustica;
	}

	public String getResidenza() {
		return residenza;
	}

	public void setResidenza(String residenza) {
		this.residenza = residenza;
	}

	public String getDomicilio() {
		return domicilio;
	}

	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
	}

	
}
