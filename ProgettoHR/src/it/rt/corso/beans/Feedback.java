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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * {@link Bean Bean} type Object that rapresents feedback table.
 * */
@Entity
@Table(name = "feedback")
public class Feedback implements Bean{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_feedback")
	private int id;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	@Column(name = "data")
	private Date data;
	@Column(name = "commento")
	private String commento;
	@Column(name = "user_insert")
	private String userInsert;
	@Column(name = "data_insert")
	private Date dateInsert;
	
	// ============================= //
	//MANY-TO-ONE con CANDIDATO
	@ManyToOne
    @JoinColumn(name="id_candidato")
	private Candidato candidato; 
	// ============================= //
	
	// ======================= //
	//MANY-TO-ONE con TIPO FEEDBACK
	@ManyToOne
	@JoinColumn(name="tipo")
	private TipoFeedback tipo;
	// ======================= //

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
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

	public Candidato getCandidato() {
		return candidato;
	}

	public void setCandidato(Candidato candidato) {
		this.candidato = candidato;
	}

	public TipoFeedback getTipo() {
		return tipo;
	}

	public void setTipo(TipoFeedback tipo) {
		this.tipo = tipo;
	}
	
	
	
}
