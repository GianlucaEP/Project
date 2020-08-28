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

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "qualification_meeting")
public class QualificationMeeting implements Bean{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_qualification")
	private int id;
	@Column(name = "cliente")
	private String cliente;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "data_presentato")
	private Date dataPresentato;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "data_colloquio")
	private Date dataColloquio;
	@Column(name = "feedback")
	private String feedback;
	@Column(name = "user_insert")
	private String userInsert;
	@Column(name = "data_insert")
	private Date dateInsert;
	@Column(name = "riferimento_gara")
	private String riferimentoGara;
	
	//MANY-TO-ONE con la classe Candidato
	@ManyToOne
    @JoinColumn(name="id_candidato")
	private Candidato candidato;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCliente() {
		return cliente;
	}

	public void setCliente(String cliente) {
		this.cliente = cliente;
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

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
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

	public String getRiferimentoGara() {
		return riferimentoGara;
	}

	public void setRiferimentoGara(String riferimentoGara) {
		this.riferimentoGara = riferimentoGara;
	}

	public Candidato getCandidato() {
		return candidato;
	}

	public void setCandidato(Candidato candidato) {
		this.candidato = candidato;
	}
	
}
