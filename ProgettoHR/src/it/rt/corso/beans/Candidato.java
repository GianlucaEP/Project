package it.rt.corso.beans;

//import java.io.File;
import java.util.Date;
import java.util.List;

public class Candidato implements Bean{
	
	//Attributi
	private int id;
	private String nome;
	private String cognome;
	private int anno;
	private String telefono;
	private String email;
	private String mansione;
	private String seniority;
	private String contatto;
	private String commmenti_contatto;
	private Date colloquio;
	private String commenti_colloquio;
	private String ricontatto;
	private String qualification_meeting;
	private String azienda_qm;
	private String commenti_qm;
	private Date in;
//	private File allegato;
	private List<Competenza> competenza;
	
	
	//Getter & Setter
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
	public String getContatto() {
		return contatto;
	}
	public void setContatto(String contatto) {
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
	public List<Competenza> getCompetenza() {
		return competenza;
	}
	public void setCompetenza(List<Competenza> competenza) {
		this.competenza = competenza;
	}
}
