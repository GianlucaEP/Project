package it.rt.corso.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * {@link Bean Bean} type Object that rapresents file table.
 * */
@Entity
@Table(name = "file")
public class UploadFile implements Bean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_file")
	private int id;
	@Column(name = "file_name")
	private String nomeFile;
	@Column(name = "tipo")
	private String tipo;
	//@Column(name = "url")
	//private String url;
	@Lob
	@Column(name = "file_data")
	private byte[] fileData;

	// =============================== //
	// MANY-TO-ONE con CANDIDATO
	@ManyToOne
	@JoinColumn(name = "id_candidato")
	private Candidato candidato;
	// =============================== //

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNomeFile() {
		return nomeFile;
	}

	public void setNomeFile(String nomeFile) {
		this.nomeFile = nomeFile;
	}

	public Candidato getCandidato() {
		return candidato;
	}

	public void setCandidato(Candidato candidato) {
		this.candidato = candidato;
	}

	public byte[] getFileData() {
		return fileData;
	}

	public void setFileData(byte[] fileData) {
		this.fileData = fileData;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

//	public String getUrl() {
//		return url;
//	}
//
//	public void setUrl(String url) {
//		this.url = url;
//	}

}
