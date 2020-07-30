package it.rt.corso.beans;

//import java.io.File;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
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
	@Column(name = "specializzazione") //Specializzazione che inserisce a mano(text box) e che fa riferimento a Sinonimo
	private String specializzazione;
	@Column(name = "inserimento_azienda")
	private Date inserimentoAzienda;
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "stato", referencedColumnName = "descrizione") //One to one con l'id(descrizione) di StatoCandidato
	private StatoCandidato statoCandidato;
	@OneToMany(mappedBy="candidato")
	Set<Feedback> feedback;//One to many con la classe feedback
	@OneToMany(mappedBy="candidato")
	Set<QualificationMeeting> qm;

//	private File allegato; TODO aggiungere successivamente il file allegato

	@ManyToMany(cascade = { CascadeType.ALL })
	/*
	 * JoinTable specifica la tabella di mezzo JoinColumn = inzialmente si specifica
	 * la foreignKey della classe in cui mi trovo InverseJoinColumn = foreignKey
	 * dell' altra entità
	 */
	@JoinTable(name = "candidato_sinonimo", joinColumns = {
			@JoinColumn(name = "id_candidato_fk") }, inverseJoinColumns = { @JoinColumn(name = "id_sinonimo_fk") })
	Set<Sinonimo> sinonimo = new HashSet<>();

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

	public Date getInserimentoAzienda() {
		return inserimentoAzienda;
	}

	public void setInserimentoAzienda(Date inserimentoAzienda) {
		this.inserimentoAzienda = inserimentoAzienda;
	}

	public Set<Sinonimo> getSinonimo() {
		return sinonimo;
	}

	public void setSinonimo(Set<Sinonimo> sinonimo) {
		this.sinonimo = sinonimo;
	}

	public String getSpecializzazione() {
		return specializzazione;
	}

	public void setSpecializzazione(String specializzazione) {
		this.specializzazione = specializzazione;
	}

	public StatoCandidato getStatoCandidato() {
		return statoCandidato;
	}

	public void setStatoCandidato(StatoCandidato statoCandidato) {
		this.statoCandidato = statoCandidato;
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

}
