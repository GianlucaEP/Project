package it.rt.corso.beans;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "qualification_meeting")
public class QualificationMeeting implements Bean{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_qualification")
	private int id;
	@Column(name = "azienda")
	private String azienda;
	@Column(name = "data_presentato")
	private Date dataPresentato;
	@Column(name = "data_colloquio")
	private Date dataColloquio;
	@Column(name = "commento")
	private String commento;
	@Column(name = "user_insert")
	private String userInsert;
	@Column(name = "data_insert")
	private Date dateInsert;
	@Column(name = "ral")
	private int ral;
	@Column(name = "preavviso")
	private String preavviso;
	@Column(name = "desiderata")
	private int desiderata;
	@ManyToOne
    @JoinColumn(name="id_candidato")
	private Candidato candidato;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAzienda() {
		return azienda;
	}
	public void setAzienda(String azienda) {
		this.azienda = azienda;
	}
	public Date getDataPresentato() {
		return dataPresentato;
	}
	public void setDataPresentato(Date dataPresentato) {
		this.dataPresentato = dataPresentato;
	}
	public Date getDataColloquio() {
		return dataColloquio;
	}
	public void setDataColloquio(Date dataColloquio) {
		this.dataColloquio = dataColloquio;
	}
	public String getCommento() {
		return commento;
	}
	public void setCommento(String commento) {
		this.commento = commento;
	}
	public String getUserInsert() {
		return userInsert;
	}
	public void setUserInsert(String userInsert) {
		this.userInsert = userInsert;
	}
	public Date getDateInsert() {
		return dateInsert;
	}
	public void setDateInsert(Date dateInsert) {
		this.dateInsert = dateInsert;
	}
	public int getRal() {
		return ral;
	}
	public void setRal(int ral) {
		this.ral = ral;
	}
	public String getPreavviso() {
		return preavviso;
	}
	public void setPreavviso(String preavviso) {
		this.preavviso = preavviso;
	}
	public int getDesiderata() {
		return desiderata;
	}
	public void setDesiderata(int desiderata) {
		this.desiderata = desiderata;
	}
	public Candidato getCandidato() {
		return candidato;
	}
	public void setCandidato(Candidato candidato) {
		this.candidato = candidato;
	}
	
}
